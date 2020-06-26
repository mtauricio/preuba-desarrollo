-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2020 a las 15:25:48
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appx_department`
--

CREATE TABLE `appx_department` (
  `id` int(20) NOT NULL,
  `department_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `department_city` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `appx_department`
--

INSERT INTO `appx_department` (`id`, `department_name`, `department_city`) VALUES
(1, 'contabilidad', 'bogota'),
(2, 'desarrollo', 'bogota'),
(3, 'marketing', 'bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appx_educationlevel`
--

CREATE TABLE `appx_educationlevel` (
  `id` int(20) NOT NULL,
  `description` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `appx_educationlevel`
--

INSERT INTO `appx_educationlevel` (`id`, `description`) VALUES
(1, 'tecnologo'),
(2, 'tecnico'),
(3, 'profesional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appx_employee`
--

CREATE TABLE `appx_employee` (
  `id` int(20) NOT NULL,
  `firstname` varchar(30) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(30) COLLATE utf8_bin NOT NULL,
  `departament_id` int(20) NOT NULL,
  `salary` bigint(200) NOT NULL,
  `educationlevel_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `appx_employee`
--

INSERT INTO `appx_employee` (`id`, `firstname`, `lastname`, `departament_id`, `salary`, `educationlevel_id`) VALUES
(11, 'juan', 'perez', 1, 50000, 2),
(12, 'johana', 'riuz', 1, 70000, 3),
(13, 'jose', 'roldan', 1, 80000, 1),
(14, 'andres', 'garcia', 2, 80000, 1),
(15, 'camilo', 'suarez', 2, 90000, 2),
(16, 'angela', 'quintero', 2, 80000, 3),
(17, 'angelica', 'urbina', 2, 90000, 3),
(18, 'rodolfo', 'orellana', 3, 70000, 2),
(19, 'susana', 'valderrama', 3, 80000, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appx_department`
--
ALTER TABLE `appx_department`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appx_educationlevel`
--
ALTER TABLE `appx_educationlevel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appx_employee`
--
ALTER TABLE `appx_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departament_employee` (`departament_id`),
  ADD KEY `fk_educationlevel_employee` (`educationlevel_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appx_department`
--
ALTER TABLE `appx_department`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appx_educationlevel`
--
ALTER TABLE `appx_educationlevel`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appx_employee`
--
ALTER TABLE `appx_employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appx_employee`
--
ALTER TABLE `appx_employee`
  ADD CONSTRAINT `fk_departament_employee` FOREIGN KEY (`departament_id`) REFERENCES `appx_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_educationlevel_employee` FOREIGN KEY (`educationlevel_id`) REFERENCES `appx_educationlevel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
