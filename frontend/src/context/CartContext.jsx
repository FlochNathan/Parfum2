// src/context/CartContext.jsx
import { createContext, useContext, useState, useCallback } from 'react';

const CartContext = createContext(null);

const STORAGE_KEY = 'laura_cart';

function loadCart() {
  try {
    const saved = localStorage.getItem(STORAGE_KEY);
    return saved ? JSON.parse(saved) : [];
  } catch {
    return [];
  }
}

function saveCart(items) {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(items));
}

export function CartProvider({ children }) {
  const [items, setItems] = useState(loadCart);

  const addToCart = useCallback((produit) => {
    setItems(prev => {
      const existing = prev.find(i => i.produit.id === produit.id);
      const next = existing
        ? prev.map(i => i.produit.id === produit.id ? { ...i, quantite: i.quantite + 1 } : i)
        : [...prev, { produit, quantite: 1 }];
      saveCart(next);
      return next;
    });
  }, []);

  const removeFromCart = useCallback((produitId) => {
    setItems(prev => {
      const next = prev.filter(i => i.produit.id !== produitId);
      saveCart(next);
      return next;
    });
  }, []);

  const updateQty = useCallback((produitId, quantite) => {
    setItems(prev => {
      const next = quantite <= 0
        ? prev.filter(i => i.produit.id !== produitId)
        : prev.map(i => i.produit.id === produitId ? { ...i, quantite } : i);
      saveCart(next);
      return next;
    });
  }, []);

  const clearCart = useCallback(() => {
    setItems([]);
    localStorage.removeItem(STORAGE_KEY);
  }, []);

  const total = items.reduce((sum, i) => sum + Number(i.produit.prix) * i.quantite, 0);
  const count = items.reduce((sum, i) => sum + i.quantite, 0);

  return (
    <CartContext.Provider value={{ items, addToCart, removeFromCart, updateQty, clearCart, total, count }}>
      {children}
    </CartContext.Provider>
  );
}

export const useCart = () => useContext(CartContext);
