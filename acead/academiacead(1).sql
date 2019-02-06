-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2018 at 09:02 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

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
  `FechaNacimiento` date NOT NULL,
  `Cedula` decimal(13,0) NOT NULL,
  `Telefono` decimal(12,0) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Id_genero` int(11) NOT NULL,
  `Id_estadocivil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_alumnos`
--

INSERT INTO `tbl_alumnos` (`Id_Alumno`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `FechaNacimiento`, `Cedula`, `Telefono`, `FechaIngreso`, `Id_genero`, `Id_estadocivil`) VALUES
(1, 'ANA', 'MARIA', 'CRUZ', 'PAZ', '1976-10-10', '1008196704567', '22789044', '2018-10-10', 1, 1),
(2, 'Juan', 'PABLO', 'PINEDA', 'PONCE', '1978-12-31', '107197809360', '22780041', '2018-10-10', 2, 2),
(3, 'ROSA', 'RITA', 'MEDRANO', 'REINA', '2010-04-03', '801201008754', '22345678', '2018-10-17', 1, 1),
(4, 'LIA', 'ISA', 'RIVERA', ' ', '2007-03-03', '807201708653', '22345632', '2018-10-17', 1, 1),
(5, 'LUNA', 'BELLA', 'CHECK', 'PAZ', '1996-03-03', '807199608653', '22348902', '2018-10-17', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_asistencia`
--

CREATE TABLE `tbl_asistencia` (
  `Id_asistencia` int(11) NOT NULL,
  `Asistencia` decimal(4,0) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Id_Clase` int(11) NOT NULL,
  `Id_Empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_asistencia`
--

INSERT INTO `tbl_asistencia` (`Id_asistencia`, `Asistencia`, `Fecha`, `Id_Clase`, `Id_Empleado`) VALUES
(1, '1', '2018-10-17', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `Id_Bitacora` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Accion` varchar(20) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_Objeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Id_Modalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clases`
--

INSERT INTO `tbl_clases` (`Id_Clase`, `DescripClase`, `Duracion`, `Id_Modalidad`) VALUES
(1, 'Piano', '01:00:00', 1),
(2, 'Bateria', '00:45:00', 2);

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
  `Id_Alumno` int(11) DEFAULT NULL,
  `Id_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`Id_Direcciones`, `Direccion`, `Id_Alumno`, `Id_Empleado`) VALUES
