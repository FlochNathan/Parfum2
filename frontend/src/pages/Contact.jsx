// src/pages/Contact.jsx
import { useState } from 'react';
import { sendContact } from '../services/api';
import './Contact.css';

export default function Contact() {
  const [form, setForm] = useState({ nom: '', email: '', sujet: '', message: '' });
  const [status, setStatus] = useState(null); // null | 'loading' | 'success' | 'error'
  const [msg, setMsg] = useState('');

  const handleChange = (e) => setForm(f => ({ ...f, [e.target.name]: e.target.value }));

  const handleSubmit = async (e) => {
    e.preventDefault();
    setStatus('loading');
    try {
      const res = await sendContact(form);
      setMsg(res.message);
      setStatus('success');
      setForm({ nom: '', email: '', sujet: '', message: '' });
    } catch (err) {
      setMsg(err.response?.data?.error || 'Une erreur est survenue.');
      setStatus('error');
    }
  };

  return (
    <main className="contact-page">

      <div className="contact-hero">
        <div className="container">
          <span className="eyebrow">✦ Écrivez-nous</span>
          <h1 className="fade-up">Restons <em>en contact</em></h1>
          <p className="fade-up delay-1">Laura répond avec attention à chaque message sous 48h.</p>
        </div>
      </div>

      <section className="section">
        <div className="container">
          <div className="contact-layout">

            {/* Infos */}
            <div className="contact-infos">
              <h3>Parlons parfums ✦</h3>
              <p>
                Vous souhaitez commander un coffret personnalisé, passer une commande professionnelle
                ou simplement échanger sur l'artisanat ? Laura sera ravie de vous lire.
              </p>

              <div className="contact-infos__list">
                {[
                  ['📍', 'Atelier', 'Provence, France'],
                  ['📧', 'Email', 'contact@douceurs-laura.fr'],
                  ['⏰', 'Réponse', 'Sous 48 heures ouvrées'],
                  ['🌿', 'Instagram', '@douceurs_laura'],
                ].map(([icon, label, value]) => (
                  <div key={label} className="contact-info-item">
                    <span className="contact-info-item__icon">{icon}</span>
                    <div>
                      <strong>{label}</strong>
                      <p>{value}</p>
                    </div>
                  </div>
                ))}
              </div>

              <div className="contact-infos__note">
                <p>💝 Commandes sur mesure, coffrets cadeaux d'entreprise et ateliers découverte disponibles sur demande.</p>
              </div>
            </div>

            {/* Formulaire */}
            <div className="contact-form-wrap">
              <h3>Envoyer un message</h3>

              {status === 'success' ? (
                <div className="contact-success">
                  <span>✨</span>
                  <p>{msg}</p>
                  <button className="btn btn-outline" onClick={() => setStatus(null)}>
                    Envoyer un autre message
                  </button>
                </div>
              ) : (
                <form className="contact-form" onSubmit={handleSubmit}>
                  <div className="contact-form__row">
                    <div className="form-group">
                      <label htmlFor="nom">Votre nom *</label>
                      <input id="nom" name="nom" value={form.nom} onChange={handleChange} placeholder="Marie Dupont" required />
                    </div>
                    <div className="form-group">
                      <label htmlFor="email">Email *</label>
                      <input id="email" name="email" type="email" value={form.email} onChange={handleChange} placeholder="marie@exemple.fr" required />
                    </div>
                  </div>

                  <div className="form-group">
                    <label htmlFor="sujet">Sujet</label>
                    <input id="sujet" name="sujet" value={form.sujet} onChange={handleChange} placeholder="Commande personnalisée, question produit…" />
                  </div>

                  <div className="form-group">
                    <label htmlFor="message">Message *</label>
                    <textarea id="message" name="message" value={form.message} onChange={handleChange} placeholder="Dites-nous tout avec poésie…" rows={6} required />
                  </div>

                  {status === 'error' && (
                    <p style={{ color: '#c05050', fontSize: '0.9rem' }}>⚠️ {msg}</p>
                  )}

                  <button type="submit" className="btn btn-primary" disabled={status === 'loading'} style={{ width: '100%', justifyContent: 'center' }}>
                    {status === 'loading' ? '⏳ Envoi en cours…' : 'Envoyer le message ✉'}
                  </button>
                </form>
              )}
            </div>

          </div>
        </div>
      </section>

    </main>
  );
}
