const express = require('express');
const router = express.Router();
const mysql = require('mysql2/promise');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { Readable } = require('stream');
const requireAuth = require('../middleware/auth');

const UPLOADS_DIR = path.join(__dirname, '..', 'uploads');
if (!fs.existsSync(UPLOADS_DIR)) fs.mkdirSync(UPLOADS_DIR, { recursive: true });

const ALLOWED_MIME = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];

const USE_CLOUDINARY = !!process.env.CLOUDINARY_CLOUD_NAME;

let cloudinary;
if (USE_CLOUDINARY) {
  cloudinary = require('cloudinary').v2;
  cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
  });
}

const storage = USE_CLOUDINARY
  ? multer.memoryStorage()
  : multer.diskStorage({
      destination: (req, file, cb) => cb(null, UPLOADS_DIR),
      filename: (req, file, cb) => {
        const ext = path.extname(file.originalname);
        cb(null, `prod_${Date.now()}${Math.random().toString(36).slice(2)}${ext}`);
      },
    });

const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 },
  fileFilter: (req, file, cb) => {
    if (ALLOWED_MIME.includes(file.mimetype)) cb(null, true);
    else cb(new Error('Type de fichier non autorisé'));
  },
});

async function uploadToCloudinary(buffer) {
  return new Promise((resolve, reject) => {
    const stream = cloudinary.uploader.upload_stream(
      { folder: 'douceurs-laura', resource_type: 'image' },
      (err, result) => (err ? reject(err) : resolve(result.secure_url))
    );
    Readable.from(buffer).pipe(stream);
  });
}

async function resolvePhoto(file) {
  if (!file) return null;
  if (USE_CLOUDINARY) return uploadToCloudinary(file.buffer);
  return file.filename;
}

async function getDB() {
  return mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
  });
}

// GET /api/produits
router.get('/', async (req, res) => {
  let db;
  try {
    db = await getDB();
    let query = 'SELECT * FROM produits ORDER BY created_at DESC';
    const params = [];
    if (req.query.categorie) {
      query = 'SELECT * FROM produits WHERE categorie = ? ORDER BY created_at DESC';
      params.push(req.query.categorie);
    }
    const [rows] = await db.execute(query, params);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

// GET /api/produits/:id
router.get('/:id', async (req, res) => {
  let db;
  try {
    db = await getDB();
    const [rows] = await db.execute('SELECT * FROM produits WHERE id = ?', [req.params.id]);
    if (rows.length === 0) return res.status(404).json({ error: 'Produit introuvable' });
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

// POST /api/produits (admin)
router.post('/', requireAuth, upload.single('photo'), async (req, res) => {
  const { titre, description, prix, categorie } = req.body;
  if (!titre || !prix || !categorie) {
    return res.status(400).json({ error: 'Champs requis manquants' });
  }
  let db;
  try {
    const photo = await resolvePhoto(req.file);
    db = await getDB();
    const [result] = await db.execute(
      'INSERT INTO produits (titre, description, prix, photo, categorie) VALUES (?, ?, ?, ?, ?)',
      [titre, description || '', parseFloat(prix), photo, categorie]
    );
    const [rows] = await db.execute('SELECT * FROM produits WHERE id = ?', [result.insertId]);
    res.status(201).json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

// PUT /api/produits/:id (admin)
router.put('/:id', requireAuth, upload.single('photo'), async (req, res) => {
  const { titre, description, prix, categorie } = req.body;
  let db;
  try {
    db = await getDB();
    const [existing] = await db.execute('SELECT * FROM produits WHERE id = ?', [req.params.id]);
    if (existing.length === 0) return res.status(404).json({ error: 'Produit introuvable' });

    const produit = existing[0];
    let photo = produit.photo;

    if (req.file) {
      if (USE_CLOUDINARY) {
        photo = await uploadToCloudinary(req.file.buffer);
      } else {
        if (produit.photo && !produit.photo.startsWith('http')) {
          const oldPath = path.join(UPLOADS_DIR, produit.photo);
          if (fs.existsSync(oldPath)) fs.unlinkSync(oldPath);
        }
        photo = req.file.filename;
      }
    }

    await db.execute(
      'UPDATE produits SET titre = ?, description = ?, prix = ?, photo = ?, categorie = ? WHERE id = ?',
      [
        titre || produit.titre,
        description !== undefined ? description : produit.description,
        prix ? parseFloat(prix) : produit.prix,
        photo,
        categorie || produit.categorie,
        req.params.id,
      ]
    );

    const [rows] = await db.execute('SELECT * FROM produits WHERE id = ?', [req.params.id]);
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

// DELETE /api/produits/:id (admin)
router.delete('/:id', requireAuth, async (req, res) => {
  let db;
  try {
    db = await getDB();
    const [existing] = await db.execute('SELECT * FROM produits WHERE id = ?', [req.params.id]);
    if (existing.length === 0) return res.status(404).json({ error: 'Produit introuvable' });

    const produit = existing[0];
    if (produit.photo && !produit.photo.startsWith('http')) {
      const imgPath = path.join(UPLOADS_DIR, produit.photo);
      if (fs.existsSync(imgPath)) fs.unlinkSync(imgPath);
    }

    await db.execute('DELETE FROM produits WHERE id = ?', [req.params.id]);
    res.json({ message: 'Produit supprimé' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

module.exports = router;
