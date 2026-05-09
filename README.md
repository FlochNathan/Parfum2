# 🕯️ Les Douceurs Parfumées de Laura

Boutique artisanale full-stack — React.js + PHP + MySQL

---

## 🗂️ Structure du projet

```
douceurs-laura/
├── database.sql              # Script SQL (tables + données de démo)
├── backend/
│   ├── config.php            # Config DB, JWT, helpers
│   ├── .htaccess             # Routage Apache
│   └── api/
│       ├── auth.php          # POST /api/auth/login
│       ├── produits.php      # GET/POST/PUT/DELETE /api/produits
│       └── contact.php       # POST /api/contact
└── frontend/
    ├── package.json
    ├── public/index.html
    └── src/
        ├── App.jsx
        ├── index.js
        ├── index.css
        ├── services/api.js
        ├── context/AuthContext.jsx
        ├── hooks/useToast.js
        ├── components/
        │   ├── Navbar.jsx/css
        │   ├── Footer.jsx/css
        │   ├── ProductCard.jsx/css
        │   └── ProductModal.jsx/css
        └── pages/
            ├── Home.jsx/css
            ├── Boutique.jsx/css
            ├── APropos.jsx/css
            ├── Contact.jsx/css
            ├── Admin.jsx/css
            └── AdminLogin.jsx/css
```

---

## 🚀 Installation

### 1. Base de données

```bash
mysql -u root -p < database.sql
```

Ou via phpMyAdmin : importer `database.sql`

### 2. Backend PHP

Placer le dossier `backend/` dans votre serveur web :

**XAMPP :** `C:\xampp\htdocs\douceurs-laura\backend\`  
**WAMP :**  `C:\wamp\www\douceurs-laura\backend\`

Modifier `backend/config.php` selon votre config :
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');       // Votre mot de passe MySQL
define('DB_NAME', 'douceurs_laura');
define('JWT_SECRET', 'CHANGEZ_CETTE_VALEUR_EN_PROD');
define('CORS_ORIGIN', 'http://localhost:3000');
```

### 3. Frontend React

```bash
cd frontend
npm install

# Créer le fichier d'environnement
echo "REACT_APP_API_URL=http://localhost/douceurs-laura/backend/api" > .env

npm start        # Développement → http://localhost:3000
npm run build    # Production → dossier build/
```

---

## 🔑 Compte admin par défaut

| Champ       | Valeur       |
|-------------|--------------|
| URL         | `/admin/login` |
| Username    | `admin`       |
| Password    | `Laura2024!`  |

> ⚠️ **Changer le mot de passe** après la première connexion en prod !

---

## 📡 Endpoints API

| Méthode | Route                  | Auth | Description             |
|---------|------------------------|------|-------------------------|
| POST    | `/api/auth/login`      | ❌   | Connexion admin          |
| GET     | `/api/produits`        | ❌   | Lister les produits      |
| GET     | `/api/produits?categorie=Bougies` | ❌ | Filtrer par catégorie |
| GET     | `/api/produits/:id`    | ❌   | Détail d'un produit      |
| POST    | `/api/produits`        | ✅   | Créer un produit         |
| PUT     | `/api/produits/:id`    | ✅   | Modifier un produit      |
| DELETE  | `/api/produits/:id`    | ✅   | Supprimer un produit     |
| POST    | `/api/contact`         | ❌   | Formulaire de contact    |

---

## 🎨 Design

- **Palette :** Rose poudré, beige clair, touches dorées
- **Typographie :** Cormorant Garamond (serif élégant) + Jost (sans-serif moderne)
- **Responsive :** Mobile, tablette, desktop
- **Animations :** fadeUp, float, hover scale

---

## 🔒 Sécurité

- Authentification par **JWT** (24h d'expiration)
- Mots de passe hashés avec **bcrypt** (`password_hash`)
- Requêtes SQL via **PDO + statements préparés** (protection XSS/injection)
- Upload sécurisé : vérification MIME type + taille max 5MB
- Headers CORS configurés

---

## 📦 Technologies

| Couche     | Technologies                    |
|------------|---------------------------------|
| Front-end  | React 18, React Router 6, Axios |
| Back-end   | PHP 8+, PDO, JWT maison         |
| Base de données | MySQL 8 / MariaDB          |
| Style      | CSS Variables, Google Fonts     |
# Parfum
