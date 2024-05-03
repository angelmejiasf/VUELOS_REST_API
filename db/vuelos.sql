-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2024 a las 12:35:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vuelos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuerto`
--

CREATE TABLE `aeropuerto` (
  `codaeropuerto` varchar(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `tasa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aeropuerto`
--

INSERT INTO `aeropuerto` (`codaeropuerto`, `nombre`, `ciudad`, `pais`, `tasa`) VALUES
('BRU EBBR', 'Bruselas-Zaventem', 'Bruselas', 'B�lgica', 20),
('CPH EKCH', 'Copenhague-Kastrup', 'Copenhague', 'Dinamarca', 150),
('GWY EICM', 'aeropuerto de Galway', 'Galway', 'Irlanda', 30),
('HEL EFHK', 'Helsinki-Vantaa', 'Helsinki', 'Finlandia', 170),
('MAD LEMD', 'Madrid-Barajas', 'Madrid', 'Espa�a', 30),
('OSL ENGM', 'Oslo-Gardermoen', 'Olso', 'Noruega', 170),
('PMI LEPA', 'Son San Juan', 'Palma de Mallorca', 'Espa�a', 30),
('PRG LKPR', 'aeropuerto de Praga', 'Praga', 'Rep�blica Checa', 50),
('RL  EBCI', 'Bruselas-Charleroi', 'Bruselas', 'B�lgica', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasaje`
--

