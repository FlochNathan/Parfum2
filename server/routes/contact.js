const express = require('express');
const router = express.Router();

// POST /api/contact
router.post('/', (req, res) => {
  const { nom, email, sujet, message } = req.body;

  if (!nom || !email || !message) {
    return res.status(400).json({ error: 'Champs requis manquants' });
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Email invalide' });
  }

  // Prêt pour l'intégration d'un service mail (nodemailer, etc.)
  console.log('Message contact reçu:', { nom, email, sujet, message });

  res.json({ message: 'Message envoyé avec succès' });
});

module.exports = router;
