// src/pages/Admin.jsx
import { useState, useEffect, useCallback } from 'react';
import { getProduits, deleteProduit, getCommandes, updateCommande } from '../services/api';
import { useAuth } from '../context/AuthContext';
import ProductCard from '../components/ProductCard';
import ProductModal from '../components/ProductModal';
import { useToast } from '../hooks/useToast';
import {
  PieChart, Pie, Cell, Tooltip, Legend, ResponsiveContainer,
  BarChart, Bar, XAxis, YAxis, CartesianGrid,
} from 'recharts';
import './Admin.css';

const CHART_COLORS = ['#c9958a', '#d4a96a', '#8fad91', '#b8a8d4', '#e8c5b5'];
const STATUT_NEXT = { nouvelle: 'vue', vue: 'traitée', traitée: 'nouvelle' };
const STATUT_LABELS = { nouvelle: '🆕 Nouvelle', vue: '👁 Vue', traitée: '✅ Traitée' };

export default function Admin() {
  const { admin } = useAuth();
  const [produits, setProduits] = useState([]);
  const [commandes, setCommandes] = useState([]);
  const [modal, setModal] = useState(null);
  const [loading, setLoading] = useState(true);
  const { toast, showToast } = useToast();

  const load = useCallback(() => {
    setLoading(true);
    Promise.all([
      getProduits().catch(() => []),
      getCommandes().catch(() => []),
    ]).then(([p, c]) => {
      setProduits(p);
      setCommandes(c);
    }).finally(() => setLoading(false));
  }, []);

  useEffect(() => { load(); }, [load]);

  const handleDelete = async (id) => {
    if (!window.confirm('Supprimer ce produit définitivement ?')) return;
    try {
      await deleteProduit(id);
      setProduits(ps => ps.filter(p => p.id !== id));
      showToast('Produit supprimé', 'success');
    } catch {
      showToast('Erreur lors de la suppression', 'error');
    }
  };

  const handleSaved = (saved, isEdit) => {
    if (isEdit) {
      setProduits(ps => ps.map(p => p.id === saved.id ? saved : p));
      showToast('Produit mis à jour ✨', 'success');
    } else {
      setProduits(ps => [saved, ...ps]);
      showToast('Produit créé avec succès ✨', 'success');
    }
    setModal(null);
  };

  const handleStatutChange = async (commande) => {
    const nextStatut = STATUT_NEXT[commande.statut] || 'nouvelle';
    try {
      await updateCommande(commande.id, { statut: nextStatut });
      setCommandes(cs => cs.map(c => c.id === commande.id ? { ...c, statut: nextStatut } : c));
    } catch {
      showToast('Erreur lors de la mise à jour du statut', 'error');
    }
  };

  // ── Données graphiques ──────────────────────────────────────────────────
  const cats = ['Bougies', 'Savons', 'Diffuseurs', 'Coffrets'];

  const pieData = cats.map(cat => ({
    name: cat,
    value: produits.filter(p => p.categorie === cat).length,
  })).filter(d => d.value > 0);

  const barData = cats.map(cat => {
    const items = produits.filter(p => p.categorie === cat);
    const avg = items.length ? items.reduce((s, p) => s + Number(p.prix), 0) / items.length : 0;
    return { name: cat, 'Prix moyen': Math.round(avg * 100) / 100 };
  }).filter(d => d['Prix moyen'] > 0);

  const stats = cats.map(cat => ({
    cat,
    count: produits.filter(p => p.categorie === cat).length,
  }));

  const totalCommandes = commandes.length;
  const nouvellesCommandes = commandes.filter(c => c.statut === 'nouvelle').length;
  const caTotal = commandes.reduce((s, c) => s + Number(c.total), 0);

  return (
    <main className="admin-page">
      <div className="container">

        {/* Header */}
        <div className="admin-header">
          <div>
            <h2>Dashboard Admin ✦</h2>
            <p>Bienvenue, <strong>{admin?.username}</strong> — {produits.length} produit{produits.length > 1 ? 's' : ''} en boutique</p>
          </div>
          <button className="btn btn-primary" onClick={() => setModal('create')}>
            ✨ Nouveau produit
          </button>
        </div>

        {/* Stats produits */}
        <div className="admin-stats">
          {stats.map(({ cat, count }) => (
            <div key={cat} className="admin-stat-card">
              <span className="admin-stat-card__num">{count}</span>
              <span className="admin-stat-card__label">{cat}</span>
            </div>
          ))}
          <div className="admin-stat-card admin-stat-card--gold">
            <span className="admin-stat-card__num">{produits.length}</span>
            <span className="admin-stat-card__label">Total</span>
          </div>
        </div>

        {/* ── Graphiques ── */}
        <div className="admin-section">
          <h3>Statistiques</h3>

          {/* Stats commandes summary */}
          <div className="admin-orders-summary">
            <div className="admin-order-stat">
              <span className="admin-order-stat__num">{totalCommandes}</span>
              <span className="admin-order-stat__label">Commandes totales</span>
            </div>
            <div className="admin-order-stat admin-order-stat--rose">
              <span className="admin-order-stat__num">{nouvellesCommandes}</span>
              <span className="admin-order-stat__label">Nouvelles commandes</span>
            </div>
            <div className="admin-order-stat admin-order-stat--gold">
              <span className="admin-order-stat__num">{caTotal.toFixed(2)} €</span>
              <span className="admin-order-stat__label">CA potentiel</span>
            </div>
          </div>

          <div className="admin-charts">
            {/* PieChart : répartition par catégorie */}
            <div className="admin-chart-card">
              <h4>Répartition par catégorie</h4>
              {pieData.length > 0 ? (
                <ResponsiveContainer width="100%" height={260}>
                  <PieChart>
                    <Pie data={pieData} dataKey="value" nameKey="name" cx="50%" cy="50%" outerRadius={90} label>
                      {pieData.map((_, i) => (
                        <Cell key={i} fill={CHART_COLORS[i % CHART_COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend />
                  </PieChart>
                </ResponsiveContainer>
              ) : (
                <p className="admin-chart-empty">Aucun produit</p>
              )}
            </div>

            {/* BarChart : prix moyen par catégorie */}
            <div className="admin-chart-card">
              <h4>Prix moyen par catégorie (€)</h4>
              {barData.length > 0 ? (
                <ResponsiveContainer width="100%" height={260}>
                  <BarChart data={barData} margin={{ top: 5, right: 20, left: 0, bottom: 5 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#f0e8e0" />
                    <XAxis dataKey="name" tick={{ fontSize: 12 }} />
                    <YAxis tick={{ fontSize: 12 }} />
                    <Tooltip formatter={(v) => `${v} €`} />
                    <Bar dataKey="Prix moyen" radius={[6, 6, 0, 0]}>
                      {barData.map((_, i) => (
                        <Cell key={i} fill={CHART_COLORS[i % CHART_COLORS.length]} />
                      ))}
                    </Bar>
                  </BarChart>
                </ResponsiveContainer>
              ) : (
                <p className="admin-chart-empty">Aucun produit</p>
              )}
            </div>
          </div>
        </div>

        {/* ── Commandes récentes ── */}
        <div className="admin-section">
          <h3>Commandes récentes</h3>
          {loading ? (
            <div className="spinner"></div>
          ) : commandes.length === 0 ? (
            <p className="admin-chart-empty">Aucune commande pour l'instant.</p>
          ) : (
            <div className="admin-orders-table-wrap">
              <table className="admin-orders-table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Client</th>
                    <th>Email</th>
                    <th>Produits</th>
                    <th>Total</th>
                    <th>Date</th>
                    <th>Statut</th>
                  </tr>
                </thead>
                <tbody>
                  {commandes.map(c => (
                    <tr key={c.id} className={`order-row order-row--${c.statut}`}>
                      <td>#{c.id}</td>
                      <td>{c.nom}</td>
                      <td><a href={`mailto:${c.email}`}>{c.email}</a></td>
                      <td>
                        <ul className="order-items-list">
                          {(Array.isArray(c.produits) ? c.produits : []).map((p, i) => (
                            <li key={i}>{p.titre} ×{p.quantite}</li>
                          ))}
                        </ul>
                      </td>
                      <td className="order-total">{Number(c.total).toFixed(2)} €</td>
                      <td className="order-date">{new Date(c.created_at).toLocaleDateString('fr-FR')}</td>
                      <td>
                        <button
                          className={`order-statut-btn order-statut-btn--${c.statut}`}
                          onClick={() => handleStatutChange(c)}
                          title="Cliquer pour passer au statut suivant"
                        >
                          {STATUT_LABELS[c.statut] || c.statut}
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Grille produits */}
        <div className="admin-section">
          <h3>Gestion des produits</h3>
          {loading ? (
            <div className="spinner"></div>
          ) : produits.length === 0 ? (
            <div className="admin-empty">
              <p>🌸 Aucun produit. Créez votre première création !</p>
              <button className="btn btn-primary" onClick={() => setModal('create')}>
                ✨ Créer un produit
              </button>
            </div>
          ) : (
            <div className="admin-grid">
              {produits.map(p => (
                <ProductCard
                  key={p.id} produit={p} isAdmin
                  onEdit={(p) => setModal(p)}
                  onDelete={handleDelete}
                />
              ))}
            </div>
          )}
        </div>

      </div>

      {modal && (
        <ProductModal
          produit={modal === 'create' ? null : modal}
          onClose={() => setModal(null)}
          onSaved={handleSaved}
        />
      )}

      {toast && <div className={`toast ${toast.type}`}>{toast.message}</div>}
    </main>
  );
}
