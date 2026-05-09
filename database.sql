-- ============================================
-- Les Douceurs Parfumées de Laura - Database
-- ============================================

CREATE DATABASE IF NOT EXISTS douceurs_laura CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE douceurs_laura;

CREATE TABLE produits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    description TEXT,
    prix DECIMAL(10,2) NOT NULL,
    photo VARCHAR(255) NOT NULL,
    categorie VARCHAR(100) DEFAULT 'Autre',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Admin par défaut : username=admin / password=Laura2024!
INSERT INTO admin (username, password_hash) VALUES (
    'admin',
    '$2y$10$IPQtASAOc1FcajZE4GhRxeuEe9slMEaP8QUF1a8xZQ0i7NqaJoR0C'
);

CREATE TABLE commandes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  telephone VARCHAR(20),
  message TEXT,
  produits JSON NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  statut ENUM('nouvelle','vue','traitée') DEFAULT 'nouvelle',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Produits de démonstration
INSERT INTO produits (titre, description, prix, photo, categorie) VALUES
('Bougie Rose & Jasmin', 'Une bougie artisanale aux effluves de rose sauvage et de jasmin de Grasse. Coulée à la main dans de la cire de soja pure, elle offre jusqu''à 45 heures de douce lumière.', 24.90, 'bougie-rose-jasmin.jpg', 'Bougies'),
('Savon Lavande Provençale', 'Savon surgras à froid, enrichi en huile d''argan et infusé aux fleurs de lavande de Provence. Une parenthèse de sérénité pour votre peau.', 12.50, 'savon-lavande.jpg', 'Savons'),
('Diffuseur Bois de Santal', 'Diffuseur à roseaux au bois de santal et vanille bourbon. Une fragrance envoûtante qui transforme votre intérieur en havre de paix.', 34.90, 'diffuseur-santal.jpg', 'Diffuseurs'),
('Coffret Nuit Étoilée', 'Un coffret cadeau précieux réunissant une bougie, un savon et un diffuseur aux notes de musc blanc et d''iris. L''élégance à offrir ou à s''offrir.', 68.00, 'coffret-nuit.jpg', 'Coffrets'),
('Bougie Ambre & Vanille', 'Mélange envoûtant d''ambre chaud et de vanille crémeuse. Cette bougie créé une atmosphère cosy et intime, parfaite pour les longues soirées d''automne.', 26.90, 'bougie-ambre.jpg', 'Bougies'),
('Savon Miel & Avoine', 'Savon douceur formulé avec du miel bio et des flocons d''avoine. Nourrit et apaise les peaux sensibles tout en dégageant un parfum gourmand.', 11.00, 'savon-miel.jpg', 'Savons');
