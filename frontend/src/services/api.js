// src/services/api.js
import axios from 'axios';

const BASE_URL = process.env.REACT_APP_API_URL || '/api';

const api = axios.create({ baseURL: BASE_URL });

// Injecter le token JWT automatiquement
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('laura_token');
  if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});

// Intercepteur erreur global
api.interceptors.response.use(
  (res) => res,
  (err) => {
    if (err.response?.status === 401) {
      localStorage.removeItem('laura_token');
      localStorage.removeItem('laura_admin');
      window.location.href = '/admin/login';
    }
    return Promise.reject(err);
  }
);

// ─── Auth ─────────────────────────────────────────
export const login = (credentials) =>
  api.post('/auth/login', credentials).then((r) => r.data);

// ─── Produits ─────────────────────────────────────
export const getProduits = (categorie) =>
  api.get('/produits', { params: categorie ? { categorie } : {} }).then((r) => r.data);

export const getProduit = (id) =>
  api.get(`/produits/${id}`).then((r) => r.data);

export const createProduit = (formData) =>
  api.post('/produits', formData, { headers: { 'Content-Type': 'multipart/form-data' } }).then((r) => r.data);

export const updateProduit = (id, formData) =>
  api.put(`/produits/${id}`, formData, { headers: { 'Content-Type': 'multipart/form-data' } }).then((r) => r.data);

export const deleteProduit = (id) =>
  api.delete(`/produits/${id}`).then((r) => r.data);

// ─── Commandes ────────────────────────────────────
export const createCommande = (data) => api.post('/commandes', data).then(r => r.data);
export const getCommandes = () => api.get('/commandes').then(r => r.data);
export const updateCommande = (id, data) => api.put(`/commandes/${id}`, data).then(r => r.data);

// ─── Contact ──────────────────────────────────────
export const sendContact = (data) =>
  api.post('/contact', data).then((r) => r.data);

export const getImageUrl = (photo) => {
  if (!photo) return 'https://placehold.co/600x700/f5e8e8/c9958a?text=Laura';
  if (photo.startsWith('http')) return photo;
  const base = process.env.REACT_APP_API_URL?.replace('/api', '') || '';
  return `${base}/uploads/${photo}`;
};
