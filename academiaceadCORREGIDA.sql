-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2019 at 07:19 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academiacead`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addbitacora` (IN `fecha_accion` DATETIME, IN `accn` VARCHAR(20), IN `descrip` VARCHAR(100), IN `id_usr` INT, IN `id_obj` INT)  begin
  insert into tbl_Bitacora(Fecha,Accion, Descripcion, Id_usuario, Id_Objeto)
  values(fecha_accion, accn, descrip, id_usr, id_obj);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERTAR_USUARIO` (IN `pcUsuario` VARCHAR(15), IN `pcContrasena` LONGTEXT, IN `pcPrimerNombre` VARCHAR(15), IN `pcSegundoNombre` VARCHAR(15), IN `pcPrimerApellido` VARCHAR(15), IN `pcSegundoApellido` VARCHAR(15), IN `pcTelefono` INT(11), IN `pcCedula` INT(13), IN `pcCorreoElectronico` VARCHAR(50), IN `pcId_Departamento` INT(11), IN `pcId_EstadoCivil` INT(11), IN `pcId_Genero` INT(11), OUT `pcMensajeError` VARCHAR(1000))  BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina si la inserción del usuario falla	
   SET vcTempMensajeError := 'Al insertar el usuario';

INSERT INTO tbl_usuarios (Usuario, Contrasena, PrimerNombre, SegundoNombre,
 PrimerApellido, SegundoApellido, Telefono, Cedula,PrimerIngreso,
 CorreoElectronico, Id_Departamento, Id_EstadoCivil, Id_Genero,
 Id_Estado, Id_Rol, FechaCreacion) 
 
 VALUES (pcUsuario, pcContrasena, pcPrimerNombre, pcSegundoNombre,
 pcPrimerApellido, pcSegundoApellido, pcTelefono, pcCedula,0,
 pcCorreoElectronico, pcId_Departamento, pcId_EstadoCivil, pcId_Genero,
 1, 5, NOW());

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_DEPARTAMENTOS` (OUT `pcMensajeError` VARCHAR(1000))  BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina la obtención de los departamentos
SET vcTempMensajeError := 'Al obtener los departamentos';
   SELECT Id_Departamentos, DescripDepart FROM tbl_departamentos;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_ESTADOSCIVILES` (OUT `pcMensajeError` VARCHAR(1000))  BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina la obtención de los estados civiles
SET vcTempMensajeError := 'Al obtener los estados civiles';
   SELECT Id_EstadoCivil, Descripcion FROM tbl_estadocivil;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_GENEROS` (OUT `pcMensajeError` VARCHAR(1000))  BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina la obtención de los generos
SET vcTempMensajeError := 'Al obtener los generos';
   SELECT Id_Genero, Descripcion FROM tbl_genero;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_alumnos`
--

CREATE TABLE `tbl_alumnos` (
  `Id_Alumno` int(11) NOT NULL,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `CorreoElectronico` varchar(30) DEFAULT NULL,
  `FechaNacimiento` date NOT NULL,
  `Cedula` decimal(13,0) NOT NULL,
  `Telefono` decimal(12,0) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Id_genero` int(11) NOT NULL,
  `Id_estadocivil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_asistencia`
--

