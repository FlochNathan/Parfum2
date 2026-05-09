// src/pages/AdminLogin.jsx
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import './AdminLogin.css';

const ACCESS_CODE = 'laura-boutique';

export default function AdminLogin() {
  const [form, setForm] = useState({ username: '', password: '' });
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [accessGranted, setAccessGranted] = useState(
    () => sessionStorage.getItem('laura_access') === '1'
  );
  const [accessCode, setAccessCode] = useState('');
  const [accessError, setAccessError] = useState('');
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleAccessCode = (e) => {
    e.preventDefault();
    if (accessCode === ACCESS_CODE) {
      sessionStorage.setItem('laura_access', '1');
      setAccessGranted(true);
    } else {
      setAccessError('Code incorrect.');
      setAccessCode('');
    }
  };

  if (!accessGranted) {
    return (
      <main className="login-page">
        <div className="login-box">
          <div className="login-box__header">
            <span className="login-box__icon">✦</span>
            <h2>Accès restreint</h2>
            <p>Entrez le code d'accès</p>
          </div>
          <form className="login-form" onSubmit={handleAccessCode}>
            <div className="form-group">
              <label htmlFor="access">Code secret</label>
              <input
                id="access" type="password"
                value={accessCode} onChange={e => setAccessCode(e.target.value)}
                placeholder="••••••••" required autoFocus
              />
            </div>
            {accessError && <p className="login-error">⚠️ {accessError}</p>}
            <button type="submit" className="btn btn-primary"
              style={{ width: '100%', justifyContent: 'center', marginTop: '0.5rem' }}>
              Continuer
            </button>
          </form>
          <p className="login-back"><a href="/">← Retour au site</a></p>
        </div>
      </main>
    );
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true); setError('');
    try {
      await login(form);
      navigate('/admin');
    } catch {
      setError('Identifiants incorrects. Veuillez réessayer.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <main className="login-page">
      <div className="login-box">
        <div className="login-box__header">
          <span className="login-box__icon">✦</span>
          <h2>Espace Administrateur</h2>
          <p>Les Douceurs Parfumées de Laura</p>
        </div>

        <form className="login-form" onSubmit={handleSubmit}>
          <div className="form-group">
            <label htmlFor="username">Identifiant</label>
            <input
              id="username" name="username" autoComplete="username"
              value={form.username} onChange={e => setForm(f => ({ ...f, username: e.target.value }))}
              placeholder="admin" required
            />
          </div>

          <div className="form-group">
            <label htmlFor="password">Mot de passe</label>
            <input
              id="password" name="password" type="password" autoComplete="current-password"
              value={form.password} onChange={e => setForm(f => ({ ...f, password: e.target.value }))}
              placeholder="••••••••" required
            />
          </div>

          {error && <p className="login-error">⚠️ {error}</p>}

          <button type="submit" className="btn btn-primary" disabled={loading}
            style={{ width: '100%', justifyContent: 'center', marginTop: '0.5rem' }}>
            {loading ? '⏳ Connexion…' : 'Se connecter'}
          </button>
        </form>

        <p className="login-back">
          <a href="/">← Retour au site</a>
        </p>
      </div>
    </main>
  );
}