(1, 'Res.Palmira', 5, 1),
(2, 'Col.Travesia', 1, 1);

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
(3, 'ACTIVO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estadocivil`
--

CREATE TABLE `tbl_estadocivil` (
  `Id_estadocivil` int(11) NOT NULL,
  `Descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estadocivil`
--

INSERT INTO `tbl_estadocivil` (`Id_estadocivil`, `Descripcion`) VALUES
(1, 'Soltero'),
(2, 'Casado');

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
  `Id_genero` int(11) NOT NULL,
  `Descripcion` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`Id_genero`, `Descripcion`) VALUES
(1, 'F'),
(2, 'M');

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

--
-- Dumping data for table `tbl_hist_contrasena`
--

INSERT INTO `tbl_hist_contrasena` (`Id_Hist`, `Contrasena`, `Id_usuario`, `FechaModificacion`, `FechaCreacion`, `CreadoPor`, `ModificadoPor`) VALUES
(1, '$2y$10$yXHKpcdEmCwO7csb/0MO5.D3pMZTkNrRef0Ni01SOM3oziKojVAu2', 1, NULL, '2018-10-24', 'adminsis', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matricula`
--

CREATE TABLE `tbl_matricula` (
  `Id_Matricula` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Modalidad` int(11) NOT NULL,
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
(1, 'Diplomado'),
(2, 'Tecnico');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modseccion`
--

CREATE TABLE `tbl_modseccion` (
  `Id_Clase` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_modseccion`
--

INSERT INTO `tbl_modseccion` (`Id_Clase`, `Id_Seccion`) VALUES
(1, 1);

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
(1, 'ADMIN_INTENTOS_INVALIDOS', '3', '2018-11-07', NULL, 1),
(2, 'ADMIN_PREGUNTAS', '1', '2018-11-07', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_periodoacademico`
--

CREATE TABLE `tbl_periodoacademico` (
  `Id_PeriodoAcm` int(11) NOT NULL,
  `DescripPeriodo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_periodoacademico`
--

INSERT INTO `tbl_periodoacademico` (`Id_PeriodoAcm`, `DescripPeriodo`) VALUES
(1, 'IPAC2018'),
(2, 'IIPAC2018');

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
-- Table structure for table `tbl_personal`
--

CREATE TABLE `tbl_personal` (
  `Id_Empleado` int(11) NOT NULL,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `Telefono` decimal(12,0) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Cedula` decimal(13,0) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `Id_Departamentos` int(11) DEFAULT NULL,
  `Id_estadocivil` int(11) NOT NULL,
  `Id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_personal`
--

INSERT INTO `tbl_personal` (`Id_Empleado`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Telefono`, `Email`, `Cedula`, `CreadoPor`, `ModificadoPor`, `FechaCreacion`, `FechaModificacion`, `Id_Departamentos`, `Id_estadocivil`, `Id_genero`) VALUES
(1, 'MANUEL', NULL, 'ARGOS', 'PEREZ', '98703456', 'MANU.AORS3@HOTMAIL.COM', '1517198956702', 'PRUEBA', 'PRUEBA', '2018-10-10', '2018-10-10', 1, 1, 2),
(2, 'Keren', NULL, 'Yanes', NULL, '12345678', 'keren@yahoo.com', '801000000000', '', NULL, '0000-00-00', NULL, NULL, 1, 2),
(3, 'JONATHAN', '', 'CARCAMO', '', '0', '', '0', '', NULL, '0000-00-00', NULL, NULL, 1, 2),
(4, 'JONATHAN', '', 'CARCAMO', '', '0', '', '0', '', NULL, '0000-00-00', NULL, NULL, 1, 2),
(5, 'JONATHAN', '', 'CARCAMO', '', '0', '', '0', '', NULL, '0000-00-00', NULL, NULL, 1, 2),
(6, 'AUTO', 'REGISTRO', 'PRUEBA', '', '123456789', 'kul@gh.hn', '801000000000', '', NULL, '0000-00-00', NULL, NULL, 1, 2);

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
  `Id_Empleado` int(11) NOT NULL,
  `Id_asistencia` int(11) NOT NULL,
  `Id_Planilla` int(11) NOT NULL,
  `Id_Pago` int(11) NOT NULL
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
(3, 'Cual era tu apodo de niño?', '1', NULL, '2018-11-07', NULL);

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
(1, 'EDITAR', 'EDITAR', 'PRUEBA', 'PRUEBA', '2018-10-17', '2018-10-17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_secciones`
--

CREATE TABLE `tbl_secciones` (
  `Id_Seccion` int(11) NOT NULL,
  `DescripSeccion` varchar(45) NOT NULL,
  `HraClase` time DEFAULT NULL,
  `AulaClase` varchar(15) DEFAULT NULL,
  `Id_Empleado` int(11) NOT NULL,
  `Id_PeriodoAcm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_secciones`
--

INSERT INTO `tbl_secciones` (`Id_Seccion`, `DescripSeccion`, `HraClase`, `AulaClase`, `Id_Empleado`, `Id_PeriodoAcm`) VALUES
(1, 'matutina', '00:59:00', '206', 1, 1),
(2, 'NOCTURNO', '00:59:00', '306', 1, 1);

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
  `NombreUsuario` varchar(100) NOT NULL,
  `Contrasena` longtext NOT NULL,
  `FechaUltimaConex` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PreguntasContestadas` bigint(20) NOT NULL,
  `PrimerIngreso` bigint(20) DEFAULT NULL,
  `FechaVencimiento` date NOT NULL,
  `CorreoElectronico` varchar(50) DEFAULT NULL,
  `Id_Estado` int(11) NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`Id_usuario`, `Usuario`, `NombreUsuario`, `Contrasena`, `FechaUltimaConex`, `PreguntasContestadas`, `PrimerIngreso`, `FechaVencimiento`, `CorreoElectronico`, `Id_Estado`, `Id_Rol`, `Id_Empleado`, `FechaCreacion`, `FechaModificacion`, `CreadoPor`, `ModificadoPor`) VALUES
(1, 'admin', 'Administrador', 'administrator1', '2018-11-07 06:10:59', 1, 1, '2020-12-31', 'admin@admin.com', 3, 1, 1, '2018-10-22', '2018-10-22', 'adminsis', 'adminsis'),
(2, 'prueba', 'prueba', 'prueba123456', '2018-11-07 07:25:57', 3, NULL, '2018-11-30', 'prueba@prueba.com', 1, 1, 3, '2018-11-07', NULL, '1', NULL);

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
  ADD KEY `fkIdx_Clas_Asis` (`Id_Clase`),
  ADD KEY `fkIdx_Pers_Asis` (`Id_Empleado`);

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
  ADD KEY `fkIdx_Mod_Clase` (`Id_Modalidad`);

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
  ADD KEY `fkIdx_Alumno_Dir` (`Id_Alumno`),
  ADD KEY `fkIdx_Pers_Dir` (`Id_Empleado`);

--
-- Indexes for table `tbl_estado`
--
ALTER TABLE `tbl_estado`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indexes for table `tbl_estadocivil`
--
ALTER TABLE `tbl_estadocivil`
  ADD PRIMARY KEY (`Id_estadocivil`);

--
-- Indexes for table `tbl_estadopago`
--
ALTER TABLE `tbl_estadopago`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indexes for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`Id_genero`);

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
  ADD KEY `fkIdx_Mod_Matricula` (`Id_Modalidad`),
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
-- Indexes for table `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD PRIMARY KEY (`Id_Empleado`),
  ADD KEY `fkIdx_Dept_Pers` (`Id_Departamentos`),
  ADD KEY `fkIdx_estcivil_pers` (`Id_estadocivil`),
  ADD KEY `fkIdx_gen_pers` (`Id_genero`);

--
-- Indexes for table `tbl_planilla`
--
ALTER TABLE `tbl_planilla`
  ADD PRIMARY KEY (`Id_Planilla`);

--
-- Indexes for table `tbl_planillapago`
--
ALTER TABLE `tbl_planillapago`
  ADD KEY `fkIdx_Pers_PPago` (`Id_Empleado`),
  ADD KEY `fkIdx_Asist_PPago` (`Id_asistencia`),
  ADD KEY `fkIdx_Planilla_PPago` (`Id_Planilla`),
  ADD KEY `fkIdx_PClases_PPago` (`Id_Pago`);

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
  ADD KEY `fkIdx_Pers_Seccion` (`Id_Empleado`),
  ADD KEY `fkIdx_Periodo_Seccion` (`Id_PeriodoAcm`);

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
  ADD KEY `fkIdx_Pers_Usuario` (`Id_Empleado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_alumnos`
--
ALTER TABLE `tbl_alumnos`
  MODIFY `Id_Alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  MODIFY `Id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `Id_Bitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_calificaciones`
--
ALTER TABLE `tbl_calificaciones`
  MODIFY `Id_Calificaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_clases`
--
ALTER TABLE `tbl_clases`
  MODIFY `Id_Clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_estadocivil`
--
ALTER TABLE `tbl_estadocivil`
  MODIFY `Id_estadocivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_estadopago`
--
ALTER TABLE `tbl_estadopago`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `Id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_hist_contrasena`
--
ALTER TABLE `tbl_hist_contrasena`
  MODIFY `Id_Hist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_modalidades`
--
ALTER TABLE `tbl_modalidades`
  MODIFY `Id_Modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_modseccion`
--
ALTER TABLE `tbl_modseccion`
  MODIFY `Id_Clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  MODIFY `Id_Objeto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_obsnotas`
--
ALTER TABLE `tbl_obsnotas`
  MODIFY `Cod_Obs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `tbl_personal`
--
ALTER TABLE `tbl_personal`
  MODIFY `Id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `Id_Pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_secciones`
--
ALTER TABLE `tbl_secciones`
  MODIFY `Id_Seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_tipocontacto`
--
ALTER TABLE `tbl_tipocontacto`
  MODIFY `Id_Tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_alumnos`
--
ALTER TABLE `tbl_alumnos`
  ADD CONSTRAINT `FK_estcivil_alum` FOREIGN KEY (`Id_estadocivil`) REFERENCES `tbl_estadocivil` (`Id_estadocivil`),
  ADD CONSTRAINT `FK_gen_alum` FOREIGN KEY (`Id_genero`) REFERENCES `tbl_genero` (`Id_genero`);

--
-- Constraints for table `tbl_asistencia`
--
ALTER TABLE `tbl_asistencia`
  ADD CONSTRAINT `FK_Clas_Asis` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  ADD CONSTRAINT `FK_Pers_Asis` FOREIGN KEY (`Id_Empleado`) REFERENCES `tbl_personal` (`Id_Empleado`);

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
  ADD CONSTRAINT `FK_Mod_Clase` FOREIGN KEY (`Id_Modalidad`) REFERENCES `tbl_modalidades` (`Id_Modalidad`);

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
  ADD CONSTRAINT `FK_Alumno_Dir` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  ADD CONSTRAINT `FK_Pers_Dir` FOREIGN KEY (`Id_Empleado`) REFERENCES `tbl_personal` (`Id_Empleado`);

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
  ADD CONSTRAINT `FK_Mod_Matricula` FOREIGN KEY (`Id_Modalidad`) REFERENCES `tbl_modalidades` (`Id_Modalidad`),
  ADD CONSTRAINT `FK_Periodo_Matri` FOREIGN KEY (`Id_PeriodoAcm`) REFERENCES `tbl_periodoacademico` (`Id_PeriodoAcm`),
  ADD CONSTRAINT `FK_Seccion_Matr` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`);

--
-- Constraints for table `tbl_modseccion`
--
ALTER TABLE `tbl_modseccion`
  ADD CONSTRAINT `FK_Clases_ModSec` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  ADD CONSTRAINT `FK_Sec_ModSec` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`);

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
-- Constraints for table `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD CONSTRAINT `FK_Dept_Pers` FOREIGN KEY (`Id_Departamentos`) REFERENCES `tbl_departamentos` (`Id_Departamentos`),
  ADD CONSTRAINT `FK_estcivil_pers` FOREIGN KEY (`Id_estadocivil`) REFERENCES `tbl_estadocivil` (`Id_estadocivil`),
  ADD CONSTRAINT `FK_gen_pers` FOREIGN KEY (`Id_genero`) REFERENCES `tbl_genero` (`Id_genero`);

--
-- Constraints for table `tbl_planillapago`
--
ALTER TABLE `tbl_planillapago`
  ADD CONSTRAINT `FK_Asist_PPago` FOREIGN KEY (`Id_asistencia`) REFERENCES `tbl_asistencia` (`Id_asistencia`),
  ADD CONSTRAINT `FK_PClases_PPago` FOREIGN KEY (`Id_Pago`) REFERENCES `tbl_pagoclases` (`Id_Pago`),
  ADD CONSTRAINT `FK_Pers_PPago` FOREIGN KEY (`Id_Empleado`) REFERENCES `tbl_personal` (`Id_Empleado`),
  ADD CONSTRAINT `FK_Planilla_PPago` FOREIGN KEY (`Id_Planilla`) REFERENCES `tbl_planilla` (`Id_Planilla`);

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
  ADD CONSTRAINT `FK_Periodo_Seccion` FOREIGN KEY (`Id_PeriodoAcm`) REFERENCES `tbl_periodoacademico` (`Id_PeriodoAcm`),
  ADD CONSTRAINT `FK_Pers_Seccion` FOREIGN KEY (`Id_Empleado`) REFERENCES `tbl_personal` (`Id_Empleado`);

--
-- Constraints for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `FK_Est_Usuario` FOREIGN KEY (`Id_Estado`) REFERENCES `tbl_estado` (`Id_Estado`),
  ADD CONSTRAINT `FK_Pers_Usuario` FOREIGN KEY (`Id_Empleado`) REFERENCES `tbl_personal` (`Id_Empleado`),
  ADD CONSTRAINT `FK_Rol_Usuario` FOREIGN KEY (`Id_Rol`) REFERENCES `tbl_roles` (`Id_Rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
