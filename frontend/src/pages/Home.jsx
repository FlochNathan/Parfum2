// src/pages/Home.jsx
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getProduits } from '../services/api';
import ProductCard from '../components/ProductCard';
import './Home.css';

export default function Home() {
  const [produits, setProduits] = useState([]);

  useEffect(() => {
    getProduits().then(data => setProduits(data.slice(0, 3))).catch(() => {});
  }, []);

  return (
    <main className="home">

      {/* ── HERO ───────────────────────────────────── */}
      <section className="hero">
        <div className="hero__bg-texture"></div>
        <div className="container hero__content">
          <span className="eyebrow fade-up">✦ Artisanat &amp; Parfums</span>
          <h1 className="fade-up delay-1">L'art de sentir<br /><em>le bonheur</em></h1>
          <p className="fade-up delay-2">
            Des créations uniques façonnées à la main, avec des matières nobles
            et des fragrances qui racontent une histoire.
          </p>
          <div className="hero__cta fade-up delay-3">
            <Link to="/boutique" className="btn btn-primary">Explorer la boutique</Link>
            <Link to="/a-propos" className="btn btn-ghost">Notre histoire</Link>
          </div>
        </div>
        <div className="hero__scroll">↓</div>
        <div className="hero__shapes">
          <div className="hero__shape hero__shape--1"></div>
          <div className="hero__shape hero__shape--2"></div>
        </div>
      </section>

      {/* ── VALEURS ────────────────────────────────── */}
      <section className="section values">
        <div className="container">
          <div className="values__grid">
            {[
              ['🌿', 'Naturel', 'Cire de soja pure, huiles essentielles bio, sans additifs chimiques.'],
              ['✋', 'Artisanal', 'Chaque pièce est coulée, façonnée et emballée à la main avec soin.'],
              ['💝', 'Engagé', 'Emballages recyclables et circuits courts pour préserver la planète.'],
            ].map(([icon, title, desc]) => (
              <div key={title} className="value-card fade-up">
                <span className="value-card__icon">{icon}</span>
                <h3>{title}</h3>
                <p>{desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── PRODUITS VEDETTES ──────────────────────── */}
      <section className="section section--beige">
        <div className="container">
          <div className="section-header">
            <span className="eyebrow">Coups de cœur</span>
            <h2>Nos créations phares</h2>
            <div className="divider"><span>✦</span></div>
            <p>Des fragrances soigneusement sélectionnées pour sublimer votre quotidien.</p>
          </div>

          {produits.length > 0 ? (
            <div className="products-grid">
              {produits.map((p, i) => (
                <div key={p.id} className={`fade-up delay-${i + 1}`}>
                  <ProductCard produit={p} />
                </div>
              ))}
            </div>
          ) : (
            <p style={{ textAlign: 'center', color: 'var(--text-light)' }}>
              Chargement des créations…
            </p>
          )}

          <div style={{ textAlign: 'center', marginTop: '3rem' }}>
            <Link to="/boutique" className="btn btn-outline">
              Voir toute la collection →
            </Link>
          </div>
        </div>
      </section>

      {/* ── CITATION ───────────────────────────────── */}
      <section className="section quote-section">
        <div className="container">
          <blockquote>
            <p>"Un parfum est un poème que l'on respire."</p>
            <cite>— Laura</cite>
          </blockquote>
        </div>
      </section>

      {/* ── BANNIÈRE CONTACT ───────────────────────── */}
      <section className="section cta-banner">
        <div className="container">
          <div className="cta-banner__inner">
            <div>
              <h2>Une question ? Un cadeau à offrir ?</h2>
              <p>Laura est là pour vous guider et créer votre coffret sur mesure.</p>
            </div>
            <Link to="/contact" className="btn btn-primary">Nous écrire ✉</Link>
          </div>
        </div>
      </section>

    </main>
  );
}
