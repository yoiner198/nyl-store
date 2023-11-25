-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2023 a las 08:27:34
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
-- Base de datos: `tienda-online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'POPULARES', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'TENIS', 'assets/images/categorias/20220805093028.jpg', 1),
(3, 'ROPA HOMBRE', 'NO', 1),
(4, 'ROPA MUJER', '', 1),
(5, 'ACCESORIOS', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(2, 'yoander', 'yoandering@gmail.com', '$2y$10$6lDUqHhaDKRexMfyC..nB.T4ucWqOSeHqsSOoiDhPeMRMZKrJKbCK', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(8, 'TENIS NIKE', 250.00, 1, 4, 12),
(9, 'BUZO', 80.00, 1, 5, 14),
(10, 'TENIS NIKE', 250.00, 1, 5, 12),
(11, 'TENIS NIKE', 250.00, 1, 6, 12),
(12, 'BUZO BLANCO', 120000.00, 1, 7, 32),
(13, 'TENIS D&G MUJER', 290000.00, 1, 7, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(4, '5G577141F41193159', 250.00, 'COMPLETED', '2023-11-24 23:41:53', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Los Rosales', 'lurigancho', 1, '3'),
(5, '05N46405J0329372E', 330.00, 'COMPLETED', '2023-11-25 00:22:52', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Los Rosales', 'lurigancho', 1, '1'),
(6, '2Y2814245W745463H', 250.00, 'COMPLETED', '2023-11-25 04:59:49', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Los Rosales', 'lurigancho', 2, '1'),
(7, '5S0188421T5088410', 410000.00, 'COMPLETED', '2023-11-25 08:02:57', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Los Rosales', 'lurigancho', 2, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(6, 'NUEVO PRODUCTO', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, facere', 50000.00, 16, 'assets/images/productos/20220806090232.jpg', 0, 2),
(11, 'CAMISA SS', 'blanca', 60000.00, 20, 'assets/images/productos/20231124210240.jpg', 1, 3),
(12, 'VESTIDO MENTA', '', 80000.00, 10, 'assets/images/productos/20231125060029.jpg', 1, 4),
(13, 'CADENA ', '', 280000.00, 10, 'assets/images/productos/20231124233308.jpg', 1, 5),
(15, 'TENIS D&G', '', 400000.00, 4, 'assets/images/productos/20231125053826.jpg', 1, 2),
(16, 'VESTIDO NEGRO', '', 99000.00, 10, 'assets/images/productos/20231125052501.jpg', 1, 1),
(17, 'SUETER NEGRO', 'S', 40000.00, 20, 'assets/images/productos/20231125052649.jpg', 1, 3),
(18, 'NIKE AIR', '', 350000.00, 10, 'assets/images/productos/20231125054706.jpg', 1, 2),
(19, 'CONJUNTO MUJER', '', 75.00, 12, 'assets/images/productos/20231125055419.jpg', 0, 4),
(20, 'RELOJ', '', 199000.00, 1, 'assets/images/productos/20231125060902.jpg', 0, 5),
(21, 'TENIS MUJER', '', 250000.00, 2, 'assets/images/productos/20231125061109.jpg', 1, 2),
(22, 'JEAN ', '', 120000.00, 2, 'assets/images/productos/20231125063017.jpg', 1, 3),
(23, 'ROLEX ', '', 5500000.00, 3, 'assets/images/productos/20231125063246.jpg', 1, 1),
(24, 'JEAN MODA', '', 95000.00, 3, 'assets/images/productos/20231125063958.jpg', 1, 4),
(25, 'SHORT ', '', 59000.00, 4, 'assets/images/productos/20231125065556.jpg', 1, 4),
(26, 'COJUNTO FLORES', '', 80000.00, 4, 'assets/images/productos/20231125070342.jpg', 1, 4),
(27, 'PIJAMA ', '', 40000.00, 2, 'assets/images/productos/20231125071627.jpg', 1, 4),
(28, 'CONJUNTO HOMBRE', '', 60000.00, 7, 'assets/images/productos/20231125071750.jpg', 1, 3),
(29, 'TRAJE ELEGANTE', '', 30000.00, 5, 'assets/images/productos/20231125072211.jpg', 1, 3),
(30, 'TENIS D&G MUJER', '', 290000.00, 1, 'assets/images/productos/20231125073821.jpg', 1, 1),
(31, 'COLLAR DE ORO', '', 199000.00, 8, 'assets/images/productos/20231125073922.jpg', 1, 1),
(32, 'BUZO BLANCO', '', 120000.00, 11, 'assets/images/productos/20231125074406.jpg', 1, 1),
(33, 'SET ANILLOS', '', 50000.00, 6, 'assets/images/productos/20231125074538.jpg', 1, 5),
(34, 'SET ARETES', '', 30000.00, 9, 'assets/images/productos/20231125074631.jpg', 1, 5),
(36, 'CORREA GUCCI', '', 75000.00, 9, 'assets/images/productos/20231125074818.jpg', 1, 5),
(37, 'ALEXANDER MCQUEEN', '', 250000.00, 7, 'assets/images/productos/20231125082614.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(3, 'Yoander', 'GL', 'yoandering@gmail.com', '$2y$10$.9Nw1341zZk21D2v6KrvCuLfBy/t10qONkKPlRKYTWX6r9E6bYCCO', NULL, 1),
(4, 'Yoander', 'GL', 'yoandering@gmail.com', '$2y$10$.9Nw1341zZk21D2v6KrvCuLfBy/t10qONkKPlRKYTWX6r9E6bYCCO', NULL, 1),
(5, 'yoiner', 'h', 'yoiner@gmail.com', '$2y$10$iNDe60bbscdmCeU6RpkQ9.3l6oy1VlM4smDRDsebHitOwA.nQWMwu', NULL, 1),
(6, 'yoan', 'g', 'y@gmail.com', '$2y$10$yLLwA2GVQBlDb2t1uvaieOWPD8j3lEdhhzbyg7s2133L1EseZRKM2', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
