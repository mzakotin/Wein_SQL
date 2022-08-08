-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Mai 2022 um 11:32
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `wein`
--
CREATE DATABASE IF NOT EXISTS `wein` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wein`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `ArtNr` int(11) NOT NULL,
  `Bezeichnung` varchar(50) NOT NULL,
  `Weingut` varchar(50) NOT NULL,
  `Jahrgang` int(11) DEFAULT NULL,
  `Farbe` varchar(50) NOT NULL,
  `Preis` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`ArtNr`, `Bezeichnung`, `Weingut`, `Jahrgang`, `Farbe`, `Preis`) VALUES
(100001, 'Les Châteaux', 'Louis Max', 2002, 'rot', 17.9),
(100002, 'Chablis', 'Louis Max', 2005, 'weiß', 15.5),
(100003, 'Château Caraguilhes ', 'Louis Max', 2005, 'rosé', 14.9),
(145119, 'Le Cop de Cazes', 'Domaine Cazes', 2004, 'rot', 6.9),
(604851, 'Prosecco Val Monte', 'Cave Bellenda', NULL, 'weiß', 7.6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auftrag`
--

CREATE TABLE `auftrag` (
  `AuftrNr` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `KndNr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `auftrag`
--

INSERT INTO `auftrag` (`AuftrNr`, `Datum`, `KndNr`) VALUES
(1001, '2006-10-12', 100101),
(1002, '2006-02-12', 100102),
(1003, '2007-03-01', 100101),
(1004, '2006-02-12', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auftrpos`
--

CREATE TABLE `auftrpos` (
  `AuftrNr` int(11) NOT NULL,
  `PosNr` int(11) NOT NULL,
  `Anzahl` int(11) NOT NULL,
  `ArtNr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `auftrpos`
--

INSERT INTO `auftrpos` (`AuftrNr`, `PosNr`, `Anzahl`, `ArtNr`) VALUES
(1001, 1, 1, 100001),
(1001, 2, 1, 100002),
(1001, 4, 1, 145119),
(1003, 3, 12, 100003);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `KndNr` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Str` varchar(50) NOT NULL,
  `PLZ` varchar(50) NOT NULL,
  `Ort` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`KndNr`, `Name`, `Vorname`, `Str`, `PLZ`, `Ort`) VALUES
(100101, 'Kehl', 'Thomas', 'Weinstr.', '79675', 'Kaiserstuhl'),
(100102, 'Kehl', 'Thomas', 'Im Riesling 3', '68734', 'Eltville'),
(100105, 'Riesling', 'Karin', '67 Rue de Château', 'F-68567', 'Colmar'),
(100106, 'Burgunder', 'Franz', 'Am Weinberg 13', '01067', 'Dresden');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lieferant`
--

CREATE TABLE `lieferant` (
  `LftNr` int(11) NOT NULL,
  `Firma` varchar(50) NOT NULL,
  `Postfach` varchar(10) NOT NULL,
  `PLZ` varchar(10) NOT NULL,
  `Ort` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `lieferant`
--

INSERT INTO `lieferant` (`LftNr`, `Firma`, `Postfach`, `PLZ`, `Ort`) VALUES
(1, 'Weingroßhandel Lehr', '45367', 'F-68567', 'Colmar'),
(2, 'Bremer Weinkonto', '56', '28195', 'Bremen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `repraesentanz`
--

CREATE TABLE `repraesentanz` (
  `LftNr` int(11) NOT NULL,
  `Weingut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `repraesentanz`
--

INSERT INTO `repraesentanz` (`LftNr`, `Weingut`) VALUES
(1, 'Louis Max'),
(2, 'Domaine Caze'),
(3, 'Cave Bellenda');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`ArtNr`);

--
-- Indizes für die Tabelle `auftrag`
--
ALTER TABLE `auftrag`
  ADD PRIMARY KEY (`AuftrNr`);

--
-- Indizes für die Tabelle `auftrpos`
--
ALTER TABLE `auftrpos`
  ADD PRIMARY KEY (`AuftrNr`,`PosNr`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`KndNr`);

--
-- Indizes für die Tabelle `lieferant`
--
ALTER TABLE `lieferant`
  ADD PRIMARY KEY (`LftNr`);

--
-- Indizes für die Tabelle `repraesentanz`
--
ALTER TABLE `repraesentanz`
  ADD PRIMARY KEY (`LftNr`,`Weingut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
