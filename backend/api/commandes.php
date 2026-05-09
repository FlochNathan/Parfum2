<?php
// GET    /api/commandes       — admin only
// POST   /api/commandes       — public
// PUT    /api/commandes/:id   — admin only
require_once '../config.php';
setCorsHeaders();

$method = $_SERVER['REQUEST_METHOD'];
$uri = $_SERVER['REQUEST_URI'];

// Extraire l'ID si présent : /api/commandes/42
preg_match('#/api/commandes/(\d+)#', $uri, $m);
$id = isset($m[1]) ? (int)$m[1] : null;

// ── POST /api/commandes — créer une commande (public) ──────────────────────
if ($method === 'POST') {
    $body = json_decode(file_get_contents('php://input'), true);

    $nom      = htmlspecialchars(trim($body['nom']      ?? ''));
    $email    = filter_var(trim($body['email'] ?? ''), FILTER_VALIDATE_EMAIL);
    $tel      = htmlspecialchars(trim($body['telephone'] ?? ''));
    $msg      = htmlspecialchars(trim($body['message']  ?? ''));
    $produits = $body['produits'] ?? null;
    $total    = isset($body['total']) ? round((float)$body['total'], 2) : null;

    if (!$nom || !$email || !$produits || $total === null) {
        jsonResponse(['error' => 'Nom, email, produits et total sont requis'], 400);
    }
    if (!is_array($produits) || count($produits) === 0) {
        jsonResponse(['error' => 'Le panier est vide'], 400);
    }

    $pdo  = getDB();
    $stmt = $pdo->prepare(
        'INSERT INTO commandes (nom, email, telephone, message, produits, total)
         VALUES (:nom, :email, :tel, :msg, :produits, :total)'
    );
    $stmt->execute([
        ':nom'      => $nom,
        ':email'    => $email,
        ':tel'      => $tel,
        ':msg'      => $msg,
        ':produits' => json_encode($produits, JSON_UNESCAPED_UNICODE),
        ':total'    => $total,
    ]);

    jsonResponse(['success' => true, 'id' => (int)$pdo->lastInsertId()], 201);
}

// ── GET /api/commandes — lister (admin) ───────────────────────────────────
if ($method === 'GET' && !$id) {
    requireAuth();
    $pdo  = getDB();
    $rows = $pdo->query('SELECT * FROM commandes ORDER BY created_at DESC')->fetchAll();
    // Décoder le JSON produits pour chaque ligne
    foreach ($rows as &$row) {
        $row['produits'] = json_decode($row['produits'], true);
    }
    jsonResponse($rows);
}

// ── PUT /api/commandes/:id — changer statut (admin) ───────────────────────
if ($method === 'PUT' && $id) {
    requireAuth();
    $body   = json_decode(file_get_contents('php://input'), true);
    $statut = $body['statut'] ?? '';

    $allowed = ['nouvelle', 'vue', 'traitée'];
    if (!in_array($statut, $allowed, true)) {
        jsonResponse(['error' => 'Statut invalide'], 400);
    }

    $pdo  = getDB();
    $stmt = $pdo->prepare('UPDATE commandes SET statut = :statut WHERE id = :id');
    $stmt->execute([':statut' => $statut, ':id' => $id]);

    if ($stmt->rowCount() === 0) {
        jsonResponse(['error' => 'Commande introuvable'], 404);
    }
    jsonResponse(['success' => true]);
}

jsonResponse(['error' => 'Méthode non autorisée'], 405);
