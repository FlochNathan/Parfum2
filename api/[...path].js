// Backend non actif en mode démo (REACT_APP_MOCK=true)
// Ce fichier sera remplacé quand la DB Supabase sera connectée
module.exports = (req, res) => {
  res.status(503).json({ error: 'Backend non disponible en mode démo' });
};