CREATE TABLE `pasaje` (
  `idpasaje` int(11) NOT NULL,
  `pasajerocod` int(11) NOT NULL,
  `identificador` varchar(10) NOT NULL,
  `numasiento` int(11) DEFAULT NULL,
  `clase` varchar(10) DEFAULT NULL,
  `pvp` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasaje`
--

INSERT INTO `pasaje` (`idpasaje`, `pasajerocod`, `identificador`, `numasiento`, `clase`, `pvp`) VALUES
(1, 1, 'IBE-762', 10, 'PRIMERA', 200),
(2, 2, 'IBE-762', 11, 'PRIMERA', 200),
(3, 3, 'IBE-762', 13, 'PRIMERA', 220),
(4, 4, 'IBE-762', 14, 'TURISTA', 230),
(5, 5, 'IBE-762', 16, 'TURISTA', 250),
(6, 6, 'IBE-762', 25, 'TURISTA', 260),
(7, 7, 'IBE-762', 27, 'BUSINESS', 280),
(8, 1, 'BRU-1234', 20, 'TURISTA', 180),
(9, 2, 'BRU-1234', 21, 'PRIMERA', 190),
(10, 3, 'BRU-1234', 23, 'PRIMERA', 220),
(11, 4, 'BRU-1234', 24, 'TURISTA', 230),
(12, 5, 'BRU-1234', 16, 'TURISTA', 250),
(13, 6, 'BRU-1234', 25, 'TURISTA', 260),
(14, 8, 'KLM-2343', 12, 'TURISTA', 180),
(15, 9, 'KLM-2343', 13, 'PRIMERA', 190),
(16, 10, 'KLM-2343', 14, 'PRIMERA', 220),
(17, 11, 'KLM-2343', 15, 'TURISTA', 230),
(18, 12, 'KLM-2343', 36, 'TURISTA', 250),
(19, 13, 'KLM-2343', 37, 'TURISTA', 260),
(20, 14, 'KLM-2343', 38, 'BUSINESS', 250),
(21, 15, 'KLM-2343', 39, 'BUSINESS', 260),
(22, 16, 'KLM-2343', 40, 'BUSINESS', 270),
(23, 17, 'KLM-2343', 41, 'BUSINESS', 260),
(24, 18, 'IBE-789', 10, 'TURISTA', 170),
(25, 19, 'IBE-789', 13, 'PRIMERA', 180),
(26, 20, 'IBE-789', 14, 'PRIMERA', 220),
(27, 21, 'IBE-789', 15, 'TURISTA', 240),
(28, 22, 'IBE-789', 46, 'TURISTA', 230),
(29, 23, 'IBE-789', 47, 'TURISTA', 270),
(30, 24, 'IBE-789', 48, 'BUSINESS', 220),
(31, 25, 'IBE-789', 49, 'BUSINESS', 230),
(32, 26, 'IBE-789', 50, 'TURISTA', 220),
(33, 15, 'AVI-ASD', 30, 'TURISTA', 170),
(34, 16, 'AVI-ASD', 33, 'PRIMERA', 180),
(35, 17, 'AVI-ASD', 34, 'PRIMERA', 220),
(36, 18, 'AVI-ASD', 35, 'TURISTA', 160),
(37, 19, 'AVI-ASD', 36, 'TURISTA', 150),
(38, 20, 'AVI-ASD', 37, 'TURISTA', 180),
(39, 21, 'AVI-ASD', 58, 'BUSINESS', 170),
(40, 22, 'AVI-ASD', 59, 'BUSINESS', 170),
(41, 23, 'AVI-ASD', 40, 'TURISTA', 120),
(42, 24, 'AVI-ASD', 68, 'BUSINESS', 220),
(43, 25, 'AVI-ASD', 69, 'BUSINESS', 230),
(44, 26, 'AVI-ASD', 41, 'TURISTA', 120),
(45, 1, 'KLM-332', 20, 'PRIMERA', 180),
(46, 2, 'KLM-332', 30, 'TURISTA', 170),
(47, 3, 'KLM-332', 33, 'PRIMERA', 180),
(48, 10, 'KLM-332', 34, 'PRIMERA', 220),
(49, 11, 'KLM-332', 35, 'TURISTA', 160),
(50, 12, 'KLM-332', 36, 'TURISTA', 150),
(51, 20, 'KLM-332', 37, 'TURISTA', 180),
(52, 21, 'KLM-332', 58, 'BUSINESS', 170),
(53, 22, 'KLM-332', 59, 'BUSINESS', 170),
(54, 23, 'KLM-332', 40, 'TURISTA', 120),
(55, 24, 'KLM-332', 68, 'BUSINESS', 220),
(56, 25, 'KLM-332', 69, 'BUSINESS', 230),
(57, 26, 'KLM-332', 41, 'TURISTA', 120),
(58, 20, 'QAT-900', 10, 'TURISTA', 100),
(59, 21, 'QAT-900', 20, 'BUSINESS', 170),
(60, 22, 'QAT-900', 25, 'BUSINESS', 170),
(61, 23, 'QAT-900', 40, 'TURISTA', 100),
(62, 24, 'QAT-900', 30, 'BUSINESS', 220),
(63, 25, 'QAT-900', 35, 'BUSINESS', 230),
(64, 26, 'QAT-900', 41, 'PRIMERA', 120),
(74, 19, 'RYA-230', 23, 'Turista', 300),
(75, 7, 'DEL-456', 34, 'Turista', 3),
(76, 13, 'DEL-34', 2, 'Business', 22),
(77, 1, 'BRU-2222', 22, 'Turista', 22),
(78, 5, 'DEL-34', 33, 'Primera', 33),
(79, 1, 'AVI-345', 33, 'Primera', 33),
(80, 10, 'IBE-212', 33, 'Primera', 33),
(81, 8, 'KLM-78', 4, 'Primera', 2),
(82, 12, 'AVI-345', 2, 'Primera', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

CREATE TABLE `pasajero` (
  `pasajerocod` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `tlf` varchar(10) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `pais` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`pasajerocod`, `nombre`, `tlf`, `direccion`, `pais`) VALUES
(1, 'ATONIO MART�NEZ', '123456', 'AVDA MADRID 2, 2�A, TALAVERA', 'ESPA�A'),
(2, 'MARIA DUE�AS', '444456', 'AVDA ALFARES 4, 8�A, MADRID', 'ESPA�A'),
(3, 'CARLOS GIL', '568956', 'C/ALAMEDA 20, MADRID', 'ESPA�A'),
(4, 'MARIA JIMENEZ', '990456', 'C/LA MONTERA 50, TALAVERA', 'ESPA�A'),
(5, 'ROSARIO FORES', '123888', 'C/LA RIADA 3, ALCORC�N', 'ESPA�A'),
(6, 'ALICIA RAMOS', '66688', 'C/LOS PINTORES 10, TALAVERA', 'ESPA�A'),
(7, 'ANA FUENTES', '8903456', 'C/LA REINA 34, MADRID', 'FRANCIA'),
(8, 'PETRA ALONSO', '222456', 'AVDA MADRID 32, 2�A, TALAVERA', 'FRANCIA'),
(9, 'ANGEL GIL', '444026', 'AVDA ALFARES 14, 8�A, MADRID', 'FRANCIA'),
(10, 'MARTIN PESACADOR', '238956', 'C/ALAMEDA 21, MADRID', 'FRANCIA'),
(11, 'LUIS CABRERO', '130456', 'C/LA CAPA 50, TALAVERA', 'FRANCIA'),
(12, 'JES�S GINER FORES', '23888', 'C/LA REJA 4, ALCORC�N', 'FRANCIA'),
(13, 'CARMEN RAMI', '6668809', 'C/LOS SAUCES 10, TALAVERA', 'PORTUGAL'),
(14, 'FELIME PRIMERO', '89803456', 'C/LA ROSA 3, MADRID', 'PORTUGAL'),
(15, 'JUANJO P�REZ', '92522245', 'AVDA CACERES 32, 2�A, TALAVERA', 'PORTUGAL'),
(16, 'PEDRO AL�A', '949944026', 'AVDA DANZANTES 14, 8�A, MADRID', 'PORTUGAL'),
(17, 'SERGIO GRAC�A', '912238956', 'C/GINER DE LOS RIOS 21, LEGAN�S', 'PORTUGAL'),
(18, 'MR�A CABRERO', '925130456', 'C/LA HERRADURA 30, TORRIJOS', 'PORTUGAL'),
(19, 'OSCAR ALONSO', '918823888', 'C/LOS MOLINOS 3, ALCAL� DE HENARES', 'ALEMANIA'),
(20, 'PILAR MART�N', '925666880', 'C/ALVARADO 30, TOLEDO', 'ESPA�A'),
(21, 'ANG�LICA SEGUNDO', '918980345', 'C/LA ROSA 3, ALCAL� DE HENARES', 'ESPA�A'),
(22, 'MIRIAM CAMACHO', '92544245', 'AVDA MADRID 32, 2�A, TALAVERA', 'ESPA�A'),
(23, 'ROSA AL�A', '949870026', 'AVDA SANZ VAZQUEZ 2, 8�A, MADRID', 'ESPA�A'),
(24, 'ALICIA GARC�A', '916738956', 'C/LIBREROS 23, LEGAN�S', 'ESPA�A'),
(25, 'MARY CASTUERA', '925220400', 'C/LA MINA 5, TORRIJOS', 'ALEMANIA'),
(26, 'SERGIO ALONSO', '91673888', 'C/LOS ALCORES 41, ALCAL� DE HENARES', 'ALEMANIA'),
(27, 'RAQUEL RINC�N', '925316882', 'C/�VILA 13, TOLEDO', 'ALEMANIA'),
(28, 'TITO VALVERDE', '916675544', 'C/LA FRUTA 33, ALCAL� DE HENARES', 'ALEMANIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `identificador` varchar(10) NOT NULL,
  `aeropuertoorigen` varchar(10) DEFAULT NULL,
  `aeropuertodestino` varchar(10) DEFAULT NULL,
  `tipovuelo` varchar(15) DEFAULT NULL,
  `fechavuelo` date DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`identificador`, `aeropuertoorigen`, `aeropuertodestino`, `tipovuelo`, `fechavuelo`, `descuento`) VALUES
('AVI-345', 'MAD LEMD', 'BRU EBBR', 'LARGO RECORRIDO', '2024-05-14', 5),
('AVI-ASD', 'MAD LEMD', 'OSL ENGM', 'LARGO RECORRIDO', '2024-05-30', 10),
('BRU-1234', 'BRU EBBR', 'CPH EKCH', 'CHARTER', '2024-05-29', 5),
('BRU-2222', 'BRU EBBR', 'MAD LEMD', 'DIRECTO', '2024-05-05', 5),
('DEL-34', 'CPH EKCH', 'BRU EBBR', 'DOM�STICO', '2024-07-18', 10),
('DEL-456', 'MAD LEMD', 'PRG LKPR', 'LARGO RECORRIDO', '2024-07-08', 20),
('IBE-212', 'CPH EKCH', 'RL  EBCI', 'CHARTER', '2024-05-31', 10),
('IBE-234', 'PMI LEPA', 'HEL EFHK', 'DOM�STICO', '2024-06-08', 5),
('IBE-762', 'MAD LEMD', 'HEL EFHK', 'DOM�STICO', '2024-05-29', 5),
('IBE-789', 'MAD LEMD', 'GWY EICM', 'DIRECTO', '2024-07-01', 10),
('KLM-2343', 'BRU EBBR', 'PMI LEPA', 'DIRECTO', '2024-05-04', 10),
('KLM-332', 'CPH EKCH', 'HEL EFHK', 'DIRECTO', '2024-07-15', 5),
('KLM-78', 'CPH EKCH', 'MAD LEMD', 'DOM�STICO', '2024-07-04', 10),
('QAT-224', 'CPH EKCH', 'PRG LKPR', 'CHARTER', '2024-05-19', 20),
('QAT-900', 'PMI LEPA', 'MAD LEMD', 'REGULAR', '2024-07-05', 10),
('RYA-22', 'PMI LEPA', 'GWY EICM', 'CHARTER', '2024-05-07', 5),
('RYA-230', 'PMI LEPA', 'OSL ENGM', 'CHARTER', '2024-05-24', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD PRIMARY KEY (`codaeropuerto`);

--
-- Indices de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD PRIMARY KEY (`idpasaje`),
  ADD UNIQUE KEY `pasajeidentificador` (`pasajerocod`,`identificador`),
  ADD KEY `fkpasajevuelo` (`identificador`);

--
-- Indices de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`pasajerocod`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`identificador`),
  ADD KEY `esorigen` (`aeropuertoorigen`),
  ADD KEY `esdestino` (`aeropuertodestino`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  MODIFY `idpasaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD CONSTRAINT `fkpasajepasajero` FOREIGN KEY (`pasajerocod`) REFERENCES `pasajero` (`pasajerocod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fkpasajevuelo` FOREIGN KEY (`identificador`) REFERENCES `vuelo` (`identificador`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `esdestino` FOREIGN KEY (`aeropuertodestino`) REFERENCES `aeropuerto` (`codaeropuerto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `esorigen` FOREIGN KEY (`aeropuertoorigen`) REFERENCES `aeropuerto` (`codaeropuerto`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