CREATE TABLE `tbl_asistencia` (
  `Id_asistencia` int(11) NOT NULL,
  `Asistencia` decimal(4,0) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `Id_Bitacora` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Accion` varchar(20) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_Objeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`Id_Bitacora`, `Fecha`, `Accion`, `Descripcion`, `Id_usuario`, `Id_Objeto`) VALUES
(25, '2019-03-08 00:16:57', 'Ingreso al sistema', 'Accediendo por el Login del sistema', 1, 1),
(26, '2019-03-08 07:17:07', 'Seguridad en acceso', 'Agregando pregunta de seguridad', 1, 2),
(27, '2019-03-08 07:17:15', 'Seguridad en acceso', 'Agregando pregunta de seguridad', 1, 2),
(28, '2019-03-08 07:17:22', 'Seguridad en acceso', 'Agregando pregunta de seguridad', 1, 2),
(29, '2019-03-08 07:17:39', 'Cambio de password', 'Cambiando el password en el primer acceso del usuario', 1, 6),
(30, '2019-03-08 00:17:54', 'Ingreso al sistema', 'Accediendo por el Login del sistema', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_calificaciones`
--

CREATE TABLE `tbl_calificaciones` (
  `Id_Calificaciones` int(11) NOT NULL,
  `NotaFinal` decimal(5,0) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL,
  `Cod_Obs` int(11) NOT NULL,
  `Id_Clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clases`
--

CREATE TABLE `tbl_clases` (
  `Id_Clase` int(11) NOT NULL,
  `DescripClase` varchar(45) NOT NULL,
  `Duracion` time NOT NULL,
  `Id_orientacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clases`
--

INSERT INTO `tbl_clases` (`Id_Clase`, `DescripClase`, `Duracion`, `Id_orientacion`) VALUES
(1, 'Instrumento I', '00:45:00', 1),
(2, 'Instrumento II', '00:45:00', 1),
(3, 'Instrumento III', '00:45:00', 1),
(4, 'Instrumento IV', '00:45:00', 1),
(5, 'Instrumento V', '00:45:00', 1),
(6, 'Instrumento VI', '00:45:00', 1),
(7, 'Instrumento VII', '00:45:00', 1),
(8, 'Instrumento VIII', '00:45:00', 1),
(9, 'Instrumento IX', '00:45:00', 1),
(10, 'Instrumento X', '00:45:00', 1),
(11, 'Instrumento I', '00:45:00', 2),
(12, 'Instrumento II', '00:45:00', 2),
(13, 'Instrumento III', '00:45:00', 2),
(14, 'Instrumento IV', '00:45:00', 2),
(15, 'Instrumento V', '00:45:00', 2),
(16, 'Instrumento VI', '00:45:00', 2),
(17, 'Instrumento VII', '00:45:00', 2),
(18, 'Instrumento VIII', '00:45:00', 2),
(19, 'Instrumento IX', '00:45:00', 2),
(20, 'Instrumento X', '00:45:00', 2),
(21, 'Instrumento I', '00:45:00', 3),
(22, 'Instrumento II', '00:45:00', 3),
(23, 'Instrumento III', '00:45:00', 3),
(24, 'Instrumento IV', '00:45:00', 3),
(25, 'Instrumento V', '00:45:00', 3),
(26, 'Instrumento VI', '00:45:00', 3),
(27, 'Instrumento VII', '00:45:00', 3),
(28, 'Instrumento VIII', '00:45:00', 3),
(29, 'Instrumento IX', '00:45:00', 3),
(30, 'Instrumento X', '00:45:00', 3),
(31, 'Instrumento I', '00:45:00', 4),
(32, 'Instrumento II', '00:45:00', 4),
(33, 'Instrumento III', '00:45:00', 4),
(34, 'Instrumento IV', '00:45:00', 4),
(35, 'Instrumento V', '00:45:00', 4),
(36, 'Instrumento VI', '00:45:00', 4),
(37, 'Instrumento VII', '00:45:00', 4),
(38, 'Instrumento VIII', '00:45:00', 4),
(39, 'Instrumento IX', '00:45:00', 4),
(40, 'Instrumento X', '00:45:00', 4),
(41, 'Instrumento I', '00:45:00', 5),
(42, 'Instrumento II', '00:45:00', 5),
(43, 'Instrumento III', '00:45:00', 5),
(44, 'Instrumento IV', '00:45:00', 5),
(45, 'Instrumento V', '00:45:00', 5),
(46, 'Instrumento VI', '00:45:00', 5),
(47, 'Instrumento VII', '00:45:00', 5),
(48, 'Instrumento VIII', '00:45:00', 5),
(49, 'Instrumento IX', '00:45:00', 5),
(50, 'Instrumento X', '00:45:00', 5),
(51, 'Instrumento I', '00:45:00', 6),
(52, 'Instrumento II', '00:45:00', 6),
(53, 'Instrumento III', '00:45:00', 6),
(54, 'Instrumento IV', '00:45:00', 6),
(55, 'Instrumento V', '00:45:00', 6),
(56, 'Instrumento VI', '00:45:00', 6),
(57, 'Instrumento VII', '00:45:00', 6),
(58, 'Instrumento VIII', '00:45:00', 6),
(59, 'Instrumento IX', '00:45:00', 6),
(60, 'Instrumento X', '00:45:00', 6),
(61, 'Instrumento I', '00:45:00', 7),
(62, 'Instrumento II', '00:45:00', 7),
(63, 'Instrumento III', '00:45:00', 7),
(64, 'Instrumento IV', '00:45:00', 7),
(65, 'Instrumento V', '00:45:00', 7),
(66, 'Instrumento VI', '00:45:00', 7),
(67, 'Instrumento VII', '00:45:00', 7),
(68, 'Instrumento VIII', '00:45:00', 7),
(69, 'Instrumento IX', '00:45:00', 7),
(70, 'Instrumento X', '00:45:00', 7),
(71, 'Instrumento I', '00:45:00', 8),
(72, 'Instrumento II', '00:45:00', 8),
(73, 'Instrumento III', '00:45:00', 8),
(74, 'Instrumento IV', '00:45:00', 8),
(75, 'Instrumento V', '00:45:00', 8),
(76, 'Instrumento VI', '00:45:00', 8),
(77, 'Instrumento VII', '00:45:00', 8),
(78, 'Instrumento VIII', '00:45:00', 8),
(79, 'Instrumento IX', '00:45:00', 8),
(80, 'Instrumento X', '00:45:00', 8),
(81, 'Instrumento I', '00:45:00', 9),
(82, 'Instrumento II', '00:45:00', 9),
(83, 'Instrumento III', '00:45:00', 9),
(84, 'Instrumento IV', '00:45:00', 9),
(85, 'Instrumento V', '00:45:00', 9),
(86, 'Instrumento VI', '00:45:00', 9),
(87, 'Instrumento VII', '00:45:00', 9),
(88, 'Instrumento VIII', '00:45:00', 9),
(89, 'Instrumento IX', '00:45:00', 9),
(90, 'Instrumento X', '00:45:00', 9),
(91, 'Instrumento I', '00:45:00', 10),
(92, 'Instrumento II', '00:45:00', 10),
(93, 'Instrumento III', '00:45:00', 10),
(94, 'Instrumento IV', '00:45:00', 10),
(95, 'Instrumento V', '00:45:00', 10),
(96, 'Instrumento VI', '00:45:00', 10),
(97, 'Instrumento VII', '00:45:00', 10),
(98, 'Instrumento VIII', '00:45:00', 10),
(99, 'Instrumento IX', '00:45:00', 10),
(100, 'Instrumento X', '00:45:00', 10),
(101, 'Lenguaje Musical I', '00:45:00', 1),
(102, 'Lenguaje Musical II', '00:45:00', 1),
(103, 'Lenguaje Musical III', '00:45:00', 1),
(104, 'Lenguaje Musical IV', '00:45:00', 1),
(105, 'Lenguaje Musical V', '00:45:00', 1),
(106, 'Lenguaje Musical VI', '00:45:00', 1),
(107, 'Lenguaje Musical I', '00:45:00', 2),
(108, 'Lenguaje Musical II', '00:45:00', 2),
(109, 'Lenguaje Musical III', '00:45:00', 2),
(110, 'Lenguaje Musical IV', '00:45:00', 2),
(111, 'Lenguaje Musical V', '00:45:00', 2),
(112, 'Lenguaje Musical VI', '00:45:00', 2),
(113, 'Lenguaje Musical I', '00:45:00', 3),
(114, 'Lenguaje Musical II', '00:45:00', 3),
(115, 'Lenguaje Musical III', '00:45:00', 3),
(116, 'Lenguaje Musical IV', '00:45:00', 3),
(117, 'Lenguaje Musical V', '00:45:00', 3),
(118, 'Lenguaje Musical VI', '00:45:00', 3),
(119, 'Lenguaje Musical I', '00:45:00', 4),
(120, 'Lenguaje Musical II', '00:45:00', 4),
(121, 'Lenguaje Musical III', '00:45:00', 4),
(122, 'Lenguaje Musical IV', '00:45:00', 4),
(123, 'Lenguaje Musical V', '00:45:00', 4),
(124, 'Lenguaje Musical VI', '00:45:00', 4),
(125, 'Lenguaje Musical I', '00:45:00', 5),
(126, 'Lenguaje Musical II', '00:45:00', 5),
(127, 'Lenguaje Musical III', '00:45:00', 5),
(128, 'Lenguaje Musical IV', '00:45:00', 5),
(129, 'Lenguaje Musical V', '00:45:00', 5),
(130, 'Lenguaje Musical VI', '00:45:00', 5),
(131, 'Lenguaje Musical I', '00:45:00', 6),
(132, 'Lenguaje Musical II', '00:45:00', 6),
(133, 'Lenguaje Musical III', '00:45:00', 6),
(134, 'Lenguaje Musical IV', '00:45:00', 6),
(135, 'Lenguaje Musical V', '00:45:00', 6),
(136, 'Lenguaje Musical VI', '00:45:00', 6),
(137, 'Lenguaje Musical I', '00:45:00', 7),
(138, 'Lenguaje Musical II', '00:45:00', 7),
(139, 'Lenguaje Musical III', '00:45:00', 7),
(140, 'Lenguaje Musical IV', '00:45:00', 7),
(141, 'Lenguaje Musical V', '00:45:00', 7),
(142, 'Lenguaje Musical VI', '00:45:00', 7),
(143, 'Lenguaje Musical I', '00:45:00', 8),
(144, 'Lenguaje Musical II', '00:45:00', 8),
(145, 'Lenguaje Musical III', '00:45:00', 8),
(146, 'Lenguaje Musical IV', '00:45:00', 8),
(147, 'Lenguaje Musical V', '00:45:00', 8),
(148, 'Lenguaje Musical VI', '00:45:00', 8),
(149, 'Lenguaje Musical I', '00:45:00', 9),
(150, 'Lenguaje Musical II', '00:45:00', 9),
(151, 'Lenguaje Musical III', '00:45:00', 9),
(152, 'Lenguaje Musical IV', '00:45:00', 9),
(153, 'Lenguaje Musical V', '00:45:00', 9),
(154, 'Lenguaje Musical VI', '00:45:00', 9),
(155, 'Lenguaje Musical I', '00:45:00', 10),
(156, 'Lenguaje Musical II', '00:45:00', 10),
(157, 'Lenguaje Musical III', '00:45:00', 10),
(158, 'Lenguaje Musical IV', '00:45:00', 10),
(159, 'Lenguaje Musical V', '00:45:00', 10),
(160, 'Lenguaje Musical VI', '00:45:00', 10),
(161, 'Armonía I', '00:45:00', 1),
(162, 'Armonía II', '00:45:00', 1),
(163, 'Armonía III', '00:45:00', 1),
(164, 'Armonía IV', '00:45:00', 1),
(165, 'Armonía I', '00:45:00', 2),
(166, 'Armonía II', '00:45:00', 2),
(167, 'Armonía III', '00:45:00', 2),
(168, 'Armonía IV', '00:45:00', 2),
(169, 'Armonía I', '00:45:00', 3),
(170, 'Armonía II', '00:45:00', 3),
(171, 'Armonía III', '00:45:00', 3),
(172, 'Armonía IV', '00:45:00', 3),
(173, 'Armonía I', '00:45:00', 4),
(174, 'Armonía II', '00:45:00', 4),
(175, 'Armonía III', '00:45:00', 4),
(176, 'Armonía IV', '00:45:00', 4),
(177, 'Armonía I', '00:45:00', 5),
(178, 'Armonía II', '00:45:00', 5),
(179, 'Armonía III', '00:45:00', 5),
(180, 'Armonía IV', '00:45:00', 5),
(181, 'Armonía I', '00:45:00', 6),
(182, 'Armonía II', '00:45:00', 6),
(183, 'Armonía III', '00:45:00', 6),
(184, 'Armonía IV', '00:45:00', 6),
(185, 'Armonía I', '00:45:00', 7),
(186, 'Armonía II', '00:45:00', 7),
(187, 'Armonía III', '00:45:00', 7),
(188, 'Armonía IV', '00:45:00', 7),
(189, 'Armonía I', '00:45:00', 8),
(190, 'Armonía II', '00:45:00', 8),
(191, 'Armonía III', '00:45:00', 8),
(192, 'Armonía IV', '00:45:00', 8),
(193, 'Armonía I', '00:45:00', 9),
(194, 'Armonía II', '00:45:00', 9),
(195, 'Armonía III', '00:45:00', 9),
(196, 'Armonía IV', '00:45:00', 9),
(197, 'Armonía I', '00:45:00', 10),
(198, 'Armonía II', '00:45:00', 10),
(199, 'Armonía III', '00:45:00', 10),
(200, 'Armonía IV', '00:45:00', 10),
(201, 'Instrumento I', '00:45:00', 11),
(202, 'Instrumento II', '00:45:00', 11),
(203, 'Instrumento III', '00:45:00', 11),
(204, 'Instrumento IV', '00:45:00', 11),
(205, 'Instrumento I', '00:45:00', 12),
(206, 'Instrumento II', '00:45:00', 12),
(207, 'Instrumento III', '00:45:00', 12),
(208, 'Instrumento IV', '00:45:00', 12),
(209, 'Instrumento I', '00:45:00', 13),
(210, 'Instrumento II', '00:45:00', 13),
(211, 'Instrumento III', '00:45:00', 13),
(212, 'Instrumento IV', '00:45:00', 13),
(213, 'Instrumento I', '00:45:00', 14),
(214, 'Instrumento II', '00:45:00', 14),
(215, 'Instrumento III', '00:45:00', 14),
(216, 'Instrumento IV', '00:45:00', 14),
(217, 'Canto I', '00:45:00', 11),
(218, 'Canto II', '00:45:00', 11),
(219, 'Canto III', '00:45:00', 11),
(220, 'Canto IV', '00:45:00', 11),
(221, 'Canto I', '00:45:00', 12),
(222, 'Canto II', '00:45:00', 12),
(223, 'Canto III', '00:45:00', 12),
(224, 'Canto IV', '00:45:00', 12),
(225, 'Canto I', '00:45:00', 13),
(226, 'Canto II', '00:45:00', 13),
(227, 'Canto III', '00:45:00', 13),
(228, 'Canto IV', '00:45:00', 13),
(229, 'Canto I', '00:45:00', 14),
(230, 'Canto II', '00:45:00', 14),
(231, 'Canto III', '00:45:00', 14),
(232, 'Canto IV', '00:45:00', 14),
(233, 'Instrumento I', '00:45:00', 15),
(234, 'Instrumento II', '00:45:00', 15),
(235, 'Instrumento III', '00:45:00', 15),
(236, 'Instrumento IV', '00:45:00', 15),
(237, 'Instrumento V', '00:45:00', 15),
(238, 'Instrumento VI', '00:45:00', 15),
(239, 'Instrumento I', '00:45:00', 16),
(240, 'Instrumento II', '00:45:00', 16),
(241, 'Instrumento III', '00:45:00', 16),
(242, 'Instrumento IV', '00:45:00', 16),
(243, 'Instrumento V', '00:45:00', 16),
(244, 'Instrumento VI', '00:45:00', 16),
(245, 'Instrumento I', '00:45:00', 17),
(246, 'Instrumento II', '00:45:00', 17),
(247, 'Instrumento III', '00:45:00', 17),
(248, 'Instrumento IV', '00:45:00', 17),
(249, 'Instrumento V', '00:45:00', 17),
(250, 'Instrumento VI', '00:45:00', 17),
(251, 'Instrumento I', '00:45:00', 18),
(252, 'Instrumento II', '00:45:00', 18),
(253, 'Instrumento III', '00:45:00', 18),
(254, 'Instrumento IV', '00:45:00', 18),
(255, 'Instrumento V', '00:45:00', 18),
(256, 'Instrumento VI', '00:45:00', 18),
(257, 'Instrumento I', '00:45:00', 19),
(258, 'Instrumento II', '00:45:00', 19),
(259, 'Instrumento III', '00:45:00', 19),
(260, 'Instrumento IV', '00:45:00', 19),
(261, 'Instrumento V', '00:45:00', 19),
(262, 'Instrumento VI', '00:45:00', 19),
(263, 'Instrumento I', '00:45:00', 20),
(264, 'Instrumento II', '00:45:00', 20),
(265, 'Instrumento III', '00:45:00', 20),
(266, 'Instrumento IV', '00:45:00', 20),
(267, 'Instrumento V', '00:45:00', 20),
(268, 'Instrumento VI', '00:45:00', 20),
(269, 'Instrumento I', '00:45:00', 21),
(270, 'Instrumento II', '00:45:00', 21),
(271, 'Instrumento III', '00:45:00', 21),
(272, 'Instrumento IV', '00:45:00', 21),
(273, 'Instrumento V', '00:45:00', 21),
(274, 'Instrumento VI', '00:45:00', 21),
(275, 'Instrumento I', '00:45:00', 22),
(276, 'Instrumento II', '00:45:00', 22),
(277, 'Instrumento III', '00:45:00', 22),
(278, 'Instrumento IV', '00:45:00', 22),
(279, 'Instrumento V', '00:45:00', 22),
(280, 'Instrumento VI', '00:45:00', 22),
(281, 'Instrumento I', '00:45:00', 23),
(282, 'Instrumento II', '00:45:00', 23),
(283, 'Instrumento III', '00:45:00', 23),
(284, 'Instrumento IV', '00:45:00', 23),
(285, 'Instrumento V', '00:45:00', 23),
(286, 'Instrumento VI', '00:45:00', 23),
(287, 'Instrumento I', '00:45:00', 24),
(288, 'Instrumento II', '00:45:00', 24),
(289, 'Instrumento III', '00:45:00', 24),
(290, 'Instrumento IV', '00:45:00', 24),
(291, 'Instrumento V', '00:45:00', 24),
(292, 'Instrumento VI', '00:45:00', 24);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cobromatricula`
--

CREATE TABLE `tbl_cobromatricula` (
  `Id_cobro` int(11) NOT NULL,
  `TotalMatricula` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contrespon`
--

CREATE TABLE `tbl_contrespon` (
  `Id_ContResp` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Telefono` decimal(12,0) NOT NULL,
  `Id_Tipo` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cuentacorriente`
--

CREATE TABLE `tbl_cuentacorriente` (
  `Id_Cuenta` int(11) NOT NULL,
  `MontoTotal` decimal(8,2) NOT NULL,
  `Mespago` varchar(15) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_cobro` int(11) NOT NULL,
  `Id_precio` int(11) NOT NULL,
  `Id_Estado` int(11) NOT NULL,
  `Id_Matricula` int(11) NOT NULL,
  `Id_Descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `Id_Departamentos` int(11) NOT NULL,
  `DescripDepart` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`Id_Departamentos`, `DescripDepart`) VALUES
(1, 'DOCENCIA'),
(2, 'ADMINISTRACION');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_descuento`
--

CREATE TABLE `tbl_descuento` (
  `Id_Descuento` int(11) NOT NULL,
  `Descuento` varchar(15) NOT NULL,
  `DescripDesc` varchar(20) NOT NULL,
  `ValorDesc` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_descuento`
--

INSERT INTO `tbl_descuento` (`Id_Descuento`, `Descuento`, `DescripDesc`, `ValorDesc`) VALUES
(1, 'MIEMBRO IGLESIA', 'MIEMBRO DE LA IGLESI', '0.15'),
(2, 'GRUPAL', 'DESC GRUPAL', '0.20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `Id_Direcciones` int(11) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado`
--

CREATE TABLE `tbl_estado` (
  `Id_Estado` int(11) NOT NULL,
  `DescripEstatus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estado`
--

INSERT INTO `tbl_estado` (`Id_Estado`, `DescripEstatus`) VALUES
(1, 'NUEVO'),
(2, 'INACTIVO'),
(3, 'ACTIVO'),
(4, 'BLOQUEADO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estadocivil`
--

CREATE TABLE `tbl_estadocivil` (
  `Id_EstadoCivil` int(11) NOT NULL,
  `Descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estadocivil`
--

INSERT INTO `tbl_estadocivil` (`Id_EstadoCivil`, `Descripcion`) VALUES
(1, 'SOLTERO'),
(2, 'CASADO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estadopago`
--

CREATE TABLE `tbl_estadopago` (
  `Id_Estado` int(11) NOT NULL,
  `EstadoPago` varchar(15) NOT NULL,
  `Descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estadopago`
--

INSERT INTO `tbl_estadopago` (`Id_Estado`, `EstadoPago`, `Descripcion`) VALUES
(1, 'PAGADO', 'PAGADO'),
(2, 'MORA', 'MORA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `Id_Genero` int(11) NOT NULL,
  `Descripcion` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`Id_Genero`, `Descripcion`) VALUES
(1, 'FEMENINO'),
(2, 'MASCULINO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hist_contrasena`
--

CREATE TABLE `tbl_hist_contrasena` (
  `Id_Hist` int(11) NOT NULL,
  `Contrasena` longtext NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matricula`
--

CREATE TABLE `tbl_matricula` (
  `Id_Matricula` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL,
  `Id_PeriodoAcm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modalidades`
--

CREATE TABLE `tbl_modalidades` (
  `Id_Modalidad` int(11) NOT NULL,
  `DescripModalidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_modalidades`
--

INSERT INTO `tbl_modalidades` (`Id_Modalidad`, `DescripModalidad`) VALUES
(1, 'DIPLOMADO'),
(2, 'TECNICO'),
(3, 'CURSO LIBRE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modseccion`
--

CREATE TABLE `tbl_modseccion` (
  `Id_Clase` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objetos`
--

CREATE TABLE `tbl_objetos` (
  `Id_Objeto` int(11) NOT NULL,
  `Objeto` varchar(100) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `TipoObjeto` varchar(15) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_objetos`
--

INSERT INTO `tbl_objetos` (`Id_Objeto`, `Objeto`, `Descripcion`, `TipoObjeto`, `FechaCreacion`, `FechaModificacion`, `CreadoPor`, `ModificadoPor`) VALUES
(1, 'Pantalla Login', 'Formulario de inicio de sesion', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL),
(2, 'Pantalla preguntas', 'Formulario de preguntas de seguridad', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL),
(3, 'Pantalla reposicion', 'Formulario de envio de correo de recuperacion de contraseña', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL),
(4, 'Pantalla autoregistro', 'Formulario de registro de usuarios', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL),
(5, 'Pantalla area trabajo', 'Formulario de entorno de trabajo principal', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL),
(6, 'Pantalla cambio password', 'Formulario para cambiar password del usuario', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL),
(7, 'cierra sesion', 'pagina de cierre de sesion', 'Pagina PHP', '2018-11-25', '2018-11-25', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_obsnotas`
--

CREATE TABLE `tbl_obsnotas` (
  `Cod_Obs` int(11) NOT NULL,
  `Observacion` varchar(25) NOT NULL,
  `DescripObs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_obsnotas`
--

INSERT INTO `tbl_obsnotas` (`Cod_Obs`, `Observacion`, `DescripObs`) VALUES
(1, 'APR', 'APRBADO'),
(2, 'RPD', 'REPROBADO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orientacion`
--

CREATE TABLE `tbl_orientacion` (
  `Id_orientacion` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Id_modalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orientacion`
--

INSERT INTO `tbl_orientacion` (`Id_orientacion`, `Nombre`, `Id_modalidad`) VALUES
(1, 'Piano', 1),
(2, 'Guitarra Acustica', 1),
(3, 'Guitarra Eléctrica', 1),
(4, 'Bajo', 1),
(5, 'Violin', 1),
(6, 'Flauta Traversa', 1),
(7, 'Trompeta', 1),
(8, 'Saxofón', 1),
(9, 'Canto', 1),
(10, 'Percusión ', 1),
(11, 'Piano', 2),
(12, 'Guitarra', 2),
(13, 'Bajo', 2),
(14, 'Batería', 2),
(15, 'Piano', 3),
(16, 'Guitarra Acustica', 3),
(17, 'Guitarra Eléctrica', 3),
(18, 'Bajo', 3),
(19, 'Violin', 3),
(20, 'Flauta Traversa', 3),
(21, 'Trompeta', 3),
(22, 'Saxofón', 3),
(23, 'Canto', 3),
(24, 'Percusión ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pagoclases`
--

CREATE TABLE `tbl_pagoclases` (
  `Id_Pago` int(11) NOT NULL,
  `Duracion` decimal(10,0) NOT NULL,
  `Valor` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Id_Clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parametros`
--

CREATE TABLE `tbl_parametros` (
  `Id_Parametro` int(11) NOT NULL,
  `Parametro` varchar(50) NOT NULL,
  `Valor` varchar(100) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `Id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parametros`
--

INSERT INTO `tbl_parametros` (`Id_Parametro`, `Parametro`, `Valor`, `FechaCreacion`, `FechaModificacion`, `Id_usuario`) VALUES
(1, 'ADMIN_INTENTOS_INVALIDOS', '3', '2019-03-07', '2019-03-07', 1),
(2, 'ADMIN_PREGUNTAS', '3', '2019-03-07', '2019-03-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_periodoacademico`
--

CREATE TABLE `tbl_periodoacademico` (
  `Id_PeriodoAcm` int(11) NOT NULL,
  `DescripPeriodo` varchar(45) NOT NULL,
  `Activo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_periodoacademico`
--

INSERT INTO `tbl_periodoacademico` (`Id_PeriodoAcm`, `DescripPeriodo`, `Activo`) VALUES
(1, 'IPAC2018', '0'),
(2, 'IIPAC2018', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permisos`
--

CREATE TABLE `tbl_permisos` (
  `PermisoInsercion` tinytext NOT NULL,
  `PermisoEliminacion` tinytext NOT NULL,
  `PermisoActualizacion` tinytext NOT NULL,
  `PermisoConsultar` tinytext NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Id_Objeto` int(11) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_planilla`
--

CREATE TABLE `tbl_planilla` (
  `Id_Planilla` int(11) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Valor` decimal(8,2) NOT NULL,
  `MesPago` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_planillapago`
--

CREATE TABLE `tbl_planillapago` (
  `MesPago` varchar(10) NOT NULL,
  `TotalPagar` decimal(8,2) DEFAULT NULL,
  `FechaGen` date DEFAULT NULL,
  `FechaPago` date DEFAULT NULL,
  `Id_asistencia` int(11) NOT NULL,
  `Id_Planilla` int(11) NOT NULL,
  `Id_Pago` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_precio`
--

CREATE TABLE `tbl_precio` (
  `Id_precio` int(11) NOT NULL,
  `Precio` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preguntas`
--

CREATE TABLE `tbl_preguntas` (
  `Id_Pregunta` int(11) NOT NULL,
  `Pregunta` varchar(45) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_preguntas`
--

INSERT INTO `tbl_preguntas` (`Id_Pregunta`, `Pregunta`, `CreadoPor`, `ModificadoPor`, `FechaCreacion`, `FechaModificacion`) VALUES
(1, 'Cual era el nombre de tu primera mascota?', '1', NULL, '2018-11-07', NULL),
(2, 'Cual es el nombre de la ciudad en que naciste', '1', NULL, '2018-11-07', NULL),
(3, 'Cual era tu apodo de niño?', '1', NULL, '2018-11-07', NULL),
(4, 'Cual era el nombre de tu primer maestro?', '1', NULL, '2018-10-10', NULL),
(5, 'Cual es tu color favorito?', '1', NULL, '2018-10-10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preguntasusuario`
--

CREATE TABLE `tbl_preguntasusuario` (
  `Respuesta` varchar(45) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_Pregunta` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_preguntasusuario`
--

INSERT INTO `tbl_preguntasusuario` (`Respuesta`, `Id_usuario`, `Id_Pregunta`, `FechaCreacion`, `FechaModificacion`, `CreadoPor`, `ModificadoPor`) VALUES
('mei', 1, 1, '2019-03-08', '2019-03-08', 'Autoregistro', 'Autoregistro'),
('keren', 1, 3, '2019-03-08', '2019-03-08', 'Autoregistro', 'Autoregistro'),
('negro', 1, 5, '2019-03-08', '2019-03-08', 'Autoregistro', 'Autoregistro');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `Id_Rol` int(11) NOT NULL,
  `Rol` varchar(30) NOT NULL,
  `DescripRol` varchar(20) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModifcadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`Id_Rol`, `Rol`, `DescripRol`, `CreadoPor`, `ModifcadoPor`, `FechaCreacion`, `FechaModificacion`) VALUES
(1, 'ADMINISTRADOR', 'EDITAR', 'PRUEBA', 'PRUEBA', '2018-10-17', '2018-10-17'),
(2, 'DIRECTOR', 'Director', 'PRUEBA', 'PRUEBA', '2018-10-10', '2018-10-10'),
(3, 'DOCENTE', 'Docente', 'PRUEBA', 'PRUEBA', '2018-10-10', '2018-10-10'),
(5, 'PENDIENTE', 'PENDIENTE', 'PRUEBA', 'PRUEBA', '2019-03-02', '2019-03-02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_secciones`
--

CREATE TABLE `tbl_secciones` (
  `Id_Seccion` int(11) NOT NULL,
  `DescripSeccion` varchar(45) NOT NULL,
  `HraClase` time DEFAULT NULL,
  `AulaClase` varchar(15) DEFAULT NULL,
  `Id_Clase` int(11) NOT NULL,
  `Id_PeriodoAcm` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipocontacto`
--

CREATE TABLE `tbl_tipocontacto` (
  `Id_Tipo` int(11) NOT NULL,
  `Tipo` varchar(15) NOT NULL,
  `Descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `Id_usuario` int(11) NOT NULL,
  `Usuario` varchar(15) NOT NULL,
  `Contrasena` longtext NOT NULL,
  `FechaUltimaConex` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `Telefono` int(11) NOT NULL,
  `Cedula` bigint(13) NOT NULL,
  `PreguntasContestadas` bigint(20) DEFAULT NULL,
  `PrimerIngreso` bigint(20) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `CorreoElectronico` varchar(50) DEFAULT NULL,
  `Id_Departamento` int(11) NOT NULL,
  `Id_Genero` int(11) NOT NULL,
  `Id_EstadoCivil` int(11) NOT NULL,
  `Id_Estado` int(11) DEFAULT NULL,
  `Id_Rol` int(11) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) DEFAULT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`Id_usuario`, `Usuario`, `Contrasena`, `FechaUltimaConex`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Telefono`, `Cedula`, `PreguntasContestadas`, `PrimerIngreso`, `FechaVencimiento`, `CorreoElectronico`, `Id_Departamento`, `Id_Genero`, `Id_EstadoCivil`, `Id_Estado`, `Id_Rol`, `FechaCreacion`, `FechaModificacion`, `CreadoPor`, `ModificadoPor`, `code`) VALUES
(1, 'ADMIN', '$2y$10$jKczoPIcnHY3dTat6UBmxePTNKhS8UP.2PKqOb3S2QYYtl8q6mSBW', '2019-03-08 06:17:54', 'ADMIN', NULL, 'ADMIN', NULL, 11111111, 801000011111, NULL, 1, NULL, 'admin@admin.com', 2, 1, 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(72, 'KERENY', '$2y$10$EzPOcGHPLgelAGAN.p6Ue.V9zg/UypIsOuqD/GgCuZ8X/GqUUSHJG', NULL, 'KEREN', '', 'YANES', '', 88888888, 801000011111, NULL, 0, NULL, 'abc@abc.com', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_alumnos`
--
ALTER TABLE `tbl_alumnos`
  ADD PRIMARY KEY (`Id_Alumno`),
  ADD KEY `fkIdx_gen_alum` (`Id_genero`),
  ADD KEY `fkIdx_estcivil_alum` (`Id_estadocivil`);

--
-- Indexes for table `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  ADD PRIMARY KEY (`Id_asistencia`),
  ADD KEY `FK_User_Asis` (`Id_usuario`),
  ADD KEY `FK_Clases_Asis` (`Id_clase`);

--
-- Indexes for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`Id_Bitacora`),
  ADD KEY `fkIdx_Usuario_Bit` (`Id_usuario`),
  ADD KEY `fkIdx_Obj_Bit` (`Id_Objeto`);

--
-- Indexes for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  ADD PRIMARY KEY (`Id_Calificaciones`),
  ADD KEY `fkIdx_Alumno_Cal` (`Id_Alumno`),
  ADD KEY `fkIdx_Seccion_Cal` (`Id_Seccion`),
  ADD KEY `fkIdx_Obs_Cal` (`Cod_Obs`),
  ADD KEY `fkIdx_Clases_Cal` (`Id_Clase`);

--
-- Indexes for table `tbl_clases`
--
ALTER TABLE `tbl_clases`
  ADD PRIMARY KEY (`Id_Clase`),
  ADD KEY `fkIdx_oreintacion_Clase` (`Id_orientacion`);

--
-- Indexes for table `tbl_cobromatricula`
--
ALTER TABLE `tbl_cobromatricula`
  ADD PRIMARY KEY (`Id_cobro`);

--
-- Indexes for table `tbl_contrespon`
--
ALTER TABLE `tbl_contrespon`
  ADD PRIMARY KEY (`Id_ContResp`),
  ADD KEY `fkIdx_TCont_ContResp` (`Id_Tipo`),
  ADD KEY `fkIdx_Alumno_ContResp` (`Id_Alumno`);

--
-- Indexes for table `tbl_cuentacorriente`
--
ALTER TABLE `tbl_cuentacorriente`
  ADD PRIMARY KEY (`Id_Cuenta`),
  ADD KEY `fkIdx_Alum_CCorriente` (`Id_Alumno`),
  ADD KEY `fkIdx_CMatri_CCorriente` (`Id_cobro`),
  ADD KEY `fkIdx_Precio_CCorriente` (`Id_precio`),
  ADD KEY `fkIdx_EstPago_CCorriente` (`Id_Estado`),
  ADD KEY `fkIdx_Matri_CCorriente` (`Id_Matricula`),
  ADD KEY `fkIdx_Desc_CCorriente` (`Id_Descuento`);

--
-- Indexes for table `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`Id_Departamentos`);

--
-- Indexes for table `tbl_descuento`
--
ALTER TABLE `tbl_descuento`
  ADD PRIMARY KEY (`Id_Descuento`);

--
-- Indexes for table `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`Id_Direcciones`),
  ADD KEY `FK_User_Dir` (`Id_usuario`),
  ADD KEY `FK_alumno_Dir` (`Id_alumno`);

--
-- Indexes for table `tbl_estado`
--
ALTER TABLE `tbl_estado`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indexes for table `tbl_estadocivil`
--
ALTER TABLE `tbl_estadocivil`
  ADD PRIMARY KEY (`Id_EstadoCivil`);

--
-- Indexes for table `tbl_estadopago`
--
ALTER TABLE `tbl_estadopago`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indexes for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`Id_Genero`);

--
-- Indexes for table `tbl_hist_contrasena`
--
ALTER TABLE `tbl_hist_contrasena`
  ADD PRIMARY KEY (`Id_Hist`),
  ADD KEY `fkIdx_Usuario_HistC` (`Id_usuario`);

--
-- Indexes for table `tbl_matricula`
--
ALTER TABLE `tbl_matricula`
  ADD PRIMARY KEY (`Id_Matricula`),
  ADD KEY `fkIdx_Alumno_Matricula` (`Id_Alumno`),
  ADD KEY `fkIdx_Seccion_Matr` (`Id_Seccion`),
  ADD KEY `fkIdx_Periodo_Matri` (`Id_PeriodoAcm`);

--
-- Indexes for table `tbl_modalidades`
--
ALTER TABLE `tbl_modalidades`
  ADD PRIMARY KEY (`Id_Modalidad`);

--
-- Indexes for table `tbl_modseccion`
--
ALTER TABLE `tbl_modseccion`
  ADD KEY `fkIdx_Clases_ModSec` (`Id_Clase`),
  ADD KEY `fkIdx_Sec_ModSec` (`Id_Seccion`);

--
-- Indexes for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  ADD PRIMARY KEY (`Id_Objeto`);

--
-- Indexes for table `tbl_obsnotas`
--
ALTER TABLE `tbl_obsnotas`
  ADD PRIMARY KEY (`Cod_Obs`);

--
-- Indexes for table `tbl_orientacion`
--
ALTER TABLE `tbl_orientacion`
  ADD PRIMARY KEY (`Id_orientacion`),
  ADD KEY `fkIdx_Mod_orientacion` (`Id_modalidad`);

--
-- Indexes for table `tbl_pagoclases`
--
ALTER TABLE `tbl_pagoclases`
  ADD PRIMARY KEY (`Id_Pago`),
  ADD KEY `fkIdx_Clases_PagoC` (`Id_Clase`);

--
-- Indexes for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  ADD PRIMARY KEY (`Id_Parametro`),
  ADD KEY `fkIdx_Usuario_Par` (`Id_usuario`);

--
-- Indexes for table `tbl_periodoacademico`
--
ALTER TABLE `tbl_periodoacademico`
  ADD PRIMARY KEY (`Id_PeriodoAcm`);

--
-- Indexes for table `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD KEY `fkIdx_Rol_Permisos` (`Id_Rol`),
  ADD KEY `fkIdx_Obj_Permisos` (`Id_Objeto`);

--
-- Indexes for table `tbl_planilla`
--
ALTER TABLE `tbl_planilla`
  ADD PRIMARY KEY (`Id_Planilla`);

--
-- Indexes for table `tbl_planillapago`
--
ALTER TABLE `tbl_planillapago`
  ADD KEY `fkIdx_Asist_PPago` (`Id_asistencia`),
  ADD KEY `fkIdx_Planilla_PPago` (`Id_Planilla`),
  ADD KEY `fkIdx_PClases_PPago` (`Id_Pago`),
  ADD KEY `FK_User_Ppago` (`Id_usuario`);

--
-- Indexes for table `tbl_precio`
--
ALTER TABLE `tbl_precio`
  ADD PRIMARY KEY (`Id_precio`);

--
-- Indexes for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  ADD PRIMARY KEY (`Id_Pregunta`);

--
-- Indexes for table `tbl_preguntasusuario`
--
ALTER TABLE `tbl_preguntasusuario`
  ADD KEY `fkIdx_Usuario_PUsuario` (`Id_usuario`),
  ADD KEY `fkIdx_Preguntas_PUsuario` (`Id_Pregunta`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indexes for table `tbl_secciones`
--
ALTER TABLE `tbl_secciones`
  ADD PRIMARY KEY (`Id_Seccion`),
  ADD KEY `fkIdx_clase_Seccion` (`Id_PeriodoAcm`),
  ADD KEY `fkIdx_Periodo_Seccion` (`Id_PeriodoAcm`),
  ADD KEY `FK_Clase_Seccion` (`Id_Clase`),
  ADD KEY `FK_User_Seccion` (`Id_usuario`);

--
-- Indexes for table `tbl_tipocontacto`
--
ALTER TABLE `tbl_tipocontacto`
  ADD PRIMARY KEY (`Id_Tipo`);

--
-- Indexes for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `fkIdx_Rol_Usuario` (`Id_Rol`),
  ADD KEY `fkIdx_Est_Usuario` (`Id_Estado`),
  ADD KEY `FK_Depto_User` (`Id_Departamento`),
  ADD KEY `FK_User_estcivil` (`Id_EstadoCivil`),
  ADD KEY `FK_User_Genero` (`Id_Genero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_alumnos`
--
ALTER TABLE `tbl_alumnos`
  MODIFY `Id_Alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  MODIFY `Id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `Id_Bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  MODIFY `Id_Calificaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_clases`
--
ALTER TABLE `tbl_clases`
  MODIFY `Id_Clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT for table `tbl_cobromatricula`
--
ALTER TABLE `tbl_cobromatricula`
  MODIFY `Id_cobro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contrespon`
--
ALTER TABLE `tbl_contrespon`
  MODIFY `Id_ContResp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cuentacorriente`
--
ALTER TABLE `tbl_cuentacorriente`
  MODIFY `Id_Cuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `Id_Departamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_descuento`
--
ALTER TABLE `tbl_descuento`
  MODIFY `Id_Descuento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  MODIFY `Id_Direcciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_estado`
--
ALTER TABLE `tbl_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_estadocivil`
--
ALTER TABLE `tbl_estadocivil`
  MODIFY `Id_EstadoCivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_estadopago`
--
ALTER TABLE `tbl_estadopago`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `Id_Genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_hist_contrasena`
--
ALTER TABLE `tbl_hist_contrasena`
  MODIFY `Id_Hist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_matricula`
--
ALTER TABLE `tbl_matricula`
  MODIFY `Id_Matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_modalidades`
--
ALTER TABLE `tbl_modalidades`
  MODIFY `Id_Modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_modseccion`
--
ALTER TABLE `tbl_modseccion`
  MODIFY `Id_Clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  MODIFY `Id_Objeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_obsnotas`
--
ALTER TABLE `tbl_obsnotas`
  MODIFY `Cod_Obs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_orientacion`
--
ALTER TABLE `tbl_orientacion`
  MODIFY `Id_orientacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_pagoclases`
--
ALTER TABLE `tbl_pagoclases`
  MODIFY `Id_Pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  MODIFY `Id_Parametro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_periodoacademico`
--
ALTER TABLE `tbl_periodoacademico`
  MODIFY `Id_PeriodoAcm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_planilla`
--
ALTER TABLE `tbl_planilla`
  MODIFY `Id_Planilla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_precio`
--
ALTER TABLE `tbl_precio`
  MODIFY `Id_precio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  MODIFY `Id_Pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_secciones`
--
ALTER TABLE `tbl_secciones`
  MODIFY `Id_Seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_tipocontacto`
--
ALTER TABLE `tbl_tipocontacto`
  MODIFY `Id_Tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_alumnos`
--
ALTER TABLE `tbl_alumnos`
  ADD CONSTRAINT `FK_estcivil_alum` FOREIGN KEY (`Id_estadocivil`) REFERENCES `tbl_estadocivil` (`Id_EstadoCivil`),
  ADD CONSTRAINT `FK_gen_alum` FOREIGN KEY (`Id_genero`) REFERENCES `tbl_genero` (`Id_Genero`);

--
-- Constraints for table `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  ADD CONSTRAINT `FK_Clases_Asis` FOREIGN KEY (`Id_clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  ADD CONSTRAINT `FK_User_Asis` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `FK_Obj_Bit` FOREIGN KEY (`Id_Objeto`) REFERENCES `tbl_objetos` (`Id_Objeto`),
  ADD CONSTRAINT `FK_Usuario_Bit` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  ADD CONSTRAINT `FK_Alumno_Cal` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  ADD CONSTRAINT `FK_Clases_Cal` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  ADD CONSTRAINT `FK_Obs_Cal` FOREIGN KEY (`Cod_Obs`) REFERENCES `tbl_obsnotas` (`Cod_Obs`),
  ADD CONSTRAINT `FK_Seccion_Cal` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`);

--
-- Constraints for table `tbl_clases`
--
ALTER TABLE `tbl_clases`
  ADD CONSTRAINT `FK_orientacion_Clase` FOREIGN KEY (`Id_orientacion`) REFERENCES `tbl_orientacion` (`Id_orientacion`);

--
-- Constraints for table `tbl_contrespon`
--
ALTER TABLE `tbl_contrespon`
  ADD CONSTRAINT `FK_Alumno_ContResp` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  ADD CONSTRAINT `FK_TCont_ContResp` FOREIGN KEY (`Id_Tipo`) REFERENCES `tbl_tipocontacto` (`Id_Tipo`);

--
-- Constraints for table `tbl_cuentacorriente`
--
ALTER TABLE `tbl_cuentacorriente`
  ADD CONSTRAINT `FK_Alumno_CCorriente` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  ADD CONSTRAINT `FK_CMatri_CCorriente` FOREIGN KEY (`Id_cobro`) REFERENCES `tbl_cobromatricula` (`Id_cobro`),
  ADD CONSTRAINT `FK_Desc_CCorriente` FOREIGN KEY (`Id_Descuento`) REFERENCES `tbl_descuento` (`Id_Descuento`),
  ADD CONSTRAINT `FK_EstPago_CCorriente` FOREIGN KEY (`Id_Estado`) REFERENCES `tbl_estadopago` (`Id_Estado`),
  ADD CONSTRAINT `FK_Matri_CCorriente` FOREIGN KEY (`Id_Matricula`) REFERENCES `tbl_matricula` (`Id_Matricula`),
  ADD CONSTRAINT `FK_Precio_CCorriente` FOREIGN KEY (`Id_precio`) REFERENCES `tbl_precio` (`Id_precio`);

--
-- Constraints for table `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD CONSTRAINT `FK_User_Dir` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`),
  ADD CONSTRAINT `FK_alumno_Dir` FOREIGN KEY (`Id_alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`);

--
-- Constraints for table `tbl_hist_contrasena`
--
ALTER TABLE `tbl_hist_contrasena`
  ADD CONSTRAINT `FK_Usuario_HistC` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_matricula`
--
ALTER TABLE `tbl_matricula`
  ADD CONSTRAINT `FK_Alumno_Matricula` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  ADD CONSTRAINT `FK_Periodo_Matri` FOREIGN KEY (`Id_PeriodoAcm`) REFERENCES `tbl_periodoacademico` (`Id_PeriodoAcm`),
  ADD CONSTRAINT `FK_Seccion_Matr` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`);

--
-- Constraints for table `tbl_modseccion`
--
ALTER TABLE `tbl_modseccion`
  ADD CONSTRAINT `FK_Clases_ModSec` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  ADD CONSTRAINT `FK_Sec_ModSec` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`);

--
-- Constraints for table `tbl_orientacion`
--
ALTER TABLE `tbl_orientacion`
  ADD CONSTRAINT `FK_Mod_orientacion` FOREIGN KEY (`Id_modalidad`) REFERENCES `tbl_modalidades` (`Id_Modalidad`);

--
-- Constraints for table `tbl_pagoclases`
--
ALTER TABLE `tbl_pagoclases`
  ADD CONSTRAINT `FK_Clases_PagoC` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`);

--
-- Constraints for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  ADD CONSTRAINT `FK_Usuario_Par` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD CONSTRAINT `FK_Obj_Permisos` FOREIGN KEY (`Id_Objeto`) REFERENCES `tbl_objetos` (`Id_Objeto`),
  ADD CONSTRAINT `FK_Rol_Permisos` FOREIGN KEY (`Id_Rol`) REFERENCES `tbl_roles` (`Id_Rol`);

--
-- Constraints for table `tbl_planillapago`
--
ALTER TABLE `tbl_planillapago`
  ADD CONSTRAINT `FK_Asist_PPago` FOREIGN KEY (`Id_asistencia`) REFERENCES `tbl_asistencia` (`Id_asistencia`),
  ADD CONSTRAINT `FK_PClases_PPago` FOREIGN KEY (`Id_Pago`) REFERENCES `tbl_pagoclases` (`Id_Pago`),
  ADD CONSTRAINT `FK_Planilla_PPago` FOREIGN KEY (`Id_Planilla`) REFERENCES `tbl_planilla` (`Id_Planilla`),
  ADD CONSTRAINT `FK_User_Ppago` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_preguntasusuario`
--
ALTER TABLE `tbl_preguntasusuario`
  ADD CONSTRAINT `FK_Preguntas_PUsuario` FOREIGN KEY (`Id_Pregunta`) REFERENCES `tbl_preguntas` (`Id_Pregunta`),
  ADD CONSTRAINT `FK_Usuario_PUsuario` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_secciones`
--
ALTER TABLE `tbl_secciones`
  ADD CONSTRAINT `FK_Clase_Seccion` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  ADD CONSTRAINT `FK_Periodo_Seccion` FOREIGN KEY (`Id_PeriodoAcm`) REFERENCES `tbl_periodoacademico` (`Id_PeriodoAcm`),
  ADD CONSTRAINT `FK_User_Seccion` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `FK_Depto_User` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamentos`),
  ADD CONSTRAINT `FK_Est_Usuario` FOREIGN KEY (`Id_Estado`) REFERENCES `tbl_estado` (`Id_Estado`),
  ADD CONSTRAINT `FK_User_Genero` FOREIGN KEY (`Id_Genero`) REFERENCES `tbl_genero` (`Id_Genero`),
  ADD CONSTRAINT `FK_User_estcivil` FOREIGN KEY (`Id_EstadoCivil`) REFERENCES `tbl_estadocivil` (`Id_EstadoCivil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
