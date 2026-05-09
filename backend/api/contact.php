<?php
// POST /api/contact
require_once '../config.php';
setCorsHeaders();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    jsonResponse(['error' => 'Méthode non autorisée'], 405);
}

$body = json_decode(file_get_contents('php://input'), true);
$nom = htmlspecialchars(trim($body['nom'] ?? ''));
$email = filter_var(trim($body['email'] ?? ''), FILTER_VALIDATE_EMAIL);
$sujet = htmlspecialchars(trim($body['sujet'] ?? ''));
$message = htmlspecialchars(trim($body['message'] ?? ''));

if (!$nom || !$email || !$message) {
    jsonResponse(['error' => 'Nom, email et message sont requis'], 400);
}

// En production, envoyer un vrai email :
// mail('contact@douceurs-laura.fr', "Message de $nom : $sujet", $message, "From: $email");

// Simuler le succès
jsonResponse([
    'success' => true,
    'message' => 'Votre message a bien été envoyé. Laura vous répondra avec délicatesse sous 48h ✨'
]);
