-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2019 a las 23:08:45
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `buffrapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'NOMBRE DEL ADMINISTRADOR',
  `E-mail` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'E-MAIL DEL ADMINISTRADOR',
  `Password` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'CONTRASEÑA DEL ADMINISTRADOR PARA INICIAR SESION',
  `DNI` int(9) NOT NULL COMMENT 'DNI DEL ADMINISTRADOR'
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

CREATE TABLE `horarios_de_atencion` (
  `Hora` time NOT NULL COMMENT 'HORA DE ATENCION',
  `Turno` varchar(7) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'TURNO DE ATENCION (MAÑANA, NOCHE Y TARDE)',
  `Dia` varchar(9) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'DIA DE ATENCION (LUNES,MARTES,MIERCOLES,JUEVES Y VIERNES)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA CON LOS HORARIOS DE ATENCION';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `DNI_Usuario` int(9) NOT NULL COMMENT 'DNI DEL USUARIO QUE HIZO EL PEDIDO',
  `ID_Pedido` int(11) NOT NULL COMMENT 'ID UNICA DEL PEDIDO',
  `ID_Producto` int(3) NOT NULL COMMENT 'ID DEL PRODUCTO PEDIDO',
  `DNI_Administrador` int(9) NOT NULL COMMENT 'DNI del administrador que tomo el pedido',
  `FH_Recibido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FH_Tomado` timestamp NULL DEFAULT NULL,
  `FH_Listo` timestamp NULL DEFAULT NULL,
  `FH_Entregado` timestamp NULL DEFAULT NULL,
  `DNI_Cancelado` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA PARA LOS PEDIDOS';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(3) NOT NULL COMMENT 'ID UNICO DEL PRODUCTO',
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'NOMBRE DEL PRODUCTO',
  `Precio` float NOT NULL COMMENT 'PRECIO DEL PRODUCTO',
  `Estado` tinyint(1) NOT NULL COMMENT 'ESTADO DEL PRODUCTO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA PARA LOS PRODUCTOS';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `Motivo` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'MOTIVO POR EL CUAL FUE REPORTADO',
  `DNI_U` int(9) NOT NULL COMMENT 'DNI DEL USUARIO',
  `DNI_A` int(9) NOT NULL COMMENT 'DNI DEL ADMINISTRADOR',
  `Fecha_Hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'FECHA HORA DEL REPORTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `DNI` int(9) NOT NULL COMMENT 'DNIDEL USUARIO REGISTRADO',
  `E-mail` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'E-MAIL DEL USUARIO REGISTRADO',
  `Password` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'CONTRASEÑA DEL ALUMNO REGISTRADO',
  `Nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Curso` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Division` varchar(5) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='TABLA PARA LOS USUARIOS';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`DNI`, `E-mail`, `Password`, `Nombre`, `Curso`, `Division`) VALUES
(42824297, NULL, NULL, 'Edgar Leonel Moyano', '7mo', '1ra');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- Indices de la tabla `horarios_de_atencion`
--
ALTER TABLE `horarios_de_atencion`
  ADD PRIMARY KEY (`Turno`,`Dia`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`DNI_U`,`Fecha_Hora`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID UNICA DEL PEDIDO';

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DEL PRODUCTO';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
