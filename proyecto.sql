-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2022 a las 00:54:44
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `codigo` int(11) NOT NULL,
  `nombre` text COLLATE utf8mb4_bin NOT NULL,
  `descripcion` text COLLATE utf8mb4_bin NOT NULL,
  `iddocente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `codigo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `codigo` int(11) NOT NULL,
  `comprobante` longblob NOT NULL,
  `nota1` float NOT NULL,
  `nota2` float NOT NULL,
  `nota3` decimal(10,0) NOT NULL,
  `soluciontarea` longblob NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idtarea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciondocente`
--

CREATE TABLE `evaluaciondocente` (
  `id` int(11) NOT NULL,
  `iddocente` int(11) NOT NULL,
  `notadesempeño` float NOT NULL,
  `notahabilidad` float NOT NULL,
  `notacomportamiento` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL,
  `titulo` text COLLATE utf8mb4_bin NOT NULL,
  `descripcion` text COLLATE utf8mb4_bin NOT NULL,
  `archivo` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`id`, `titulo`, `descripcion`, `archivo`) VALUES
(11111, 'sadsadsad', 'asdiasncasndcvavdfvvavafvadfv', 0x436f757273657261204843564b59334d3546524e502e706466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `documento` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `celular` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `contraseña` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `ustipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`documento`, `nombre`, `correo`, `celular`, `contraseña`, `direccion`, `ustipo`) VALUES
(13480553, 'Administrador', 'osfecasusama@gmail.com', '3143374223', 'admin', 'calle 12°2-11', 1),
(1005035136, 'oscar felipe', 'oscarfelipecsua@ufps.edu.co', '3222938508', '1234', 'calle 29°1-20', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validardatos`
--

CREATE TABLE `validardatos` (
  `id` int(11) NOT NULL,
  `reporte` longblob NOT NULL,
  `pago` longblob NOT NULL,
  `cedula` longblob NOT NULL,
  `certificado` longblob NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `validardatos`
--

INSERT INTO `validardatos` (`id`, `reporte`, `pago`, `cedula`, `certificado`, `idusuario`) VALUES
(12432, 0x576861747341707020496d61676520323032322d30332d323920617420362e33392e323020504d202831292e6a706567, 0x576861747341707020496d61676520323032322d30332d323920617420362e33392e323020504d202832292e6a706567, 0x436f757273657261204843564b59334d3546524e502e706466, 0x434552544946494341444f2d3334352e706466, 1005035136);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `iddocente` (`iddocente`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idusuario` (`idusuario`,`idcurso`,`idtarea`),
  ADD KEY `idtarea` (`idtarea`),
  ADD KEY `idcurso` (`idcurso`);

--
-- Indices de la tabla `evaluaciondocente`
--
ALTER TABLE `evaluaciondocente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iddocente` (`iddocente`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`documento`);

--
-- Indices de la tabla `validardatos`
--
ALTER TABLE `validardatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`documento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`idtarea`) REFERENCES `tarea` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluaciondocente`
--
ALTER TABLE `evaluaciondocente`
  ADD CONSTRAINT `evaluaciondocente_ibfk_1` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `validardatos`
--
ALTER TABLE `validardatos`
  ADD CONSTRAINT `validardatos_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`documento`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
