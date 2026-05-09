// src/components/ProductCard.jsx
import { getImageUrl } from '../services/api';
import { useCart } from '../context/CartContext';
import './ProductCard.css';

const CATEGORY_ICONS = {
  'Bougies': '🕯️',
  'Savons': '🧼',
  'Diffuseurs': '🌿',
  'Coffrets': '🎁',
  'Autre': '✦',
};

export default function ProductCard({ produit, onEdit, onDelete, isAdmin }) {
  const { id, titre, description, prix, photo, categorie } = produit;
  const icon = CATEGORY_ICONS[categorie] || '✦';
  const { addToCart } = useCart();

  return (
    <div className="product-card card fade-up">
      <div className="product-card__image-wrap">
        <img
          src={getImageUrl(photo)}
          alt={titre}
          className="product-card__image"
          onError={(e) => {
            e.target.src = `https://placehold.co/600x700/f5e8e8/c9958a?text=${encodeURIComponent(titre)}`;
          }}
        />
        <div className="product-card__overlay">
          <span className="badge badge-rose">{icon} {categorie}</span>
        </div>
      </div>

      <div className="product-card__body">
        <h3 className="product-card__title">{titre}</h3>
        <p className="product-card__desc">{description}</p>
        <div className="product-card__footer">
          <span className="product-card__price">{Number(prix).toFixed(2)} €</span>
          {isAdmin ? (
            <div className="product-card__actions">
              <button className="btn btn-outline btn-sm" onClick={() => onEdit(produit)}>
                ✏️ Modifier
              </button>
              <button className="btn btn-danger btn-sm" onClick={() => onDelete(id)}>
                🗑️
              </button>
            </div>
          ) : (
            <button className="btn btn-primary btn-sm" onClick={() => addToCart(produit)}>
              🛒 Ajouter au panier
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
