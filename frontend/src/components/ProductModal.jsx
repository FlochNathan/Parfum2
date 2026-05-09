// src/components/ProductModal.jsx
import { useState, useEffect, useRef } from 'react';
import { createProduit, updateProduit, getImageUrl } from '../services/api';
import './ProductModal.css';

const CATEGORIES = ['Bougies', 'Savons', 'Diffuseurs', 'Coffrets', 'Autre'];

export default function ProductModal({ produit, onClose, onSaved }) {
  const isEdit = !!produit;
  const fileRef = useRef(null);

  const [form, setForm] = useState({
    titre: produit?.titre || '',
    description: produit?.description || '',
    prix: produit?.prix || '',
    categorie: produit?.categorie || 'Bougies',
  });
  const [photoFile, setPhotoFile] = useState(null);
  const [preview, setPreview] = useState(produit ? getImageUrl(produit.photo) : null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleChange = (e) => setForm(f => ({ ...f, [e.target.name]: e.target.value }));

  const handlePhoto = (e) => {
    const file = e.target.files[0];
    if (!file) return;
    setPhotoFile(file);
    setPreview(URL.createObjectURL(file));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!form.titre || !form.prix) { setError('Titre et prix requis'); return; }
    if (!isEdit && !photoFile) { setError('Une photo est requise'); return; }

    setLoading(true);
    setError('');
    try {
      const fd = new FormData();
      Object.entries(form).forEach(([k, v]) => fd.append(k, v));
      if (photoFile) fd.append('photo', photoFile);

      let saved;
      if (isEdit) {
        saved = await updateProduit(produit.id, fd);
      } else {
        saved = await createProduit(fd);
      }
      onSaved(saved, isEdit);
    } catch (err) {
      setError(err.response?.data?.error || 'Erreur lors de la sauvegarde');
    } finally {
      setLoading(false);
    }
  };

  // Trap focus / Escape
  useEffect(() => {
    const onKey = (e) => { if (e.key === 'Escape') onClose(); };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose]);

  return (
    <div className="modal-backdrop" onClick={(e) => e.target === e.currentTarget && onClose()}>
      <div className="modal">
        <div className="modal__header">
          <h3>{isEdit ? '✏️ Modifier le produit' : '✨ Nouveau produit'}</h3>
          <button className="modal__close" onClick={onClose}>✕</button>
        </div>

        <form className="modal__form" onSubmit={handleSubmit}>
          <div className="modal__photo-zone" onClick={() => fileRef.current?.click()}>
            {preview ? (
              <img src={preview} alt="Aperçu" />
            ) : (
              <div className="modal__photo-placeholder">
                <span>📷</span>
                <p>Cliquer pour ajouter une photo</p>
              </div>
            )}
            <input ref={fileRef} type="file" accept="image/*" onChange={handlePhoto} hidden />
          </div>

          <div className="modal__fields">
            <div className="form-group">
              <label htmlFor="titre">Titre du produit *</label>
              <input id="titre" name="titre" value={form.titre} onChange={handleChange} placeholder="Bougie Rose & Jasmin" required />
            </div>

            <div className="form-group">
              <label htmlFor="description">Description</label>
              <textarea id="description" name="description" value={form.description} onChange={handleChange} placeholder="Décrivez votre création avec poésie..." rows={4} />
            </div>

            <div className="modal__row">
              <div className="form-group">
                <label htmlFor="prix">Prix (€) *</label>
                <input id="prix" name="prix" type="number" step="0.01" min="0" value={form.prix} onChange={handleChange} placeholder="24.90" required />
              </div>
              <div className="form-group">
                <label htmlFor="categorie">Catégorie</label>
                <select id="categorie" name="categorie" value={form.categorie} onChange={handleChange}>
                  {CATEGORIES.map(c => <option key={c} value={c}>{c}</option>)}
                </select>
              </div>
            </div>

            {error && <p className="modal__error">⚠️ {error}</p>}

            <div className="modal__actions">
              <button type="button" className="btn btn-outline" onClick={onClose}>Annuler</button>
              <button type="submit" className="btn btn-primary" disabled={loading}>
                {loading ? '⏳ Sauvegarde...' : isEdit ? '✔ Mettre à jour' : '✨ Créer'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}
