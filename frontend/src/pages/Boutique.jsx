// src/pages/Boutique.jsx
import { useState, useEffect } from 'react';
import { getProduits } from '../services/api';
import ProductCard from '../components/ProductCard';
import './Boutique.css';

const CATEGORIES = ['Tous', 'Bougies', 'Savons', 'Diffuseurs', 'Coffrets'];

const CAT_ICONS = { Tous: '✦', Bougies: '🕯️', Savons: '🧼', Diffuseurs: '🌿', Coffrets: '🎁' };

export default function Boutique() {
  const [produits, setProduits] = useState([]);
  const [categorie, setCategorie] = useState('Tous');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    getProduits(categorie === 'Tous' ? null : categorie)
      .then(setProduits)
      .catch(() => setProduits([]))
      .finally(() => setLoading(false));
  }, [categorie]);

  return (
    <main className="boutique-page">

      {/* En-tête */}
      <div className="boutique-hero">
        <div className="container">
          <span className="eyebrow">✦ Notre collection</span>
          <h1 className="fade-up">La Boutique</h1>
          <p className="fade-up delay-1">Chaque création est une invitation au voyage des sens.</p>
        </div>
      </div>

      <section className="section">
        <div className="container">

          {/* Filtres catégories */}
          <div className="boutique-filters">
            {CATEGORIES.map(cat => (
              <button
                key={cat}
                className={`filter-btn ${categorie === cat ? 'filter-btn--active' : ''}`}
                onClick={() => setCategorie(cat)}
              >
                {CAT_ICONS[cat]} {cat}
              </button>
            ))}
          </div>

          {/* Résultats */}
          {loading ? (
            <div className="spinner"></div>
          ) : produits.length === 0 ? (
            <div className="boutique-empty">
              <p>🌸 Aucune création dans cette catégorie pour le moment.</p>
            </div>
          ) : (
            <>
              <p className="boutique-count">{produits.length} création{produits.length > 1 ? 's' : ''}</p>
              <div className="boutique-grid">
                {produits.map(p => (
                  <ProductCard key={p.id} produit={p} />
                ))}
              </div>
            </>
          )}
        </div>
      </section>

    </main>
  );
}
