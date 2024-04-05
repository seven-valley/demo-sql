CREATE TABLE `client` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL
);

CREATE TABLE `projet` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `nom` varchar(255)
);

CREATE TABLE `devis` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `version` int NOT NULL,
  `reference` varchar(10) NOT NULL,
  `prix` float NOT NULL,
  `projet_id` int NOT NULL
);

CREATE TABLE `facture` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `reference` varchar(10) NOT NULL,
  `info` varchar(255) NOT NULL,
  `total` float NOT NULL,
  `date_crea` date NOT NULL,
  `date_paiement` date,
  `devis_id` int NOT NULL
);

ALTER TABLE `projet` ADD FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

ALTER TABLE `devis` ADD FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`);

ALTER TABLE `facture` ADD FOREIGN KEY (`devis_id`) REFERENCES `devis` (`id`);
