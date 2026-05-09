// src/context/AuthContext.jsx
import { createContext, useContext, useState, useCallback } from 'react';
import { login as apiLogin } from '../services/api';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [admin, setAdmin] = useState(() => {
    const saved = localStorage.getItem('laura_admin');
    return saved ? JSON.parse(saved) : null;
  });

  const loginFn = useCallback(async (credentials) => {
    const data = await apiLogin(credentials);
    localStorage.setItem('laura_token', data.token);
    localStorage.setItem('laura_admin', JSON.stringify({ username: data.username }));
    setAdmin({ username: data.username });
    return data;
  }, []);

  const logout = useCallback(() => {
    localStorage.removeItem('laura_token');
    localStorage.removeItem('laura_admin');
    setAdmin(null);
  }, []);

  return (
    <AuthContext.Provider value={{ admin, login: loginFn, logout }}>
      {children}
    </AuthContext.Provider>
  );
}

export const useAuth = () => useContext(AuthContext);
