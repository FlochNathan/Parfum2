const express = require('express');
const router = express.Router();
const mysql = require('mysql2/promise');
const requireAuth = require('../middleware/auth');

async function getDB() {
  return mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
  });
}

const STATUTS_VALIDES = ['nouvelle', 'vue', 'traitée'];

// POST /api/commandes (public)
router.post('/', async (req, res) => {
  const { nom, email, telephone, message, produits, total } = req.body;
  if (!nom || !email || !produits || total === undefined) {
    return res.status(400).json({ error: 'Champs requis manquants' });
  }

  let db;
  try {
    db = await getDB();
    const [result] = await db.execute(
      'INSERT INTO commandes (nom, email, telephone, message, produits, total) VALUES (?, ?, ?, ?, ?, ?)',
      [nom, email, telephone || '', message || '', JSON.stringify(produits), parseFloat(total)]
    );
    res.status(201).json({ id: result.insertId, message: 'Commande enregistrée' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

// GET /api/commandes (admin)
router.get('/', requireAuth, async (req, res) => {
  let db;
  try {
    db = await getDB();
    const [rows] = await db.execute('SELECT * FROM commandes ORDER BY created_at DESC');
    const commandes = rows.map(c => ({
      ...c,
      produits: typeof c.produits === 'string' ? JSON.parse(c.produits) : c.produits,
    }));
    res.json(commandes);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

// PUT /api/commandes/:id (admin)
router.put('/:id', requireAuth, async (req, res) => {
  const { statut } = req.body;
  if (!statut || !STATUTS_VALIDES.includes(statut)) {
    return res.status(400).json({ error: 'Statut invalide' });
  }

  let db;
  try {
    db = await getDB();
    const [existing] = await db.execute('SELECT id FROM commandes WHERE id = ?', [req.params.id]);
    if (existing.length === 0) return res.status(404).json({ error: 'Commande introuvable' });

    await db.execute('UPDATE commandes SET statut = ? WHERE id = ?', [statut, req.params.id]);
    res.json({ message: 'Statut mis à jour' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur serveur' });
  } finally {
    if (db) await db.end();
  }
});

module.exports = router;
