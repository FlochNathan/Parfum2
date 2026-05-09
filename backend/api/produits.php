<?php
// /api/produits.php - Routes : GET, POST, PUT/:id, DELETE/:id
require_once '../config.php';
setCorsHeaders();

$method = $_SERVER['REQUEST_METHOD'];
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

// Extraire l'ID si présent (/api/produits/42)
preg_match('/\/produits\/(\d+)/', $uri, $matches);
$id = $matches[1] ?? null;

$db = getDB();

// ─── GET /produits ─────────────────────────────────
if ($method === 'GET' && !$id) {
    $categorie = $_GET['categorie'] ?? null;
    if ($categorie) {
        $stmt = $db->prepare('SELECT * FROM produits WHERE categorie = ? ORDER BY created_at DESC');
        $stmt->execute([$categorie]);
    } else {
        $stmt = $db->query('SELECT * FROM produits ORDER BY created_at DESC');
    }
    jsonResponse($stmt->fetchAll());
}

// ─── GET /produits/:id ─────────────────────────────
if ($method === 'GET' && $id) {
    $stmt = $db->prepare('SELECT * FROM produits WHERE id = ?');
    $stmt->execute([$id]);
    $produit = $stmt->fetch();
    if (!$produit) jsonResponse(['error' => 'Produit introuvable'], 404);
    jsonResponse($produit);
}

// ─── POST /produits (Admin) ────────────────────────
if ($method === 'POST') {
    requireAuth();

    $titre = trim($_POST['titre'] ?? '');
    $description = trim($_POST['description'] ?? '');
    $prix = floatval($_POST['prix'] ?? 0);
    $categorie = trim($_POST['categorie'] ?? 'Autre');

    if (!$titre || $prix <= 0) {
        jsonResponse(['error' => 'Titre et prix requis'], 400);
    }

    $photo = handleUpload();

    $stmt = $db->prepare('INSERT INTO produits (titre, description, prix, photo, categorie) VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([$titre, $description, $prix, $photo, $categorie]);
    $newId = $db->lastInsertId();

    $stmt2 = $db->prepare('SELECT * FROM produits WHERE id = ?');
    $stmt2->execute([$newId]);
    jsonResponse($stmt2->fetch(), 201);
}

// ─── PUT /produits/:id (Admin) ─────────────────────
if ($method === 'PUT' && $id) {
    requireAuth();

    // PHP ne parse pas multipart pour PUT, utiliser POST avec _method=PUT ou JSON
    $contentType = $_SERVER['CONTENT_TYPE'] ?? '';

    if (str_contains($contentType, 'multipart/form-data')) {
        // Workaround pour PUT multipart
        $titre = trim($_POST['titre'] ?? '');
        $description = trim($_POST['description'] ?? '');
        $prix = floatval($_POST['prix'] ?? 0);
        $categorie = trim($_POST['categorie'] ?? 'Autre');
    } else {
        $body = json_decode(file_get_contents('php://input'), true) ?? [];
        $titre = trim($body['titre'] ?? '');
        $description = trim($body['description'] ?? '');
        $prix = floatval($body['prix'] ?? 0);
        $categorie = trim($body['categorie'] ?? 'Autre');
    }

    if (!$titre || $prix <= 0) {
        jsonResponse(['error' => 'Titre et prix requis'], 400);
    }

    // Récupérer l'ancienne photo
    $stmt = $db->prepare('SELECT photo FROM produits WHERE id = ?');
    $stmt->execute([$id]);
    $existing = $stmt->fetch();
    if (!$existing) jsonResponse(['error' => 'Produit introuvable'], 404);

    $photo = $existing['photo'];
    if (!empty($_FILES['photo']['name'])) {
        $photo = handleUpload($existing['photo']);
    }

    $stmt = $db->prepare('UPDATE produits SET titre=?, description=?, prix=?, photo=?, categorie=?, updated_at=NOW() WHERE id=?');
    $stmt->execute([$titre, $description, $prix, $photo, $categorie, $id]);

    $stmt2 = $db->prepare('SELECT * FROM produits WHERE id = ?');
    $stmt2->execute([$id]);
    jsonResponse($stmt2->fetch());
}

// ─── DELETE /produits/:id (Admin) ──────────────────
if ($method === 'DELETE' && $id) {
    requireAuth();

    $stmt = $db->prepare('SELECT photo FROM produits WHERE id = ?');
    $stmt->execute([$id]);
    $produit = $stmt->fetch();
    if (!$produit) jsonResponse(['error' => 'Produit introuvable'], 404);

    // Supprimer le fichier image
    $photoPath = UPLOAD_DIR . $produit['photo'];
    if (file_exists($photoPath) && !str_contains($produit['photo'], 'placeholder')) {
        unlink($photoPath);
    }

    $stmt = $db->prepare('DELETE FROM produits WHERE id = ?');
    $stmt->execute([$id]);
    jsonResponse(['message' => 'Produit supprimé avec succès']);
}

jsonResponse(['error' => 'Route introuvable'], 404);

// ─── Fonction upload image ─────────────────────────
function handleUpload(?string $oldPhoto = null): string {
    if (empty($_FILES['photo']['name'])) {
        return $oldPhoto ?? 'placeholder.jpg';
    }

    $file = $_FILES['photo'];
    if ($file['error'] !== UPLOAD_ERR_OK) {
        jsonResponse(['error' => 'Erreur upload'], 400);
    }
    if ($file['size'] > MAX_FILE_SIZE) {
        jsonResponse(['error' => 'Fichier trop lourd (max 5MB)'], 400);
    }

    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $mime = $finfo->file($file['tmp_name']);
    if (!in_array($mime, ALLOWED_TYPES)) {
        jsonResponse(['error' => 'Type de fichier non autorisé'], 400);
    }

    $ext = match($mime) {
        'image/jpeg' => 'jpg',
        'image/png'  => 'png',
        'image/webp' => 'webp',
        'image/gif'  => 'gif',
    };

    $filename = uniqid('prod_', true) . '.' . $ext;
    $destPath = UPLOAD_DIR . $filename;

    if (!is_dir(UPLOAD_DIR)) mkdir(UPLOAD_DIR, 0755, true);

    if (!move_uploaded_file($file['tmp_name'], $destPath)) {
        jsonResponse(['error' => 'Impossible de sauvegarder le fichier'], 500);
    }

    // Supprimer l'ancienne photo si elle existe
    if ($oldPhoto && file_exists(UPLOAD_DIR . $oldPhoto) && !str_contains($oldPhoto, 'placeholder')) {
        unlink(UPLOAD_DIR . $oldPhoto);
    }

    return $filename;
}
