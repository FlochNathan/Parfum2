// src/pages/Cart.jsx
import { useState } from 'react';
import { useCart } from '../context/CartContext';
import { createCommande } from '../services/api';
import { getImageUrl } from '../services/api';
import './Cart.css';

export default function Cart() {
  const { items, removeFromCart, updateQty, clearCart, total } = useCart();
  const [form, setForm] = useState({ nom: '', email: '', telephone: '', message: '' });
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState('');

  const handleChange = (e) => setForm(f => ({ ...f, [e.target.name]: e.target.value }));

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (items.length === 0) return;
    setLoading(true);
    setError('');
    try {
      const produits = items.map(i => ({
        id: i.produit.id,
        titre: i.produit.titre,
        prix: Number(i.produit.prix),
        quantite: i.quantite,
      }));
      await createCommande({ ...form, produits, total: Math.round(total * 100) / 100 });
      clearCart();
      setSuccess(true);
    } catch (err) {
      setError(err.response?.data?.error || 'Une erreur est survenue. Veuillez réessayer.');
    } finally {
      setLoading(false);
    }
  };

  if (success) {
    return (
      <main className="cart-page">
        <div className="container cart-success">
          <div className="cart-success__icon">✨</div>
          <h2>Commande envoyée !</h2>
          <p>Merci pour votre commande. Laura vous contactera très prochainement pour confirmer les détails.</p>
          <a href="/boutique" className="btn btn-primary">Continuer mes achats</a>
        </div>
      </main>
    );
  }

  return (
    <main className="cart-page">
      <div className="container">
        <h2 className="cart-title">Mon panier</h2>

        {items.length === 0 ? (
          <div className="cart-empty">
            <p>Votre panier est vide 🛒</p>
            <a href="/boutique" className="btn btn-primary">Découvrir la boutique</a>
          </div>
        ) : (
          <div className="cart-layout">
            {/* Liste des produits */}
            <div className="cart-items">
              {items.map(({ produit, quantite }) => (
                <div key={produit.id} className="cart-item">
                  <img
                    src={getImageUrl(produit.photo)}
                    alt={produit.titre}
                    className="cart-item__img"
                    onError={(e) => { e.target.src = `https://placehold.co/80x80/f5e8e8/c9958a?text=${encodeURIComponent(produit.titre)}`; }}
                  />
                  <div className="cart-item__info">
                    <h4>{produit.titre}</h4>
                    <p className="cart-item__price">{Number(produit.prix).toFixed(2)} €</p>
                  </div>
                  <div className="cart-item__qty">
                    <button onClick={() => updateQty(produit.id, quantite - 1)}>−</button>
                    <span>{quantite}</span>
                    <button onClick={() => updateQty(produit.id, quantite + 1)}>+</button>
                  </div>
                  <p className="cart-item__subtotal">{(Number(produit.prix) * quantite).toFixed(2)} €</p>
                  <button className="cart-item__remove" onClick={() => removeFromCart(produit.id)} aria-label="Supprimer">✕</button>
                </div>
              ))}
              <div className="cart-total">
                <span>Total</span>
                <strong>{total.toFixed(2)} €</strong>
              </div>
            </div>

            {/* Formulaire commande */}
            <div className="cart-form-wrap">
              <h3>Vos coordonnées</h3>
              <form className="cart-form" onSubmit={handleSubmit}>
                <div className="form-group">
                  <label htmlFor="nom">Nom *</label>
                  <input id="nom" name="nom" type="text" value={form.nom} onChange={handleChange} required placeholder="Votre nom" />
                </div>
                <div className="form-group">
                  <label htmlFor="email">Email *</label>
                  <input id="email" name="email" type="email" value={form.email} onChange={handleChange} required placeholder="votre@email.fr" />
                </div>
                <div className="form-group">
                  <label htmlFor="telephone">Téléphone</label>
                  <input id="telephone" name="telephone" type="tel" value={form.telephone} onChange={handleChange} placeholder="06 00 00 00 00" />
                </div>
                <div className="form-group">
                  <label htmlFor="message">Message</label>
                  <textarea id="message" name="message" rows="3" value={form.message} onChange={handleChange} placeholder="Précisions, livraison..."></textarea>
                </div>
                {error && <p className="cart-error">{error}</p>}
                <button type="submit" className="btn btn-primary cart-submit" disabled={loading}>
                  {loading ? 'Envoi…' : `Passer la commande — ${total.toFixed(2)} €`}
                </button>
              </form>
            </div>
          </div>
        )}
      </div>
    </main>
  );
}
