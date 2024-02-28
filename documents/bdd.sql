-- Crée une base de données nommée php_vanilla avec un jeu de caractères et un classement par défaut
CREATE DATABASE IF NOT EXISTS php_vanilla
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;

-- Utilise la base de données php_vanilla pour les requêtes suivantes
USE php_vanilla;

-- Tableau des catégories pour classer les produits
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), avec auto-incrémentation
    name VARCHAR(100) NOT NULL -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 100 caractères, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau pour stocker les informations sur les images des produits
CREATE TABLE IF NOT EXISTS pictures (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), avec auto-incrémentation
    name VARCHAR(100) NOT NULL -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 100 caractères, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau pour stocker les informations sur les produits disponibles
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), avec auto-incrémentation
    name VARCHAR(150) NOT NULL UNIQUE, -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 150 caractères, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL, UNIQUE garantit que chaque valeur est unique
    content TEXT NOT NULL, -- Type de données TEXT pour stocker des données textuelles de longueur variable, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
    price DECIMAL(10) NOT NULL, -- Type de données DECIMAL pour stocker des valeurs numériques décimales, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Type de données TIMESTAMP pour stocker une date et une heure, DEFAULT CURRENT_TIMESTAMP attribue automatiquement la date et l'heure actuelles lors de l'insertion d'une nouvelle ligne
    isPublish BOOLEAN DEFAULT FALSE, -- Type de données BOOLEAN pour stocker des valeurs logiques (true/false), DEFAULT FALSE attribue automatiquement la valeur FALSE si aucune valeur n'est fournie lors de l'insertion d'une nouvelle ligne
    category_id INT NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE -- Clé étrangère reliant cette colonne à la colonne id de la table categories, ON DELETE CASCADE indique que si une catégorie est supprimée, toutes les produits associés à cette catégorie seront également supprimées pour maintenir l'intégrité référentielle
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau de liaison entre les produits et les images correspondantes
CREATE TABLE IF NOT EXISTS products_pictures (
    product_id INT NOT NULL, -- Type de données INT pour stocker un nombre entier (ID) faisant référence à un produit
    picture_id INT NOT NULL, -- Type de données INT pour stocker un nombre entier (ID) faisant référence à une image
    FOREIGN KEY (product_id) REFERENCES products(id), -- Clé étrangère reliant cette colonne à la colonne id de la table products
    FOREIGN KEY (picture_id) REFERENCES pictures(id) -- Clé étrangère reliant cette colonne à la colonne id de la table pictures
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau pour stocker les avis des utilisateurs sur les produits
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), avec auto-incrémentation
    username VARCHAR(255) NOT NULL, -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 255 caractères, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
    content TEXT NOT NULL, -- Type de données TEXT pour stocker des données textuelles de longueur variable, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
    note INT NOT NULL, -- Type de données INT pour stocker un nombre entier, NOT NULL indique que cette colonne ne peut pas contenir de valeurs NULL
    product_id INT, -- Type de données INT pour stocker un nombre entier (ID) faisant référence à un produit
    FOREIGN KEY (product_id) REFERENCES products(id) -- Clé étrangère reliant cette colonne à la colonne id de la table products
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau pour stocker les informations sur les utilisateurs
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), avec auto-incrémentation
    firstName VARCHAR(50), -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 50 caractères
    lastName VARCHAR(50), -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 50 caractères
    email VARCHAR(150), -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 150 caractères
    password VARCHAR(255) -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 255 caractères
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau pour stocker les rôles des utilisateurs
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- Type de données INT pour stocker un nombre entier (ID), avec auto-incrémentation
    name VARCHAR(50) -- Type de données VARCHAR pour stocker une chaîne de caractères jusqu'à 50 caractères
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table

-- Tableau de liaison entre les utilisateurs et leurs rôles
CREATE TABLE IF NOT EXISTS users_roles (
    user_id INT NOT NULL, -- Type de données INT pour stocker un nombre entier (ID) faisant référence à un utilisateur
    role_id INT NOT NULL, -- Type de données INT pour stocker un nombre entier (ID) faisant référence à un rôle
    FOREIGN KEY (user_id) REFERENCES users(id), -- Clé étrangère reliant cette colonne à la colonne id de la table users
    FOREIGN KEY (role_id) REFERENCES roles(id) -- Clé étrangère reliant cette colonne à la colonne id de la table roles
) ENGINE=InnoDB; -- Le moteur de stockage InnoDB est utilisé pour cette table
