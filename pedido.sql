-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2018 a las 21:43:15
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedido`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spNumDocMes` (IN `tipo` CHAR(2), IN `mes` CHAR(2), OUT `cantidad` INT, OUT `total` INT)  select 	count(*), sum(importe)  into cantidad,total
	from vwVentas
	where month(fecha) = mes
	and tipo_doc = tipo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spProducto` ()  SELECT * FROM producto WHERE stock > 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidar` (IN `pemail` CHAR(50), IN `pclave` CHAR(20), OUT `pexiste` INT, OUT `pnombre` CHAR(100))  BEGIN
	SET pexiste=0;
	SELECT nombres,id_usuario into pnombre, pexiste 
	FROM usuario 
		WHERE STRCMP(email,pemail)=0 
		AND STRCMP(clave,pclave)=0; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentasMes` (`mes` CHAR(2))  select sum(importe) as total 
	from vwVentas
	where month(fecha) = mes$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentasMesTipo` (`mes` CHAR(2))  select tipo_doc, sum(importe) as total 
	from vwVentas
	where month(fecha) = mes
	group by tipo_doc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentasxCliente` ()  select razon_social, sum(importe) as total
from vwVentas
group by razon_social$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentasxMes` ()  select month(fecha) as mes, sum(importe) as total
from vwVentas
group by mes$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` tinyint(4) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`) VALUES
(1, 'Desayunos'),
(2, 'Combos'),
(3, 'Jugos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_doc` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_doc` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `razon_social`, `tipo_doc`, `num_doc`, `email`) VALUES
(1, 'KKKKK', 'DN', '55555', 'LLLL'),
(2, 'ABC SAC', 'DN', '07258689', ''),
(3, 'JUAN', 'DN', '2222', ''),
(4, 'julio', 'DN', '654656', ''),
(5, 'PERU DATA SA', 'RU', '10526568', ''),
(6, 'LUIS DIAZ', 'DN', '10525658', ''),
(7, 'MIGUEL', 'DN', '12568954', ''),
(8, 'KARINA', 'DN', '32132132', ''),
(9, 'LUIS', 'DN', '6546545', ''),
(10, 'ESTUDIO X EIRL', 'RU', '205689548', ''),
(11, '', 'DN', 'JAVIER', ''),
(12, 'MIGUEL', 'DN', '222555255', ''),
(13, 'ABC SA', 'RU', '20535855', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `id_consumo` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `mesa` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo_cab`
--

CREATE TABLE `consumo_cab` (
  `id_consumo` int(11) NOT NULL,
  `mesa` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `serie` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `consumo_cab`
--

INSERT INTO `consumo_cab` (`id_consumo`, `mesa`, `fecha`, `id_documento`, `serie`, `numero`, `id_cliente`) VALUES
(23, '1', '2017-05-24 18:26:00', NULL, NULL, NULL, NULL),
(24, '2', '2017-05-24 18:26:20', NULL, NULL, NULL, NULL),
(25, '10', '2017-05-31 17:30:41', NULL, NULL, NULL, NULL),
(26, '7', '2017-05-31 17:42:14', NULL, NULL, NULL, NULL),
(27, '01', '2017-03-14 15:34:36', NULL, NULL, NULL, NULL),
(28, '01', '2017-03-17 22:47:51', 1, '', '', 1),
(29, '02', '2017-04-17 22:51:39', 2, '', '', 2),
(30, '02', '2017-04-17 22:57:06', 1, '001', '1', 3),
(31, '05', '2017-05-17 23:00:35', 2, '001', '1', 4),
(32, '03', '2017-06-17 23:02:29', 3, '001', '1', 5),
(33, '05', '2017-06-17 23:02:51', 2, '001', '2', 6),
(34, '03', '2017-07-17 23:03:15', 1, '001', '2', 7),
(35, '05', '2017-07-17 23:03:35', 1, '001', '3', 8),
(36, '12', '2017-08-17 23:04:13', 1, '001', '4', 9),
(37, '03', '2017-08-17 23:04:46', 3, '001', '2', 10),
(38, '01', '2017-09-17 23:07:32', 1, '001', '5', 11),
(39, '06', '2017-09-17 23:08:56', 1, '001', '6', 12),
(40, '05', '2017-09-17 23:12:57', 1, '001', '7', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo_det`
--

CREATE TABLE `consumo_det` (
  `id_detalle` int(11) NOT NULL,
  `id_consumo` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `consumo_det`
--

INSERT INTO `consumo_det` (`id_detalle`, `id_consumo`, `id_producto`, `precio`, `cantidad`) VALUES
(17, 23, 1, 12, 1),
(18, 23, 4, 12, 1),
(19, 23, 7, 15, 1),
(20, 24, 2, 15, 1),
(21, 24, 5, 8, 1),
(22, 25, 1, 12, 1),
(23, 25, 2, 15, 1),
(24, 26, 2, 15, 1),
(25, 26, 1, 12, 1),
(26, 27, 2, 15, 1),
(27, 28, 2, 15, 1),
(28, 28, 1, 12, 1),
(29, 29, 2, 15, 1),
(30, 29, 4, 12, 1),
(31, 30, 2, 15, 1),
(32, 31, 2, 15, 1),
(33, 31, 1, 12, 1),
(34, 32, 4, 12, 1),
(35, 33, 6, 5, 1),
(36, 33, 4, 12, 1),
(37, 34, 4, 12, 1),
(38, 34, 1, 12, 1),
(39, 35, 2, 15, 1),
(40, 35, 4, 12, 1),
(41, 36, 4, 12, 1),
(42, 36, 6, 5, 1),
(43, 37, 2, 15, 1),
(44, 37, 4, 12, 1),
(45, 38, 2, 15, 1),
(46, 38, 4, 12, 1),
(47, 39, 2, 15, 1),
(48, 40, 2, 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL,
  `tipo_doc` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `tipo_doc`, `serie`, `correlativo`) VALUES
(1, 'RE', '001', 8),
(2, 'BO', '001', 3),
(3, 'FA', '001', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`) VALUES
(1, 'Operaciones'),
(2, 'Reportes'),
(3, 'Mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id_opcion` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `opcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `archivo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id_opcion`, `id_menu`, `opcion`, `archivo`) VALUES
(1, 1, 'Venta', 'venta.php'),
(2, 1, 'Credito', NULL),
(3, 2, 'Liquidacion', 'liquidacion.php'),
(4, 2, 'Lista precios', 'lista_precios.php'),
(5, 3, 'Cliente', NULL),
(6, 3, 'Producto', 'producto_lista.php'),
(7, 3, 'Acceso', 'permiso.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `id_opcion` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `id_opcion`, `id_usuario`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 4, 1),
(4, 6, 1),
(5, 1, 2),
(6, 2, 2),
(7, 3, 2),
(8, 5, 2),
(9, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) DEFAULT '0',
  `id_categoria` tinyint(4) NOT NULL,
  `foto` varchar(100) COLLATE utf8_spanish_ci DEFAULT 'sinfoto.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion`, `precio`, `stock`, `id_categoria`, `foto`) VALUES
(1, 'Desayuno continental', 12, 30, 1, 'sinfoto.jpg'),
(2, 'Desayuno americano', 15, 30, 1, 'des_amer.jpg'),
(3, 'Desayuno criollo', 25, 50, 1, 'des_crio.jpg'),
(4, 'Taza de cafe + tamalitos', 12, 0, 2, 'sinfoto.jpg'),
(5, 'Jugo de PiÃ±a', 8, 0, 3, 'sinfoto.jpg'),
(6, 'Jugo de Papaya', 5, 0, 3, 'sinfoto.jpg'),
(7, 'Jugo especial', 15, 0, 3, 'sinfoto.jpg'),
(8, 'Jugo especial', 15, 0, 3, 'sinfoto.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombres`, `email`, `clave`) VALUES
(1, 'Usuario1', 'usuario1', '123'),
(2, 'Usuario2', 'usuario2', '456');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwventas` (
`fecha` varchar(10)
,`tipo_doc` varchar(3)
,`serie` varchar(4)
,`numero` varchar(10)
,`razon_social` varchar(100)
,`importe` double
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vwventas`
--
DROP TABLE IF EXISTS `vwventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwventas`  AS  select substr(`consumo_cab`.`fecha`,1,10) AS `fecha`,`documento`.`tipo_doc` AS `tipo_doc`,`consumo_cab`.`serie` AS `serie`,`consumo_cab`.`numero` AS `numero`,`cliente`.`razon_social` AS `razon_social`,sum((`consumo_det`.`precio` * `consumo_det`.`cantidad`)) AS `importe` from (((`consumo_cab` join `consumo_det`) join `documento`) join `cliente`) where ((`consumo_cab`.`id_consumo` = `consumo_det`.`id_consumo`) and (`consumo_cab`.`id_documento` = `documento`.`id_documento`) and (`consumo_cab`.`id_cliente` = `cliente`.`id_cliente`)) group by `consumo_cab`.`id_consumo` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`id_consumo`);

--
-- Indices de la tabla `consumo_cab`
--
ALTER TABLE `consumo_cab`
  ADD PRIMARY KEY (`id_consumo`);

--
-- Indices de la tabla `consumo_det`
--
ALTER TABLE `consumo_det`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id_opcion`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `consumo`
--
ALTER TABLE `consumo`
  MODIFY `id_consumo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consumo_cab`
--
ALTER TABLE `consumo_cab`
  MODIFY `id_consumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `consumo_det`
--
ALTER TABLE `consumo_det`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
