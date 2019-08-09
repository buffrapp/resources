-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-08-2019 a las 17:59:40
-- Versión del servidor: 5.6.13
-- Versión de PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `buffrapp`
--
CREATE DATABASE IF NOT EXISTS `buffrapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `buffrapp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'NOMBRE DEL ADMINISTRADOR',
  `E-mail` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'E-MAIL DEL ADMINISTRADOR',
  `Password` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'CONTRASEÑA DEL ADMINISTRADOR PARA INICIAR SESION',
  `DNI` int(9) NOT NULL COMMENT 'DNI DEL ADMINISTRADOR',
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `DNI` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABALA PARA LOS ADMINISTRADORES';

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Nombre`, `E-mail`, `Password`, `DNI`) VALUES
('Facundo Montero', 'facu@gmail.com', '1234', 12345678);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_de_atencion`
--

CREATE TABLE IF NOT EXISTS `horarios_de_atencion` (
  `Hora` time NOT NULL COMMENT 'HORA DE ATENCION',
  `Turno` varchar(7) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'TURNO DE ATENCION (MAÑANA, NOCHE Y TARDE)',
  `Dia` varchar(9) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'DIA DE ATENCION (LUNES,MARTES,MIERCOLES,JUEVES Y VIERNES)',
  PRIMARY KEY (`Turno`,`Dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA CON LOS HORARIOS DE ATENCION';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivos`
--

CREATE TABLE IF NOT EXISTS `motivos` (
  `ID_Motivo` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID que representa el motivo en las demas tablas',
  `Motivo` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Motivo',
  `Tipo` tinyint(1) NOT NULL COMMENT 'Tipo de motivo (0=alumnos y 1=pedidos)',
  PRIMARY KEY (`ID_Motivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='TABLA CON LOS MOTIVOS' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `DNI_Usuario` int(9) NOT NULL COMMENT 'DNI DEL USUARIO QUE HIZO EL PEDIDO',
  `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID UNICA DEL PEDIDO',
  `ID_Producto` int(3) NOT NULL COMMENT 'ID DEL PRODUCTO PEDIDO',
  `DNI_Administrador` int(9) DEFAULT NULL COMMENT 'DNI del administrador que tomo el pedido',
  `FH_Recibido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FH_Tomado` timestamp NULL DEFAULT NULL,
  `FH_Listo` timestamp NULL DEFAULT NULL,
  `FH_Entregado` timestamp NULL DEFAULT NULL,
  `DNI_Cancelado` int(9) DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA PARA LOS PEDIDOS' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`DNI_Usuario`, `ID_Pedido`, `ID_Producto`, `DNI_Administrador`, `FH_Recibido`, `FH_Tomado`, `FH_Listo`, `FH_Entregado`, `DNI_Cancelado`) VALUES
(42824297, 1, 1, 12345678, '2019-08-09 13:56:05', '2019-08-09 13:58:13', '2019-08-09 13:58:32', '2019-08-09 13:58:48', NULL),
(42824297, 2, 1, NULL, '2019-08-09 13:59:43', NULL, NULL, NULL, 42824297);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `ID_Producto` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DEL PRODUCTO',
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'NOMBRE DEL PRODUCTO',
  `Precio` float NOT NULL COMMENT 'PRECIO DEL PRODUCTO',
  `Estado` tinyint(1) NOT NULL COMMENT 'ESTADO DEL PRODUCTO',
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA PARA LOS PRODUCTOS' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `Nombre`, `Precio`, `Estado`) VALUES
(1, 'asd', 123, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE IF NOT EXISTS `reportes` (
  `Motivo` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'MOTIVO POR EL CUAL FUE REPORTADO',
  `DNI_U` int(9) NOT NULL COMMENT 'DNI DEL USUARIO',
  `DNI_A` int(9) NOT NULL COMMENT 'DNI DEL ADMINISTRADOR',
  `Fecha_Hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'FECHA HORA DEL REPORTE',
  PRIMARY KEY (`DNI_U`,`Fecha_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `DNI` int(9) NOT NULL COMMENT 'DNIDEL USUARIO REGISTRADO',
  `E-mail` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'E-MAIL DEL USUARIO REGISTRADO',
  `Password` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'CONTRASEÑA DEL ALUMNO REGISTRADO',
  `Nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Curso` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Division` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA PARA LOS USUARIOS';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`DNI`, `E-mail`, `Password`, `Nombre`, `Curso`, `Division`) VALUES
(42824297, NULL, NULL, 'Edgar Leonel Moyano', '7mo', '1ra');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
