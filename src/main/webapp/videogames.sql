-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 13:26:58
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videogames`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `contenido` varchar(10000) NOT NULL,
  `fecha` date NOT NULL,
  `accesible` tinyint(1) NOT NULL,
  `LGTBI` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titular`, `contenido`, `fecha`, `accesible`, `LGTBI`) VALUES
(1, 'sggdsóó', 'gdsgsgsdgóó', '2023-11-27', 0, 1),
(2, 'fdhdfh', 'dhfdhd', '2023-12-04', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `donacion` varchar(100) NOT NULL,
  `metodo_pago` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `nombre`, `empresa`, `fecha`, `donacion`, `metodo_pago`) VALUES
(1, 'Marvel s Spider-Man 2', 'Imsoniac Games', '2023', '5', 'PayPal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `user`, `password`, `admin`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(2, 'sara', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(3, 'prueba', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `accesible` tinyint(1) DEFAULT 0,
  `LGTBI` tinyint(1) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`id`, `nombre`, `empresa`, `fecha`, `accesible`, `LGTBI`, `url`) VALUES
(1, 'Baldurs Gate', 'Larian Studios', '2023', 0, 1, 'https://baldursgate3.game/'),
(2, 'The Last of Us 2', 'Naughty Dog', '2020', 0, 1, 'https://www.naughtydog.com/blog/the_last_of_us_part_ii'),
(3, 'Life is Strange', 'Square Enix', '2015', 0, 1, 'https://lifeisstrange.square-enix-games.com/es/games/life-is-strange-remastered-collection/'),
(4, 'Hades', 'Supergiant Games', '2018', 0, 1, 'https://www.supergiantgames.com/games/hades/'),
(5, 'God of War Ragnarok', 'Santa Monica Studio', '2022', 0, 1, 'https://www.playstation.com/es-es/games/god-of-war-ragnarok/'),
(6, 'Celeste', 'Maddy Makes Games', '2018', 0, 1, 'https://www.celestegame.com/'),
(7, 'Diablo IV', 'Blizzard Entertainment', '2023', 0, 1, 'https://diablo4.blizzard.com/es-es/');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
