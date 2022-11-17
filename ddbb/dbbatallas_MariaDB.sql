-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2022 a las 18:03:44
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbbatallas`
--

CREATE DATABASE IF NOT EXISTS `dbbatallas`;
USE `dbbatallas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `batalla`
--

CREATE TABLE `batalla` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `batalla_elemento`
--

CREATE TABLE `batalla_elemento` (
  `id_batalla` int(11) NOT NULL,
  `id_elemento1` int(11) NOT NULL,
  `id_elemento2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial`
--

CREATE TABLE `credencial` (
  `nombreusuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento`
--

CREATE TABLE `elemento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fechanacimiento` datetime NOT NULL,
  `foto` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `modovis` enum('light','dark') NOT NULL DEFAULT 'light',
  `idioma` enum('es','en') NOT NULL DEFAULT 'es',
  `rol` enum('usuario','admin') NOT NULL DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_batalla`
--

CREATE TABLE `usuario_batalla` (
  `id_usuario` int(11) NOT NULL,
  `id_batalla` int(11) NOT NULL,
  `accion` enum('crear','eliminar','ignorar','denunciar') NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_credencial`
--

CREATE TABLE `usuario_credencial` (
  `id_usuario` int(11) NOT NULL,
  `nombreusuario` varchar(50) NOT NULL,
  `accion` enum('registrar','loguear') NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_elemento`
--

CREATE TABLE `usuario_elemento` (
  `id_usuario` int(11) NOT NULL,
  `id_elemento` int(11) NOT NULL,
  `accion` enum('crear','editar','eliminar') NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

CREATE TABLE `voto` (
  `id_usuario` int(11) NOT NULL,
  `id_batalla` int(11) NOT NULL,
  `id_elemento` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TRIAL';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `batalla`
--
ALTER TABLE `batalla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `batalla_elemento`
--
ALTER TABLE `batalla_elemento`
  ADD PRIMARY KEY (`id_batalla`,`id_elemento1`,`id_elemento2`),
  ADD KEY `id_elemento1_idx` (`id_elemento1`),
  ADD KEY `id_elemento2_idx` (`id_elemento2`);

--
-- Indices de la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD PRIMARY KEY (`nombreusuario`);

--
-- Indices de la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_batalla`
--
ALTER TABLE `usuario_batalla`
  ADD PRIMARY KEY (`id_usuario`,`id_batalla`),
  ADD KEY `id_batalla_idx` (`id_batalla`);

--
-- Indices de la tabla `usuario_credencial`
--
ALTER TABLE `usuario_credencial`
  ADD PRIMARY KEY (`id_usuario`,`nombreusuario`),
  ADD KEY `nombreusuario_idx` (`nombreusuario`);

--
-- Indices de la tabla `usuario_elemento`
--
ALTER TABLE `usuario_elemento`
  ADD PRIMARY KEY (`id_usuario`,`id_elemento`),
  ADD KEY `id_elemento_idx` (`id_elemento`);

--
-- Indices de la tabla `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`id_usuario`,`id_batalla`,`id_elemento`),
  ADD KEY `id_batalla_idx` (`id_batalla`),
  ADD KEY `id_elemento_idx` (`id_elemento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `batalla`
--
ALTER TABLE `batalla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `elemento`
--
ALTER TABLE `elemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `batalla_elemento`
--
ALTER TABLE `batalla_elemento`
  ADD CONSTRAINT `id_batalla_be` FOREIGN KEY (`id_batalla`) REFERENCES `batalla` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_elemento1_be` FOREIGN KEY (`id_elemento1`) REFERENCES `elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_elemento2_be` FOREIGN KEY (`id_elemento2`) REFERENCES `elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_batalla`
--
ALTER TABLE `usuario_batalla`
  ADD CONSTRAINT `id_batalla_ub` FOREIGN KEY (`id_batalla`) REFERENCES `batalla` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_ub` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_credencial`
--
ALTER TABLE `usuario_credencial`
  ADD CONSTRAINT `id_usuario_uc` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `nombreusuario_uc` FOREIGN KEY (`nombreusuario`) REFERENCES `credencial` (`nombreusuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_elemento`
--
ALTER TABLE `usuario_elemento`
  ADD CONSTRAINT `id_elemento_ue` FOREIGN KEY (`id_elemento`) REFERENCES `elemento` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_ue` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `id_batalla_v` FOREIGN KEY (`id_batalla`) REFERENCES `batalla` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_elemento_v` FOREIGN KEY (`id_elemento`) REFERENCES `elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_v` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
