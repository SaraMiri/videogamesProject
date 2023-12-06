-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2023 a las 20:34:52
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
  `titular` varchar(300) NOT NULL,
  `contenido` varchar(10000) NOT NULL,
  `fecha` date NOT NULL,
  `accesible` tinyint(1) NOT NULL,
  `LGTBI` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titular`, `contenido`, `fecha`, `accesible`, `LGTBI`) VALUES
(1, 'Los videojuegos no son solo juegos, también cuentan historias LGTB ', 'Recientemente ha salido la serie inspirada en el videojuego a HBO. Y sí­, esta serie esta inspirada en el juego de Neil Druckmann y Bruce Straley, como proyecto de Sony. Un día, el mundo deja de ser normal para convertirse en apocalíptico. El hongo Cordyceps ha mutado y se ha introducido en el interior de las personas, convirtiéndoles en criaturas caní­bales infectadas. Ellie, una de las protagonistas es la representación LGTB  en esta historia, concretamente en la parte The Last of Us: Parte 2 comparte una relación intensa con Dina, una de las más habladas en las redes sociales.', '2023-12-05', 0, 1),
(2, 'Videojuegos para personas con discapacidad: cómo han evolucionado para ser más accesibles y qué queda por hacer', 'En España cada vez jugamos más. Las cifras que proporciona la Asociación Española de Videojuegos (AEVI) colocan al videojuego como la principal industria audiovisual en España. Pero, aunque cada vez hay más jugadoras y jugadores, aún queda mucho por hacer para que los videojuegos sean accesibles para todos, y que en ese todos se incluya también a las personas con discapacidad.', '2023-12-01', 0, 1),
(3, 'Un nuevo hito para Dragon Age: Dreadwolf', 'Dragon Age: Inquisition (el tercer juego de la saga) ya salió en 2014. Desde entonces, se espera con ansia la cuarta parte, de la que todaví­a no se sabe fecha de publicación.', '2023-12-11', 0, 1),
(4, 'Juegos LGBT publicados en los últimos años', 'Destacan el Hades, Celeste o Stardew Valley.', '2023-12-14', 0, 1),
(5, 'Los mejores juegos accesibles', 'Far Cry 6, God of War PS4 y God of War: Ragnarok', '2023-11-22', 1, 1);

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
(7, 'Diablo IV', 'Blizzard Entertainment', '2023', 0, 0, 'https://diablo4.blizzard.com/es-es/'),
(8, 'Los Sims', 'Electronic Arts', '2000', 1, 1, 'https://www.ea.com/es-es/games/the-sims'),
(9, 'Dragon Age: Origins', 'BioWare', '2009', 1, 1, 'https://www.ea.com/es-es/games/dragon-age'),
(10, 'Dragon Age II', 'BioWare', '2011', 1, 1, 'https://www.ea.com/es-es/games/dragon-age'),
(11, 'Dragon Age: Inquisition', 'BioWare', '2014', 1, 1, 'https://www.ea.com/es-es/games/dragon-age');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
