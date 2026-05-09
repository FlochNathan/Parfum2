<?php
// POST /api/auth/login
require_once '../config.php';
setCorsHeaders();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    jsonResponse(['error' => 'Méthode non autorisée'], 405);
}

$body = json_decode(file_get_contents('php://input'), true);
$username = trim($body['username'] ?? '');
$password = $body['password'] ?? '';

if (!$username || !$password) {
    jsonResponse(['error' => 'Identifiants manquants'], 400);
}

$db = getDB();
$stmt = $db->prepare('SELECT * FROM admin WHERE username = ?');
$stmt->execute([$username]);
$admin = $stmt->fetch();

if (!$admin || !password_verify($password, $admin['password_hash'])) {
    jsonResponse(['error' => 'Identifiants incorrects'], 401);
}

$token = generateJWT(['id' => $admin['id'], 'username' => $admin['username']]);
jsonResponse(['token' => $token, 'username' => $admin['username']]);
