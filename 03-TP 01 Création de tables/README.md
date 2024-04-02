# :cocktail: TP 01 VIP Cocktail
Créer une base de donnée : **invitation**
Créer une table : **personne**
rajouter le prefixe "inv" à votre table

Nou allons créer une liste d'invités pour des soirées VIP

Chaque personne a :
  
- un prénom
- un nom  
- un age  
- la date de sont inscription
- un status : Valide ou NON Valide (un booléen)
- un type : membre ou non membre (une énumération)
- une description
- salaire annuel

Créer un fichier SQL
- on efface la base si elle existe
- avec création de la base
- tester votre fichier en l'important dans PhpMyadmin
- uploader votre travail sur GIT

# Correction
```mysql
CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE invitation;
-- DEFAULT
-- si on ne met pas la contrainte de NULLITE
-- alors le champ peut etre NULL
CREATE TABLE personne(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(100) NOT NULL DEFAULT 'Toto', 
    nom VARCHAR(100) NOT NULL, 
    age TINYINT(1) NOT NULL,
    inscription DATE NOT NULL DEFAULT NOW(),
    statut TINYINT(1) NOT NULL DEFAULT 1,
    type ENUM('membre','NON MEMBRE') NOT NULL DEFAULT 'NON MEMBRE',
    description TEXT,
    salaire INT NOT NULL
)ENGINE=InnoDB;



DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Toto',
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` tinyint(1) NOT NULL,
  `inscription` date NOT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('membre','NON membre') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NON membre',
  `description` text COLLATE utf8mb4_unicode_ci,
  `salaire` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;
```

