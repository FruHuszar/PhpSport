-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 27. 20:21
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.3.6

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `sport`
--
CREATE DATABASE IF NOT EXISTS `sport` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `sport`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapat`
--

DROP TABLE IF EXISTS `csapat`;
CREATE TABLE IF NOT EXISTS `csapat` (
  `csapatAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `orszagAzon` int(11) NOT NULL,
  `kep` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`csapatAzon`),
  KEY `orszagAzon` (`orszagAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `csapat`
--

INSERT INTO `csapat` (`csapatAzon`, `nev`, `orszagAzon`, `kep`) VALUES
(1, 'Minyonok', 1, 'minyonok.png'),
(2, 'Kutya', 2, 'macskak.png'),
(3, 'Medmex', 5, 'medmex.png'),
(4, 'Aranyások', 3, 'aranyasok.png'),
(5, 'Királyok', 4, 'kiraly.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orszag`
--

DROP TABLE IF EXISTS `orszag`;
CREATE TABLE IF NOT EXISTS `orszag` (
  `orszagAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`orszagAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orszag`
--

INSERT INTO `orszag` (`orszagAzon`, `nev`) VALUES
(1, 'Brazilia'),
(2, 'Pualalunkuj'),
(3, 'Török'),
(4, 'Üzbegisztán'),
(5, 'Skócia'),
(6, 'Izrael'),
(2000, 'Beszúrtgg'),
(2001, 'Orosz'),
(2002, 'Orosz'),
(2003, 'Orosz');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `tagAzon` int(11) NOT NULL AUTO_INCREMENT,
  `csapatAzon` int(11) NOT NULL,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`tagAzon`),
  KEY `csapatAzon` (`csapatAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=50012 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--

INSERT INTO `tag` (`tagAzon`, `csapatAzon`, `nev`) VALUES
(1, 1, 'Messi'),
(2, 3, 'Piroska'),
(3, 2, 'Buldog'),
(4, 5, 'Frodó'),
(5, 4, 'Endi'),
(7, 1, 'Dani');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csapat`
--
ALTER TABLE `csapat`
  ADD CONSTRAINT `csapat_ibfk_2` FOREIGN KEY (`orszagAzon`) REFERENCES `orszag` (`orszagAzon`);

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`csapatAzon`) REFERENCES `csapat` (`csapatAzon`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
