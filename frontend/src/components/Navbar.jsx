// src/components/Navbar.jsx
import { useState, useEffect } from 'react';
import { Link, NavLink, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { useCart } from '../context/CartContext';
import './Navbar.css';

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const { admin, logout } = useAuth();
  const { count } = useCart();
  const navigate = useNavigate();

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 60);
    window.addEventListener('scroll', onScroll);
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  const handleLogout = () => {
    logout();
    navigate('/');
  };

  return (
    <nav className={`navbar ${scrolled ? 'navbar--scrolled' : ''}`}>
      <div className="container navbar__inner">
        <Link to="/" className="navbar__logo">
          <span className="navbar__logo-icon">✦</span>
          <div>
            <span className="navbar__logo-main">Les Douceurs</span>
            <span className="navbar__logo-sub">Parfumées de Laura</span>
          </div>
        </Link>

        <button className="navbar__burger" onClick={() => setMenuOpen(!menuOpen)} aria-label="Menu">
          <span className={menuOpen ? 'open' : ''}></span>
          <span className={menuOpen ? 'open' : ''}></span>
          <span className={menuOpen ? 'open' : ''}></span>
        </button>

        <ul className={`navbar__links ${menuOpen ? 'navbar__links--open' : ''}`}>
          {[['/', 'Accueil'], ['/boutique', 'Boutique'], ['/a-propos', 'À propos'], ['/contact', 'Contact']].map(([to, label]) => (
            <li key={to}>
              <NavLink to={to} end={to === '/'} onClick={() => setMenuOpen(false)}>
                {label}
              </NavLink>
            </li>
          ))}
          {admin && (
            <>
              <li><NavLink to="/admin" onClick={() => setMenuOpen(false)}>Dashboard</NavLink></li>
              <li><button className="navbar__logout" onClick={handleLogout}>Déconnexion</button></li>
            </>
          )}
          <li>
            <NavLink to="/panier" className="navbar__cart" onClick={() => setMenuOpen(false)}>
              🛒
              {count > 0 && <span className="navbar__cart-badge">{count}</span>}
            </NavLink>
          </li>
        </ul>
      </div>
    </nav>
  );
}
