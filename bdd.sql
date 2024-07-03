-- Base de données :  `shop`
--
DROP DATABASE IF EXISTS `shop`;
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop`;

-- -------------------Structure de la table `User-------------------

CREATE TABLE `User`(
 `id` int PRIMARY KEY AUTO_INCREMENT,
 `nom` VARCHAR(100),
 `prenom` VARCHAR(100),
 `adresse` VARCHAR(100),
 `tel` VARCHAR(20) UNIQUE,
 `email`VARCHAR(40),
 `pwd` VARCHAR(100),
 `profile` ENUM("ADMIN", "CLIENT")
);

 -- Structure de la table `categories`
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `corbeille` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE `produits` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `id_admin` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `corbeille` int,
  CONSTRAINT FOREIGN KEY (`id_admin`) REFERENCES `User`(`id`),
  CONSTRAINT FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    pays_region VARCHAR(50) NOT NULL,
    region_departement VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    expedition VARCHAR(50) NOT NULL,
    total_produits DECIMAL(10, 2) NOT NULL,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_id_admin FOREIGN KEY (id_admin) REFERENCES User(id);
);

CREATE TABLE details_commande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT,
    produit_id INT,
    nom_produit VARCHAR(100),
    quantite INT,
    prix_unitaire DECIMAL(10, 2),
    image VARCHAR(255),
    sous_total DECIMAL(10, 2),
    FOREIGN KEY (commande_id) REFERENCES commandes(id)
);

CREATE TABLE livreurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    adresse TEXT
);

CREATE TABLE panier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT,
    produits_id INT,
    quantite INT,
    FOREIGN KEY (User_id) REFERENCES User(id),
    FOREIGN KEY (produits_id) REFERENCES produit(id)
);







 