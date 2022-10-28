-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 26 oct. 2022 à 18:07
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinema`
--
CREATE DATABASE IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cinema`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `id_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `name`, `id_price`) VALUES
(1, 'Agneta', NULL),
(2, 'Byram', NULL),
(3, 'Hemi', NULL),
(4, 'Leoni', NULL),
(5, 'Hagzen', NULL),
(6, 'Byram', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ajouter`
--

CREATE TABLE `ajouter` (
  `id_reservation` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ajouter`
--

INSERT INTO `ajouter` (`id_reservation`, `id_user`) VALUES
(1, 1),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `id_moovie` int(11) NOT NULL,
  `id_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`id_moovie`, `id_price`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

CREATE TABLE `cinema` (
  `id_cinema` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `id_session` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cinema`
--

INSERT INTO `cinema` (`id_cinema`, `name`, `address`, `city`, `id_session`) VALUES
(1, 'Polygoneciné', '508 avenue Mariline', 'Strasbourg', NULL),
(2, 'Cinéplus', '102 avenue Foch', 'Nimes', NULL),
(3, 'Cinédrama', '212 avenue Bulbi', 'Lavandou', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `correspondant`
--

CREATE TABLE `correspondant` (
  `id_reservation` int(11) NOT NULL,
  `id_session` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `correspondant`
--

INSERT INTO `correspondant` (`id_reservation`, `id_session`) VALUES
(1, 1),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `gérer`
--

CREATE TABLE `gérer` (
  `id_cinema` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `gérer`
--

INSERT INTO `gérer` (`id_cinema`, `id_admin`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `moovie`
--

CREATE TABLE `moovie` (
  `id_moovie` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `id_session` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `moovie`
--

INSERT INTO `moovie` (`id_moovie`, `title`, `genre`, `id_session`) VALUES
(1, 'The Land Unknown', 'Fantasy', 1),
(2, 'Octagon', 'Action', 2),
(3, 'Outsiders', 'Drama', 3),
(4, 'Elephant Boy', 'Drama', NULL),
(5, 'Cigarette Girl of Mosselprom', 'Comedy', NULL),
(6, 'Blood and Roses', 'Horror', NULL),
(7, 'Kill List', 'Thriller', NULL),
(8, 'Genesis', 'Horror', NULL),
(9, 'Saturn', 'Thriller', NULL),
(10, 'Shrink', 'Drama', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `price`
--

CREATE TABLE `price` (
  `id_price` int(11) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(75) DEFAULT NULL,
  `numero_ticket` int(11) DEFAULT NULL,
  `spot_paiement` tinyint(1) DEFAULT NULL,
  `online_paiement` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `price`
--

INSERT INTO `price` (`id_price`, `price`, `description`, `numero_ticket`, `spot_paiement`, `online_paiement`) VALUES
(1, 5.9, 'moins de 14 ans', 1, 1, 1),
(2, 7.6, 'etudiant', 2, 1, 1),
(3, 9.2, 'plein tarif', 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date`) VALUES
(1, '2022-12-10 00:00:00'),
(2, '2022-12-12 00:00:00'),
(3, '2022-12-14 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `régir`
--

CREATE TABLE `régir` (
  `id_session` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `régir`
--

INSERT INTO `régir` (`id_session`, `id_admin`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id_session` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `place` int(11) DEFAULT NULL CHECK (1 > `place` < 60)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id_session`, `date`, `place`) VALUES
(1, '2022-12-10 00:00:00', 1),
(2, '2022-12-10 00:00:00', 2),
(3, '2022-12-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `first_name`, `last_name`, `role`, `email`, `password`, `phone`, `id_admin`) VALUES
(1, 'Maisie', 'Demkowicz', 'customer', 'mdemkowicz0@twitpic.com', '$2y$10$AQXldLbuI1/USj8IFYQg8OpH8Y7p0procnP8G6x0H1ftA8Xe5UiU2', '6026995093', 0),
(2, 'Ruben', 'Jacombs', 'customer', 'Foreman,rjacombs1@hostgator.com', '$2y$10$E0LIWpA8wGGdfkRmrSQ6sO4GLCoOwFAQc3v18lQWmq7Sbbzgt8VDG', '1132211904', 0),
(3, 'Glenden', 'Simonitto', 'customer', 'gsimonitto2@dailymotion.com', '$2y$10$KITCknBJwucshLzX8hfVXeCiv4xjZdJFCr8ZXEbF0yH0JCFV4Nu8a', '5253450400', 0),
(4, 'Agneta', 'Tocknell', 'Admin', 'atocknell3@a8.net', '$2y$10$rQT8JMFYY6OtZnr3D0tG2.QBEWCxc4YUXbkMvehaO0DDpi.7Zr8Vy', '3108133180', 0),
(5, 'Byram', 'Chellam', 'Admin', 'bchellam4@huffingtonpost.com', '$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6', '6679607207', 0),
(6, 'Hemi', 'Chatsou', 'Admin', 'bcchatsou84@hello.com', '$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6', '6679607210', 1),
(7, 'Leoni', 'Marron', 'Admin', 'bouotcheyeu@hello.com', '$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6', '6679607280', 1),
(8, 'Hagzen', 'Dasz', 'Admin', 'bccsasjuesou84@hello.com', '$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6', '6679707210', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_price` (`id_price`);

--
-- Index pour la table `ajouter`
--
ALTER TABLE `ajouter`
  ADD PRIMARY KEY (`id_reservation`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`id_moovie`,`id_price`),
  ADD KEY `id_price` (`id_price`);

--
-- Index pour la table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id_cinema`),
  ADD KEY `id_session` (`id_session`);

--
-- Index pour la table `correspondant`
--
ALTER TABLE `correspondant`
  ADD PRIMARY KEY (`id_reservation`,`id_session`),
  ADD KEY `id_session` (`id_session`);

--
-- Index pour la table `gérer`
--
ALTER TABLE `gérer`
  ADD PRIMARY KEY (`id_cinema`,`id_admin`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Index pour la table `moovie`
--
ALTER TABLE `moovie`
  ADD PRIMARY KEY (`id_moovie`),
  ADD KEY `id_session` (`id_session`);

--
-- Index pour la table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id_price`),
  ADD UNIQUE KEY `numero_ticket` (`numero_ticket`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`);

--
-- Index pour la table `régir`
--
ALTER TABLE `régir`
  ADD PRIMARY KEY (`id_session`,`id_admin`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id_session`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id_cinema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `moovie`
--
ALTER TABLE `moovie`
  MODIFY `id_moovie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `price`
--
ALTER TABLE `price`
  MODIFY `id_price` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_price`) REFERENCES `price` (`id_price`);

--
-- Contraintes pour la table `ajouter`
--
ALTER TABLE `ajouter`
  ADD CONSTRAINT `ajouter_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`),
  ADD CONSTRAINT `ajouter_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`id_moovie`) REFERENCES `moovie` (`id_moovie`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`id_price`) REFERENCES `price` (`id_price`);

--
-- Contraintes pour la table `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`);

--
-- Contraintes pour la table `correspondant`
--
ALTER TABLE `correspondant`
  ADD CONSTRAINT `correspondant_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`),
  ADD CONSTRAINT `correspondant_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`);

--
-- Contraintes pour la table `gérer`
--
ALTER TABLE `gérer`
  ADD CONSTRAINT `gérer_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id_cinema`),
  ADD CONSTRAINT `gérer_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Contraintes pour la table `moovie`
--
ALTER TABLE `moovie`
  ADD CONSTRAINT `moovie_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`);

--
-- Contraintes pour la table `régir`
--
ALTER TABLE `régir`
  ADD CONSTRAINT `régir_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`),
  ADD CONSTRAINT `régir_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
