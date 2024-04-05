-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2024 at 10:02 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `location_skis`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `refart` char(5) NOT NULL,
  `designation` varchar(80) NOT NULL,
  `codeGam` char(5) DEFAULT NULL,
  `codeCate` char(5) DEFAULT NULL,
  PRIMARY KEY (`refart`),
  KEY `fk_articles_grilletarifs1_idx` (`codeGam`),
  KEY `fk_articles_grilletarifs2_idx` (`codeCate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES
('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA'),
('F01', 'Fischer Cruiser', 'EG', 'FOA'),
('F02', 'Fischer Cruiser', 'EG', 'FOA'),
('F03', 'Fischer Cruiser', 'EG', 'FOA'),
('F04', 'Fischer Cruiser', 'EG', 'FOA'),
('F05', 'Fischer Cruiser', 'EG', 'FOA'),
('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP'),
('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
('S01', 'Décathlon Apparition', 'EG', 'SURF'),
('S02', 'Décathlon Apparition', 'EG', 'SURF'),
('S03', 'Décathlon Apparition', 'EG', 'SURF');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `codeCate` char(5) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`codeCate`),
  UNIQUE KEY `libelle_UNIQUE` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`codeCate`, `libelle`) VALUES
('MONO', 'Monoski'),
('PA', 'Patinette'),
('SA', 'Ski alpin'),
('FOA', 'Ski de fond alternatif'),
('FOP', 'Ski de fond patineur'),
('SURF', 'Surf');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `noCli` int NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `adresse` varchar(120) DEFAULT NULL,
  `cpo` varchar(5) NOT NULL,
  `ville` varchar(80) NOT NULL DEFAULT 'Nantes',
  PRIMARY KEY (`noCli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES
(1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens'),
(2, 'Bernard', 'Barnabé', 'Rue du bar', '1000', 'Bourg en Bresse'),
(3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes'),
(4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon'),
(5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne'),
(6, 'Ferdinand', 'François', 'Rue de la convention', '44100', 'Nantes'),
(9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris'),
(14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `fiches`
--

DROP TABLE IF EXISTS `fiches`;
CREATE TABLE IF NOT EXISTS `fiches` (
  `noFic` int NOT NULL,
  `noCli` int NOT NULL,
  `dateCrea` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datePaye` datetime DEFAULT NULL,
  `etat` enum('EC','RE','SO') NOT NULL DEFAULT 'EC',
  PRIMARY KEY (`noFic`),
  KEY `fk_fiches_clients_idx` (`noCli`)
) ;

--
-- Dumping data for table `fiches`
--

INSERT INTO `fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES
(1001, 14, '2024-03-20 11:04:38', '2024-03-22 11:04:38', 'SO'),
(1002, 4, '2024-03-22 11:04:38', NULL, 'EC'),
(1003, 1, '2024-03-23 11:04:38', '2024-03-25 11:04:38', 'SO'),
(1004, 6, '2024-03-24 11:04:38', NULL, 'EC'),
(1005, 3, '2024-03-25 11:04:38', NULL, 'EC'),
(1006, 9, '2024-03-25 11:04:38', NULL, 'RE'),
(1007, 1, '2024-04-01 11:04:38', NULL, 'EC'),
(1008, 2, '2024-04-04 11:04:38', NULL, 'EC');

-- --------------------------------------------------------

--
-- Table structure for table `gammes`
--

DROP TABLE IF EXISTS `gammes`;
CREATE TABLE IF NOT EXISTS `gammes` (
  `codeGam` char(5) NOT NULL,
  `libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`codeGam`),
  UNIQUE KEY `libelle_UNIQUE` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gammes`
--

INSERT INTO `gammes` (`codeGam`, `libelle`) VALUES
('EG', 'Entrée de gamme'),
('HG', 'Haut de gamme'),
('PR', 'Matériel Professionnel'),
('MG', 'Moyenne gamme');

-- --------------------------------------------------------

--
-- Table structure for table `grilletarifs`
--

DROP TABLE IF EXISTS `grilletarifs`;
CREATE TABLE IF NOT EXISTS `grilletarifs` (
  `codeGam` char(5) NOT NULL,
  `codeCate` char(5) NOT NULL,
  `codeTarif` char(5) DEFAULT NULL,
  PRIMARY KEY (`codeGam`,`codeCate`),
  KEY `fk_grilletarifs_tarifs1_idx` (`codeTarif`),
  KEY `fk_grilletarifs_categories1_idx` (`codeCate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `grilletarifs`
--

INSERT INTO `grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES
('EG', 'FOA', 'T1'),
('EG', 'MONO', 'T1'),
('EG', 'PA', 'T1'),
('EG', 'SA', 'T1'),
('EG', 'SURF', 'T1'),
('EG', 'FOP', 'T2'),
('MG', 'FOA', 'T2'),
('MG', 'MONO', 'T2'),
('MG', 'PA', 'T2'),
('MG', 'SA', 'T2'),
('MG', 'SURF', 'T2'),
('HG', 'SURF', 'T3'),
('MG', 'FOP', 'T3'),
('HG', 'FOA', 'T4'),
('HG', 'FOP', 'T4'),
('HG', 'SA', 'T4'),
('PR', 'SURF', 'T5'),
('PR', 'FOA', 'T6'),
('PR', 'FOP', 'T6'),
('PR', 'SA', 'T6');

-- --------------------------------------------------------

--
-- Table structure for table `lignesfic`
--

DROP TABLE IF EXISTS `lignesfic`;
CREATE TABLE IF NOT EXISTS `lignesfic` (
  `noFic` int NOT NULL AUTO_INCREMENT,
  `noLig` int NOT NULL,
  `refart` char(8) NOT NULL,
  `depart` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retour` datetime DEFAULT NULL,
  PRIMARY KEY (`noFic`,`noLig`),
  KEY `fk_lignesfic_articles1_idx` (`refart`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lignesfic`
--

INSERT INTO `lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES
(1001, 1, 'F05', '2024-03-20 11:04:38', '2024-03-22 11:04:38'),
(1001, 2, 'F50', '2024-03-20 11:04:38', '2024-03-21 11:04:38'),
(1001, 3, 'F60', '2024-03-22 11:04:38', '2024-03-22 11:04:38'),
(1002, 1, 'A03', '2024-03-22 11:04:38', '2024-03-26 11:04:38'),
(1002, 2, 'A04', '2024-03-23 11:04:38', '2024-03-28 11:04:38'),
(1002, 3, 'S03', '2024-03-27 11:04:38', NULL),
(1003, 1, 'F50', '2024-03-23 11:04:38', '2024-03-25 11:04:38'),
(1003, 2, 'F05', '2024-03-23 11:04:38', '2024-03-25 11:04:38'),
(1004, 1, 'P01', '2024-03-29 11:04:38', NULL),
(1005, 1, 'F05', '2024-03-26 11:04:38', '2024-03-30 11:04:38'),
(1005, 2, 'F10', '2024-03-31 11:04:38', NULL),
(1006, 1, 'S01', '2024-03-25 11:04:38', '2024-03-26 11:04:38'),
(1006, 2, 'S02', '2024-03-25 11:04:38', '2024-03-26 11:04:38'),
(1006, 3, 'S03', '2024-03-25 11:04:38', '2024-03-26 11:04:38'),
(1007, 1, 'F50', '2024-04-01 11:04:38', '2024-04-02 11:04:38'),
(1007, 2, 'F05', '2024-04-01 11:04:38', NULL),
(1007, 3, 'F60', '2024-04-03 11:04:38', NULL),
(1007, 4, 'S02', '2024-04-04 11:04:38', NULL),
(1008, 1, 'S01', '2024-04-04 11:04:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
CREATE TABLE IF NOT EXISTS `tarifs` (
  `codeTarif` char(5) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  `prixJour` decimal(5,0) UNSIGNED NOT NULL,
  PRIMARY KEY (`codeTarif`),
  UNIQUE KEY `libelle_UNIQUE` (`libelle`)
) ;

--
-- Dumping data for table `tarifs`
--

INSERT INTO `tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES
('T1', 'Base', '10'),
('T2', 'Chocolat', '15'),
('T3', 'Bronze', '20'),
('T4', 'Argent', '30'),
('T5', 'Or', '50'),
('T6', 'Platine', '90');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_articles_grilletarifs1` FOREIGN KEY (`codeGam`) REFERENCES `grilletarifs` (`codeGam`),
  ADD CONSTRAINT `fk_articles_grilletarifs2` FOREIGN KEY (`codeCate`) REFERENCES `grilletarifs` (`codeCate`);

--
-- Constraints for table `fiches`
--
ALTER TABLE `fiches`
  ADD CONSTRAINT `fk_fiches_clients` FOREIGN KEY (`noCli`) REFERENCES `clients` (`noCli`) ON DELETE CASCADE;

--
-- Constraints for table `grilletarifs`
--
ALTER TABLE `grilletarifs`
  ADD CONSTRAINT `fk_grilletarifs_categories1` FOREIGN KEY (`codeCate`) REFERENCES `categories` (`codeCate`),
  ADD CONSTRAINT `fk_grilletarifs_gammes1` FOREIGN KEY (`codeGam`) REFERENCES `gammes` (`codeGam`),
  ADD CONSTRAINT `fk_grilletarifs_tarifs1` FOREIGN KEY (`codeTarif`) REFERENCES `tarifs` (`codeTarif`);

--
-- Constraints for table `lignesfic`
--
ALTER TABLE `lignesfic`
  ADD CONSTRAINT `fk_lignesfic_articles1` FOREIGN KEY (`refart`) REFERENCES `articles` (`refart`),
  ADD CONSTRAINT `fk_lignesfic_fiches1` FOREIGN KEY (`noFic`) REFERENCES `fiches` (`noFic`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
