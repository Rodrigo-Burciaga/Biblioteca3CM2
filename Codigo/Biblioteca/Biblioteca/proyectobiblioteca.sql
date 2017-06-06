-- MySQL dump 10.13  Distrib 5.1.59, for Win64 (unknown)
--
-- Host: localhost    Database: proyectobiblioteca
-- ------------------------------------------------------
-- Server version	5.1.59-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audiovisual`
--

DROP TABLE IF EXISTS `audiovisual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiovisual` (
  `idAudioVisual` int(11) NOT NULL,
  `Elemento_idElemento` int(11) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Autor1` varchar(45) NOT NULL,
  `Autor2` varchar(45) DEFAULT NULL,
  `Autor3` varchar(45) DEFAULT NULL,
  `Autor 4` varchar(45) DEFAULT NULL,
  `FechaPub` varchar(45) NOT NULL,
  `Duracion` varchar(45) NOT NULL,
  `Audiovisual_tipoAudiovisual` int(11) NOT NULL,
  `Precio` double NOT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAudioVisual`),
  KEY `fk_AudioVisual_Elemento1_idx` (`Elemento_idElemento`),
  KEY `fk_AudioVisual_1_idx` (`Audiovisual_tipoAudiovisual`),
  CONSTRAINT `fk_AudioVisual_1` FOREIGN KEY (`Audiovisual_tipoAudiovisual`) REFERENCES `tipo_audiovisual` (`idTipoAudiovisual`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AudioVisual_Elemento1` FOREIGN KEY (`Elemento_idElemento`) REFERENCES `elemento` (`idElemento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiovisual`
--

LOCK TABLES `audiovisual` WRITE;
/*!40000 ALTER TABLE `audiovisual` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiovisual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonia`
--

DROP TABLE IF EXISTS `colonia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colonia` (
  `idColonia` int(11) NOT NULL,
  `CP_idCP` int(11) NOT NULL,
  `Delegacion_idDelegacion` int(11) NOT NULL,
  `NombreCol` varchar(45) NOT NULL,
  PRIMARY KEY (`idColonia`),
  KEY `fk_Colonia_CP1_idx` (`CP_idCP`),
  KEY `fk_Colonia_Delegacion1_idx` (`Delegacion_idDelegacion`),
  CONSTRAINT `fk_Colonia_CP1` FOREIGN KEY (`CP_idCP`) REFERENCES `cp` (`idCP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Colonia_Delegacion1` FOREIGN KEY (`Delegacion_idDelegacion`) REFERENCES `delegacion` (`idDelegacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonia`
--

LOCK TABLES `colonia` WRITE;
/*!40000 ALTER TABLE `colonia` DISABLE KEYS */;
/*!40000 ALTER TABLE `colonia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computo`
--

DROP TABLE IF EXISTS `computo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computo` (
  `idComputadora` int(11) NOT NULL,
  `noSerieMonitor` varchar(45) NOT NULL,
  `noSerieCpu` varchar(45) NOT NULL,
  `noSerieTeclado` varchar(45) NOT NULL,
  `noSerieMouse` varchar(45) NOT NULL,
  `PrecioCpu` double NOT NULL,
  `PrecioMonitor` varchar(45) NOT NULL,
  `PrecioMouse` varchar(45) NOT NULL,
  `PrecioTeclado` varchar(45) NOT NULL,
  `Elemento_idElemento` int(11) DEFAULT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComputadora`),
  KEY `fk_Computo_1_idx` (`Elemento_idElemento`),
  CONSTRAINT `fk_Computo_1` FOREIGN KEY (`Elemento_idElemento`) REFERENCES `elemento` (`idElemento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computo`
--

LOCK TABLES `computo` WRITE;
/*!40000 ALTER TABLE `computo` DISABLE KEYS */;
/*!40000 ALTER TABLE `computo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `idContacto` int(11) NOT NULL,
  `Colonia_idColonia` int(11) NOT NULL,
  `CalleNum` varchar(80) DEFAULT NULL,
  `TelCasa` varchar(45) DEFAULT NULL,
  `TelCelular` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idContacto`),
  KEY `fk_Contacto_Colonia1_idx` (`Colonia_idColonia`),
  CONSTRAINT `fk_Contacto_Colonia1` FOREIGN KEY (`Colonia_idColonia`) REFERENCES `colonia` (`idColonia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cp`
--

DROP TABLE IF EXISTS `cp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cp` (
  `idCP` int(11) NOT NULL,
  `CP` varchar(5) NOT NULL,
  PRIMARY KEY (`idCP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cp`
--

LOCK TABLES `cp` WRITE;
/*!40000 ALTER TABLE `cp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencial`
--

DROP TABLE IF EXISTS `credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credencial` (
  `idCredencial` int(11) NOT NULL,
  `Lector_idLector` int(11) NOT NULL,
  `FechaEmision` date NOT NULL,
  PRIMARY KEY (`idCredencial`),
  KEY `fk_Credencial_Lector1_idx` (`Lector_idLector`),
  CONSTRAINT `fk_Credencial_Lector1` FOREIGN KEY (`Lector_idLector`) REFERENCES `lector` (`idLector`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencial`
--

LOCK TABLES `credencial` WRITE;
/*!40000 ALTER TABLE `credencial` DISABLE KEYS */;
/*!40000 ALTER TABLE `credencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_presot`
--

DROP TABLE IF EXISTS `d_presot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_presot` (
  `idD_PresOt` int(11) NOT NULL,
  `Elemento_idElemento` int(11) NOT NULL,
  `PrestamoOtros_idPrestamoOtros` int(11) NOT NULL,
  PRIMARY KEY (`idD_PresOt`),
  KEY `fk_D_PresOt_Elemento1_idx` (`Elemento_idElemento`),
  KEY `fk_D_PresOt_PrestamoOtros1_idx` (`PrestamoOtros_idPrestamoOtros`),
  CONSTRAINT `fk_D_PresOt_Elemento1` FOREIGN KEY (`Elemento_idElemento`) REFERENCES `elemento` (`idElemento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_D_PresOt_PrestamoOtros1` FOREIGN KEY (`PrestamoOtros_idPrestamoOtros`) REFERENCES `prestamootros` (`idPrestamoOtros`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_presot`
--

LOCK TABLES `d_presot` WRITE;
/*!40000 ALTER TABLE `d_presot` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_presot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_prestamo`
--

DROP TABLE IF EXISTS `d_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_prestamo` (
  `idD_Prestamo` int(11) NOT NULL,
  `Ejemplar_idEjemplar` int(11) NOT NULL,
  `Prestamo_idPrestamo` int(11) NOT NULL,
  PRIMARY KEY (`idD_Prestamo`),
  KEY `fk_D_Prestamo_Ejemplar1_idx` (`Ejemplar_idEjemplar`),
  KEY `fk_D_Prestamo_Prestamo1_idx` (`Prestamo_idPrestamo`),
  CONSTRAINT `fk_D_Prestamo_Ejemplar1` FOREIGN KEY (`Ejemplar_idEjemplar`) REFERENCES `ejemplar` (`idEjemplar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_D_Prestamo_Prestamo1` FOREIGN KEY (`Prestamo_idPrestamo`) REFERENCES `prestamo` (`idPrestamo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_prestamo`
--

LOCK TABLES `d_prestamo` WRITE;
/*!40000 ALTER TABLE `d_prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosacademicos`
--

DROP TABLE IF EXISTS `datosacademicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosacademicos` (
  `idDatosAcademicos` int(11) NOT NULL,
  `Semestre` int(11) NOT NULL,
  `Turno` varchar(45) NOT NULL,
  `Estudiante_Boleta` varchar(45) NOT NULL,
  PRIMARY KEY (`idDatosAcademicos`),
  KEY `fk_DatosAcademicos_Estudiante1_idx` (`Estudiante_Boleta`),
  CONSTRAINT `fk_DatosAcademicos_Estudiante1` FOREIGN KEY (`Estudiante_Boleta`) REFERENCES `estudiante` (`Boleta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosacademicos`
--

LOCK TABLES `datosacademicos` WRITE;
/*!40000 ALTER TABLE `datosacademicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `datosacademicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegacion`
--

DROP TABLE IF EXISTS `delegacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegacion` (
  `idDelegacion` int(11) NOT NULL,
  `NombreDel` varchar(45) NOT NULL,
  PRIMARY KEY (`idDelegacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegacion`
--

LOCK TABLES `delegacion` WRITE;
/*!40000 ALTER TABLE `delegacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `delegacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmultaeje`
--

DROP TABLE IF EXISTS `dmultaeje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmultaeje` (
  `idDMultaEje` int(11) NOT NULL,
  `Ejemplar_idEjemplar` int(11) NOT NULL,
  `Multa_idMulta` int(11) NOT NULL,
  `TipoMulta_idTipoMulta` int(11) NOT NULL,
  PRIMARY KEY (`idDMultaEje`),
  KEY `fk_DMultaEje_Ejemplar1_idx` (`Ejemplar_idEjemplar`),
  KEY `fk_DMultaEje_Multa1_idx` (`Multa_idMulta`),
  KEY `fk_DMultaEje_TipoMulta1_idx` (`TipoMulta_idTipoMulta`),
  CONSTRAINT `fk_DMultaEje_Ejemplar1` FOREIGN KEY (`Ejemplar_idEjemplar`) REFERENCES `ejemplar` (`idEjemplar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DMultaEje_Multa1` FOREIGN KEY (`Multa_idMulta`) REFERENCES `multa` (`idMulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DMultaEje_TipoMulta1` FOREIGN KEY (`TipoMulta_idTipoMulta`) REFERENCES `tipomulta` (`idTipoMulta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmultaeje`
--

LOCK TABLES `dmultaeje` WRITE;
/*!40000 ALTER TABLE `dmultaeje` DISABLE KEYS */;
/*!40000 ALTER TABLE `dmultaeje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `NumEmpleado` varchar(45) NOT NULL,
  `Lector_idLector` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrimerAp` varchar(45) NOT NULL,
  `SegundoAp` varchar(45) NOT NULL,
  `FechaNac` date NOT NULL,
  `CURP` varchar(45) NOT NULL,
  PRIMARY KEY (`NumEmpleado`),
  KEY `fk_Docente_Lector1_idx` (`Lector_idLector`),
  CONSTRAINT `fk_Docente_Lector1` FOREIGN KEY (`Lector_idLector`) REFERENCES `lector` (`idLector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejemplar` (
  `idEjemplar` int(11) NOT NULL,
  `Disponibilidad` tinyint(4) NOT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  `Libro_ISBN_ID` varchar(45) NOT NULL,
  `EstadoLibro_idEdoLibro` int(11) NOT NULL,
  PRIMARY KEY (`idEjemplar`),
  KEY `fk_Ejemplar_Libro1_idx` (`Libro_ISBN_ID`),
  KEY `fk_Ejemplar_EstadoLibro1_idx` (`EstadoLibro_idEdoLibro`),
  CONSTRAINT `fk_Ejemplar_EstadoLibro1` FOREIGN KEY (`EstadoLibro_idEdoLibro`) REFERENCES `estadolibro` (`idEdoLibro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejemplar_Libro1` FOREIGN KEY (`Libro_ISBN_ID`) REFERENCES `libro` (`ISBN_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elemento`
--

DROP TABLE IF EXISTS `elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elemento` (
  `idElemento` int(11) NOT NULL,
  `EstadoElemnto_idEdoElemnto` int(11) NOT NULL,
  PRIMARY KEY (`idElemento`),
  KEY `fk_Elemento_EstadoElemnto1_idx` (`EstadoElemnto_idEdoElemnto`),
  CONSTRAINT `fk_Elemento_EstadoElemnto1` FOREIGN KEY (`EstadoElemnto_idEdoElemnto`) REFERENCES `estadoelemnto` (`idEdoElemnto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento`
--

LOCK TABLES `elemento` WRITE;
/*!40000 ALTER TABLE `elemento` DISABLE KEYS */;
/*!40000 ALTER TABLE `elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `Contacto_idContacto` int(11) NOT NULL,
  `RolEmpleado_idRolEmpleado` int(11) NOT NULL,
  `EstadoEmpleado_idEdoEmp` int(11) NOT NULL,
  `Usuario_Matricula` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrimerAp` varchar(45) NOT NULL,
  `SegundoAp` varchar(45) NOT NULL,
  `FechaAdmision` date NOT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `fk_Empleado_Contacto1_idx` (`Contacto_idContacto`),
  KEY `fk_Empleado_RolEmpleado1_idx` (`RolEmpleado_idRolEmpleado`),
  KEY `fk_Empleado_EstadoEmpleado1_idx` (`EstadoEmpleado_idEdoEmp`),
  KEY `fk_Empleado_Usuario1_idx` (`Usuario_Matricula`),
  CONSTRAINT `fk_Empleado_Contacto1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `contacto` (`idContacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_EstadoEmpleado1` FOREIGN KEY (`EstadoEmpleado_idEdoEmp`) REFERENCES `estadoempleado` (`idEdoEmp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_RolEmpleado1` FOREIGN KEY (`RolEmpleado_idRolEmpleado`) REFERENCES `rolempleado` (`idRolEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_Usuario1` FOREIGN KEY (`Usuario_Matricula`) REFERENCES `usuario` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuela` (
  `idEscuela` int(11) NOT NULL,
  `NombreEsc` varchar(45) NOT NULL,
  PRIMARY KEY (`idEscuela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoelemnto`
--

DROP TABLE IF EXISTS `estadoelemnto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoelemnto` (
  `idEdoElemnto` int(11) NOT NULL,
  `EdoElem` varchar(45) NOT NULL,
  PRIMARY KEY (`idEdoElemnto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoelemnto`
--

LOCK TABLES `estadoelemnto` WRITE;
/*!40000 ALTER TABLE `estadoelemnto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoelemnto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoempleado`
--

DROP TABLE IF EXISTS `estadoempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoempleado` (
  `idEdoEmp` int(11) NOT NULL,
  `EdoEmp` varchar(45) NOT NULL,
  PRIMARY KEY (`idEdoEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoempleado`
--

LOCK TABLES `estadoempleado` WRITE;
/*!40000 ALTER TABLE `estadoempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoestudiante`
--

DROP TABLE IF EXISTS `estadoestudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoestudiante` (
  `idEdoEst` int(11) NOT NULL,
  `EdoEst` varchar(45) NOT NULL,
  PRIMARY KEY (`idEdoEst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoestudiante`
--

LOCK TABLES `estadoestudiante` WRITE;
/*!40000 ALTER TABLE `estadoestudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoestudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadolibro`
--

DROP TABLE IF EXISTS `estadolibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadolibro` (
  `idEdoLibro` int(11) NOT NULL,
  `EdoLibro` varchar(45) NOT NULL,
  PRIMARY KEY (`idEdoLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadolibro`
--

LOCK TABLES `estadolibro` WRITE;
/*!40000 ALTER TABLE `estadolibro` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadolibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `Boleta` varchar(45) NOT NULL,
  `EstadoEstudiante_idEdoEst` int(11) NOT NULL,
  `Lector_idLector` int(11) NOT NULL,
  `TipoEstudiante_idTipoEs` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrimerApellido` varchar(45) NOT NULL,
  `SegundoApellido` varchar(45) NOT NULL,
  `CURP` varchar(45) NOT NULL,
  `FechaNac` varchar(45) NOT NULL,
  PRIMARY KEY (`Boleta`),
  KEY `fk_Estudiante_EstadoEstudiante1_idx` (`EstadoEstudiante_idEdoEst`),
  KEY `fk_Estudiante_Lector1_idx` (`Lector_idLector`),
  KEY `fk_Estudiante_TipoEstudiante1_idx` (`TipoEstudiante_idTipoEs`),
  CONSTRAINT `fk_Estudiante_EstadoEstudiante1` FOREIGN KEY (`EstadoEstudiante_idEdoEst`) REFERENCES `estadoestudiante` (`idEdoEst`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_Lector1` FOREIGN KEY (`Lector_idLector`) REFERENCES `lector` (`idLector`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Estudiante_TipoEstudiante1` FOREIGN KEY (`TipoEstudiante_idTipoEs`) REFERENCES `tipoestudiante` (`idTipoEs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lector`
--

DROP TABLE IF EXISTS `lector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lector` (
  `idLector` int(11) NOT NULL,
  `Contacto_idContacto` int(11) NOT NULL,
  `Usuario_Matricula` int(11) NOT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLector`),
  KEY `fk_Lector_Contacto1_idx` (`Contacto_idContacto`),
  KEY `fk_Lector_Usuario1_idx` (`Usuario_Matricula`),
  CONSTRAINT `fk_Lector_Contacto1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `contacto` (`idContacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Lector_Usuario1` FOREIGN KEY (`Usuario_Matricula`) REFERENCES `usuario` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lector`
--

LOCK TABLES `lector` WRITE;
/*!40000 ALTER TABLE `lector` DISABLE KEYS */;
/*!40000 ALTER TABLE `lector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro` (
  `ISBN_ID` varchar(45) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Autor1` varchar(45) NOT NULL,
  `Autor2` varchar(45) DEFAULT NULL,
  `Autor3` varchar(45) DEFAULT NULL,
  `Autor4` varchar(45) DEFAULT NULL,
  `Editorial` varchar(45) NOT NULL,
  `FechaPub` varchar(45) NOT NULL,
  `NoPags` int(11) NOT NULL,
  `Edicion` int(11) NOT NULL,
  `Precio` double NOT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ISBN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('123-123-001','Titanic','Diego','Efrain','Lopez','Orozco','ASdasd','20-12-2017',124,2,521.239990234375,0),('1234','Tiac','Di','TJRFTH','TYJFJ','TUYTYKAQUIOÑY','IUHILQ','20-15-2015',4,3,456.480010986328,0);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa`
--

DROP TABLE IF EXISTS `multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multa` (
  `idMulta` int(11) NOT NULL,
  `Monto` double NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaPago` date NOT NULL,
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`idMulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa`
--

LOCK TABLES `multa` WRITE;
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multaextarna`
--

DROP TABLE IF EXISTS `multaextarna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multaextarna` (
  `idMultaExtarna` int(11) NOT NULL AUTO_INCREMENT,
  `PrestamoExterno_idPrestamoExterno` int(11) NOT NULL,
  `Monto` double NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaPago` date NOT NULL,
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`idMultaExtarna`),
  KEY `fk_MultaExtarna_PrestamoExterno1_idx` (`PrestamoExterno_idPrestamoExterno`),
  CONSTRAINT `fk_MultaExtarna_PrestamoExterno1` FOREIGN KEY (`PrestamoExterno_idPrestamoExterno`) REFERENCES `prestamoexterno` (`idPrestamoExterno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multaextarna`
--

LOCK TABLES `multaextarna` WRITE;
/*!40000 ALTER TABLE `multaextarna` DISABLE KEYS */;
/*!40000 ALTER TABLE `multaextarna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamo` (
  `idPrestamo` int(11) NOT NULL,
  `Lector_idLector` int(11) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `EstadoPr` int(11) NOT NULL,
  PRIMARY KEY (`idPrestamo`),
  KEY `fk_Prestamo_Lector1_idx` (`Lector_idLector`),
  CONSTRAINT `fk_Prestamo_Lector1` FOREIGN KEY (`Lector_idLector`) REFERENCES `lector` (`idLector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamoexterno`
--

DROP TABLE IF EXISTS `prestamoexterno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamoexterno` (
  `idPrestamoExterno` int(11) NOT NULL,
  `Escuela_idEscuela` int(11) NOT NULL,
  `NombreP` varchar(45) NOT NULL,
  `PrimerApP` varchar(45) NOT NULL,
  `SegundoApP` varchar(45) NOT NULL,
  `Matricula` varchar(45) NOT NULL,
  `Ejemplar_idEjemplar` int(11) NOT NULL,
  PRIMARY KEY (`idPrestamoExterno`),
  KEY `fk_PrestamoExterno_Escuela1_idx` (`Escuela_idEscuela`),
  KEY `fk_PrestamoExterno_Ejemplar1_idx` (`Ejemplar_idEjemplar`),
  CONSTRAINT `fk_PrestamoExterno_Ejemplar1` FOREIGN KEY (`Ejemplar_idEjemplar`) REFERENCES `ejemplar` (`idEjemplar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PrestamoExterno_Escuela1` FOREIGN KEY (`Escuela_idEscuela`) REFERENCES `escuela` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamoexterno`
--

LOCK TABLES `prestamoexterno` WRITE;
/*!40000 ALTER TABLE `prestamoexterno` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamoexterno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamointer`
--

DROP TABLE IF EXISTS `prestamointer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamointer` (
  `idPrestamoInter` int(11) NOT NULL,
  `Escuela_idEscuela` int(11) NOT NULL,
  `Lector_idLector` int(11) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Autor` varchar(45) NOT NULL,
  `Edicion` varchar(45) NOT NULL,
  `Publicacion` int(11) NOT NULL,
  `Editorial` varchar(45) NOT NULL,
  `FechaPrestamo` date NOT NULL,
  PRIMARY KEY (`idPrestamoInter`),
  KEY `fk_PrestamoInter_Escuela1_idx` (`Escuela_idEscuela`),
  KEY `fk_PrestamoInter_Lector1_idx` (`Lector_idLector`),
  CONSTRAINT `fk_PrestamoInter_Escuela1` FOREIGN KEY (`Escuela_idEscuela`) REFERENCES `escuela` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PrestamoInter_Lector1` FOREIGN KEY (`Lector_idLector`) REFERENCES `lector` (`idLector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamointer`
--

LOCK TABLES `prestamointer` WRITE;
/*!40000 ALTER TABLE `prestamointer` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamointer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolempleado`
--

DROP TABLE IF EXISTS `rolempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolempleado` (
  `idRolEmpleado` int(11) NOT NULL,
  `RolEmp` varchar(45) NOT NULL,
  PRIMARY KEY (`idRolEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolempleado`
--

LOCK TABLES `rolempleado` WRITE;
/*!40000 ALTER TABLE `rolempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_audiovisual`
--

DROP TABLE IF EXISTS `tipo_audiovisual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_audiovisual` (
  `idTipoAudiovisual` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Libro_ISBNID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoAudiovisual`),
  KEY `fk_Tipo_Audiovisual_1_idx` (`Libro_ISBNID`),
  CONSTRAINT `fk_Tipo_Audiovisual_1` FOREIGN KEY (`Libro_ISBNID`) REFERENCES `libro` (`ISBN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_audiovisual`
--

LOCK TABLES `tipo_audiovisual` WRITE;
/*!40000 ALTER TABLE `tipo_audiovisual` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_audiovisual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoestudiante`
--

DROP TABLE IF EXISTS `tipoestudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoestudiante` (
  `idTipoEs` int(11) NOT NULL,
  `TipoEst` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoEs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoestudiante`
--

LOCK TABLES `tipoestudiante` WRITE;
/*!40000 ALTER TABLE `tipoestudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoestudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomulta`
--

DROP TABLE IF EXISTS `tipomulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomulta` (
  `idTipoMulta` int(11) NOT NULL,
  `Desc` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoMulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomulta`
--

LOCK TABLES `tipomulta` WRITE;
/*!40000 ALTER TABLE `tipomulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt` (
  `noTT` varchar(45) NOT NULL,
  `Elemento_idElemento` int(11) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `FechaPresent` date NOT NULL,
  `Autor1` varchar(95) NOT NULL,
  `Autor2` varchar(45) DEFAULT NULL,
  `Autor3` varchar(45) DEFAULT NULL,
  `Autor4` varchar(45) DEFAULT NULL,
  `Autor5` varchar(45) DEFAULT NULL,
  `Director1` varchar(45) NOT NULL,
  `Director 2` varchar(45) DEFAULT NULL,
  `EstadoBorrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`noTT`),
  KEY `fk_TT_Elemento1_idx` (`Elemento_idElemento`),
  CONSTRAINT `fk_TT_Elemento1` FOREIGN KEY (`Elemento_idElemento`) REFERENCES `elemento` (`idElemento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt`
--

LOCK TABLES `tt` WRITE;
/*!40000 ALTER TABLE `tt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `Matricula` int(11) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Tipo` int(11) NOT NULL,
  PRIMARY KEY (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-05 20:35:12
