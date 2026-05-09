// src/pages/APropos.jsx
import { Link } from 'react-router-dom';
import './APropos.css';

export default function APropos() {
  return (
    <main className="apropos-page">

      {/* Hero */}
      <div className="apropos-hero">
        <div className="container">
          <span className="eyebrow">✦ Notre histoire</span>
          <h1 className="fade-up">À propos de <em>Laura</em></h1>
        </div>
      </div>

      <section className="section">
        <div className="container">

          {/* Histoire */}
          <div className="apropos-story">
            <div className="apropos-story__visual">
              <div className="apropos-story__img-wrap">
                <div className="apropos-story__img-placeholder">
                  <span>🕯️</span>
                  <p>Laura dans son atelier</p>
                </div>
              </div>
              <div className="apropos-story__badge">
                <span>Artisan</span>
                <span>depuis 2018</span>
              </div>
            </div>
            <div className="apropos-story__text">
              <span className="eyebrow">L'histoire</span>
              <h2>Née d'une passion, <em>cultivée avec amour</em></h2>
              <p>
                Tout a commencé dans une petite cuisine provençale, avec de la cire fondue,
                des huiles essentielles soigneusement sélectionnées, et une envie irrépressible
                de partager la beauté des parfums naturels.
              </p>
              <p>
                Depuis 2018, Laura crée des objets du quotidien qui subliment chaque instant.
                Chaque bougie, chaque savon est une œuvre unique, pensée pour éveiller
                les sens et créer des souvenirs olfactifs impérissables.
              </p>
              <p>
                Les recettes évoluent avec les saisons, s'inspirant des marchés provençaux,
                des forêts d'automne, des matins de printemps — pour capturer l'essence
                même du bonheur dans chaque création.
              </p>
            </div>
          </div>

          {/* Valeurs */}
          <div className="section-header" style={{ marginTop: '6rem' }}>
            <span className="eyebrow">Ce qui nous guide</span>
            <h2>Nos engagements</h2>
            <div className="divider"><span>✦</span></div>
          </div>

          <div className="apropos-engagements">
            {[
              { icon: '🌱', titre: 'Ingrédients naturels', texte: 'Cire de soja, beurre de karité, huiles essentielles certifiées bio. Rien de superflu, que le meilleur pour vous et la planète.' },
              { icon: '🤲', titre: 'Fait main', texte: 'Du mélange à l\'emballage, chaque étape est réalisée à la main. Aucune chaîne de production, juste des gestes précis et du cœur.' },
              { icon: '♻️', titre: 'Éco-responsable', texte: 'Emballages recyclables, encres naturelles, zéro plastique inutile. Notre planète est notre premier atelier.' },
              { icon: '🇫🇷', titre: 'Made in France', texte: 'Produits fabriqués en France, matières premières sourcées localement autant que possible. Soutenir le savoir-faire artisanal français.' },
            ].map(({ icon, titre, texte }) => (
              <div key={titre} className="engagement-card fade-up">
                <span className="engagement-card__icon">{icon}</span>
                <h4>{titre}</h4>
                <p>{texte}</p>
              </div>
            ))}
          </div>

          {/* CTA */}
          <div className="apropos-cta">
            <h3>Prête à découvrir nos créations ?</h3>
            <p>Explorez la boutique et trouvez votre fragrance signature.</p>
            <div style={{ display: 'flex', gap: '1rem', justifyContent: 'center', flexWrap: 'wrap', marginTop: '2rem' }}>
              <Link to="/boutique" className="btn btn-primary">Visiter la boutique</Link>
              <Link to="/contact" className="btn btn-outline">Nous contacter</Link>
            </div>
          </div>

        </div>
      </section>

    </main>
  );
}
