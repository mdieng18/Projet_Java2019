-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 22 mai 2019 à 18:06
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetjava`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneescolaire`
--

DROP TABLE IF EXISTS `anneescolaire`;
CREATE TABLE IF NOT EXISTS `anneescolaire` (
  `ID_anneescolaire` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_anneescolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `ID_bulletin` int(255) NOT NULL,
  `ID_trimestre` int(255) NOT NULL,
  `ID_inscription` int(255) NOT NULL,
  `appreciation` text NOT NULL,
  KEY `ID_trimestre` (`ID_trimestre`),
  KEY `ID_inscription` (`ID_inscription`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `ID_classe` int(255) NOT NULL AUTO_INCREMENT,
  `nom_classe` varchar(255) NOT NULL,
  `ID_niveau` int(255) NOT NULL,
  `ID_anneescolaire` int(11) NOT NULL,
  PRIMARY KEY (`ID_classe`),
  KEY `ID_niveau` (`ID_niveau`),
  KEY `ID_anneescolaire` (`ID_anneescolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `detailbulletin`
--

DROP TABLE IF EXISTS `detailbulletin`;
CREATE TABLE IF NOT EXISTS `detailbulletin` (
  `ID_detail` int(255) NOT NULL AUTO_INCREMENT,
  `ID_bulletin` int(255) NOT NULL,
  `ID_enseignement` int(255) NOT NULL,
  `appreciation` text NOT NULL,
  PRIMARY KEY (`ID_detail`),
  KEY `ID_bulletin` (`ID_bulletin`),
  KEY `ID_enseignement` (`ID_enseignement`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `ID_discipline` int(255) NOT NULL AUTO_INCREMENT,
  `nom_discipline` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_discipline`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
CREATE TABLE IF NOT EXISTS `ecole` (
  `ID_ecole` int(255) NOT NULL AUTO_INCREMENT,
  `nom_ecole` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_ecole`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `ID_enseignement` int(255) NOT NULL AUTO_INCREMENT,
  `ID_classe` int(255) NOT NULL,
  `ID_discipline` int(255) NOT NULL,
  `ID_personne` int(255) NOT NULL,
  PRIMARY KEY (`ID_enseignement`),
  KEY `ID_personne` (`ID_personne`),
  KEY `ID_discipline` (`ID_discipline`),
  KEY `ID_classe` (`ID_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `ID_evaluation` int(255) NOT NULL AUTO_INCREMENT,
  `ID_detail` int(255) NOT NULL,
  `note` int(20) NOT NULL,
  `appreciation` text NOT NULL,
  PRIMARY KEY (`ID_evaluation`),
  KEY `ID_detail` (`ID_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `ID_inscription` int(255) NOT NULL AUTO_INCREMENT,
  `ID_classe` int(255) NOT NULL,
  `ID_personne` int(255) NOT NULL,
  PRIMARY KEY (`ID_inscription`),
  KEY `ID_personne` (`ID_personne`),
  KEY `ID_classe` (`ID_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `ID_niveau` int(255) NOT NULL AUTO_INCREMENT,
  `nom_niveau` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_niveau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `ID_personne` int(255) NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(255) NOT NULL,
  `prenom_personne` varchar(255) NOT NULL,
  `type` int(10) NOT NULL,
  PRIMARY KEY (`ID_personne`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
CREATE TABLE IF NOT EXISTS `trimestre` (
  `ID_trimestre` int(255) NOT NULL AUTO_INCREMENT,
  `numero` int(255) NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `ID_anneescolaire` int(255) NOT NULL,
  PRIMARY KEY (`ID_trimestre`),
  KEY `ID_anneescolaire` (`ID_anneescolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
