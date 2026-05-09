// src/components/Footer.jsx
import { Link } from 'react-router-dom';
import './Footer.css';

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer__decor">
        <span>✦</span><span>✦</span><span>✦</span>
      </div>
      <div className="container footer__inner">
        <div className="footer__brand">
          <h3>Les Douceurs Parfumées<br /><em>de Laura</em></h3>
          <p>Des créations artisanales nées de la passion,<br />façonnées avec amour pour éveiller vos sens.</p>
        </div>
        <div className="footer__nav">
          <h4>Navigation</h4>
          <ul>
            {[['/', 'Accueil'], ['/boutique', 'Boutique'], ['/a-propos', 'À propos'], ['/contact', 'Contact']].map(([to, label]) => (
              <li key={to}><Link to={to}>{label}</Link></li>
            ))}
          </ul>
        </div>
        <div className="footer__contact">
          <h4>Contact</h4>
          <p>📍 Atelier artisanal, France</p>
          <p>📧 contact@douceurs-laura.fr</p>
          <p>📱 @douceurs_laura</p>
          <div className="footer__socials">
            <a href="#instagram" aria-label="Instagram">Ig</a>
            <a href="#facebook" aria-label="Facebook">Fb</a>
            <a href="#pinterest" aria-label="Pinterest">Pt</a>
          </div>
        </div>
      </div>
      <div className="footer__bottom">
        <p>© {new Date().getFullYear()} Les Douceurs Parfumées de Laura · Fait avec ♡ en France</p>
      </div>
    </footer>
  );
}
