--
-- DATABASE DUMP for SISFO Sekolah JIBAS 18.0 (01 Agustus 2019)
--
-- MySQL dump 10.13  Distrib 5.6.20, for Win32 (x86)
--
-- Host: localhost    Database: jbsakad
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Current Database: `jbsakad`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsakad` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsakad`;

--
-- Table structure for table `aktivitaskalender`
--

DROP TABLE IF EXISTS `aktivitaskalender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aktivitaskalender` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkalender` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggalawal` date NOT NULL DEFAULT '0000-00-00',
  `tanggalakhir` date NOT NULL DEFAULT '0000-00-00',
  `kegiatan` varchar(50) NOT NULL,
  `keterangan` text,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aktivitaskalender_kalenderakademik` (`idkalender`),
  KEY `IX_aktivitaskalender_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aktivitaskalender_kalenderakademik` FOREIGN KEY (`idkalender`) REFERENCES `kalenderakademik` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktivitaskalender`
--

LOCK TABLES `aktivitaskalender` WRITE;
/*!40000 ALTER TABLE `aktivitaskalender` DISABLE KEYS */;
/*!40000 ALTER TABLE `aktivitaskalender` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_aktivitaskalender BEFORE INSERT ON jbsakad.aktivitaskalender
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_aktivitaskalender BEFORE UPDATE ON jbsakad.aktivitaskalender
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_aktivitaskalender AFTER DELETE ON jbsakad.aktivitaskalender
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aktivitaskalender', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(45) NOT NULL,
  `klsakhir` int(10) unsigned NOT NULL,
  `tktakhir` int(10) unsigned NOT NULL,
  `tgllulus` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_alumni_siswa` (`nis`),
  KEY `FK_alumni_tingkat` (`tktakhir`),
  KEY `FK_alumni_kelas` (`klsakhir`),
  KEY `FK_alumni_departemen` (`departemen`),
  KEY `IX_alumni_ts` (`ts`,`issync`),
  CONSTRAINT `FK_alumni_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_alumni_kelas` FOREIGN KEY (`klsakhir`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_alumni_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alumni_tingkat` FOREIGN KEY (`tktakhir`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumni`
--

LOCK TABLES `alumni` WRITE;
/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angkatan`
--

DROP TABLE IF EXISTS `angkatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_angkatan_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angkatan`
--

LOCK TABLES `angkatan` WRITE;
/*!40000 ALTER TABLE `angkatan` DISABLE KEYS */;
INSERT INTO `angkatan` VALUES (19,'2008','SMA',1,'Sekedar contoh. Nama angkatan siswa yang ada di departemen sekolah. Biasanya angkatan ini bersesuaian dengan tahun penerimaan siswa baru. Ubah atau tambahkan data ini sesuai dengan nama angkatan siswa di sekolah.',NULL,NULL,NULL,'2010-03-02 03:06:17',11596,0);
/*!40000 ALTER TABLE `angkatan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_angkatan BEFORE INSERT ON jbsakad.angkatan
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_angkatan BEFORE UPDATE ON jbsakad.angkatan
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_angkatan AFTER DELETE ON jbsakad.angkatan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'angkatan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asalsekolah`
--

DROP TABLE IF EXISTS `asalsekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asalsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `sekolah` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sekolah`),
  UNIQUE KEY `UX_asalsekolah` (`replid`),
  KEY `FK_asalsekolah_departemen` (`departemen`),
  KEY `IX_asalsekolah_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asalsekolah`
--

LOCK TABLES `asalsekolah` WRITE;
/*!40000 ALTER TABLE `asalsekolah` DISABLE KEYS */;
INSERT INTO `asalsekolah` VALUES (31,'SDN','SDN Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',29807,0),(30,'SMAN','SMAN Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',48716,0),(21,'SMPN','SMP Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',23099,0);
/*!40000 ALTER TABLE `asalsekolah` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_asalsekolah BEFORE INSERT ON jbsakad.asalsekolah
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_asalsekolah BEFORE UPDATE ON jbsakad.asalsekolah
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_asalsekolah AFTER DELETE ON jbsakad.asalsekolah
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'asalsekolah', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aturangrading`
--

DROP TABLE IF EXISTS `aturangrading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aturangrading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(30) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) NOT NULL,
  `nmin` decimal(6,1) NOT NULL,
  `nmax` decimal(6,1) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aturangrading_pegawai` (`nipguru`),
  KEY `FK_aturangrading_tingkat` (`idtingkat`),
  KEY `FK_aturangrading_pelajaran` (`idpelajaran`),
  KEY `FK_aturangrading_dasarpenilaian` (`dasarpenilaian`),
  KEY `IX_aturangrading_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aturangrading_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturangrading_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturangrading_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturangrading_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aturangrading`
--

LOCK TABLES `aturangrading` WRITE;
/*!40000 ALTER TABLE `aturangrading` DISABLE KEYS */;
INSERT INTO `aturangrading` VALUES (207,'101',26,45,'Praktik',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',34878,0),(208,'101',26,45,'Praktik',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',39560,0),(209,'101',26,45,'Praktik',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',27637,0),(210,'101',26,45,'Praktik',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',19503,0),(211,'101',26,45,'Praktik',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',14603,0),(217,'101',27,45,'Pemahaman Konsep',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',14507,0),(218,'101',27,45,'Pemahaman Konsep',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',28724,0),(219,'101',27,45,'Pemahaman Konsep',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',34571,0),(220,'101',27,45,'Pemahaman Konsep',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',21151,0),(221,'101',27,45,'Pemahaman Konsep',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',2041,0),(222,'101',27,45,'Praktik',70.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',12283,0),(223,'101',27,45,'Praktik',50.0,69.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',55290,0),(224,'101',27,45,'Praktik',40.0,49.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',43011,0),(225,'101',27,45,'Praktik',30.0,39.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',49186,0),(226,'101',27,45,'Praktik',0.0,29.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',51364,0),(227,'101',28,45,'Pemahaman Konsep',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',43731,0),(228,'101',28,45,'Pemahaman Konsep',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',64565,0),(229,'101',28,45,'Pemahaman Konsep',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',60569,0),(230,'101',28,45,'Pemahaman Konsep',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',43622,0),(231,'101',28,45,'Pemahaman Konsep',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',36402,0),(242,'101',28,45,'Praktik',70.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',51145,0),(243,'101',28,45,'Praktik',50.0,69.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',15456,0),(244,'101',28,45,'Praktik',40.0,49.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',54904,0),(245,'101',28,45,'Praktik',30.0,39.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',31562,0),(246,'101',28,45,'Praktik',0.0,29.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',58628,0),(252,'101',26,45,'Pemahaman Konsep',75.0,100.0,'A',NULL,NULL,NULL,'2010-03-02 03:06:17',1865,0),(253,'101',26,45,'Pemahaman Konsep',60.0,74.9,'B',NULL,NULL,NULL,'2010-03-02 03:06:17',30031,0),(254,'101',26,45,'Pemahaman Konsep',50.0,59.9,'C',NULL,NULL,NULL,'2010-03-02 03:06:17',13500,0),(255,'101',26,45,'Pemahaman Konsep',40.0,49.9,'D',NULL,NULL,NULL,'2010-03-02 03:06:17',42936,0),(256,'101',26,45,'Pemahaman Konsep',0.0,39.9,'E',NULL,NULL,NULL,'2010-03-02 03:06:17',43118,0);
/*!40000 ALTER TABLE `aturangrading` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_aturangrading BEFORE INSERT ON jbsakad.aturangrading
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_aturangrading BEFORE UPDATE ON jbsakad.aturangrading
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_aturangrading AFTER DELETE ON jbsakad.aturangrading
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aturangrading', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aturannhb`
--

DROP TABLE IF EXISTS `aturannhb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aturannhb` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(30) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) NOT NULL,
  `idjenisujian` int(10) unsigned NOT NULL,
  `bobot` tinyint(3) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aturannhb_jenisujian` (`idjenisujian`),
  KEY `FK_aturannhb_dasarpenilaian` (`dasarpenilaian`),
  KEY `FK_aturannhb_pelajaran` (`idpelajaran`),
  KEY `FK_aturannhb_tingkat` (`idtingkat`),
  KEY `FK_aturannhb_pegawai` (`nipguru`),
  KEY `IX_aturannhb_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aturannhb_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_jenisujian` FOREIGN KEY (`idjenisujian`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aturannhb_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aturannhb`
--

LOCK TABLES `aturannhb` WRITE;
/*!40000 ALTER TABLE `aturannhb` DISABLE KEYS */;
INSERT INTO `aturannhb` VALUES (203,'101',26,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',42437,0),(214,'101',27,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',55114,0),(222,'101',28,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 03:06:17',5132,0);
/*!40000 ALTER TABLE `aturannhb` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_aturannhb BEFORE INSERT ON jbsakad.aturannhb
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_aturannhb BEFORE UPDATE ON jbsakad.aturannhb
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_aturannhb AFTER DELETE ON jbsakad.aturannhb
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aturannhb', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditnilai`
--

DROP TABLE IF EXISTS `auditnilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenisnilai` varchar(45) NOT NULL,
  `idnilai` int(10) unsigned NOT NULL,
  `nasli` decimal(10,2) NOT NULL,
  `nubah` decimal(10,2) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alasan` varchar(255) NOT NULL,
  `pengguna` varchar(100) NOT NULL,
  `informasi` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditnilai`
--

LOCK TABLES `auditnilai` WRITE;
/*!40000 ALTER TABLE `auditnilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditnilai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bobotnau`
--

DROP TABLE IF EXISTS `bobotnau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobotnau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idinfo` int(10) unsigned DEFAULT NULL,
  `idujian` int(10) unsigned NOT NULL,
  `bobot` int(10) unsigned NOT NULL DEFAULT '0',
  `idaturan` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_bobotnau_infobobot` (`idinfo`),
  KEY `FK_bobotnau_ujian` (`idujian`),
  KEY `IX_bobotnau_ts` (`ts`,`issync`),
  CONSTRAINT `FK_bobotnau_infobobot` FOREIGN KEY (`idinfo`) REFERENCES `infobobotnau` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bobotnau_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bobotnau`
--

LOCK TABLES `bobotnau` WRITE;
/*!40000 ALTER TABLE `bobotnau` DISABLE KEYS */;
/*!40000 ALTER TABLE `bobotnau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calonsiswa`
--

DROP TABLE IF EXISTS `calonsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `noun` varchar(50) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `suku` varchar(20) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `kondisi` varchar(100) DEFAULT NULL,
  `kelamin` varchar(1) DEFAULT NULL,
  `tmplahir` varchar(50) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `statusanak` varchar(10) DEFAULT NULL,
  `jkandung` tinyint(2) unsigned DEFAULT '0',
  `jtiri` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(30) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` blob,
  `pinsiswa` varchar(25) NOT NULL,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `jarak` tinyint(1) unsigned DEFAULT '0',
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(150) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `noijasah` varchar(25) DEFAULT NULL,
  `tglijasah` varchar(25) DEFAULT NULL,
  `ketsekolah` varchar(100) DEFAULT NULL,
  `namaayah` varchar(60) DEFAULT NULL,
  `namaibu` varchar(60) DEFAULT NULL,
  `statusayah` varchar(10) DEFAULT NULL,
  `statusibu` varchar(10) DEFAULT NULL,
  `tmplahirayah` varchar(35) DEFAULT NULL,
  `tmplahiribu` varchar(35) DEFAULT NULL,
  `tgllahirayah` varchar(35) DEFAULT NULL,
  `tgllahiribu` varchar(35) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(60) DEFAULT NULL,
  `pekerjaanibu` varchar(60) DEFAULT NULL,
  `wali` varchar(60) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `hobi` text,
  `replidsiswa` int(10) unsigned DEFAULT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `sum1` decimal(10,0) NOT NULL DEFAULT '0',
  `sum2` decimal(10,0) NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian4` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian5` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian6` decimal(5,2) NOT NULL,
  `ujian7` decimal(5,2) NOT NULL,
  `ujian8` decimal(5,2) NOT NULL,
  `ujian9` decimal(5,2) NOT NULL,
  `ujian10` decimal(5,2) NOT NULL,
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nopendaftaran`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_prosespenerimaansiswa` (`idproses`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`idkelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_asalsekolah` (`asalsekolah`),
  KEY `FK_calonsiswa_tingkatpendidikan` (`pendidikanayah`),
  KEY `FK_calonsiswa_jenispekerjaan` (`pekerjaanayah`),
  KEY `FK_calonsiswa_tingkatpendidikanibu` (`pendidikanibu`),
  KEY `FK_calonsiswa_jenispekerjaanibu` (`pekerjaanibu`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`),
  KEY `IX_calonsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_calonsiswa_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_asalsekolah` FOREIGN KEY (`asalsekolah`) REFERENCES `asalsekolah` (`sekolah`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_jenispekerjaan` FOREIGN KEY (`pekerjaanayah`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_jenispekerjaanibu` FOREIGN KEY (`pekerjaanibu`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_kelompokcalonsiswa` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokcalonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_kondisisiswa` FOREIGN KEY (`kondisi`) REFERENCES `kondisisiswa` (`kondisi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_prosespenerimaansiswa` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_statussiswa` FOREIGN KEY (`status`) REFERENCES `statussiswa` (`status`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_tingkatpendidikan` FOREIGN KEY (`pendidikanayah`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_calonsiswa_tingkatpendidikanibu` FOREIGN KEY (`pendidikanibu`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 196608 kB; (`pendidikanibu`) REFER `jbsumum/tin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calonsiswa`
--

LOCK TABLES `calonsiswa` WRITE;
/*!40000 ALTER TABLE `calonsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `calonsiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_calonsiswa BEFORE INSERT ON jbsakad.calonsiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_calonsiswa BEFORE UPDATE ON jbsakad.calonsiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_calonsiswa AFTER DELETE ON jbsakad.calonsiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'calonsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dasarpenilaian`
--

DROP TABLE IF EXISTS `dasarpenilaian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dasarpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dasarpenilaian` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dasarpenilaian`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dasarpenilaian`
--

LOCK TABLES `dasarpenilaian` WRITE;
/*!40000 ALTER TABLE `dasarpenilaian` DISABLE KEYS */;
INSERT INTO `dasarpenilaian` VALUES (3,'PKON','Pemahaman Konsep',NULL,NULL,NULL,'2010-03-02 03:06:17',50529,0),(4,'PRAK','Praktik',NULL,NULL,NULL,'2010-03-02 03:06:17',24109,0);
/*!40000 ALTER TABLE `dasarpenilaian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_dasarpenilaian BEFORE INSERT ON jbsakad.dasarpenilaian
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_dasarpenilaian BEFORE UPDATE ON jbsakad.dasarpenilaian
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_dasarpenilaian AFTER DELETE ON jbsakad.dasarpenilaian
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'dasarpenilaian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `deleteddata`
--

DROP TABLE IF EXISTS `deleteddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleteddata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) NOT NULL,
  `rowid` bigint(20) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_deleteddata_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleteddata`
--

LOCK TABLES `deleteddata` WRITE;
/*!40000 ALTER TABLE `deleteddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departemen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nipkepsek` varchar(30) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`departemen`),
  UNIQUE KEY `UX_departemen_replid` (`replid`),
  KEY `FK_departemen_pegawai` (`nipkepsek`),
  KEY `IX_departemen_ts` (`ts`,`issync`),
  CONSTRAINT `FK_departemen_pegawai` FOREIGN KEY (`nipkepsek`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departemen`
--

LOCK TABLES `departemen` WRITE;
/*!40000 ALTER TABLE `departemen` DISABLE KEYS */;
INSERT INTO `departemen` VALUES (11,'SMA','101',1,'Sekedar contoh. Menu ini mengatur departemen-departemen yang ada di sekolah. Ubah atau tambahkan data ini sesuai dengan departemen yang ada di sekolah anda.',1,NULL,NULL,NULL,'2010-03-02 03:06:17',34486,0);
/*!40000 ALTER TABLE `departemen` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_departemen BEFORE INSERT ON jbsakad.departemen
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_departemen BEFORE UPDATE ON jbsakad.departemen
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_departemen AFTER DELETE ON jbsakad.departemen
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'departemen', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guru`
--

DROP TABLE IF EXISTS `guru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `statusguru` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`nip`),
  KEY `FK_guru_pelajaran` (`idpelajaran`),
  KEY `FK_guru_statusguru` (`statusguru`),
  KEY `IX_guru_ts` (`ts`,`issync`),
  CONSTRAINT `FK_guru_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_guru_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_guru_statusguru` FOREIGN KEY (`statusguru`) REFERENCES `statusguru` (`status`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guru`
--

LOCK TABLES `guru` WRITE;
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` VALUES (44,'101',45,'Guru Pelajaran',1,'',NULL,NULL,NULL,'2010-03-02 03:06:17',34572,0);
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_guru BEFORE INSERT ON jbsakad.guru
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_guru BEFORE UPDATE ON jbsakad.guru
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_guru AFTER DELETE ON jbsakad.guru
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'guru', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `infobobotnau`
--

DROP TABLE IF EXISTS `infobobotnau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobobotnau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobobotnau_ujian` (`idujian`),
  KEY `IX_infobobotnau_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infobobotnau_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobobotnau`
--

LOCK TABLES `infobobotnau` WRITE;
/*!40000 ALTER TABLE `infobobotnau` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobobotnau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infobobotujian`
--

DROP TABLE IF EXISTS `infobobotujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infobobotujian` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenisujian` int(10) unsigned NOT NULL DEFAULT '0',
  `pilihan` tinyint(4) NOT NULL DEFAULT '0',
  `info` varchar(100) NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobobotujian_idpelajaran` (`idpelajaran`),
  KEY `FK_infobobotujian_idsemester` (`idsemester`),
  KEY `FK_infobobotujian_idjenis` (`idjenisujian`),
  KEY `FK_infobobotujian_kelas` (`idkelas`),
  KEY `IX_infobobotujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infobobotujian_idjenis` FOREIGN KEY (`idjenisujian`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_infobobotujian_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_infobobotujian_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_infobobotujian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infobobotujian`
--

LOCK TABLES `infobobotujian` WRITE;
/*!40000 ALTER TABLE `infobobotujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobobotujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infojadwal`
--

DROP TABLE IF EXISTS `infojadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infojadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(100) NOT NULL DEFAULT '',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `terlihat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infojadwal_tahunajaran` (`idtahunajaran`),
  KEY `IX_infojadwal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infojadwal_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infojadwal`
--

LOCK TABLES `infojadwal` WRITE;
/*!40000 ALTER TABLE `infojadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `infojadwal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_infojadwal BEFORE INSERT ON jbsakad.infojadwal
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_infojadwal BEFORE UPDATE ON jbsakad.infojadwal
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_infojadwal AFTER DELETE ON jbsakad.infojadwal
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'infojadwal', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `infonap`
--

DROP TABLE IF EXISTS `infonap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infonap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaimin` decimal(5,2) NOT NULL DEFAULT '0.00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infonap_pelajaran` (`idpelajaran`),
  KEY `FK_infonap_semester` (`idsemester`),
  KEY `FK_infonap_kelas` (`idkelas`),
  KEY `IX_infonap_ts` (`ts`,`issync`),
  CONSTRAINT `FK_infonap_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_infonap_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_infonap_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infonap`
--

LOCK TABLES `infonap` WRITE;
/*!40000 ALTER TABLE `infonap` DISABLE KEYS */;
/*!40000 ALTER TABLE `infonap` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_infonap BEFORE INSERT ON jbsakad.infonap
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_infonap BEFORE UPDATE ON jbsakad.infonap
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_infonap AFTER DELETE ON jbsakad.infonap
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'infonap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nipguru` varchar(30) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL DEFAULT '',
  `infojadwal` int(10) unsigned NOT NULL DEFAULT '0',
  `hari` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jamke` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `njam` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sifat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `jam1` time NOT NULL DEFAULT '00:00:00',
  `jam2` time NOT NULL DEFAULT '00:00:00',
  `idjam1` int(10) unsigned NOT NULL DEFAULT '0',
  `idjam2` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jadwal_departemen` (`departemen`),
  KEY `FK_jadwal_pegawai` (`nipguru`),
  KEY `FK_jadwal_jam1` (`idjam1`),
  KEY `FK_jadwal_jam2` (`idjam2`),
  KEY `FK_jadwal_infojadwal` (`infojadwal`),
  KEY `FK_jadwal_pelajaran` (`idpelajaran`),
  KEY `FK_jadwal_kelas` (`idkelas`),
  KEY `IX_jadwal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jadwal_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_infojadwal` FOREIGN KEY (`infojadwal`) REFERENCES `infojadwal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_jam` FOREIGN KEY (`idjam1`) REFERENCES `jam` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_jam2` FOREIGN KEY (`idjam2`) REFERENCES `jam` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jadwal BEFORE INSERT ON jbsakad.jadwal
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jadwal BEFORE UPDATE ON jbsakad.jadwal
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jadwal AFTER DELETE ON jbsakad.jadwal
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jadwal', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jam`
--

DROP TABLE IF EXISTS `jam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jamke` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL DEFAULT '',
  `jam1` time NOT NULL DEFAULT '00:00:00',
  `jam2` time NOT NULL DEFAULT '00:00:00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jam_departemen` (`departemen`),
  KEY `IX_jam_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jam_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jam`
--

LOCK TABLES `jam` WRITE;
/*!40000 ALTER TABLE `jam` DISABLE KEYS */;
INSERT INTO `jam` VALUES (34,1,'SMA','06:30:00','08:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',52283,0),(35,2,'SMA','08:00:00','09:30:00',NULL,NULL,NULL,'2010-03-02 03:06:17',40376,0),(36,3,'SMA','09:30:00','10:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',45031,0),(37,4,'SMA','10:30:00','12:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',38498,0),(38,5,'SMA','12:00:00','13:30:00',NULL,NULL,NULL,'2010-03-02 03:06:17',57397,0),(39,6,'SMA','13:30:00','15:00:00',NULL,NULL,NULL,'2010-03-02 03:06:17',40428,0);
/*!40000 ALTER TABLE `jam` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jam BEFORE INSERT ON jbsakad.jam
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jam BEFORE UPDATE ON jbsakad.jam
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jam AFTER DELETE ON jbsakad.jam
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jam', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jenismutasi`
--

DROP TABLE IF EXISTS `jenismutasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenismutasi` varchar(45) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jenismutasi_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenismutasi`
--

LOCK TABLES `jenismutasi` WRITE;
/*!40000 ALTER TABLE `jenismutasi` DISABLE KEYS */;
INSERT INTO `jenismutasi` VALUES (2,'Pindah Sekolah','',NULL,NULL,NULL,'2010-03-02 03:06:17',29948,0),(3,'Dikeluarkan','Sekedar contoh. Menu ini mengatur jenis-jenis mutasi siswa. Ubah atau tambahkan data ini sesuai dengan jenis-jenis mutasi siswa yang terjadi.',NULL,NULL,NULL,'2010-03-02 03:06:17',28455,0),(4,'Mengundurkan Diri','',NULL,NULL,NULL,'2010-03-02 03:06:17',52431,0),(5,'Meninggal Dunia','',NULL,NULL,NULL,'2010-03-02 03:06:17',45730,0),(6,'Pindah Tempat Tinggal','',NULL,NULL,NULL,'2010-03-02 03:06:17',5828,0);
/*!40000 ALTER TABLE `jenismutasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenisujian`
--

DROP TABLE IF EXISTS `jenisujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenisujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenisujian` varchar(50) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jenisujian_pelajaran` (`idpelajaran`),
  KEY `IX_jenisujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jenisujian_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisujian`
--

LOCK TABLES `jenisujian` WRITE;
/*!40000 ALTER TABLE `jenisujian` DISABLE KEYS */;
INSERT INTO `jenisujian` VALUES (108,'PR',45,'Sekedar contoh. Menu ini mengatur jenis-jenis ujian untuk pengambilan nilai siswa pada setiap pelajaran di sekolah. Ubah atau tambahkan data ini sesuai dengan jenis-jenis ujian yang digunakan di sekolah.','PR',NULL,NULL,'2010-04-16 01:55:23',32036,0);
/*!40000 ALTER TABLE `jenisujian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jenisujian BEFORE INSERT ON jbsakad.jenisujian
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jenisujian BEFORE UPDATE ON jbsakad.jenisujian
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jenisujian AFTER DELETE ON jbsakad.jenisujian
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jenisujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kalenderakademik`
--

DROP TABLE IF EXISTS `kalenderakademik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kalenderakademik` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kalender` varchar(50) NOT NULL DEFAULT '',
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terlihat` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `idtahunajaran` int(10) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kalenderakademik_tahunajaran` (`idtahunajaran`),
  KEY `FK_kalenderakademik_departemen` (`departemen`),
  KEY `IX_kalenderakademik_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kalenderakademik_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kalenderakademik_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kalenderakademik`
--

LOCK TABLES `kalenderakademik` WRITE;
/*!40000 ALTER TABLE `kalenderakademik` DISABLE KEYS */;
/*!40000 ALTER TABLE `kalenderakademik` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kalenderakademik BEFORE INSERT ON jbsakad.kalenderakademik
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kalenderakademik BEFORE UPDATE ON jbsakad.kalenderakademik
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kalenderakademik AFTER DELETE ON jbsakad.kalenderakademik
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kalenderakademik', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kejadianpenting`
--

DROP TABLE IF EXISTS `kejadianpenting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kejadianpenting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(15) NOT NULL DEFAULT '',
  `nip` varchar(15) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `kejadian` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_kejadianpenting_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kejadianpenting`
--

LOCK TABLES `kejadianpenting` WRITE;
/*!40000 ALTER TABLE `kejadianpenting` DISABLE KEYS */;
/*!40000 ALTER TABLE `kejadianpenting` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kejadianpenting BEFORE INSERT ON jbsakad.kejadianpenting
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kejadianpenting BEFORE UPDATE ON jbsakad.kejadianpenting
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kejadianpenting AFTER DELETE ON jbsakad.kejadianpenting
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kejadianpenting', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(50) NOT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `nipwali` varchar(30) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelas_pegawai` (`nipwali`),
  KEY `FK_kelas_tahunajaran` (`idtahunajaran`),
  KEY `FK_kelas_tingkat` (`idtingkat`),
  KEY `IX_kelas_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kelas_pegawai` FOREIGN KEY (`nipwali`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kelas_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kelas_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (46,'1-A',20,50,'101',1,'Sekedar contoh. Menu ini mengatur setiap nama kelas yang ada di setiap tingkatan di sekolah. Ubah atau tambahkan data ini sesuai dengan nama-nama kelas di sekolah.',26,NULL,NULL,NULL,'2010-03-02 03:06:17',17056,0);
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kelas BEFORE INSERT ON jbsakad.kelas
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kelas BEFORE UPDATE ON jbsakad.kelas
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kelas AFTER DELETE ON jbsakad.kelas
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kelas', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kelompokcalonsiswa`
--

DROP TABLE IF EXISTS `kelompokcalonsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokcalonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`idproses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kelompokcalonsiswa_prosespenerimaansiswa` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokcalonsiswa`
--

LOCK TABLES `kelompokcalonsiswa` WRITE;
/*!40000 ALTER TABLE `kelompokcalonsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokcalonsiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kelompokcalonsiswa BEFORE INSERT ON jbsakad.kelompokcalonsiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kelompokcalonsiswa BEFORE UPDATE ON jbsakad.kelompokcalonsiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kelompokcalonsiswa AFTER DELETE ON jbsakad.kelompokcalonsiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kelompokcalonsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kelompokpelajaran`
--

DROP TABLE IF EXISTS `kelompokpelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokpelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) NOT NULL,
  `kelompok` varchar(45) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokpelajaran`
--

LOCK TABLES `kelompokpelajaran` WRITE;
/*!40000 ALTER TABLE `kelompokpelajaran` DISABLE KEYS */;
INSERT INTO `kelompokpelajaran` VALUES (1,'KP','Kelompok Pelajaran',1);
/*!40000 ALTER TABLE `kelompokpelajaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komennap`
--

DROP TABLE IF EXISTS `komennap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komennap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `komentar` text NOT NULL,
  `predikat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_komennap_infonap` (`idinfo`),
  KEY `FK_komennap_siswa` (`nis`),
  KEY `IX_komennap_ts` (`ts`,`issync`),
  CONSTRAINT `FK_komennap_infonap` FOREIGN KEY (`idinfo`) REFERENCES `infonap` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_komennap_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komennap`
--

LOCK TABLES `komennap` WRITE;
/*!40000 ALTER TABLE `komennap` DISABLE KEYS */;
/*!40000 ALTER TABLE `komennap` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_komennap BEFORE INSERT ON jbsakad.komennap
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_komennap BEFORE UPDATE ON jbsakad.komennap
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_komennap AFTER DELETE ON jbsakad.komennap
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'komennap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `komenrapor`
--

DROP TABLE IF EXISTS `komenrapor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komenrapor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `jenis` varchar(3) NOT NULL,
  `komentar` text NOT NULL,
  `predikat` tinyint(1) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_komenrapor_siswa` (`nis`),
  KEY `FK_komenrapor_kelas` (`idkelas`),
  KEY `FK_komenrapor_semester` (`idsemester`),
  CONSTRAINT `FK_komenrapor_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_komenrapor_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_komenrapor_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komenrapor`
--

LOCK TABLES `komenrapor` WRITE;
/*!40000 ALTER TABLE `komenrapor` DISABLE KEYS */;
/*!40000 ALTER TABLE `komenrapor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kondisisiswa`
--

DROP TABLE IF EXISTS `kondisisiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kondisi`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`),
  KEY `IX_kondisisiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kondisisiswa`
--

LOCK TABLES `kondisisiswa` WRITE;
/*!40000 ALTER TABLE `kondisisiswa` DISABLE KEYS */;
INSERT INTO `kondisisiswa` VALUES (8,'Berkecukupan',1,NULL,NULL,NULL,'2010-03-02 03:06:17',30009,0),(9,'Kurang Mampu',2,NULL,NULL,NULL,'2010-03-02 03:06:17',54640,0);
/*!40000 ALTER TABLE `kondisisiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kondisisiswa BEFORE INSERT ON jbsakad.kondisisiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kondisisiswa BEFORE UPDATE ON jbsakad.kondisisiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kondisisiswa AFTER DELETE ON jbsakad.kondisisiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kondisisiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kriteriakejadian`
--

DROP TABLE IF EXISTS `kriteriakejadian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kriteriakejadian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(50) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_kriteriakejadian_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kriteriakejadian`
--

LOCK TABLES `kriteriakejadian` WRITE;
/*!40000 ALTER TABLE `kriteriakejadian` DISABLE KEYS */;
/*!40000 ALTER TABLE `kriteriakejadian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kriteriakejadian BEFORE INSERT ON jbsakad.kriteriakejadian
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kriteriakejadian BEFORE UPDATE ON jbsakad.kriteriakejadian
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kriteriakejadian AFTER DELETE ON jbsakad.kriteriakejadian
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kriteriakejadian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mutasisiswa`
--

DROP TABLE IF EXISTS `mutasisiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutasisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `jenismutasi` int(10) unsigned NOT NULL DEFAULT '0',
  `tglmutasi` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_mutasisiswa_jenismutasi` (`jenismutasi`),
  KEY `FK_mutasisiswa_siswa` (`nis`),
  KEY `FK_mutasisiswa_departemen` (`departemen`),
  KEY `IX_mutasisiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_mutasisiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_mutasisiswa_jenismutasi` FOREIGN KEY (`jenismutasi`) REFERENCES `jenismutasi` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_mutasisiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutasisiswa`
--

LOCK TABLES `mutasisiswa` WRITE;
/*!40000 ALTER TABLE `mutasisiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutasisiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nap`
--

DROP TABLE IF EXISTS `nap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL DEFAULT '',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiangka` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nilaihuruf` varchar(2) NOT NULL DEFAULT '',
  `komentar` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nap_infonap` (`idinfo`),
  KEY `FK_nap_siswa` (`nis`),
  KEY `FK_nap_aturannhb` (`idaturan`),
  KEY `IX_nap_ts` (`ts`,`issync`),
  CONSTRAINT `FK_nap_aturannhb` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nap_infonap` FOREIGN KEY (`idinfo`) REFERENCES `infonap` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nap_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nap`
--

LOCK TABLES `nap` WRITE;
/*!40000 ALTER TABLE `nap` DISABLE KEYS */;
/*!40000 ALTER TABLE `nap` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_nap BEFORE INSERT ON jbsakad.nap
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_nap BEFORE UPDATE ON jbsakad.nap
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_nap AFTER DELETE ON jbsakad.nap
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nau`
--

DROP TABLE IF EXISTS `nau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiAU` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nau_idpelajaran` (`idpelajaran`),
  KEY `FK_nau_nis` (`nis`),
  KEY `FK_nau_idsemester` (`idsemester`),
  KEY `FK_nau_idjenis` (`idjenis`),
  KEY `FK_nau_idaturan` (`idaturan`),
  KEY `FK_nau_kelas` (`idkelas`),
  KEY `IX_nau_ts` (`ts`,`issync`),
  CONSTRAINT `FK_nau_idaturan` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_idjenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nau_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nau`
--

LOCK TABLES `nau` WRITE;
/*!40000 ALTER TABLE `nau` DISABLE KEYS */;
/*!40000 ALTER TABLE `nau` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_nau BEFORE INSERT ON jbsakad.nau
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_nau BEFORE UPDATE ON jbsakad.nau
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_nau AFTER DELETE ON jbsakad.nau
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nau', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nilaiujian`
--

DROP TABLE IF EXISTS `nilaiujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilaiujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `nilaiujian` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nilaiujian_idujian` (`idujian`),
  KEY `FK_nilaiujian_nis` (`nis`),
  KEY `IX_nilaiujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_nilaiujian_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_nilaiujian_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilaiujian`
--

LOCK TABLES `nilaiujian` WRITE;
/*!40000 ALTER TABLE `nilaiujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `nilaiujian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_nilaiujian BEFORE INSERT ON jbsakad.nilaiujian
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_nilaiujian BEFORE UPDATE ON jbsakad.nilaiujian
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_nilaiujian AFTER DELETE ON jbsakad.nilaiujian
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nilaiujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pelajaran`
--

DROP TABLE IF EXISTS `pelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `sifat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_daftarpelajaran_kode` (`kode`),
  KEY `FK_pelajaran_departemen` (`departemen`),
  KEY `IX_pelajaran_ts` (`ts`,`issync`),
  KEY `FK_pelajaran_kelompokpelajaran` (`idkelompok`),
  CONSTRAINT `FK_pelajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pelajaran_kelompokpelajaran` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelajaran`
--

LOCK TABLES `pelajaran` WRITE;
/*!40000 ALTER TABLE `pelajaran` DISABLE KEYS */;
INSERT INTO `pelajaran` VALUES (45,'FIS','Fisika','SMA',1,1,1,'Sekedar contoh. Menu ini mengatur nama dan kode pelajaran yang diajarkan di sekolah. Ubah atau tambahkan data ini sesuai dengan pelajaran-pelajaran yang ada di sekolah.',NULL,NULL,NULL,'2018-04-02 04:16:10',52115,0);
/*!40000 ALTER TABLE `pelajaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pelajaran BEFORE INSERT ON jbsakad.pelajaran
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pelajaran BEFORE UPDATE ON jbsakad.pelajaran
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pelajaran AFTER DELETE ON jbsakad.pelajaran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'pelajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `phsiswa`
--

DROP TABLE IF EXISTS `phsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpresensi` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `hadir` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ijin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sakit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cuti` smallint(5) unsigned NOT NULL DEFAULT '0',
  `alpa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_phsiswa_siswa` (`nis`),
  KEY `FK_phsiswa_presensiharian` (`idpresensi`),
  KEY `IX_phsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_phsiswa_presensiharian` FOREIGN KEY (`idpresensi`) REFERENCES `presensiharian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_phsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phsiswa`
--

LOCK TABLES `phsiswa` WRITE;
/*!40000 ALTER TABLE `phsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `phsiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_phsiswa BEFORE INSERT ON jbsakad.phsiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_phsiswa BEFORE UPDATE ON jbsakad.phsiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_phsiswa AFTER DELETE ON jbsakad.phsiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'phsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pilihandata`
--

DROP TABLE IF EXISTS `pilihandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtambahan` int(10) unsigned NOT NULL,
  `pilihan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihandata_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_pilihandata_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihandata`
--

LOCK TABLES `pilihandata` WRITE;
/*!40000 ALTER TABLE `pilihandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihkomenpel`
--

DROP TABLE IF EXISTS `pilihkomenpel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihkomenpel` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `komentar` text NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihkomenpel_pelajaran` (`idpelajaran`),
  KEY `FK_pilihkomenpel_dasarpenilaian` (`dasarpenilaian`),
  KEY `FK_pilihkomenpel_tingkat` (`idtingkat`),
  CONSTRAINT `FK_pilihkomenpel_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pilihkomenpel_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pilihkomenpel_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihkomenpel`
--

LOCK TABLES `pilihkomenpel` WRITE;
/*!40000 ALTER TABLE `pilihkomenpel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihkomenpel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihkomensos`
--

DROP TABLE IF EXISTS `pilihkomensos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihkomensos` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL,
  `jenis` varchar(3) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `komentar` text NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihkomensos_pelajaran` (`idpelajaran`),
  KEY `FK_pilihkomensos_tingkat` (`idtingkat`),
  CONSTRAINT `FK_pilihkomensos_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pilihkomensos_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihkomensos`
--

LOCK TABLES `pilihkomensos` WRITE;
/*!40000 ALTER TABLE `pilihkomensos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihkomensos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppsiswa`
--

DROP TABLE IF EXISTS `ppsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpp` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `statushadir` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Hadir; 1 Sakit; 2 Ijin; 3 Alpa; 4 Cuti',
  `catatan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ppsiswa_presensipelajaran` (`idpp`),
  KEY `FK_ppsiswa_siswa` (`nis`),
  KEY `IX_ppsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_ppsiswa_presensipelajaran` FOREIGN KEY (`idpp`) REFERENCES `presensipelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Presensi kehadiran siswa dalam pelajaran';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppsiswa`
--

LOCK TABLES `ppsiswa` WRITE;
/*!40000 ALTER TABLE `ppsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppsiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_ppsiswa BEFORE INSERT ON jbsakad.ppsiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_ppsiswa_ppsiswahadir_100` AFTER INSERT ON `ppsiswa` FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		IF NEW.statushadir = 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
			  FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;

			INSERT INTO jbsakad.ppsiswahadir 
			SET nis = NEW.nis, idkelas = xidkelas, idsemester = xidsemester,
				idpelajaran = xidpelajaran, gurupelajaran = xgurupelajaran, bulan = xbulan, tahun = xtahun, 
				hadir = 1, token = FLOOR(1 + (RAND() * 65530))
			ON DUPLICATE KEY
			UPDATE hadir = hadir + 1, issync = 0, ts = CURRENT_TIMESTAMP;
		
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_ppsiswa BEFORE UPDATE ON jbsakad.ppsiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_ppsiswa_ppsiswahadir_100` AFTER UPDATE ON `ppsiswa` FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		IF NEW.statushadir = 0 AND OLD.statushadir <> 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;

			INSERT INTO jbsakad.ppsiswahadir 
			SET nis = NEW.nis, idkelas = xidkelas, idsemester = xidsemester,
				idpelajaran = xidpelajaran, gurupelajaran = xgurupelajaran, bulan = xbulan, tahun = xtahun, 
				hadir = 1, token = FLOOR(1 + (RAND() * 65530))
			ON DUPLICATE KEY
			UPDATE hadir = hadir + 1, issync = 0, ts = CURRENT_TIMESTAMP;
			
		ElSEIF NEW.statushadir <> 0 AND OLD.statushadir = 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;
			
			UPDATE jbsakad.ppsiswahadir SET hadir = hadir - 1, issync = 0, ts = CURRENT_TIMESTAMP
			  WHERE nis = NEW.nis AND idkelas = xidkelas AND 
			    idsemester = xidsemester AND idpelajaran = xidpelajaran AND
			    gurupelajaran = xgurupelajaran AND bulan = xbulan AND tahun = xtahun;
				
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_ppsiswa AFTER DELETE ON jbsakad.ppsiswa
FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;

	IF @DISABLE_TRIGER IS NULL THEN
		IF OLD.statushadir = 0 THEN
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
			  FROM jbsakad.presensipelajaran WHERE replid = OLD.idpp;

			UPDATE jbsakad.ppsiswahadir SET hadir = hadir - 1, issync = 0, ts = CURRENT_TIMESTAMP
			 WHERE nis = OLD.nis AND idkelas = xidkelas AND 
			       idsemester = xidsemester AND idpelajaran = xidpelajaran AND
			       gurupelajaran = xgurupelajaran AND bulan = xbulan AND tahun = xtahun;
		END IF;

		INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), 
			dbname = 'jbsakad', tablename = 'ppsiswa', dataid = OLD.replid, datatoken = OLD.token;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ppsiswahadir`
--

DROP TABLE IF EXISTS `ppsiswahadir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppsiswahadir` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `gurupelajaran` varchar(30) NOT NULL,
  `bulan` tinyint(1) unsigned NOT NULL,
  `tahun` smallint(5) unsigned NOT NULL,
  `hadir` smallint(5) unsigned NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_ppsiswahadir` (`nis`,`idkelas`,`idsemester`,`idpelajaran`,`gurupelajaran`,`bulan`,`tahun`),
  KEY `FK_ppsiswahadir_siswa` (`nis`),
  KEY `FK_ppsiswahadir_kelas` (`idkelas`),
  KEY `FK_ppsiswahadir_semester` (`idsemester`),
  KEY `FK_ppsiswahadir_pelajaran` (`idpelajaran`),
  KEY `FK_ppsiswahadir_pegawai` (`gurupelajaran`),
  CONSTRAINT `FK_ppsiswahadir_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_pegawai` FOREIGN KEY (`gurupelajaran`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ppsiswahadir_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppsiswahadir`
--

LOCK TABLES `ppsiswahadir` WRITE;
/*!40000 ALTER TABLE `ppsiswahadir` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppsiswahadir` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_ppsiswahadir BEFORE INSERT ON jbsakad.ppsiswahadir
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_ppsiswahadir BEFORE UPDATE ON jbsakad.ppsiswahadir
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_ppsiswahadir AFTER DELETE ON jbsakad.ppsiswahadir
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ppsiswahadir', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `presensiharian`
--

DROP TABLE IF EXISTS `presensiharian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensiharian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL,
  `tanggal2` date NOT NULL,
  `hariaktif` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_presensiharian_semester` (`idsemester`),
  KEY `IX_presensiharian_tanggal1` (`tanggal1`),
  KEY `IX_presensiharian_tanggal2` (`tanggal2`),
  KEY `FK_presensiharian_kelas` (`idkelas`),
  KEY `IX_presensiharian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_presensiharian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_presensiharian_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensiharian`
--

LOCK TABLES `presensiharian` WRITE;
/*!40000 ALTER TABLE `presensiharian` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensiharian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_presensiharian BEFORE INSERT ON jbsakad.presensiharian
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_presensiharian BEFORE UPDATE ON jbsakad.presensiharian
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_presensiharian AFTER DELETE ON jbsakad.presensiharian
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'presensiharian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `presensipelajaran`
--

DROP TABLE IF EXISTS `presensipelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensipelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `gurupelajaran` varchar(30) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `materi` varchar(1000) NOT NULL DEFAULT '',
  `objektif` varchar(255) DEFAULT NULL,
  `refleksi` varchar(255) DEFAULT NULL,
  `rencana` varchar(255) DEFAULT NULL,
  `keterlambatan` tinyint(4) DEFAULT NULL,
  `jumlahjam` decimal(4,2) NOT NULL DEFAULT '0.00',
  `jenisguru` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_presensipelajaran_semester` (`idsemester`),
  KEY `FK_presensipelajaran_jenisguru` (`jenisguru`),
  KEY `FK_presensipelajaran_pelajaran` (`idpelajaran`),
  KEY `FK_presensipelajaran_pegawai` (`gurupelajaran`),
  KEY `FK_presensipelajaran_kelas` (`idkelas`),
  KEY `IX_presensipelajaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_presensipelajaran_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_pegawai` FOREIGN KEY (`gurupelajaran`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_presensipelajaran_statusguru` FOREIGN KEY (`jenisguru`) REFERENCES `statusguru` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informasi presensi kehadiran guru dan siswa per mata pelajar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensipelajaran`
--

LOCK TABLES `presensipelajaran` WRITE;
/*!40000 ALTER TABLE `presensipelajaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensipelajaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_presensipelajaran BEFORE INSERT ON jbsakad.presensipelajaran
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_presensipelajaran BEFORE UPDATE ON jbsakad.presensipelajaran
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_presensipelajaran AFTER DELETE ON jbsakad.presensipelajaran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'presensipelajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prosespenerimaansiswa`
--

DROP TABLE IF EXISTS `prosespenerimaansiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prosespenerimaansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proses` varchar(100) NOT NULL,
  `kodeawalan` varchar(5) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_prosespenerimaansiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosespenerimaansiswa`
--

LOCK TABLES `prosespenerimaansiswa` WRITE;
/*!40000 ALTER TABLE `prosespenerimaansiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosespenerimaansiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_prosespenerimaansiswa BEFORE INSERT ON jbsakad.prosespenerimaansiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_prosespenerimaansiswa BEFORE UPDATE ON jbsakad.prosespenerimaansiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_prosespenerimaansiswa AFTER DELETE ON jbsakad.prosespenerimaansiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'prosespenerimaansiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ratauk`
--

DROP TABLE IF EXISTS `ratauk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratauk` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idujian` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiRK` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ratauk_idsemester` (`idsemester`),
  KEY `FK_ratauk_idujian` (`idujian`),
  KEY `FK_ratauk_kelas` (`idkelas`),
  KEY `IX_ratauk_ts` (`ts`,`issync`),
  CONSTRAINT `FK_ratauk_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ratauk_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ratauk_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratauk`
--

LOCK TABLES `ratauk` WRITE;
/*!40000 ALTER TABLE `ratauk` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratauk` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_ratauk BEFORE INSERT ON jbsakad.ratauk
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_ratauk BEFORE UPDATE ON jbsakad.ratauk
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_ratauk AFTER DELETE ON jbsakad.ratauk
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ratauk', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rataus`
--

DROP TABLE IF EXISTS `rataus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rataus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `rataUS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_rataus_nis` (`nis`),
  KEY `FK_rataus_idsemester` (`idsemester`),
  KEY `FK_rataus_jenis` (`idjenis`),
  KEY `FK_rataus_idpelajaran` (`idpelajaran`),
  KEY `FK_rataus_kelas` (`idkelas`),
  KEY `IX_rataus_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rataus_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_jenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_rataus_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rataus`
--

LOCK TABLES `rataus` WRITE;
/*!40000 ALTER TABLE `rataus` DISABLE KEYS */;
/*!40000 ALTER TABLE `rataus` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_rataus BEFORE INSERT ON jbsakad.rataus
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_rataus BEFORE UPDATE ON jbsakad.rataus
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_rataus AFTER DELETE ON jbsakad.rataus
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'rataus', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `riwayatdeptsiswa`
--

DROP TABLE IF EXISTS `riwayatdeptsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatdeptsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `mulai` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 -> Baru, 1 -> Siswa Pindah Departemen',
  `keterangan` varchar(255) DEFAULT NULL,
  `nislama` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatdeptsiswa_departemen` (`departemen`),
  KEY `FK_riwayatdeptsiswa_siswa` (`nis`),
  KEY `IX_riwayatdeptsiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_riwayatdeptsiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_riwayatdeptsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatdeptsiswa`
--

LOCK TABLES `riwayatdeptsiswa` WRITE;
/*!40000 ALTER TABLE `riwayatdeptsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatdeptsiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_riwayatdeptsiswa BEFORE INSERT ON jbsakad.riwayatdeptsiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_riwayatdeptsiswa BEFORE UPDATE ON jbsakad.riwayatdeptsiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_riwayatdeptsiswa AFTER DELETE ON jbsakad.riwayatdeptsiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'riwayatdeptsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `riwayatkelassiswa`
--

DROP TABLE IF EXISTS `riwayatkelassiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatkelassiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `mulai` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 -> Baru, 1 -> Naik, 2 -> Tidak Naik, 3-> Pindah',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatkelassiswa_siswa` (`nis`),
  KEY `FK_riwayatkelassiswa_kelas` (`idkelas`),
  KEY `IX_riwayatkelassiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_riwayatkelassiswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_riwayatkelassiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatkelassiswa`
--

LOCK TABLES `riwayatkelassiswa` WRITE;
/*!40000 ALTER TABLE `riwayatkelassiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatkelassiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_riwayatkelassiswa BEFORE INSERT ON jbsakad.riwayatkelassiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_riwayatkelassiswa BEFORE UPDATE ON jbsakad.riwayatkelassiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_riwayatkelassiswa AFTER DELETE ON jbsakad.riwayatkelassiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'riwayatkelassiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rpp`
--

DROP TABLE IF EXISTS `rpp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtingkat` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `koderpp` varchar(20) NOT NULL,
  `rpp` varchar(255) NOT NULL,
  `deskripsi` text,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`idtingkat`),
  KEY `FK_rpp_semester` (`idsemester`),
  KEY `FK_rpp_pelajaran` (`idpelajaran`),
  KEY `IX_rpp_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rpp_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rpp_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rpp_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpp`
--

LOCK TABLES `rpp` WRITE;
/*!40000 ALTER TABLE `rpp` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpp` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_rpp BEFORE INSERT ON jbsakad.rpp
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_rpp BEFORE UPDATE ON jbsakad.rpp
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_rpp AFTER DELETE ON jbsakad.rpp
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'rpp', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`departemen`),
  KEY `IX_semester_ts` (`ts`,`issync`),
  CONSTRAINT `FK_semester_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (20,'Semester I','SMA',1,'Sekedar contoh. Menu ini mengatur setiap nama  semester yang ada di departemen sekolah. Setiap pergantian semester, pengguna harus mengubah status aktif semester ini. Ubah atau tambahkan data ini sesuai dengan nama semester yang digunakan disekolah anda.',NULL,NULL,NULL,'2010-03-02 03:06:18',6418,0);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_semester BEFORE INSERT ON jbsakad.semester
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_semester BEFORE UPDATE ON jbsakad.semester
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_semester AFTER DELETE ON jbsakad.semester
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'semester', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `settingpsb`
--

DROP TABLE IF EXISTS `settingpsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settingpsb` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idproses` int(10) unsigned NOT NULL,
  `kdsum1` varchar(5) DEFAULT NULL,
  `nmsum1` varchar(100) DEFAULT NULL,
  `kdsum2` varchar(5) DEFAULT NULL,
  `nmsum2` varchar(100) DEFAULT NULL,
  `kdujian1` varchar(5) DEFAULT NULL,
  `nmujian1` varchar(100) DEFAULT NULL,
  `kdujian2` varchar(5) DEFAULT NULL,
  `nmujian2` varchar(100) DEFAULT NULL,
  `kdujian3` varchar(5) DEFAULT NULL,
  `nmujian3` varchar(100) DEFAULT NULL,
  `kdujian4` varchar(5) DEFAULT NULL,
  `nmujian4` varchar(100) DEFAULT NULL,
  `kdujian5` varchar(5) DEFAULT NULL,
  `nmujian5` varchar(100) DEFAULT NULL,
  `kdujian6` varchar(5) DEFAULT NULL,
  `nmujian6` varchar(100) DEFAULT NULL,
  `kdujian7` varchar(5) DEFAULT NULL,
  `nmujian7` varchar(100) DEFAULT NULL,
  `kdujian8` varchar(5) DEFAULT NULL,
  `nmujian8` varchar(100) DEFAULT NULL,
  `kdujian9` varchar(5) DEFAULT NULL,
  `nmujian9` varchar(100) DEFAULT NULL,
  `kdujian10` varchar(5) DEFAULT NULL,
  `nmujian10` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_settingpsb_prosespsb` (`idproses`),
  CONSTRAINT `FK_settingpsb_prosespsb` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settingpsb`
--

LOCK TABLES `settingpsb` WRITE;
/*!40000 ALTER TABLE `settingpsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `settingpsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `noun` varchar(50) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idangkatan` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `suku` varchar(20) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `kondisi` varchar(100) DEFAULT NULL,
  `kelamin` varchar(1) DEFAULT NULL,
  `tmplahir` varchar(50) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `statusanak` varchar(10) DEFAULT NULL,
  `jkandung` tinyint(2) unsigned DEFAULT '0',
  `jtiri` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` mediumblob,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `jarak` tinyint(1) unsigned DEFAULT '0',
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(150) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `noijasah` varchar(25) DEFAULT NULL,
  `tglijasah` varchar(25) DEFAULT NULL,
  `ketsekolah` varchar(100) DEFAULT NULL,
  `namaayah` varchar(60) DEFAULT NULL,
  `namaibu` varchar(60) DEFAULT NULL,
  `statusayah` varchar(10) DEFAULT NULL,
  `statusibu` varchar(10) DEFAULT NULL,
  `tmplahirayah` varchar(35) DEFAULT NULL,
  `tmplahiribu` varchar(35) DEFAULT NULL,
  `tgllahirayah` varchar(35) DEFAULT NULL,
  `tgllahiribu` varchar(35) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(60) DEFAULT NULL,
  `pekerjaanibu` varchar(60) DEFAULT NULL,
  `wali` varchar(60) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `hobi` text,
  `frompsb` tinyint(1) unsigned DEFAULT '0',
  `ketpsb` varchar(100) DEFAULT NULL,
  `statusmutasi` int(10) unsigned DEFAULT NULL,
  `alumni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 bukan alumni, 1 alumni',
  `pinsiswa` varchar(25) NOT NULL,
  `pinortu` varchar(25) NOT NULL,
  `pinortuibu` varchar(25) NOT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nis`),
  UNIQUE KEY `UX_siswa_replid` (`replid`),
  KEY `FK_siswa_angkatan` (`idangkatan`),
  KEY `FK_siswa_suku` (`suku`),
  KEY `FK_siswa_agama` (`agama`),
  KEY `FK_siswa_status` (`status`),
  KEY `FK_siswa_kondisi` (`kondisi`),
  KEY `FK_siswa_pendidikanayah` (`pendidikanayah`),
  KEY `FK_siswa_pendidikanibu` (`pendidikanibu`),
  KEY `FK_siswa_pekerjaanayah` (`pekerjaanayah`),
  KEY `FK_siswa_pekerjaanibu` (`pekerjaanibu`),
  KEY `FK_siswa_statusmutasi` (`statusmutasi`),
  KEY `FK_siswa_kelas` (`idkelas`),
  KEY `FK_siswa_asalsekolah` (`asalsekolah`),
  KEY `IX_siswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_siswa_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_angkatan` FOREIGN KEY (`idangkatan`) REFERENCES `angkatan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_asalsekolah` FOREIGN KEY (`asalsekolah`) REFERENCES `asalsekolah` (`sekolah`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_kondisi` FOREIGN KEY (`kondisi`) REFERENCES `kondisisiswa` (`kondisi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pekerjaanayah` FOREIGN KEY (`pekerjaanayah`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pekerjaanibu` FOREIGN KEY (`pekerjaanibu`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pendidikanayah` FOREIGN KEY (`pendidikanayah`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_pendidikanibu` FOREIGN KEY (`pendidikanibu`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_status` FOREIGN KEY (`status`) REFERENCES `statussiswa` (`status`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_statusmutasi` FOREIGN KEY (`statusmutasi`) REFERENCES `jenismutasi` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_siswa_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_siswa BEFORE INSERT ON jbsakad.siswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_siswa BEFORE UPDATE ON jbsakad.siswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_siswa AFTER DELETE ON jbsakad.siswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'siswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `statusguru`
--

DROP TABLE IF EXISTS `statusguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusguru`
--

LOCK TABLES `statusguru` WRITE;
/*!40000 ALTER TABLE `statusguru` DISABLE KEYS */;
INSERT INTO `statusguru` VALUES (8,'Asisten','Sekedar contoh. Menu ini mengatur status setiap guru yang mengajar di sekolah. Ubah atau tambahkan data ini sesuai dengan status guru yang ada di sekolah.',NULL,NULL,NULL,'2010-03-02 03:06:18',11638,0),(7,'Guru Honorer','',NULL,NULL,NULL,'2010-03-02 03:06:18',52760,0),(6,'Guru Pelajaran','',NULL,NULL,NULL,'2010-03-02 03:06:18',32293,0);
/*!40000 ALTER TABLE `statusguru` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_statusguru BEFORE INSERT ON jbsakad.statusguru
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_statusguru BEFORE UPDATE ON jbsakad.statusguru
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_statusguru AFTER DELETE ON jbsakad.statusguru
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statusguru', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `statussiswa`
--

DROP TABLE IF EXISTS `statussiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statussiswa`
--

LOCK TABLES `statussiswa` WRITE;
/*!40000 ALTER TABLE `statussiswa` DISABLE KEYS */;
INSERT INTO `statussiswa` VALUES (7,'Eksklusif',2,NULL,NULL,NULL,'2010-03-02 03:06:18',3185,0),(6,'Reguler',1,NULL,NULL,NULL,'2010-03-02 03:06:18',50107,0);
/*!40000 ALTER TABLE `statussiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_statussiswa BEFORE INSERT ON jbsakad.statussiswa
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_statussiswa BEFORE UPDATE ON jbsakad.statussiswa
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_statussiswa AFTER DELETE ON jbsakad.statussiswa
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statussiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tahunajaran`
--

DROP TABLE IF EXISTS `tahunajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tahunajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahunajaran`
--

LOCK TABLES `tahunajaran` WRITE;
/*!40000 ALTER TABLE `tahunajaran` DISABLE KEYS */;
INSERT INTO `tahunajaran` VALUES (20,'2009/2010','SMA','2009-06-01','2010-07-30',1,'Sekedar contoh. Nama tahun ajaran yang berlangsung di departemen sekolah. Ubah atau tambahkan data ini sesuai dengan nama tahun ajaran yang ada di sekolah.',NULL,NULL,NULL,'2010-03-18 02:53:06',44390,0);
/*!40000 ALTER TABLE `tahunajaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_tahunajaran BEFORE INSERT ON jbsakad.tahunajaran
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_tahunajaran BEFORE UPDATE ON jbsakad.tahunajaran
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_tahunajaran AFTER DELETE ON jbsakad.tahunajaran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'tahunajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tambahandata`
--

DROP TABLE IF EXISTS `tambahandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `kolom` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Text 2 Binary',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandata_departemen` (`departemen`),
  CONSTRAINT `FK_tambahandata_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandata`
--

LOCK TABLES `tambahandata` WRITE;
/*!40000 ALTER TABLE `tambahandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandatacalon`
--

DROP TABLE IF EXISTS `tambahandatacalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandatacalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) CHARACTER SET utf8 NOT NULL,
  `idtambahan` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Teks 2 File',
  `teks` varchar(1000) DEFAULT NULL,
  `filedata` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandatacalon_calonsiswa` (`nopendaftaran`),
  KEY `FK_tambahandatacalon_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_tambahandatacalon_calonsiswa` FOREIGN KEY (`nopendaftaran`) REFERENCES `calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tambahandatacalon_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandatacalon`
--

LOCK TABLES `tambahandatacalon` WRITE;
/*!40000 ALTER TABLE `tambahandatacalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandatacalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandatasiswa`
--

DROP TABLE IF EXISTS `tambahandatasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandatasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `idtambahan` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Teks 2 File',
  `teks` varchar(1000) DEFAULT NULL,
  `filedata` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandatasiswa_siswa` (`nis`),
  KEY `FK_tambahandatasiswa_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_tambahandatasiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tambahandatasiswa_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandatasiswa`
--

LOCK TABLES `tambahandatasiswa` WRITE;
/*!40000 ALTER TABLE `tambahandatasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandatasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tingkat`
--

DROP TABLE IF EXISTS `tingkat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tingkat_departemen` (`departemen`),
  KEY `IX_tingkat_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tingkat_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tingkat`
--

LOCK TABLES `tingkat` WRITE;
/*!40000 ALTER TABLE `tingkat` DISABLE KEYS */;
INSERT INTO `tingkat` VALUES (26,'10','SMA',1,'Sekedar contoh. Nama tingkatan kelas yang ada di sekolah. Ubah atau tambahkan data ini sesuai dengan nama tingkatan kelas di sekolah.',1,NULL,NULL,NULL,'2010-03-02 03:06:18',6098,0),(27,'11','SMA',1,'',2,NULL,NULL,NULL,'2010-03-02 03:06:18',28378,0),(28,'12','SMA',1,'',3,NULL,NULL,NULL,'2010-03-02 03:06:18',58064,0);
/*!40000 ALTER TABLE `tingkat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_tingkat BEFORE INSERT ON jbsakad.tingkat
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_tingkat BEFORE UPDATE ON jbsakad.tingkat
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_tingkat AFTER DELETE ON jbsakad.tingkat
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'tingkat', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `deskripsi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `tglkirimSMS` date DEFAULT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `idrpp` int(10) unsigned DEFAULT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ujian_idpelajaran` (`idpelajaran`),
  KEY `FK_ujian_idsemester` (`idsemester`),
  KEY `FK_ujian_idjenis` (`idjenis`),
  KEY `FK_ujian_idaturan` (`idaturan`),
  KEY `FK_ujian_rpp` (`idrpp`),
  KEY `FK_ujian_kelas` (`idkelas`),
  KEY `IX_ujian_ts` (`ts`,`issync`),
  CONSTRAINT `FK_ujian_idaturan` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_idjenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_rpp` FOREIGN KEY (`idrpp`) REFERENCES `rpp` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_ujian BEFORE INSERT ON jbsakad.ujian
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_ujian BEFORE UPDATE ON jbsakad.ujian
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_ujian AFTER DELETE ON jbsakad.ujian
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `jbscbe`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbscbe` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbscbe`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other, 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_anggota_kelompokpeserta` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  KEY `FK_anggota_calonsiswa` (`nic`),
  CONSTRAINT `FK_anggota_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_kelompokpeserta` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpeserta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  `informasi` varchar(500) NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `jenis` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_audit_user` (`iduser`),
  KEY `IX_audit_jenis` (`jenis`),
  CONSTRAINT `FK_audit_user` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audithapusujian`
--

DROP TABLE IF EXISTS `audithapusujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audithapusujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `username` varchar(255) NOT NULL,
  `idujian` int(10) unsigned NOT NULL,
  `ujian` varchar(255) NOT NULL,
  `nilai` varchar(10) NOT NULL,
  `petugas` varchar(255) NOT NULL,
  `idpetugas` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audithapusujian`
--

LOCK TABLES `audithapusujian` WRITE;
/*!40000 ALTER TABLE `audithapusujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `audithapusujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoakses`
--

DROP TABLE IF EXISTS `autoakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoakses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_autoakses_departemen` (`departemen`),
  KEY `FK_autoakses_pegawai` (`nip`),
  CONSTRAINT `FK_autoakses_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_autoakses_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoakses`
--

LOCK TABLES `autoakses` WRITE;
/*!40000 ALTER TABLE `autoakses` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatsms`
--

DROP TABLE IF EXISTS `formatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatsms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `formatsms` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_formatsms_departemen` (`departemen`),
  CONSTRAINT `FK_formatsms_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatsms`
--

LOCK TABLES `formatsms` WRITE;
/*!40000 ALTER TABLE `formatsms` DISABLE KEYS */;
INSERT INTO `formatsms` VALUES (1,'SMA','Hasil {SISWA} untuk {UJIAN} tanggal {TANGGAL} nilai {NILAI}');
/*!40000 ALTER TABLE `formatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ftdatasoal`
--

DROP TABLE IF EXISTS `ftdatasoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ftdatasoal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_ftdatasoal` (`idsoal`),
  FULLTEXT KEY `FT_data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ftdatasoal`
--

LOCK TABLES `ftdatasoal` WRITE;
/*!40000 ALTER TABLE `ftdatasoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `ftdatasoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambarlatar`
--

DROP TABLE IF EXISTS `gambarlatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambarlatar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gambar` mediumblob NOT NULL,
  `warna` varchar(10) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambarlatar`
--

LOCK TABLES `gambarlatar` WRITE;
/*!40000 ALTER TABLE `gambarlatar` DISABLE KEYS */;
INSERT INTO `gambarlatar` VALUES (1,'ÿØÿà\0JFIF\0\0\0\0\0\0\0ÿî\0Adobe\0d\0\0\0\0ÿÛ\0C\0ÿÛ\0CÿÀ\0Ğ€\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0H\0\r\0!1AQaq\"ğÁÑ2B‘¡±áñ#R3	b$%rC’Scs4&‚5\'ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0R\0\0!1AaQq2‘¡±\"ÁBÑRbr‚’#ğ¢3á²ÂCS$ñÒcs4%ƒ“£³DTdt&ò6ÿÚ\0\0\0?\0ñÍìçA<¯n¯åÿ\0¾Dè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\0\0 ÂÆÂö©3¶ˆH&IB4´çõ…G96²(Ó$@zš,¹.r/d8Z\Zñ«MËH[!­À-¢\"Ònæ´„<­n¦ú„œ)¤¨sšH\'•íÏh}J tƒQmÃCU\n%±Ã‡\n“0Kh›„ƒ÷e4iiÏê5äÚÈqe’ ½Mê<ió‘{ Ù\0v›–‘©%üjÄÀ-¢qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ„28¡M! ıV²\'$¥2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À! $ÍW]È–Ä{ÍeYTš¢ÊÜı\rÓ`€Ÿs5Á[]÷	jY\n8ş”¹ˆ%^‘U¿6ÇË¡Ìj.“’Ÿ \rHZT ½ˆO1ZFR¶J¶W!r%­h6P–Ãı(™$RÈcdÍWr%­úæk\'2©ºlÖQÒÈjz@\0ŸPìYáFÈ$%©b,r4;Ñ6B![ó\"_Ìf\rcQt˜§Äâ¤-7A{Ç1ZD‘vd0°U+œ…\rÚ­Ë\Z&If@É 	‚¸«‘8aÇ3YÖU7Ck(éd5= \0¾<2¡ÚˆgQ²	šˆ±ãC½À(@„+O©øc¡ùj.†tèË“Õ¤´©@Äq­bH²M U)$:CA²ÚØQ))dÃÙ#H™ªë¹‚xæk72©º…Nv‡¥‚^ùğğ§ÌÔMŞŠšıd·M’ÇÏD*)VÙÈ—Äøp§å¨º.ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚Îâ%“H*Ö©<İı*$^M¢jäs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Gt€êh##íb”÷Hµ”jE&‡k‘8rä\r8–-¢ŠÎ™dÒ¦µW›³¥\"å´J¬BcH¹ŸuI-d2$ãKpÄ¸åáÆ“’›\0¬ `Œù\n–è¢8Ë	x	•·IFiM£‡\"¨tâX¶ˆ%GÉ&U­¹¾.Ã+Z‰i2²q`\ZE³ä)E¬„$¶`ƒHı‡¤æE\nÁµÌ‚ŸÍŠFâğK…²æ)Šİ\nØášIF8Ypğ4F…´H‡QÎI¤ZÁ~nÀş”J²dER8°Ñlù\n\r(,šDÁRGì8­*È¡@[CÌ‚˜øĞæ(VÂ^ .b˜st(ÒØß ”k°äåDğ4âH-¢¨â$“H*Ö\\æ®Àş”HóI\r¹€i3şÔ‰k#½’q¥¢Ö%Ç.Cå:9‚3ñğ¢È`UÆL€ê\0·\0Sø¦+tˆB4Äı£]‡\"pıj¢X¶‰ÕS’Y4‚­j¯7gzr.[D:’—Æ–„ÌãåÉiÖL2Dá™8xtT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![ÚéI¶a}°©5²N×P´B‘ØRµEĞêÚÑ0Ô|\0dR½î•S#iŒN¶C•—EÔk>ëËÈVµp\'#à)Æ¥ôL–¢·0Dı@#\\º“\0xåcJT/¢\\ÏE$ixl·¤kd*!°µF…ÇŸ$¤\\(P0SÌ\02ññ¢æ·E‘ÆÇ0D&\\¨ªRp­±‰¨…klŞËòâ\\¾ˆ.Ê9‚7êDk¬S\0xò”¨_DU[ãÖ’Ê÷¤I6EU¶£ÌùŒp¤äw¡Š˜ï\0VÏ\'Šl1ƒ¨Û!ÂK¡•¶Wê!Zß•p.ãåN5<Ú!‚…¢\'ê\Zï™0ãÉh•è†W#‰¥Á3ûÒ5²!s[Ô<ÁÏ˜¢£½¨1³´“à\0ÊÙñ¢¤ÖèdQÇ¡§Q¶C‡÷ \rPÅc?Y\nÖÙ«+€«‰rú\"¬£˜#~°®±A`åÇ4J…ô@uRFç€\ZBgH—²€„(ä œy\n-cT]@0S…À‡ Mnš¸ÚX\n›d8\nb•(Q±‰_¬…kp\\…×ÀS‰rú!ÚŠœÏ³&°Ôk±Lâœ)Ê…ôL½ÕHÓ\"ipK(¤j“ s[ayÚŠôT&’8ğæG3N÷ºŠ¶4Æ£n{\Zb—MÜªkD¯ÔBµ¿*à]ÇšUF¥ôMQh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB|pÒZm{ÙÎ®`K$é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,´DÇAÄ°µkjÙK«’7é\0´”W^ÆøTÍÀ¥å($-Òà!mÏ#ÀÖU\rĞÎ­Ñ	rØ€¢†z§emˆ0—n)3T¤­¡\Zã{~œh¬è.…¢0â \0ı*,íZ@l¦[Øô¶”6Srˆ¾3p)åEÊN‘G\0¨¨3^Y\ZÍÌ(nJ³^àå²ağÎ‘sT2&ÄK²ş)3U§Şn–¨¾^h~j¡Ù>(Ü¤\r…m¬’V‘r+d‰RHÜÒi){ØÑ7ŒÈt-Òñê!m\0x\ZÊ±¡º«1	\\¶ (Çô43—C•Œ—­€°øÒfªCÿ\00F…pBVÉÅ/|hóP]$øÚâ ĞĞHôÙ@å•kH­’RV¹I\0VÄ~ôL)dÒAû#KÇ¨Şß²ğ5—–†èTè„[ydi³Õ7Q±62ç-€(>&“T:¢ÃKB¸\\­“Š^ôë*¡Ê|QŸ©A7iKÃ*Ö.EYê¤À(ZJ½ˆ¢n,‡HO²Ğ×Qlüx\ZÍùhn˜*yúRãàE6z¢…P‰¬%Ëd°á@qT2-˜ÜQS‚xãMÌ¨.Š§1Ké@SÓkZÁÍì••H\ZSJ+¯d[dh˜\"ŞT%g´A\0(¶ı°Â¢°¡ó*TèƒÜM(ãM¨uMŒFK–À\ZªSº…&Ğ5c~§\Z<ÔIš©±Æâ€Ğ	RÛXrÊ¶ƒ‘[$ú!•À’Šod\\(“K&ë=¡j95\"Û¿ÅEaCuWQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º+Ù®(‡•¬™à•\\\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²jÚÉ%\0»ÒÓtÌ|—)>d¨¦B5\\4P€[\n®W/`¤—LâĞISúş–+O€(e`HÜ?d¤õb‡LM.BC‚)B/jLX¾ˆ$¤¹ŒÄsGÓõÄV|¤ZÈÕµ’H¥§éÌø®†&è~Å©°AÈ@,ˆ£x\n¡/¢UF…KZ¥|8&V6§Úºl \rƒŠ\0y[/\0”ŸB‡]C‰BA¥øó½I‹Ğ©t—5ñYêhºbà=õ™‰²nêÚÉ&\0¿ÒÜCQ	øQÊMì‘#Åhl#Pr ,B[Ò¨Dú\"¥3N 8•ıí\r7.ÃT+Ó€.6ı~ÉIË±¢˜NAÁ¡Çõ¤bÅôC$º7Ä	g©¢ú~¡åfÄXÑ:(Æ>Pı-?OÔ|W\n›¢‹@ˆ( ²\0£xUˆ‚_Dœ\"Cv‚ªy]G+|©¾¢`ÒQ<8sÁ)½X¡ıˆL@8’ƒš”\"øáÇIˆÅ‘EÌ|@–zÚ/¥=CÀgPÄXÑ:(Øß(ş–›éú3Â†‘¹E„M.P\0i²%°âkA/¢ÑéÄ¯ïoĞƒMË°Õ%ZpÄ\'¸~ÉMË±¢İ.E¥ÿ\0\ZF «\"«;™,@–zš.ˆ®mO+XÑ5¯”\'¥§éD$sà(å&öMÙ=°‚àà­h¡Øc{Uˆ¹}ıªÈ7kJ©ó6CÈ¨«}¨qª¨k¬‡•&&Á>ÀJl\nBĞK@\nHÏ8Òåb÷	Ues$ŒÏSEô¥Àä˜Ô±²oÚ©¬’@ı-?NgÅE…¤İµ“ÄMÔ \0K \n?{V‚._D@VA¸AÇ¡Z§«\rPê¸4’ş™y%=X ‡K|MÔJE(—Çõ¥ÊÅî,Îd‘[ëhºfô©å\"Êœ!k_(Ş–”:s#Ÿ¦\"OšÉ­\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ìçA<¯n£‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡t€¸¶á¡ª…<íÂ¤ÌÚ\"‰GîJhÒÓdxÖfdÚÉ:¶™\"\0?ÔÑeÌ±Æ§œ‹Ù6Zšñ«N …@„_÷ºÕ‰€[D¸¦q \"xZß²yÑ[„”¹BŠ	å{~ëF¯$•\0â\r€j¡@‰;TK %´EÒ¹B7ÒÓ™ùˆ>-fg#k&Ìˆ}È€õ4}Cæ?:\\ä^Èp´±í\r]@…É/‡ëV&Å´IÊbbZúg€!%`9ÁA<¯˜Æ×¡õ(ª¢öê-+¤5RÀ[Æ ÍËX!’\\dÀÒ119V|Ò6²\0\nØdˆ\0ÿ\0S—êŸRæ\"éÓÅhkÛ«J’ÒÕÀsÎ´bÚ$ì1-\0sK[€Jz¸IÔB‚y^Ü*(­ÊS5¡\rQ\0±Ã…A˜%´F©û²‚\Z44­×ÔGº£œ›Yºû±\0êh¶¥¸øÑÎEìì´5ÃV•V¨‹ùgV2\0[D‘è7sB!ı-Á,”ßP¢š\n‡8(\'õ·1u¡õ(tw¨µQ *`-.@KU“Hp–PC}-+ê_QóÊ£œ›Y:ªoİˆ\0ÿ\0SEµ-Àç{ÑÎEì‹Ù=¯¦å¤*\0¹¶5b`Ñ%dbZÒ\0<­eÀ%W‡Q0$\'$½¹â´Ü»”:<j!Hh\n\0\"cÎÕ&n[DİÖwe4hiÍ}GÏ*bmdQS\\ø€\ZØ3ú‡™ÆÔsH^É°6ºp{uiBÙ¿ïZFlXÙ&VZnæ„ÂÇ­UÄ*K‚à Ÿ×<ñQO‰B[äiqmÀRÀ[Ó…#7-¢*³;îHo¥§3gŠrmeN„Ä\0©¢ËõÍqJbr²\Z¦‡\rHª[\0Eş5¬r\0ytJ¡¤ÂÅ8d”õx¡QÈªy^ßºÓ«¹M-Ï\n[pU,0ÈgjF`–°@Y÷%7ĞÓeúˆ÷Tó“k*`„kˆ\0ÿ\0SEƒ†#†w¦\'!{$é­iÅ¤-€\"ş5¨˜´M4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ„28¡M! ıV²\'$¥2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"Á…ÚJ†ƒ`mdLiNDÚÉ?bPV«ˆ.Dµ¿\\ÍbæU7@‰ÒÔF\"ZˆVÙÉ\0Y1ãC½®ÑmŠ%î¾éy*<ÈZbT\ZƒÀ-ˆóZ¸Ê@VÊ}È¤% ü‚dT¦I`À%†‰š¯ ¹Ø„ã™¬\\Ê¦èvVén\rÓé\0)¤KQ\nÚÿ\0¸\\İ>”(Nts=ÈB¨¨~úNaQt2Ó¤¤ƒ“ob>5q‘²NÊI©\n\Zv²ygDäH£2±(ÊÕuÜ‰ıøÖNgRj“•n~‚¤ \0*òğ¥ÌÔ	Ü+cÄ…ÍK%Ğøà”¹‰\Z\"ÒØ¨bˆ§5á˜¡Ìj.‹­—\0´İ\0Õb8æ*ã)Ù#Ø®Bä:P4j	`\ZS$Š3 7ŠB	š®*Q8æµŸš¦èv²0†§¥1J	j!F¿î5=)ôE• …ªÜQ/ŸÀÑXÔ]÷Z#Ô—BÒWÒÄV2¾U/VU&¤±\rh?PKDÌˆ¥“¬‚f«ÑÃù5eStİ¬©ÒÔô¥Ê~”ÔEÔkşás@ô¥Æ‡z\"Ê …ªÔTKçáÌPüµC½Óã/OR›£ob8ğ­ H»2T°º©IBšCF\Z‚[r§))dÂÎ\ZÙš®*äEÃ$ÖneY];/xŒ†¥¸¡§ÌÔEÂ¦¿Y-\rô¡C{ü)»Ñ3EDš­@äKãåÀÓs\n‹¥R›¤\n…§!{ûÖ°‘fMÚöU)r-\0©E“ãDäM¨ãÁgA0W(Š2L<I¨s*›¦Êœÿ\0¶CSÒÈËÃ*|ÍD2\'Ü.jY\nïá@/D*-…ba|O†b˜&5Cö¦F\\ƒR›Ø-“u´	¶L±C*té\0q¶^C\Zr”ˆ£2@7rÌŸp+®QY<j<õ>dÕ:@Â\ZAN)aÂ›±`š ñ!s@ô¦?\Zz!Q­MH—Ís\r0y*.†tÈõ%ÓI$ ½ˆã[BD^Èv¡C+œ…4†ƒõZÈ”æIfM\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°YÜD²iZÕ\'›¿¥D‹É´M\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš8‹¤P	‘öÅ(î‘:\"alRh%\Zì\0Iş(‰bÚ\"¥Yp–M «[iJ²m`‰î,H¶|…I$ZÉ*´ãKp²”·‡5¤K”Y£¯‰#SÌcDªSb.x*ĞF_îŠ¦)48ú]‡\0ãÏ§Å´IÎˆ‹„²‚­j’˜)T²HŞK\0Ò\0THµ“eE\'\Z[†gáãH’J-ta!j;Ä1åŠR~Z!ëDqğu4!À§ñÆ€IºG±[R94¥®¸\\TNKDKÑÈ™dÒºšÕ\'w*S.Y\Z:)cCBYH$·r‘ÅS’q¤XY\\oä8áIÜñNÊÂ@Ô7Ä‚˜ò49É\\¢T€—4&V Vèª&š	F<Sƒ“4âÀ¶‰êÜ’É¤cœÁv(™²\0aŞ®E`-™ÈråRKY:!!³\r-Ã–H8Ğä¢Êı0.˜#>FüM Y¢W‚Km‘L~497AQ¤E&ƒf»ÉÇ/:¨I‹h•ÔqÈ‹X¤ğ.÷¥.[Dİ•Ê¬\Zƒ2–ª\\‹ ÈlãKBI9dƒŠĞä¡ê§¦¥Ã˜#>GÌĞ!k $„?\Z`“t*jC&‚äkğ\\“5P5cdˆ~õNIdÒ¦°xaú\n$Ä²\0oRFkl·<<¹Ò%¬›%¹\'n‘†dŒ949%PPß\n\"ò4;\Z¡İ\\eÒ­¡2QLU\0Óš	Fºí\\—UÅ´Up©ßòÉ¤Mj’™ŸéNEäÚ%£ª”–¥ Ê~Ü–‚ZÖL%&Ü3\'øMIMëUJ!\Z\\<ìS:`ò§u¯P	€QüS‰{¤ÈI ”c°\\8çWÅ´Kâ©Úe4kT×§\"å´LJ]\Z[lÏ»Î‘-eT)N\rœ#m™9xs¦ä”ª¨„#°¹L|jd;¨Â^ .b˜stĞ‚\"~‚QÀœ6Eª‰bÉİS‹e4kUStä^L•@t2—F4æ}É’ĞKY0^š $Ny“‡€çEIE”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ‰­çàÑ—ˆ¥~õ$±¢dM1ƒ©ÖÈ{é\n]ª&0Jın†ü ¥ÈÀø\n\"\\º	jj­Ì?P\01Ø ÁØ¯¢T<Ú$Şêß¤E¸©‘{!û¶©¾`çÌxTèdmhœjqä\ZÏ\ZWïA)‘0Æq	÷ÒµJD«dbY5¸z\ZˆnáDK—I˜\"“SZŒv)“¾”¨y“Dö€	˜\\ªd^Èz¨Z!\nÜ0#/\ZF•Õ+”Mcg\Zœ|\Z<j\\“Å#K&DÃ!ÆÙT;T —VÈÄÒ¬m›ÍÂëåN5.‘,UnŒE& ¯±A`ì|–”˜Ù\0’>7H—P¡qÒ¤P£˜Ø¡p N>;Y\nÚÆÎ£.g\'{¡Ù2(İ:œ\0ÈIÒ$(ØÄÏÖB±©¤ÈÏÀUB¥ôCµ®­ÑˆdÖèwÍÉØ¯…¡}©ïE$f@4§;ãPîuBX \Z›àAÏ˜¤è½Õ†‰Æ§x\02æ|hºŠ(˜c9ÖÄt ±*6!4…ä+f®Ã<.•P©sd‹ÅGF!<c¬S\0ïÓDè_D#Š’0È\0k½9?Ú¥0Á	h€jmò çÌPì†uA‚q©Ş\0°¹â´:-dQFcQ	ˆ<é» »ÑcÉ¬CP4qwì*áRæÈ¨U:1š€F;æä~N…ôIÎ·RF:@48%”ˆãRà¦ášØk|Ç\n`µ“wBÙÚ\\l0\09+C½Ğ£\"tm:œl8ëLB¦Æ%~·5ZĞ\\İÇ˜Qry…’$€…ÌÉ¬cìîÜ|\r¡tÁpÆê¥c¤\049}+Ù\0¥¹­€ji¶m8c…7#½1T!¢f—;€ÀxñZ¡SÅ;`:l½¹ÓªSæª¦°K&§c~UÀ»1U\Z—A(_ŠMmÇb\0œ|©’ÅÍ’C+]\"™<è5²Ks[\0ià9ó)Ôwª\0hœï\0\\Ï\Zb§Šl©‘˜ÁSl‡·\Z¨–ºVº°JıN\nÆ„\0¢b¾ª5<È%»Õ=‚\'ëï™2?\nr¡}èn†F™K‚f(5²T·4Biä[Ç˜áN£½\0¡\0L	u²\0eâ3Zlê¬QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D\'È×m%¦×½‘|êæ²N‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:@H†—R-±+üVU…\rĞîŒÂC‰±|)\ZÕ\'Ñb%Ëd(>4™ªQñD‚V \0”öı34«:¡h® .bÖö­\"¶RX#{ƒoUì‹Q7T^©`@k‚[gğ¬ÉCtİˆ<‡-ˆ\n1òZD9t\"qrÛ!ñ¤ÍT\"A(F…6>Üj|ôE–˜˜â¤\ré$Xò«ˆ&öRıˆÇ\'¤4´”W^È¾t¦àRÈt°@xõ\"Úÿ\0®b²s\Z¢öVè„k‰²|)3ÕÔVÈ›.§…&\"¥\"]oŞi\rEE½ˆğÌÑæµÑeª&\ZƒCAOIKûVr;\"§TRFôô†–’ŠëØŞ”ÜÙC„-GÙÈ¨Ûø.`Ö\'å¡MÉ²\'B$prØ€£¤J>el„Fç9mÊ’\n´lÍ@u;4•\"•–˜šâĞ iµE‚ş—­`äV‘IÕÈÇ†£CKM•×±…)¸²gO²\\¢Úøñàk#òĞ¦«0‡íV@¢‘.‡![a.rÙ,)\n!ÊšDÍFP{x§\Zcæ C›•¢&;HÒ\Z	IK\0¼’µƒÈVÊJ’±ÈCt–’ŠëÙÎ‰¸²Ï¤Bİ/¤[_¬‰1¡Tä¨a!Ëd\n<©èrCœ¶KcLQT-ûÁ\Z¢ŞÇšq¦>j;]>6<´\Z\Z\nzJX_’^µƒæÊ\\*•®\r°n“ewÀÑ7Tİf	t¸\0q¶%:Ì¼hUy•>#ƒ‰²q¡\Z*l-ÎrÛ!…0QT%¢f£©öN)™¦>jœƒTèãzzƒt‚G¦Ö†U´B´Š!•C§N“euìBÓ›O*ae-û-\rr**Ÿèk?-èS½>&½ÁÄ”L8ĞÄÕB¦Ä#sœ	D()³T¦î¨†ÎÔhõ\"ğN(3¡Ì¨.‹]5‘¸¨\0ĞQZRÉû\nÚEl‡Ñ­r:t›)½‘iÈ)d;,¶‰º\\¢ÛŸ…G’†êâprØ¢>Wª*„D\\å°\Z\0j¡Ğ&i\r\n@[Ù8§\Z y¨.›¦1\"è\0·¤¥€ı…m\"¶I»J×€SIi²›Ùœ–@bx¬öˆ#€ß²¥ÅEaCuH]{ƒ‰²i³Õ4\" Âç-€·õ¦)TœÙ	Q¤¨æ8§\Z~z¦éÑµÈAúJX$­b	².¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º+Ù®(‡•¬™à•\\\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\\nHi$!åk&xG‚Ì¬ÄĞâPB)B/ëY˜±}\n›¤–É%¦‹‘‰ífbE¬›„ld’\0_éiË3â¢ÀÒå&éÖZ[.P­h¡ŞöÕ‚_DŸMSRå­ºW²1QGh6Ô£\0âˆy[‚T“¡H•F!¬”PB)D¾?­IˆîKto…¤³ÖÑtú‡€Í+\"–LqDÆ>Pı\r?OÔ|W\nLMì‡Z™.P\0!Dc{Så¾Š	MÓˆ¹O.pÆ‡6ÂØ@áû%-X¤áÚn¢ä$8\"”\"ê¸q©0bÿ\0uR‘[ë`¾›ê—*LLmdï{¢c(ÃKMôê><¤\"MedË[!Á×\05,B[Ò«”ãÊ ”ĞÜCn	¹ãdğ½Ÿ(4EuE§\0ç\"~ÖıT½yM\0E}¦‡!psCT¡RpÁxÒ1bú –¢C£’ K¦é¹pğ+#-dßÚ­‘¾Pı-)éÀ‘Ípodjd\0¸8\0¡\0VáT\"	º‘=¥3I»APqâmÊÅi¾‘²TV\rsˆ\0ğ@™à”ŸC¢±	…¡ÅÈ\\ÒMÅîpãHÅ‹èQÌ[ŠÎæ>0KÍÓõÄVf&5O™î­¬’D/F´ı9ŸÀP\"eSd5–†Â5j»ZYÆ÷µXˆ%ôIË#Cv´’	\\í|,WÊ›è,Š¨‡Ò×4\\9à™Púq@è@qrMñÇ4Œ@/¡C•Ì’0KÍOÔ<PbcQdß¶êšÇÈz5‡éÌø®“Sds5–†ÂİAÈZ\0E\n<ojĞDÿ\0u.bÈ“´’ VÈp±Znl,‡íT˜4¹\0?¢ò\0PúB–è@qr4©B/Š%ïG(ôL•Ñ¾ K=MN.;f•&2¨T\n¦Ç$ ,(tàâ9®\0Ğ\"Mì‡nôñu(­M~Õ¤b	}ÑiÄ*ñÎÇ…ŠÕ9~QdQ\n`?l¸ J`èK2;’].¹¡ªp+ëáO”÷Ú²½’D	hÔÑ‘›&5<¤XÑX.±¾P†§G5À\Zb&^k Ó½;ì@¡\05,€[vB_î¤äd€I<ªÕjÀİ€…@Ij\\<˜$)”§Ä‰BZ@j”\"øş´r€_D•ì|`–zš/§êS.R-eoÚ…±¾`ı\r7Óõ\0ÓbnƒÁ0D5‚„4–Ã ˆ%ìVF!¤•?­ákŠ°t0{P^ÍqDğ²ÎÁ*»)š¥º \\„‚I_/z\\ Ñ\':¬®cã±Ñ—Ô$Ä\n\\¤ZÉ‚èC$ÿ\0KMÀD\'Ç…1n›D ¸†€Š\"a _@’„KA$¯dğ+V;ªªökŠ!åk&x%>!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^Îp$ÊöàqZ8”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mF„’Z\0òµ¸d§Ä$à``H$úÛ÷‘&å+¨dÅ·\rrb…ff´NİéNt’j1¤cõÓ\nÏ˜ÊÖI»U°É\ZıM1â¸Òç\"öJæ‹S$\Z´â[\0—ÃõáT&m NDW4\"x[<\0@.!I(€*à JsÎ× J27QmÀ\rÔ„\0-;Vr›–Ñ	dÉ(!¾†›/ÔG$Â³æ&ÖI>ä@}ÏSFcæ+Kœ‹Ù;ÙkdƒPh»HT\0%ş4ÄÀ,l¤ö¦‰\0ÛÂÅ8ÎoÀ%TÀÜ…VSoİE+cT™S¤\Z‹Eš\Z¨BaéÂ‘È	­‚i$K(!¾–œş¢¼ò‘ÈM¨b6}È€G0YGÌ¼Rú„^¡&º­m‘¡Á —4µp_÷ª«h•“\07 …Šp	C×š:$ãDA¸…¯k[5Ä¡Qx.-¸kZ¨Pad\0p©9- C{R®@C}-9ßQı²3‘µvDÃ$@\0æ\n>`9® Rç\"õ	=ëK^J«KUŞ´\0-p¥“rĞB-k.Á({Èh›v¢*æ’	år‹ÅE\'±(¥¹ãQj£@TğÅ<8R9- EIû’o¡§ê?1ø¬I\Z\nİ”\Zâ\0?ÔÑõ@ËØĞ2H^Èu¡¯n Õ%¤)DKá–u ÈÅ´IÊ=!KšCú[•‚\nÔ„œ©¦áÎ©ı[9¡6MÊ½º‹n\Z\Z©d¶?§\nG- C•ßr@C}\r9Ÿ˜ƒÎ³9$h(uC\\@úš>¡ˆá@ÈEêî×ZUZBØZø~µ¨Èm¢\"Â¥Í\0yZÜ	LŠ*Òl\\\nÊåÔS{T7b[5©\r\rT°1çjG %´ojÌó$ †€Ö‰ù‡\nƒ2m@â…¥ñ\0êhÌ|ÃÅq˜œ…êº{^5i]M!P\0ŠróZÔd\0¶‰\\+-Ä´ •Š)°¨\Zó\r„ƒbB‚x‹Û*( ÉÚ–é¨´’\Z©\n—˜Ú™˜\'€MdÜ”Äk\r”üÄ{…I™<`îD\0w©¢Ú†#Ç•1‹Ô&œÙ­&í!P\0Eş5¨˜…’V[‰h@2µ¬¹X%;a¢È¸%¦ç•ì¹Ø­:ùAN©o)iPĞÕDcÎÕ<à–°L{ÖG‰%3ĞÒ·\'Ô|T¹Éµ•P!i’ ıM_¨|j¹È½‘Üš$\ZƒnZZ¹súÖ‘˜´MQ¹¡ò·ö«¡/‚À¸§Ï÷ÅjœÜ¡Ò_ Ô[ƒ@\\€¶8p£œÖ\n®³?îJŸKNgæ ø`µ<äÚÈfººH€G4Y~¡â¸Š|Ä^ÈmEÓ„€;H»HTEüxÖ‘˜´EÂ„b@ úcÊÀUñ²!Î‚y^Ü+Tú”ÁpÒ\rE·\r\rT(0ÇÚ‘˜%´M ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñC#ŠÒ\ZÕk\"rJS$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nĞD¨\n\"œO‡CòT]\"µB\\\0T-*P^Ä&5q$^ÊYÑ<¸‹†ƒmA0	S9)dPST ’…7(Š9xcYyë/2jp[3ÃÂ‘“P\"ıÈØÿ\0¸K@ô¡Cñ©æz Ñ1!Xš‘.ŠW1ÀÔ¹EÔİi‹Pj¹%Q·±	çWCdw¢¸‚„ƒ¬Ÿ\ZS‘\"ŒÈt°ÍRš€OÍbæU‘ªVFd85-Å?Š’t¸DÙ>á-OJcÇÆ“½·z0ÑU¨\n%ñ>Ò~J‹£½k„¡iáê±çëX’|©Rj-(Z\0!5ZÈŸÍ)È‘O*—ìK\0LÕyõ\"ZÖË™&¸æFU7M›½xaK\09ı©ÉğDÇ}ÂZ–B‡#K™Ò(ÃD!Z€¢)çšâ´¹¹j.•îµD z´•F…±	üÖ‘­Ê¤¹Kˆ!¤ƒõ°	Ë:S$Š3 {ÒƒDÍW]Èœ\r¸¥Í`eÍStØåeÁ\rÒ‚×ı‚R2dQ\\\\Ô²<|is:	E¤Bˆ¨—ç˜UCK˜Æ¡\'%i‹X\ní:MĞ^Ä&#\ZÖaû*J¹5ÙÍkA¶ –O4§\"E<©¤i€]rˆ¾a‰5‰—5MÓoj·80†é·€ ÉŠ)em:ÉhLo~XRæt8SOÚ\nÔ‰ántsrV7J‰ñjA«Ii_”-ˆıï[BD\nùPì¤ªABĞú‚Y>4NDŠR(t€ßºÈJ\'ÉxÖ&\\Õ7N*9Á„5-Ç!ûQÌÈ}4ë%ºl˜ähtQV‘VØá{ş‹>nZ„2|z€RAi*€-ˆOæ¶„ˆò¤UK¬ƒ¤´4j¶^ç\'²…›H™ªô.DPƒ\'YssTİ0HBç85\nZÿ\0\n|Ì›ªk„…ÍÓéK?Ş˜“¢ˆKD![b‰|O‡\nb\\µgMˆ¸(Zn\n 0o[À+d½¤t–µ ÛPK\0‰úÓœ‰ò¦jÌZ&j¸‚QÃÄ­eÌeStídpa\rK |ê¹™0ì„?YstÙ1ãî¦¦„U˜ mïæ:b\\µ	3”Øõ\'¨·I$£BÙ8ø×\" WÊ‘,‚bKJi\rÚ­d\Zs$Š•0²‰Z®BQ8ñ¬Ÿ¦ê«¢HCRÙÛ\nnÔB ‘În›%Æ˜$Ñ;$µ7\'áT-EÑtqê@¨ZVÍ½ˆıï[BDy™“vºu%­\0ÛU”\':r‘ÒÈîY“ï5^Ar&Y`xš‡æ©º=â7§¤\0¦«™¨¨°á! %Æ˜“ÓD[¹	ÿ\0„(±@/|Š¯%ct]:2à.…¦èĞ¶Dı+XH‹Ù\r5A+œAÒ@hÉÁ-†?ÅT‰6`Ë*	B¹‘1ã™¨Î¦ê‡½S¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°YÜD²iZÕ\'›¿¥D‹É´M\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)YX\"„såCòİ	±ğu4à\ncR	7HñVÂ#“A(Ç`¼M‘yÑÅ“(Üá$šB´_›°<R•K)ª\'êŒÑlÏ»•L‹PY·²+N@²)\',Tè%¬Œ²\\FÇÂ—•+¦FKÁÔ9t…odÙ‰úQ¯ùW\0ìyÒ‰i6Š]¥“J«Z¤ówô¥2å‘£¦HçF†€ÜÏ\n‚YOz«N4·Ì‘û\n›¡0i€#‚æÎøä´¨äèµH¡éÊØòJN‘(˜‘I ”c°\\¸ÎœdÅ´Iœ9FâÙ$ÒÓ©¬UL½éS3Ì[DhŠML\0?‡%¨%¬‡ìP¤ÃKl,K“øâj]ÑÄİHF“ä@ı\nN×I2 ç‚\\\0s¥ÌéUR)4ri\\6OD$Å´(ø£:e5u5ªOìïšRœœ°°C²7—0\r\r	™ş•™,’£¦pƒÏ¸xÒw²,ˆPaÉ#Î“µ™\Z¼@&^Ü©è\'Em\"\'è%\Zì\0ì’ÕBM&Ñ+«), ‚ÖªŞÅß½)È6¤ÔÀ4 ”ıªšÉ:8ÒÜ1$åÈq£˜”w«\Zaà¹‚ş4¨„Q«ÁÔÛd¹Ğ	(VÔM‚¥Š¢yÕBL[D(í2É¦Å¬¹à]ï¢ry0²BÊH¬Km™÷%I$&\nÎ¡%Ç.CJza9x‚=ôÁj\'ÜŠ=R©\"œÿ\0z»R(GüRh$»Ø8åt±«„˜¶…5NIdÒ.Ö*¦ÿ\0Js“É´B©€iÌâœ’¤–MôK L“îé»Ğ!Æª­Câ\n>İ¨PÄ¨Âçƒ­ ·%Át%1I ”k°\\^´„ˆ-¡MÊ§$²iZÕT¸.÷Óœœ¶A.¦¤[3Âø%ÌRœ“\r!S7{‡\Znö@*”BÒQˆ ~ÇÂ˜-Dş*£YP\"iƒÚô--ŠBÇ-~€wÀÖ,[D=½%—@!Ìn<¿¥9IËv!¨âè%Õ\Z§;aÊ‡L\nKƒwKm™qË$V›¦€‘\0Òîd<1D)sÁÖ›¡¦+t%„ŠM\nuÂäî´bÚ*ÑĞ8‰dÒ!Š·Äÿ\0Jr/&Ñd%‚ÃyyPKZÊ™Ò\\“-Ä¸ÿ\0ŠÕ;÷¥cÅ\nˆAñgìi‚ÔLLYÔdj¢^è#±\\\"“A(×pQ<\r\\h[D\ZÕˆ’M «sÀ»NEË&,ªRXs)ûPIBK’`ƒI?Ç72LqT„ïxòåOËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml…D@#À}å®©\"kDÁNüš›Şéj™:²ú-R™(ØÁ+õ­hFª!v+à)F¥Ôš\"-?X×YÈ0+ iN…ô@stÇ°Èš\\1ÇD«d¬´B›†ù¶&é^ˆÚÁO€ÜjnïtY6&ÁÔ|9zV½’%Ê6F%~·k~Pp\'ğ¢\\ºGŞˆ³íI¬c¬S\0î)4¥Bèw\rª7Æé\0Òl·æ8ùT–)#-l\0øsçÉ*l„Lcg\Zœy\02ÂüÖ¤—IË¦ÄÃ:œ1OïItl`–Mn\nÆü«w`Q\Z—Ñ\"Q–¤Ö1ß2XRèRïº\'°È\0i²ßÂ³5C²½¨rP¸ó©%¬•M“Á0Sap\0Ë™Ô’÷EŠlQ˜ÁÔmáÎ“°ª	DÈ„²kpô54ğ.N/¢UñDèÛšš\0c±äå_ĞÒèïDøËĞ4¨Ì{p¬ÉtsUYh„(Ã0sæ”¬¥XÙ‚¸ñ\0‡2*]Ñdq0Æ\n›eıèïA(›–Mn\nÆá‚ƒà)Â¥ôH–¦ª:1õ\0Œv)“¸ğCDè_DMÕ¾7H\0\"ß\n‚A²,…Ä)+ÌxRv²¶f«°\0eÌøĞî„qÅ¡§S­–ı¨„*lm‘úŠ–¶ÍTBåÇ˜Py6FŠ:6Æı@#]ó&\0ª¯ h›Ä¸²|zÀ\ru³\n>$’…Nca\nˆ9ó;Y\nƒÍS†Apñ¡ŞèVÈİN¢mqoëLº61+õ8+[‡7ü\\*_DE•9‚)5\0ŒwÍÀ¢t/¢†èea\r$&b•Ğ\n5°€[àBãÎ›Ğ†	%à4eÌŠz”Xªde€ê)˜ïTw*z¡lm–MN\nÆü«›—*¸T¾ˆ>ô/ŒE&¶„c±LøgU*Ñ$2°È“lÇ|é]0RÆÂ\\YGiÊ˜-dî— Løğñâµ@½ÓªŒaŒãe·÷ªCº•úÈVµ4®ÙW¥ôG\rRŞÁšÀF?æLıj¥Bú&š •†P\\1íÂ„Ã=RŞÑ\0ÔŞAÀçÏ•0Y@\Z\'\Z…Ã@ËŸ:¡TĞ²7F\n›-‡N<P–%“Y\nÖØ‹…×ÀUÆ¥ĞìØ\"“X×|É“¸òœ¨_Dï{ ‘†DÒà™ÿ\0?µ3[&§\0Q†cŞ)Ú Õ; Ò&ÎÃ—3Æ˜¯z,£cQ	ğÄøÕ×MÒÃD¯ÖBµ¶jà]ÇÀV©}x%½¢\'ê\ZìS\'b¾œ¨_DÛt25ÏI²Ü{è5²a€„06#?ÖEuB\0 — —–kT>nôÕÆÒÀup[ï@¥ÓÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ	ò5À[Iiµïd_:¹‚,“¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:@H†—R-±+üVU…\rĞîŒÄC–ÄGB‘©tb%Ël‡\Z–j”Õ ˜#Bœon~t¼ôJ×Zâcj@ş6°°«ˆ$VÊYãrXÒP-ìBáS7–C oüCK‚9×ğ\\Ö±?%\rÒ½‘˜ƒÜ\n¨L8ùÔõÑU‚6Ä#%Ë‘©f©RI4L\0LÔ]ìƒ4âieAt­u¦&9­(?ñµ‚å•\\7²’SÇé°ii·ªö!iLrŠY\rWÕ\0ép\0¢ÚëÁs±?-\rĞèÌ\"G5ëdãçRK :6D#%ÀÛÀTñA%oŞĞ®ğâœM/5OÛ@µÂÇ .Ò\Z	»JXúUÅÈ¯•A-@F9ji6Sr‰úTÍÀ¥+Ş–\Z!\08!ÆÙü\r`^47N—Õˆ<‡*‚ŒrÊ¤ÕQ² ÂJÛ!í+U&:£\rj**gıiyè.‚[½j‰ ( ¢‚–Ê®.EY”:)#pBÒ@½ìŸ½)’<©‚–\0…¨àEµñÁsZÀü´7HšÑYˆHàë˜di\ZÕDÈC	r áÂ“²;Ñ6f–·ÔäT9!ÈbiVVH–Z¢È44YAKûV$ŠùR$)$nB€’—½óDÜ\nyPéA¢£…ÑP_Áx\ZÀZ\Z&äÙ[¡prØ‹Œrı)èª¶Ââå¶CãáE‘]U–ıæ£P›?TÌĞ>z“¢cˆ\Z´†…ùmaË*ÚE|©2’Æä:té8j+dıè›û(d>ËQÈ6¿‚æ+òĞ§uN„=ÁÄÙ.8ÛM»6Âçd†ŞDUQoŞj5·@oû§L|Ôr£Ét\r\nZÀ~Õ¼	\"¾T‰U,nÁ¥¤æVÉûÑ7T8Y‹[QÁ\n(Lü²5›˜Ğª@øÈr¨L8Ów(îB\"’ëÃ!Lv¢ªˆ5\Z8Şß¢ãL|ÔCö¦Ç *5 ­)`8e[À’*Ü¨%¬p\0-6RVÈ´æàRÈu˜QÈ\n*oü\ZÏÉCu`º[ápq6@£Uë¢mØ„DK–ÀXaúÓC€´LÒ\Z¢ß.>5Aå@‡ö¦FÇ ]! ¥Š·ƒÈV#Nô1ÈtéÒJzŠÙÕRp)åLºÊ@ˆixG\"Û\0ó¬ü´*»¬–øƒÈq6L8Õ^ª@!leÎ[%†TÂEĞ&j4)@n8§\Z°9¨õLc¦ú@ô¨°2­ 9…h¯©Zä:t¡?Uì‹DÄ£o*íYˆµÈ¶¾9áCuW4²[¢pq6L*™ê˜$ É+l¸U\0ÕNè>èF…8ŞÖä¨¦¨|ôJÔ)ŒcˆR\0\0•ÒRÃ–U´ŠÙ7Ğ •C¥4›)½‘iÉÀ¥“YJB4¸\0QmÏø©òĞİö@èƒÜM(ãTÏUN¨DK–ÀX|h‹¤è \r@/1Å8Õyè.›§F× T\ré)`<’µˆ$VÈº’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+¢½šâˆyZÉ	UÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nSí\0âä$ŠP‹ãúÔ€^á.	E²F	g©¢äbG;cY‘k!Â6±ò\0_éaús>*,\rO)7H–Z™Ôv€È.<oj®W/¢WN\0©\0¨>²ebƒ¨è(Â’\ZI	ş§I_Úhq(H-E²^ç<k9E6ˆ²Ykâ³ÔÑ}?R{À¬ÌHµ‘tlcä\0¿ÒÒ”¹ñ\\©bod»Ö¦D5!ÖÃÒ¨CšO÷T¾‰á¸uğ½¯Ê›³Æ&ˆL\0’Š\0yxx\0*IĞ›$J¿²İdKH\rÉ{œßAˆî\nVKtoˆÏSô§¨ŠV&$ZÉ»÷£9%\0¿ÒÃtKŸ¹I½’%»Ö¶BİJ4\r$„Gïj¡KÚ*I>) -i%Jå{_R\'@h†Ô¦€qD<­–x%I:À Åfê. –¸\0¥÷ıê@/¢UK1¾ K=LÓõbc!j„İ‘27Êw¥…-õÏ€4„IóY\'ZÙu\\\0ÈŒ9Õr‚^ÑRJrb$ßâ´œùce/Ø‹N\r$„9§x%\'ĞšÔ0€âä.\0¥øáÆ¤Äÿ\0t¡$²HšK}LÓõËˆ‰‰¨G26G$ zZn\ZˆHçÀ\ZB$ŞÉ¥°@à\0K\"[Ò¬DöŠ.›§‚Jşö>D\Z¿,l‘eiò´”CÊÖç‚R}%d:£¸‚àZŠP‹ø^üjL@/¡IÖwFøÁ,õ4_OÔi‘™Œ£k*r­±¾@†–”:n¤s[\0h&öIÖ–À5jB\0	bFø «¿İH”E¦ímÁ<ì‡‘QMôˆñSI³M€<­dÌÙ(æĞ› ÷¡t QA¥3Ç4Œ@/¡@<VgFø-\Zš/§09%ˆ$XÑ7Q±¾@ı\r(tæG5ÀP\"e{!Êx„-Ú\0K \nÜ\rïjĞDÿ\0u¯N-Tò½¿B¾UO¤l‡T[€$„?¥¹à”V&	N…º‰Ä8\"”\"øáÆ™ˆôBÌøä‰¤´jhºb@ğÔr‘bá7BÖI+Aw¥¦úQG>\0ÓŒI½“~Û¦ˆBª€A\0(Ãô¨ˆ%şêBÒ¥ ªö¾5o ²*„Œ$!ı~ÉL\r‚%ğ·QrE(—Ç4ùDKÜÂÊøß%¾¶§Ô/\nƒ-dÁö lo”ÿ\0KÓõT##{&î˜!nµ\0€YØ~•´b	{ETF-i%{&V**ßî‹&\nYC\\HCË ™Ø%P:D6¡)Ñ48’	\0Pãs…ïG(ô(sâ²I‘Yê`º%Ç\nR-e@‚x lo”ÿ\0K\n)ê#šàµB$ÔÙ7nôÑuê\n\ZD¶íÆµŒ\\½‚WïTAR\ZUqÂöL¬TV€ıÑdÚ”B	Dğà™ÚÕ@ıÙ\Z*ItCQr¡¢]Wõ¤aÊ^ñ(r²=’F	o©¢ú~ <…ÅO)²§~ô’H=~–”!¹‘Ä®\0Õ“R“@¹P†€–DQ†*mZF._@ÕA-{~…kA¨$%TP~¸ ¦4‰LÔ—Ä.BA¤®8át4ù@/¡E–G1ñ‚Zh¾œÀä˜Š\\¤ZÉ‚èC$ÿ\0K\rÃF\'Ç…1n›D ¸:í\0¡\0¶áZ‡}TVí•<¯dÊÅkNUKÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½œàH\'•íÀâ´q(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„\"h*àH\'•ş\"‚u) Vé¢Û€¥†áY™[D3%8½à†£ZEÏÔLgÍ)ZÈDÃ$`jõ4 |Às\\jyˆ½’`JÖÉ Û–¶/‡ëUÎmidä¹-ı,N\0Y)qJ1ô”%Ou¸>U5~i#½Bğ¥·\0BƒxÚ¢S¶\'r€ıÉ\rF´âãó\nÈÌ›Y:l2D¤{EµÔ5Å*y¥­”šÚëkĞäÄê@„_ÇX˜Š”àÒ¥À‡pà\0({˜¤NˆÀÁÎ‚Rœñ¥ìM¬È5pĞÕrÊ¢S¶K&IÓŸÔG–\0Ö&r6²tèØdŒ\0äs¨~¸SÎc{)5<V¸Ş5Ü´…°QêñãUõ\0-p•«ªz\\–„ÂÉà2¤÷I	SÄ]G<A©zƒ+#½Bñ¨¶è\Z¨Pa¹T€–´BĞ$€éiÏ3XË$¨FÂø€G°YGÌ5Ä\n_RBöHğºÖ×\rA¿IjÙ¿\Z¡×\nkªhi\nX\0òµ¯…‚gIêd4MÀFpçTşöãŠÔ½‰²NtV^‹J††êDEAÈ	àd£÷$44„Sóã•drHÚ7˜dˆ\0ÿ\0[”b‰Æ—9²W²ÒÇ\rZqi€\"çŸ\Z±Ú$™¢åÀ‡•­û\'sœ+\r¸q©åğB´V’6Cö(çE¸µnƒE¯Rf	cd!ÂI\rô4çõîZs+YR¶kˆ\0ÿ\0[Eµ}@s\\@£œ‹Ù\"\rõZ\Zá«H$´…²*±’ ¶‰WVG£	ûä,tŞæ!‚+ÁMÄ´¡?©EÌ]hvc*‚Šö¡s†¢Ò ¯1-©‘%´C™âI\rô4ŒWÔG’%G9•¬˜S~ä@zÚ-«êšâd^È/tğñ¨7æ*\0¾W½êÄÀ-¢\\l¬¶åÍ!åk~Uk(Ù7C¢áÅH\'•íú¡ÙŒ‚%½ÃQ\0\0–ÇÚƒÚ\0šÌó$ †ú\ZT/ÔL*Éµ“µĞq\0Ø-¨|Às9ùÓ½“pSCÀvKšZ©b/—šÖ±ÈmeE·.h-CÊŞBÀV¢É¹ÈM‹ ğÎË Š lJnœàEô†ªcúPr	Ğ#ºë+õÈo¡§5:ˆ÷TóÈÚÉŠ],kˆ\0ïSEµ@çz¡’Bõ\n¯dÀöêÒn[\0AZÚ9\0,+»”#\0mb˜ Á<êÁ.e^ÉipPO+œsÅjÄ§T—¼j-¸ht˜áÂŸÔ¶;÷¬2Hj5„b~b<°<äĞP&À\Zİ,Ä\0w©£0º€óÄ\n¡9\nJÊ®˜$n­8´…(>úÚ3\0·İJİÊ‹šCÊÇúURE–ZT8‚Tş¼1±Z lM‰/{Kˆ¸ª–cæ)™‚[î…KÌ’„†‘‰ùˆ>Ts,˜–²F\0©£˜x©Â¨L‹ÙU\n`.“pB \0‹Ö¢`Ñ+0TábŸ²{êõæŠwKD H\'õÏ<V«‰BL’\rD`Ğ\n%±Ã‡\n9Á-¢¡Åey’@túZs?1XR&ÖC\0P5ÏŒ\0ôs—ê®)UÍ(ŞÈmEÓ[ Ó‹HT\0|?ZĞLÚ&ÎS†.h!+cÊÈ*ÇhH¢ÙÎ‚y^Ü+UÄªt.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„!‘Å\ni\rêµ‘9%)’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|EÉêBÓs¦ö#÷½i@«2F2G9’A¶«[Š‰’E/T°’·SŠ”Eşæ²óŞèîV^\ZàÖR–¤eË@—\0šÇıÇd(xøğ¨æz\"Á1!Xš‘.ŠW1ÀÔ¿-EÔİj‹Po©\'©±	W{!ÉBš@ê¶_µLÉ\"ŒF½ÈZ3u8‚ä\"Ù{Í`I•î‹\"t„5,‚ü)Å’ºdn$%’Ç/âÔŒš\"ÉÈ n¦¦«ã|ù\Z—å¬TÜ²×	v•qikŠ£obù«Œˆ§İH°(¤.B… ƒ­oï’RÈIò¢ô\0´9ÅJ\"‹aÇ5®9<õ7E¨¸-™áRdÔJöNcƒÉjY,xøğ¨ærƒJ&\0\"\nÛOò8\ZnJ‹¤ÎµE©¤-\'ŞÄV‘öR%“¨‹ÖƒmV¶W©É\"E’@\0• »E0ã™5Ç$Î¦éZÈ‹ƒHj3)añ©2bŠ¦FàòZdù\n“\'îAL\r…jjÂüøb•<Üµ\njV¸µ\0®BÒU\ZÄ\'i	?e*+“QCAÎÖO,éd‘\"T?b[Z&h&îD_<kdeY]º781Á¤²Ÿ)sv%Ü‰.hm¡L|h¹b‡G¤D¸¢^ê¿¸48…EÒ®«LZ.’	úodıëXH_*E•È¨P€Ì&\\O:2JDSÊè¦‰A¢f«®äN®XÍSt9Vç87M]8à”s2[]÷Z–B‡÷©æˆVZ!j´€ì/‰ğÄÑÍËQt“ãÔ€¸´´•F…²qÎ¶„ˆ²©.¤(Z\Z\rµ²\'•èœ‰²*\Z&j¸‚à6ıÍcÍÍStT÷}·§¦×ñáO™“T×}Ç9¡¶B‡÷£™è‡*‹D-VÙÈœIğÅ)órÔ]›\Z T-\' ¶N#ÖØå +d?j©u!BĞú”`>4ç\"E<¨¢Ì[÷B»OÓù¬œN¦é‡ÑŞCK})Šaá•†ˆª¸=Å 2<h}\noD.h…ªÔTEÄŸÄ¹k¡2=@BÒ¶±½r!\"|©»]º‹N’Ö€lÉáNr$SÊŠ,¥¢f«¹E°ã™¬ù¹ªSŞàÇ–Ù>n\\Ì¨%¬µ1øŠ¡\',„$š­Åüıõ@òT]º6j\0*œ@½ˆO1\\Œr U™æ$ƒ¤´4¢À|j§\"Gìªe J×(	‚çYósÔİ6d·¼1Á©kçÂ«™“‰AÁî qãğ«zì€¤@– (—çü\Z y*.‹İ22ä\n„l/b?zäc$\nùR·r	µ%­\0ıA,>tç\'ò§K,„	š®BğÈ0ıÉ¬ù¹ªS\Z%Hà×¢\0\0_ãô«nåIaáåÍÉGö¦î[DYƒbj´€äE9ûÅ0L*.Ñ°¹ÈAÉ·Ä~â·\"ìÈ·r	K‹J€\rµ[/T¤M¬šÊŸt+È.DÈaú“PüÕ7@¢[Ş#pjzP_Û…W3QP¨KÖâ\0²cÇáV%ÍDZˆJDÕn(—òı\r?%EÓïMÎOR•(Ø„Æµ U™v%ÌJ:CA¶«Y’UH’(À Yg´ÍW]ÈœÇÆ³¬ªMS²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX,î\"Y4‚­j“ÍßÒ¢EäÚ&®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0FVöT Vè(ØDRh%\Zì\0ãÏ…,[D®‹P‘è\nµ˜ğ.ÃÍ)N²dX\"y-H¶g€©‘åµ”£´À5£Äœ²AÆ³$È¢É€ˆk¼C†~>6Jé‘<ál­—¾/Cd2c‰úIF½4®Ø\0¼éD´›DD²\0ªÖÜówô©™rÚ%£¦HâÀ4´&|ª‹)º Á’rä<iè·zkH€#‡61ñà•6¢F´	±<ğé)Pî†j&FDRh%\Zô@p?ÂÓ‰bÚ%tÂD’ *Ö…<Ü©æ•3<ÒmZ#v¦\0@·’³‘k\"ıÈí0\ro‰\'.CA.“ö&5!ìîøøT;Q*§E©ãÔÑËÛ•K½ì‚tLbE&‚Q®Áp4FL[E5!0‘$šG©­‚ì<\nTÌóI´	#~¦\0@¶|*ÌÉ¬š\"“€Ñ†$œ²AÅj	{)~ÄÖ¤!‰ˆ 5.ÔI6=R¨ ÊØãR\n	Ñ7è%äE8;ó§	4›D»Ñ2I¤MoÍÀ»Ş)L™I´IØ&?S\0Ò,·şÕ&‰T«A8A†dÿ\0‘/k¢ÓQÁq ä|xRré±j@iÈ§íÎ“½Òº¶†Å&‚N—`¸—%§	1m®¨œ’I¤!k.y»ø)Jræ-¢(ŠBchÒĞŠ2‹! n\nfH·‡‰¤şÔXÿ\0¨G0à?czèãÕ %À&\0òZ{¡ÍŠŒ?jM€ÇO\'*\'§Å´B·»&Ak[âîL¹mU&¦¤Ìä\"ZÉ¿b>øÒ³)oÌÑÌıèu-\0ÒáÌ8Øå@,‡R2dXl,0¦¦ªjG&‚Q®ùW\'pZ¸K–M¢¸6Y4‚­mÎ`ºë|‰K˜¶ˆKª04§3îó¥ÌÉ¥86q¤“—€ÈÕ9(t(!ì.AøÓ»Ó¡TÍO¸[jb¨b–4Ç&’Q®ùNAÇ/:¨Ú&î…É,šAÔÖ*¦náNRy6‰è‚MLH¶|‡…\"Y0t²K’pÃ2ãTîŸ!8sgË÷ª¨‡(X²\\\0àxÕF]¶M,$Rh\'K\\-À9Q<\rk	1m\n\n¤²iC1à]ãU)9mbÉrêbih3—éC°¥•¢C€˜ ²bO»Å*ì„\n!ïF|…P-DÁ@İO‘l¹üjâ^öE»’ÁÉ¤”k…–Èì’Ö—)m\nio\"Y4‚­b¯ìïW\"òmd¹Ì–„aIÛ¹SD—¦àihÂäŸw\Z P&©e\"ï@Ç—X-DïŞ„¼à.tÅn‹%¨M\np\ZW#‚xUÀ±mhèD¯Ò!Š·ÅÜ*¤^Ll„0\r#|)’Ö²¦Jq€\ZÑdRNY ãNé\n Q-wˆ<y\Z ySº[œ .Ú®\'šèA¿I(Ç`¸‡èjàXòèªè\\D²‚­j¯\rTä^L•ª‚G9Ÿ(\0f}Ü–‚ZÖT’\'<ÉÃÀs¢¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹ÈZX	s­_Ö•®¤—,µ‚Y5­.Œü©}4œÁõ\0ŒpB™;ğ4¥CÍ¢^÷Fæ¤„Ì/¶/d\n£A\0‘‡Uˆ5¢&8Öì0\0{^•ßµ ÔBU[ š¦1‚Y5¬oÊ¸ü©u%hŠM`#g&Şµ2¡t=TÇFdE¸ãıªe[$(Œ\0Ô0°-9óä•–Hö&5¢q©Ş\0¼x­MÑå¦©Ñ0°D& -Mƒ$K–	Œ`–Mn\nÖü æìAò¥\Z—Ñ\"Z0°E&°®±A\\y-N@ÅÅ’©M{ÀÒà–PU‘ª	E¤BrçT’ÖI1>@d8Ÿ\Z‚^¥\"jŸ`ê6Ê¥I(ØÁ,šÈV6Áp.Å|©sd‹²a`‰úÃQù`­NJÑšö¥Á3çY\Z¢÷W¥°…o\\ÿ\0j“D¬˜Æ	‚Ÿ 2æEI/R‘÷\'E`:ˆä2éğH”lˆK&·c~^Ù`S€r¤’ÈÌmŠM@#ŠdåÇ4N’}µã2&‚0¸5œ‹ ”E€jmò áãÊ¥Û½.õa­œjvŒ¼xÒ©ïGÅ6(İ!ÆÙpúÒvºN­±‰dÖBµ¿(8.7ÈSÌ_D\"1ˆ¤/\rF»æµâ™Jt“è“¢|eáº\\4æb —C…Nh€Ò¹ñæ1JNÈwVÖ	Æ§*`\08s<hwC—¢8¢1ƒ¨„Èphvº¨ØşôšËUŒ³AD.ùSO‹õNìÉ¬5û9•WÀÓ‘bú 9\nåÒ&’03çåRî€èÁ\0V¯/~c…İéÕP`œ+ŠpjáÌ‹-èv*ãŒÆÒà™À|i‚×G6¨DbY5–«[òğ.ãÌ\n¸VO¢£I¨k¾dãÈ\Zr¡}ª©#sÀBÙR%ì‡KsDS|9ü)Ù:j„0N5:Âà—4Î˜/Ş…LŒÆ²Êøz¨–L6Ë&¢­°åÇ˜¤EôA.8 |b)5´#ó&Øá4L1tÃ²\\±—¦“lÇtŠ`¥=‚£Ìqğ¦Y1Á+Kf\nì2\0áÁ|j…Szªde€‡8Œ9sZ Y=h–%~²ùWåÇÀV¸ê_D8J{OÖ1ø¦NU_U ÅôM¬2¤Û:.˜)/h„(ó|ªj„Á)E­˜+¼€?¢ñ«ªhXÂÀu8&UB‰ºP`–Md+[f­<yZã\\ÙÔ@ö¤Ö5ß2XÇÎªA‹è˜4b•+‰¤„Ì.#úQp˜,RœS|?Èğª²w¡KÒ\'\ZİÌƒ‡3Æ¨U…671¥M²\\K]3Z¥	^^B±¶\nˆ]ÇÀUÆ¥Óv¦¨ÁšÀF»æLœN>™¡}~ô°¼\r.	3[*©.­¸`àxqä•VïAA¤N‰â\0Éª5LQXXÓ¨Û!ÃŸTO)ªj°HıD+Z*!v+à*ãSÌ‚P=¢5\0Œv)‘<ª¥~máĞJÓ\"ipLÂåı(½’,RÈ…qò§nõJ\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ	ò5À[Iiµïd_:¹‚,“¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\nÛc‹–ÈqÊ†j ”ËLÔhõ\0·²qN5>j©¥h‰®Ké\0¦ÖÅ\\A7ò„Ñ¹®K!i²›Ù*r,–¼P„„¸]Ùğ^‰xPİ4NˆHàå±G•KjLda„l˜dK7ÌS4L\0L4´\r@/1Ç‚ÔÖVºŠêµÄÇ 44ôÚÀpÊª ‘[$S×£t–›+¯bÎ”âbDµt [¥Á\n-®¼0kñ¡º0Ä$s^M[İPj€ã½1‘ì€°ËúÔÙ\"MµM\0LÔhR‹{^Üj|ÔŠVZ¡cˆ\Z´€\nzlPÚ®.E|ªX&I€:@ ”RVÄp©ÈàSÊ‡BĞ\"n—&¢ß·ñ®<¾Zß²àVÉl«9V©šÈ„dmøÔÚ©|Q†‰\r¾øùê|ÔIl†7E½%,íW\"¬ÊIÑ2HÜM:M‚•²/NG–JÕ(\05¢ Ä¯uÇ?%\rÓwµÓ>Èy&É€ÏÃ…A©RíŞ˜Èƒ	 Û!ÃÆV©Jé¢f£nPû†tŸš‚è·zÙn ( ¢‹Y?j¸;VÊIÑ‘¸Hii(®+dñ¥‘À¥’ïK	t¹5ckãí`~J¦á„=Íq6L8ü*MjLd\"2\\,ØåûÒ²TV‚v£B»Ù8¦dÒóP]V¨£r\rA ›(²­ äWÊ•QIéB	Ì­‘idp(Ü¨I\r45ÀBÛ>u‰&47C…f÷Y0Ò½PıŠÛXK”¢aÃùZVª«Ğ&j4ä\\S3åCóP]\"JÑo-\Z€\r=*,íZÁÈ­’º’ÆğßH¤§ªö#÷¢n,‹,úD-ÒğEAuñà|k\'å¡º U:÷)DÂ‹ÕTl\"2çdÀä3â´Z¨~Ô%¢v–´ä[Øy¦5®‡N7\'¨\0OM¬¯[ÁÈ¯•†XÜ‡N’ÒGÍ{yãNn,Š¬È n—„r-®¼1Y¹\rĞåàòT&Üi¦á\0„0¹ÀÚö8\nb•)  L£Õ\Z¡óP]7M75†…»m`¿¥ojùRîK–7\0t€Zl	½ˆáU2@¥“u”´BÈ\n-±ı8ÖoÉCuWïJ|Aî&ÉqÆ›=QdÂçn!Ÿ†©»÷¥–‰B4)Å3±ºq«=§!lqCCA8(°ş/\\ˆ9ò¥t©cpH§‰[ûŠ©¸²`éªÈæˆB9•? Â£ËCuIOˆ=ÁÄÙ.8Õ^© ûA„•¶\\ª…*€OŠIh™¨Ô%ÃãV>zEQ>Ôq±Ä\rA \nÛX\näAÈ¯•\'K™\0éD6õ^È¶«“O*|VB!\0(¨1¾Â£ËBªéOˆ=Áëd¸ªºb”@\"leÏÈPeT.hRˆ5\Z¢Ü\"qN5`P!Û½Xí!t†‚›XÚ¶€2lnéRµÈté-(=W²~ôæ²`öİe @4¸!B]W#ÀŠñ¡º«¥¾ çdÃSsUP²XŒF\\å°\Z \Z©(Á\Z.‹|iÆ¨<¨.˜(ÚÇ%Ğ\0~›XÚ·Æ	½’±A+\\[m$İ{\"ùÓ˜1·•1ušĞ„põ¶çÇ¨òĞİ3[%º ç-ˆT÷-S=UíTØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%tW³\\Q+Y3Á*¸…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“FÆ>Pÿ\0KMÃ~¢9ğ¥ÊMì¤­Mˆj¸\0%a…1/¢‚j*€U|.£ô+G\0Tº`[4”OY6	R{	OŠ³%	\0¥¾)ãY˜±}’€²HZK}MÓõ>)YA¥“ØÉ$\0¿Ò×!ÓõÂ§”Ÿ5’+c\"\n\rÀ\n&#ÒPKØ$§€J´WÂê?u§«)z¦40”CÊß®)ô&3Ú‹ì·Q(KHÒ¥øó½Aˆô*x”ñXu0_OÔ€Æ°1\"ÖMß½26I(¥‡¢2^§”›Ù\"ymu±A×k@K \n07½©ò‚_E<À!@ºŸreb¢‘?v&ˆ)¡¿(%/ÊÖç`•V4Oz#ÔJQCÎj@/¡C ,’ K=LL\\ikÖ‰	8ñLc(¥‡éÌø®\0Ôˆ“{!m\\„4²b0æSå½‚’tO\rÄ¿½‘Z’KòÆÉ#\r¸i(‡•­Ï/¡,F£‚?²‰BA\ZT¢_Ö À;ıÒ“ÑH-õ´_OÔ<\ZÌÄÆÖIİù@.ô´¡Ò¤çÁjye+Ù­±Â5„\0B #\n| —Ñ+§âĞâT¯¸ƒH–&1ªD¢\rRÖ¸‡—¿\n\\ÅØ–	h¬Â%’MÕqıj@/pRt£±Yê`º˜\\EdbBî‘>`‡K\rôàHç-#Ü‡kl#P7k@K ÃÕ‚_NÔ3I¸j•â—P™X¨ ›Ä:0Óf¹Èá‚Ï¤dç”Ğ˜J\0ĞIµñÁ1©1bú\"É.ŠXA,G0_OÔ<8¥fAÈp­‘Ë0C¥†ú~¢9®H{’v²ĞØ¬ ¦ÈŒ1Sj±Kè‡)šqhq*Wöı\nĞìycWET#\0\\@²Ø\nnIå4$³urT¡ÇÆƒè›³º9a°ê`¾”õË\"fAÉ»•MŠY€sÑ¬7Óõ\0Ü‡	íºÃ´é$–ÃÃh\"	}î¬·µÄ‚sÙ2±QTÿ\0tUÑD\ZJ€ë\0rK%³ÁW3‘Xİ-Ğ´8¹n•(EñÃ Ğ¤ë#ã|@–z˜/¥=@x`R¥¤;•87B#–Pı,7Ò,â9ğ˜÷$ídÑPB†€™l1áZˆƒ\'Ñ7íºÛ–´›WQü*·ĞM	4’öAÏ\0*$ò›!%ğ·Q(H!(A[œ8Õr€_B¬±½ˆßSB”ErrâŸ­O,£k*,G$ úZo¦ú\n¡+ÙÖLKv€B%°­½ySz sJ–‚ªqA{àV¬#dôà€Œ$\'ìŸÂSCdî³¾\\„‚J!\\SÆ¯”úÅ.±=ŒÏSôı@rL@¥Ë(ÚÊ®€2I\0/ô°ı9•ãÀ\Z¨Ä›ÙíD!\Z–á \"„s+hÄö	½UâU<¯úX­hçË\'Ü”A(×CËÃ;ªÀš $> \\„‚4©ç½W(ô)•FI.g©¢úRàrÆ—)¨T%Ò›’…yÒÃ})ê#Ü\rP‰7²nİé‚ëÔ4(‰l9Ûm‚^Á\"^¨\\\n– W²ekŠĞvFÊ‡jQ$„ğÈ~ÉF¬l’Câj’„‚NÇ4r±{…N±½ŒßSEôıCÃ¤yl¨v lo˜ÿ\0CMôıGÇ€5@{&x&6 \\\n\0 @\0Œ?N5¨‹—Ñ\'BUKAU<¯dğ ŠĞvªá,Œ$\'†CöJ MŠN”è†¢ìC‚)C8q£•‹è¨•í|`–úš.˜¸qñ©å\"ÖF¨\Z×Êw¥¥œÈçÁj„IóYRĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){9ÀO+ÛÅhâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ™%ßKNQDÚÈ%L‘\0êh°9–8Ôó{$;BÖ×A¸‚Õ²Ş˜˜¾êWªkA»€@+[€ÂƒrBW<Z\n‡8(&ÜıÄRN¥è¯îâ.\ZĞ©lF^U”§VÑK &IA\rô4Ù~£ç•eÌM¬0É\ZılÌx®)HÌ‹ÙËc$\Z´âTEş<(\0¶ŠjĞĞB¸O[•…©êLlšĞAp\'QóÈŒEÖ¤›e&¥‘¨¶á¡º€(0Å5™˜%´K&IA\rô0çõã•dfM¬J¦1ÒF\0w©˜x®\"£œÆöH‡<VØä\Z€Ui\n€¾­W8´HÒ‰à\\¸ÂÅ<,u\'¶6	qÑ5 ¨$(\'$½¿pj	o˜¤J2ö©mÃZ!† VrÈ	àFèÜ”#@cÅ}GÌ`+	L›$İ·Ln¸€×êhÀŒ@Ê¤d\"†È5 [Xğ\Zºj B/ûÓşÊ›\'›–‚òµ¯l€¤ML…‚TM\rD$§’œóÅjkIJÉ¢=cQ\05P 1çj™dÕå	7µû“hĞÃõ}D	…brk#â˜Íq\0ê`ú¾ 9©½OÔ½’â¶5íÕ¦å¥º¬„<éŒ€Ğ©M\rÄ´‡À`”‰©Ñ`mÁ!A<”ç+RMŒª\nU=ÊÌÔ[t\r[€œS;TK %´RÌ”~ìÀ†\r6\\ÈÃ«#2mdÑ0Iş¦jÔJOHd#¹[#CƒEÚB›/†7½?¨’ø&%Éh!<,B:	5”hH´›ÛaJİj^¼Ò¨)w¡sÚAThT(±Âƒßu4—%4hiÌüÄVFfV²i’ ½MÕ˜y\nÌodªÔÙ­*­!P\0Eş<*Æ@h¥“w4\Zo…p ñÆ‡Ö6MV“és!Ç•Ô(ÆÅrÂ‡«È:D.xÔ[pĞÕByÚƒ’.Ú%ñYdÔkNQG9•¬˜*šé\"\0;ÖÑe d¿Ö2/dÏjp{ui¹)\0|kQ×ŠéÄ€‰ábù\'óC¹2\0I!´Üñ·<Aòª¯šU	¹K|.-+¤5RÃ@6£êj²Èñ$ †zs?1<*~¡=Ê¨€}È@õ4[P¹%ãT2Ü„Ğöê\r¹º¬„\\ş·­cßuTæâà,éú`•Nk(Ñ“¨@ZlH.ÁM¿uª¢RCƒD—<}!ªKiÇôª9- Mc“îJj1§?©<r©ú†V²¡^ô¯ù!\0;ÖÁm_P/\Z¸ä\"öB`xÔ …²|?ZÚ9\0-÷SojÜHåcå‚UvÊ6’‹J‚àH\'•íÀâ´Á´Š®ä‡¼j-$€¨\0[.5G \'öBt+şä€†\r9æG¹yR9	µ“KY\"W­ƒ<ÀóÄ\n¨ä\"†É‘®¨ÄÕ§©b/€¿\ZŞ9\0-¢{ÒÜÔ$€@•­Á,• ?xh¨K#[‰å{(ñZ¡Újâ³É .#\0ÖªØá˜áUÎ	oº‹Ì’5éa§æ#Ë\0is™PP&Ìj”ø€õ0YBêSt«\"öTÏŞš$n­8´µl<ëXÌÚ$ÁT´‡•±\\\0h\rä,‹w%–’…ÁWÂå-cŠÕ\r	\n¥ò-¸\rn¤°Ã3µ#0dßud“îJŸCNQeHL›Y]Xt‘\0ëh@¹Íqªæ\"âˆS>ãC€ZBœş7ºÖ±˜´C!p7sA\ZlO€AZĞD²\rœB¯…íÃ5`Ô‚’ç…-¸«Ã÷µn[DÖW™$­ô´Ù~¢<yÔó“k*,–‘\0êh¶¡ˆú¡2/déíjÓrÒ5 \0‹øÖ‚@Ñ¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆBP¦Ğ~«Y’R™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E‘™d5,Mğ<24‰bÁ#Z#d‚BBzr<}Õ.ôE‘Z ­ÅÇÃ¥ä¨ó!k‰Å\0:KIúodñ½TI¶JÉ’9È-\r& œ¸Z¦d‘FJ\0 j*äEø¦5‡¦éØqFé–\0)N<2µI-D®šÉ„°7Ò–)üğ©rR!ª˜Ğ\"\nÔ™şoIÌ*<ÉTÕm…ÎEr’¨ÛåÇ:¸’|ªJl…ÚI¡ ÛU¬•FBH¥’¦©mVêwÌ‰À™®<‰•J5L/-jâ–&L‚›ƒÉhL~5N•¯tàA[b€)N?±¨æä¨ºLë\\%À\rHA86ö#ãZD+åHû“\\ˆÒĞ[„°¶?Åg’DÙR L×².qLk)sTİ	Åá\r#Óoè•L—\0šÇë% [UıÈ²k@ˆ+PE7>\\*¹+¨½JÙ	v›¦“tlBck@¯•I5â˜õK†ƒ¬Ÿµéd”ˆ§•ÑnõMh™ªôÔ!0\\ëŒO5MÒªaxŒ†%°P\r¾5$±E¨7	[¥BXİ\rI“Ñ\"SP@ÕjjÃÅxf*_–¡MìµÅ«O«Iª7Õb8çU	+åJTrm(·µéd‘\"”Šì­4\\ZÈ˜s5Ç22©ºHÌ‚2\0QáÊ¤š¡ôDÇıÇéF¥ïğ¥Ì\rKa\nÔÕ…ñCÃ)srÔ]%¦-IêÓ¤’HhÕb8ŒEi	+e$½‘K¨ƒ¤´4jµ€Oæ–I8#½$7ï5\\A(–±åãX“ÍStè;Õ¸†85-e#Ÿ\nFMÜ\nØàòZd±½ıÔ¹ˆ$¢ÓöZ­@äKÜùf(æå¨ºNéñj\r¾’Ó“BØŠÖ VÉ:¹uSHh?R‹\"4NDŠYØ³éûÁ\\…ÈŠ,mÇ3Y?5MÓvTç84¶Èß>	ÂfMÍ´‡’Ô(–<j|ÏD?r…¢­ KÜù*ŞŸ7-EĞÀ¦Ç¨V’ÒTé¹DO;ÖĞ‘¶H¾ˆfÔZt–†ƒmA‡Ÿ…9È‘K!ûVm\"f«“R\"‹aûšÏ›š¦ê@÷ı·§§>`Ñ“î3O¤‚˜ßÇ*`º9­º˜@vçÃ1T%Ëd]zjÒ†èĞ¶OŞõÈÇ\"kMÈº	µi(ZĞ\nú­—ÆœäH§•ÑeÒ&j¹5\"(	‡îjš¦éÚ‰R81Á¨‚Êr¾5bMÜ¨\ZQ,<H\\İ6LJ¡ıªrÉ¾‰nh„jbjÂøŸB\\µGÁ.„lĞ¶L“×\'ˆò§{¥L]¤¡ Ø8\'ö§2H¥ 3¶«V«®QXùæk.c*›ª¨J{Ã\ZGšX|j¹›¹]èƒõ¹Í\r²cÆ¬¦ˆ¨¡JpM `/îáZ	rÔ]4l.OR¹M‚ä˜×# ~ÊWµÒf.Bh\0ÛU¬‰\n¹E<ªXÈ…uÜ‰à˜.uÏSuIR<1Á©éD^ªdÅBHpysPéLxşÕ “¦şÔ·U©©øŸÅP<•Õ62í#V’ÜQ·±_}r H¿•gs––†‚>kYªäIò v,nPä%‘b=æ³s;İ]BSå¸4J\\¥Sµléb@÷9 zP¡ãTÑ4A-±@ş™çT%EÓº8Üáó!i$ bÅmZ¶R—3ŠCEÆ«YÊõr$Š0\n®2’…v$\'øÔ‡O™4/0€–Ìğà”İ‹&„H$.hB‡÷¦ÑK´!ZÈ—Äøp«òÔ];§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁgqÉ¤kTnş•/&Ñ5r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm‰îsH¹Ÿw%©‘k!Y\"q¥¾%Ç/+Qr¤R¥\"£¼Aù¤æ%	°’ğK€C‡:Nô)\\£aI¤”k°\\?À4…h‘ìLQ$ˆ\nµ˜ğ.ñåS2òåC&¸¹€€g€áÉj$Z‚È=ˆ‚NF€âµ™.R²cRéuÔ” cÈÒv5RjSá%àêhL¹üEK½ĞSc\")tŒwÊ¹;Ç“Ğ©ÑÓ\\æÍ(h*Æb˜|DË–Ñ-8¦<–4ihLù\nÈ’„@	†–ø’F…L‹¥«§´ˆF—aˆpÏÆ³vJıéÑğK…²çñJ—{ ö&ÆDRi%\Zü\0M¼–”dÅ´S¢j‰dĞ-`WUØ*2- R8§<–¤\0Ñ‰÷r¬‰dş(ı3fOğ8­A/@¦É­HB;Ä8yr¨v¢NõOˆ—ƒ©¾œ­(Ö¥\"é¬\"\'é%\ZôÒ¸¹-8–“h¤·Šj‰dU­¹à]ı*2K˜¶‰|^K\0ÒĞ–^B³‘!Ñ\0\'\Z[È—!ÄÔ“±tÖ¤\0µÂØ‡ù\n‡nõ7N‹T€—§\"˜ñ©wº((‰š	F:árqË’Ñ1d»ÓII¤]Œ¹ÿ\0êvÅ*g.bÉpFòæ¤\0ÜÏº³%¡I€\rËG€¤ä¤õLjBÙÜ?cáRìŠ”ÈÃ	p	—ïåHIî•-tMHŸ ”k‘\"lˆÉ¤Ú!Ñ–@ÕVµU0.ñ¥9sI´J¨äV¥¡38şÕD$¨¤á€BJ-\'%V„!ò cÈğJNBG©à—6Ù[*{¡Õ±#“I³_‚äìÀŠ¨Ë”¶‰£’Gék1¹»¿¥)KšM¢¢’1£Kl¡JaåH–²¨“#$$‘‡‡\Z›& HB\"ŸÏ…E\n(¤jğu4&VyUJ„ŠM£]p¸Ã’ÕÂM&Ñ:²$²iZÅT8ºœ¥Ì[D:€i3<9yÒ2!U-d—0Ò,.9xqTªw²*¨„áàáŸ#áL¢S5<@à\nU÷O‚[HŠM(Çü«“—J+H,› ~™dÒ¦2ç›®¾)U)sÑÈ%.Œ\r-Væxró¡Ù;Ñ!é8ÒÑlK\\‡: _½ªYÓt»Å®\\ª!0_½¶„6iâ9V‘.¨=’­šIF»È®u¦9r–Ñ	o\"WéZÕ\\ÁvcšUH¼›DÃY*RX4æxQ*T\'­R0Ò0Ä“‡€ãL²®)DˆF“ÌƒÇÆ¨º«¥°¹áÅÃÓÏÚõq/tjÅ($Rh%ÿ\0—ƒ]‚rQ[c“Aát§¤²iC1à]ÁxUÊO&ÑP³¥J\\À­m¾£ÃÊ›²¡Ø³½\'\Z[†%Çø5@º,Rœ.ñò«‰dø a/SBelªÁ%4¶¸C!a(Ç`¸?ZÒ‹hä\"Yt‚¬j¯ìü…\\‹–ìOGÕ*bX\0h\Zs9Ã•7ÕPYÜ“Ñ…”‘oÆ©Ü†E ik¹–¸y\Z`U^¡¤i.2<G¼UÆ´6OVKQô’v‘à¼´irè‚ŞD¯\rZÅ\'9ÕH¼›D\n ˜¹ im³>ä¦ídÍ*H™ºFRŸÇ\ZndSU¨BpæÏÇÂ˜¢lèXK×Pp)ìµq­ÑÁSHúIF»å\\¸rZ¨–-¢jœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D#sKÀÒà†ä.U­¬¥êˆÔ\r¬ãÌp©4ïM[Z\'\np¸pO¥w&êMˆ˜c8€8pçQj”ì±‚Y5éjƒ™ùQ\Z—ÑA>ÔÇ0E& ±LÇÎ¢T<Ú&,˜ö4†ºÙ…ËûTJµ\n^µFZØ¦áƒ8ó*ô;¦FÑ8Ôì€Ã™ãHÖéY>ÁÔà™\0bj\nD¹M‚Y5¬ji\\‡ò”F¥ôHĞ2a`ŠM@#\\º“\0xøTä_D´Lsˆ†ÊŸŸ*ÊU²Iˆ ÍÎÄyT\Z ¦µ¢`¿A÷ÖwªVZ!a`:ˆÓ[TÔ)%ÊllÉ¬…hùU.ì€¥\Z—Ğ)‘jİ\'êï™2<y-F@ÅôBs˜_§K½8øÖ&¨ôzD#Pó¤ÒÊMÓZÖÌÕ8`\08s<jGÍt‰ìZ!ŒÆÓ¨#\nN×JİéÌŒK&·kSH8ù¥(ÖO¢)†1š€F¿Á®_àÔN’}tÇF^—[êçı«9IõLÒØ¦áy·zWLcDãS¼F\\ÈÎ¡İ\Z§ÃŒn	PpğãRì“¦GšR÷clĞp.Wš\nQ©à‘%˜\"“Xo¥Ø€<|)N…ôIØd@×[1ÇŸ•fkd•èl!G G©%­tj˜Ö	‚’\0É£.dfµ.÷ºDÕ6(Ì`ê6ÈRvºDº&Æ%“Y\nÆáÀ¸`|©}$‹]£É¨\0ëÇÀÒŸË\'Ñ\0’+tOˆÈ\0kŸö¨$›!Ca\n8ƒüñT!X\'¸ˆ\0]94™ûÒqØ8Ì`ëu²ú\0k£™F±²¿YK~UÌñÃ*¨‡/¢S˜ØŸ¬¡ß2dxáDƒÑ®HÌ‰¡ŞœÂãÎ‘ds s\0\0ƒŸ1ŠRb;Ğî„F\'»š\0pæxÓ©)Ñ[\"1´ê(2(‹¡cI¨Lmš¸.7ÈUÃæ/¢	-Å˜\"“PÇb˜qğ4åBú ½ĞË‘4›Yhwµ“	n`€(¸6-9ÓvµÓ¥èlÁM²\r‰5@“tõTÆÁ6Èd\Z¡K¡XÙdÖ[éoÊñà‚®/¢n–öeÖ1ÿ\02`î\Z©PğC •†DĞà˜¸ÿ\0joìL‡´@r§>c…P-eBéZ8Ôì0\rs<jÁ~ôZÈ¤8úVÁpq,›ºXŒK!s‚±¿*à\\)˜¤*]7Õ*HÄ2k\Zï™0ççU*IôOŠT¬2¥Á3úª›*½wµ°…`AşE29mtÇaJÒ&\nï\0¿ŠÓNÖ²0°NµÊd*Å\Z¤è¿Y\nÆü«w*Ûrú?µ)ìI¬k±K\0q^jä¾ˆB•+ˆZá§êûÑpÊ‚ÎæˆB0WÚÕb–U~ô­\"p\\ì”\0?“Æ¬U1D¶°°6ş+HÒè±K¿Y\nÖ¦•D$]|iæ/ L¥½‚)5€Œ~)€wÀÕH1}J™†@4¸ ¹G?\nb¨)5°·Sy8ób–Ut­-œjv\0‡\ZaÏznÈXÃ:²à•b•(wKk’k!Xß•p.ãÌ\n¸Ôº§¢SÚ!“PÇb™Ë…Q¿6‰ •¥é¥ÃNa*w²»„‡\0Q†`œ|8%]»Òt¶a¨ó\0¹4Ã›İ5LaŒç[<*£J”=P5¢Wê!Zß•p.ãÍ*ãRú*TZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ	ò5À[Iiµïd_:¹‚,“¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®OJ’—½ˆ\\3¢`K!Ø 	t¸z‘m\0s°/\Z¤+TF0òMZ“=P™A„½mÃ…I\rTµL	0F…p½òâœMIù¨.‚V¸Zäõ\0\0)éµ‡•TA\"¶SªcÚí6ÒZJodıê&µh…©QÂä-¯l—1X\rÒº3‘ÁÄØoëIº%Á9‘É Ù,8~õ<PJhIÚ@n8pÌÔ±•â«d-qh]! ‘éµ€òKÕD+e%5ìpo§N— W²/:œ<©8z¡h€×(¨3ñá\\bñ¡ºo®©ŸlHàòT ¶GÎ ‡H\'2 Â\\¾GQjè‚JpV£EÅïl8fjÎ‚ê,¶B×oM¬Ÿµ\\\\ŠùRfM|n\0é\r-\'²/Ÿ*Œ,§Š¦¤MG 8€15Æ/\n¦ïMS¾Èy[|8T71RKQ68C	r”L8Z\r*•ªnœ\0˜#B‘{åáÆ üÔR¶BÇ ] )\nÕÅê¢	ò¤O±9ñ¹=(ZJ+¯d\\3¨ÈàRÉ?µ@… =EArx/:ã—\rÒ)¿gî9®U	òñóçP{Pı‰Ì„DâåÀTqRQ€\'j4àj|ÔH•²Şt†´­µ€È1«‹‘[)%‘¸4éÒZJã¨¢-NG‚8”\0Z\ZàE¶küVòĞİèŒ!ä9l@QRj]Q² ÂH_…K5JD¦‰çáï4Ÿ‚éUkŠ\' Ô¢Ê\nXVr+e.É\0é\0´”ÅlGùQ7‚-£ìµ€â‚ÿ\0¯XŸ’†èº\'BàâI,3ó¢õM•¶Â\\,2\nV©):½?x#PœyÛù¤üôCğZ#c‹F­! ı*,’^´ˆ&öIÔ•\rôé-6W^È¼è“‹Y³§ÚäT[cfü”7LU:òn;ÕÓp©°ˆÉuÀÈeLR¥\n‹~óQ bT\'éÆ€y¨.•“#Ä\rA­hP­µ‚å•m\0H­å±9IAªöÇÎ‰¸²Ú²ˆF—YÈ¨3òÈÖnaI]R[â!ÇıiŞ©ƒØ„DÖå°Æ¨Pº}×@Z&j\0¤æ8øÓš‚èr#cˆ¤4ò”(ı.k‘jÙEÒæÁ§Hikˆ\0»ÕbÏÆªn,˜=·XÈ5¢Û5ãÀÔyhn©á88› ·\Z®)„¯²#sœ¶Bƒ$ÇÎ¬v¦ı©Nf£@.H6#Ã2jÇÍAtÑ27\'©AEiKû\näcr+dŸÚ•3\ZƒIØºê}Õsp)e@²ÆGÙáê!P~ËÀÔyhn˜÷$Éy[&b¥UûÒ„A„¹l0<i·)}%ÀJ¡N$goÜáW7dLcˆ\n\0mîÒˆƒÉ/\\ŒnEl)31ÀĞ%ŞÈµrp)åT*±”ˆ#…ÍĞsÁxT±\rÓºKâpq6EN5wª Y$F\\å){`*ÀdÊS€˜Ğ¥öCšq«‹Ê7GG«Hh8´¥€?¥r äWÊ“Ş“3\\\Zt†–›zŠÙÎ®@K&\nÉhZÆ×_ÅCĞ«ó%> ÷/¤€Hâ8-Uê˜)\"!œA¶C‡óWûZ!-ÀNÔhõ\0·±	Šfi‡‘atíÜ‰qhT\réµ€òJŞ\0Ÿ5\n\\ÍvŸN’	E7±şj¤·•6e”ÿ\0ÂÔpõclÇ>¤|´7T\nT‘õ²*{r«Ê60Â\\–B©š¥4%&j4z…ïŠf™š~j †ª(Øë*ƒôÚÀ~Â·€$VÉ‚áI\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WE{5Åòµ“<«A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸\"j¨$\0K&\'aJVVbn¢P@\np¾8q¬ÌX½Ã!Ø%9ŒÄsGÓõÄV\\¤ZÉéŒkähÕéiC§ê#Ÿ©å&²²ÆD5„\0FÃ\Z|®^ÁI)àX´_Ô¨Ï\"•\"K¢0.Ö@•¬™à‚§½\"ŒÄİd¡-!áÏ5™‹¸)Y,²Hs=m_P¸ŠÌÀK ïM’L¥†á zˆæ¸\nRodÛU¹@…h\n\"(Ã‰°ş)ˆ‚_î¤ïÜRÖ•Ù2±Z’t\n8¦CI 7ÂÙg‚\nƒØh„d*T¢_\ZÌÄN‰¨Æø-õ0_OÔ>\"°”d-d=8¦ÆÇÈŸéiDndsà\rG)7²NËk!À…\rhBB\0£tùA/`¥Ö€\n\n©ıl‡TTŸÕ’=‰À|­%òà™à•›Õ‚E3í\0âë@\0›ã‘¬Ì@= ©Bc’ K}MÓõ5™‰¬“ºll| jô0ßJ#¨å‘½Oµmd-ÔP\0K°§ÈŸD¸h´\0nÖ•R¤Û0‡©&àRœÑ€$€=ßÂVdÔD–R‹ìEÈHpÒ¥8áÆ¢Q\0“VG?nXA,õ´\\¨YXJ$w\"‰ŒI@/:XSÓõÏ \rO)7²—[#€!k@E\0­Ã:| —ÑI:j˜±¥uJl™XƒåRú|S\Z.Ö¸ •¬ƒ¤’ü¦É\Z«0´8¹	k€\0”Kã‡\Zƒ/V(.ÌoŒßSGÓõËˆ¬Œe%R˜Èß ş†é1øSÊMì“Şµ²¨h ÚØcÂ¬D;Ø%Rœˆ•ıíúh$Ø$¯OÊÒHCË‡<“èPêF¢P@\ZŠ|OA\0Ñ\'JtrD	iÔÑ}7$\\R³ -à•lò€^¡¥›©øCHù¬‚Yhl-Ô\n\0O1†7µP‹—Ñ\'G§.8^ßºÓ}C«Ó€u€ğ²	CèJ-Ğ·Qr( Êøá{Òåbú!è³º7Ä	j–‹¥Ôx©b-dÁ½Sc’P®:ZP†¥ÈçÁh\0Ÿ5‘bœ \Z•h¡ÆíZ\0	}Qn-•<ÿ\0KG…[›İQn\0’ö·ì”ÁĞÙ	.„&¦¸\"Ø‹ã‡\Z@/¢*GÆøÁ,õ°_I»€åÄ\nB<ªèn–#|ˆ]èiús>+`\r1JöN¡4Bİ@¡h\n ÃÖ¢\0—Ñ¢¶BæâÖ’Tğ±`ıÑPSø%¥­q-ÒyYg`S—bhšCàhqr×R„_8Õr‡}jÆøäˆÏ[ôı@râ.R;•;÷ É0C¥†à}GÇ€ªŒIL_dj[€( aú\nÚ1½ySzğBàn$~?\rh\ryb]	.£I@\rŠ<V€ÔFUCŞ³¾‡A*İ*P‚·8qªä\0¿İ)ƒìX¤câ·ÖÁ}8¸^¹d,©Ò„o”ïK\rôıGÇ‚Õˆ™^È%ª¯í\rA×\0(ÃØV‘€æà›Ñó4Êşâµ£›ERK°%ûc`•`ØÁ1B³¾&‡!-pÒ¥øáÆ«”ú\"«Œ’ K}MmÓê’cG)V÷¤†>Tsı,?OÔ|W\n¸Ä›Ù=Fµ¸h „¶§\ZŞ1¾ˆsª*–‚H&ø^ÈpÅEh;#dÏjY4”V@™à‚¨ˆ¸HtM$‚Cš\Z	B/|“yÕr€_E@¬22HC‹Ímôı@g† QÊE¬¨]’ƒ$˜?ÒÓô€#Ÿ\0j„	½“%‡b&ë\ZY\0Q‡éV\"åôHÈ%­$‚y]B,A­G`U¢0i$\'…sÁ*.Å;¬î‰¡Ä¢‚J|pãO•‹è…•Í|@éõ4_OÔ.4¹H¨²«„¶±ò!¥‡éúŠáUÊO™˜\"\ZÔ(h(ÂŞ<+XÅËèz2§-ÃI*oÄâ<5bì5Hv!½šâˆyZÉ	UÀª!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/g8	å{p8­J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ˜ĞlH%OêKÒ7r¦öW÷¢.\0–Xş•œ¤	mGµ(™%PÔcHÅ}GÏ+VFDŠY<S_kõ0YsñNu<ò²\nÖÉ­*­!P!Ãõ§Îm§ŒËA\0V(Tp	ï¤{B&09À•6çñZ™hJ—ìFdn¢.\0n¤(0Ç«3 K}Ğ¤ƒâ€™%Ñ¡§3óÆœ¦M¬ª:3$@£Ø,¡K€óÄTs‘{%C]VÆHİ@--[\0G«Ç16-¢ŠÙ<KAyX§\0,ƒÆ‘¿0°H¦°\\9À|“qâµØQ£&}Æê\"á­j¥’ØóZÊS¶&B²J¾†œNdV2œ¬’lfH€G´X¨kgÎEì‘­–èŞİA¸´E/ãÆŸÔ\0µÂ“E \\ábŸ²yÔ—¼RNkn	\'$+nxƒY’ÌMRwLûÔEÃZ,0Çô¨3ÁIÅQ2J¾†œ×ÔGˆÃù¬ŒÉµ‘dØÌ€`Ïêš›Šr;’[XöêKB B=GŸ\Z> ¾ê• 6ä€€c† rÂ¤“YDYMÓš>RA ›a{[V³7æ•AG_qº‹n\0n¬€¶#Ê¢Y-^P’e”#F†OÔA÷xV2™6E®†H?ÖÑeÌ•ræ7²“SK­Ìi¹i\n€:;ŞŸÔÚ%dàÛ—\0ˆy[È%I.æ4/‚`n‚A<®¡|Ö¤ÜJU/‚\"á¨¶à­Ğb<¸Tœ€É«ÊJYû’\Z4´ıGæ óÉk32md“#×ş¶‹jº´{êLä/d‹x­m{ui¹*\0*yÓbÚ$æÉ¡˜¸\08ZÖä\'\'Ô$Œ7B©ä¦ÜñZNnl‘*E·\05RÀ[Æ ÌÚ%T§	$ĞÓ™>£ç¬ùÉµ“nÕmû‘\0ë`@£æ®)Kœ‹Š$@ñOk›©.AdKøñ­F-¢éÄ´…¬¸¡ÍÂ(¯NÂÇ‚^Ü*)¹¹B[œĞâ.\0\n…2Çô©9¶	û’‚èiÌüÄxŒ*yÉµÁPû‘\0Øj0ñ\\@ L‹Ù6ìºhxÒ‚,Eÿ\0{Ö‚`Ñ*Ü¨[‹€ÀòQú`•c¶4MĞè¸q‚pµíáu¦ö$&é/{up\0T(–Ç	A›–Ñ5•ÿ\0rPCF†‘óf|è&ÖL{Ò†¸€õ4}Cæ+üj„È½“M¤úšBØ¾­h&›î”„µ€@ÆÖ .Ş©Ü™F‰ëD¢ÜA*yò8­P-YTû¬’ù¢Û†€©dôşöªúÛDî±Hd”ÔcNQ.s+Y1D°é!\0?ÖÌêŞ•Q™NõG÷¨1U¥º¬Ãİkhä\0¶‰¡p7 ²à’´ı¨Ù$·A ^9âµaé)N¡g{Û¨¶à4(ËÒ¯êZ¼ª´X¤2Jo¡®ÄıIÈåKœ›YPìIH@õ´}_P/\Z¸Ì‹Ù4_q¡ÚEÚB‹øñ­„Ã¶ˆd§6åÍåk/%X::QÉÄ”ÊçŞµc´ÔôY¤‘º‹ph\nL±ı*ùÁ<\0L[ŠÅ!’PF4çõ|0¹ämeB‰+$@z˜-¨b¾®9½•w#ûÔ\Z.4©D\"ş<V·ŒÀ-x ¥¸\\¹ „7ÂÖ\'À ­¹\Z&,Å(Œ	‚m‚’‹˜BµbâFÈH|ÔAP\ZÕB\0Çôªç·İMˆX¤t“ 4æ¾¢3ÃKœšh«â’ılQˆcˆ«\"öNè„Õ¤\\­‹øñ­À-÷J¡pÅÍi?¥¯d²U‹¸M(­œA \"ê?pjÅÜ¦\"I¤45Q\0Ã.4ùÁ-¢z¬¯2H=#CNQ<é	k*	k$I«ÔÁe[×ª\"öAâ˜$\Z“¥‹øñZÖ3\0¶ˆU‰\0„ğ±N	d«¡ª]Ô9ÀO+ÛÅjø•N…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñC#ŠÒ\ZÕk\"rJS$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸmHZN\r½“÷­\"H²\rdr$ƒmA-†9TL’(Ì”RÂJĞ\\T¢(åáeç©ó#¹Ü %³<ò©‘bÁ!wMdšËš– ¡?²Ô;–Hİ0U¶6\nsøT“ËQt2×phNMb?z¨’.Ì¤¦¼¹¥¡£\rA,?Š‰’E’@Ğ&Î¹Lp!?šÄ“ òº,÷n\rK ÃÂ¤”ˆ&5’}ÂZ’ÇÁjÑj&€!\nÒD+ÏÅV¥ùj.¦õ+d%È´•ô…±½\\I¾U%‰Myq’ĞÕj	dO*Ï!$~ÊDªh…uÈ£ö^5Æ\'¦éÚš§}Á\r\"ÖS{ª	¥67‰B c‘5è’x­@ãk¦1‰³2å¨HÔ²Û	r\rHZN\r½ˆøÕÄ+åRS\\’Ğ& –Ãª2!O*š(Ğ%\nä%àµ<Õ7E»ÓuˆÈYøU:)MâG§¥1º\\ª	z$éà[©©¨ÚøxbA¨\'–¡Mè¶Ã©­%¤“é½ˆıê¡\"l“²sË´«K@Ú‚Yù¬òHÃÊ’;UÈ\\ˆ¸aÇ3XÍSt“KÃ\Z”Æ –EÓ#py-K%…A“ÓD‰`ÉÁ¢©¨ˆIçÃ1PeËQu7º×	r\0ä-%N›ØŠ¸H[%Ìšòt:CA_U¹TÌÊB–H”-f‚â¤µ°ıÖ±~kİ$ÂàÂ\Z–	Ê‘“}c÷	j#RÆ÷øTs=)€6«PBMÕN>5.cQtî´Å©/¤‚VÊlGïW{)E\"¡Bq·µéNDŠ0î@\Z&h.MHœ\r¸æk2©5C²·81Á©`— É¨Ù\\\\ĞÛ!B­.g¢:«Ò!jµD¿3ˆµ\'å¨ºL´G¨q¤ª6ö!8^´„ˆ½’¢©ut–†ƒmV²xQ9k\'D\"f«Š¹Ü°æI¬ßš¦èeNpcƒtú@\nSøJ|ÍDÀ:!9Í\0¢?\Zˆ.ˆZ­EÂøŸÁå¨º¢€[\'ïzŞ¬QÅº¡h\0ıJ2OäÓœ‰ BÌ@™ªâ	DQl0^u\0™Tù•ÖK{ƒjzlŸ5\\ÍDÒÃƒÉhmóZ¡\'¢o¡@@„5¯¹F5@òÚèdLTº¸ÜØ„Ç:ÚÄVÉºTÅÈt\Z\nVÉ1ñ5S‘\"–LBÑ3u8‚ä@E°ã™¬Áæ½Óv¨I‘Á\rK\0/•h$İÊÑ(?YsRÉ‰ãÏ…P“Ñ;])À@¤ˆ¦æÿ\0Åh-EÑz£av•qièÛØ9Ş·Ç\"|©¤ÌJ%­h?U²øÕÎR\"–tÁXÈ5\\…À\'?sRüÕ7LP¤HğÇ\0‡J7Añ­j*}µ‰š¡ãğªDÒ\\-VÇÄf+@yj.ªôVÂäG!öb¶2@«r¡\"bä:KCAú­`ù«™$SÊ¨R‹`® ¸0æjy¹ªn˜¡H‘á\n ğáV$ÔT”$.jY,xÕƒTôt—U¨÷V€òT]1TL.Ai½¯dµø-rq’ì£T‰‰#ÒZ\Z\nú­€Oæ®D‘O* Î²&\ZœT¢[—É¨~j›§k$¾O¶àÄ°Äûr«p¨U+î	æ§¥1ããT\nŠ%<F¦âB_ğ«—Ëtî…Àzµ×°[˜ğ­ H²WµÒe%¡ ÛU¬r«‘$Q€TB­W!r\"ø`¼jA2©º¤0†\'¤tş*‹ %kû„µ,–<|xUôLö¥Ú&«Jqåäjü•dÓcs“Ô„(ÛÙÅk@«2%Ìã}%¡ ¨Õk\"rKÕH’(À Yg´ÍW]ÈœÇÆ³¬ªMS²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹ÄK&U­Ry»úTH¼›DÕÈç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{±Â)IF»À8ŸØ\Zb‡—D‘—	d\rZÌx3¬™ŞâÀ4‹-ùyTšZÊQÚp\Zß2pd™$”\n&‡F—x‚3À_Â¦É]6\"_ó\0™s\"·Lö&0ˆäÒJ5×\np*‰çH-¢›„ÍBY4‚¬`¿ì<\nTÎ²d¬œç1 ´Ìğ9TJ–I\Z‰ÀklÜOğ8Ô¬\\¦´ˆBÌn¢EÓâs	p±6æ0¨½ÒMŒˆJ5È‹€w@Ò‰i6…/Šv¡$ˆ\nµ‚ü¿‚FCÍ&ÑK\'8¹€\0}GİÊ²‘k ¦&0Ìû‡\ZÌÖŠSÚ7K¼AGÂ³%Vˆ‹	p±>›{-C½ì“h›<0”c°\\°O:Q“I´R$“H*ÖãÀ¹SÀŠS©m÷§¸¹º@Ò1)ûrZÊD‹$Q¨œinŸpâµ’¥9¥°7K¼AL|x%fI	-—H	p~[eRït0	±éŠM£p¸(²ä\rLdÅ”Ş©Ä‰¤\rZÕ^ØyÔL¹mNyt`iÌ§íYH’ ÁOğ*	z¤hÔ€áÁøğJ‚ZŠoTèµH¡lRı©pLf˜¤ĞJ1ÈœÃ4@R>ôâ’É¥U­¹]ïJS/&Ñ šıLM &g!Ë•g\"Ö²DH&<K¸rV “$¬˜Ô„i9›ü\Z—åStèx%À—>U.MĞ‰©š	F¹‘9rˆ–-¢OØŒ¤’‚­mÏ3â·©™y2µ1äÆ–„ÏşÕ$ZÈà©>øAa™?Å\"\\¤õVÃ@ÇÇ\ZOÊ‡:#‰d¹ª2>ÙP	7AumH¤ĞJ5È‹€8\'%§Å´EÔ),¢íf)›¸sJ$^M¢J¥V¥¨ÜÏ»•#&²`  Nª™“‡€çG1%Oı‡³€öÁåCÕF :šl¹S‰&éğK	ôèv“«‰i6ˆmP¹%“H*Öªğ.ñÍ*¤\\¶ˆvº	U‰¥¨39IG1²wIrL4ÿ\0[áÅR©ùŠv@RC‡0áŸ#T	Šh©àê‘ãñq/{&ú%„úIF»\0pÁ\\ÑÎ”ô–M «Zº¸J©¼‹&;eÕ£Ó™à)9Ñ>%é8ÒÜ1.?ÀªÓªQHAñÚÕq-E@º[¤X\Zrµh¦”ŠBÂQ®ùxpäµ¤	üd-–] «wp.÷¥i)sÑ4©‹£H°Äòàœé»w*¡Yß§pİ-ÂÄ“—!ÅjÁ>(’Hº]|HrcãV(˜Ki2\\“­\"^ê‚Jˆ¤ĞJ5Ø.G‡\0­`X¶‰êò%“H*Ö©7ÅØy¥9“hÓŠT¥Ì,oÈ{–›µ¬®ôYß¦q¤a‰\'.CX.€H¨oŠ1ñğ­(©m%àê=J¸—º¤•¿I(×`NTı\rmŒ´›B™íIyÉ¤kT”À»4«‘rÚôI•Î`°°7<…7kY?‚KÈ˜ °ÌŸw\Z ^‰Š](‘\0-p±R÷øUŠ&kT.‘®Ô-‘>×«SÕ$ô’Œv€q(œ«…	ˆº[È–M «ZÜİ‡íVK–Ñ:²\\¤³å,¼‡…7kYXìHqú[†%Ç.@fµNéYˆAk¼A\0ğª“¸KasÔeÌUÇæºášIF¿\0àup¡m]-î¼4ky»Ç•Q¬›D‚©æ¤\03>îKA¥•!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z£c¯ÖBµ¿*àHÀùQ\ZÉôRnˆ´Dı`#]b˜b©Â”è_DßCtni‘4›gQ*ÙILA\0>IYšw¦Q´	ıN6Àïñ¤ÏŞ¥>&–©ÖË‚TZè&©Œ`•åä+fƒ™ø\nB¥ÔüSOÔ5ø °q¿’ÔËÍÍ¢NôN{¡ôÙGY”™¥°\rMğ çÎ Ñ ˜Æ‰†§aÔš¤nŸ8ØaÊ¢ UINc¯ÖBµ¶jàHÏ˜¢¹²D²vÃ€F;ÉÊ¾@Öy(_B€iÅ9Ì/K‚-Å°¬¥Z)L\0B5 çÌs¨•,’s\Z\'\Zœmgfj‘ºÑ6p©TøØ%~¢­ùWq^`R€æ“èÈ²~šÀF8]0?À4§Bú)ÓŠs˜^\Z\Zà–.æ?¥c*Ù$`6¨`¨AÏ˜ğ¨4µÒNc[8Ôì.\0gŠÔ=éj´ÂÃ:²à?½gkÙ\"S£ŒM&²6\0‹›±_\n‘RêIdÒÁšÃQ®Å29ŸS:	hšæÌ-e*Ù uLAä\nÌÒÉ^‰­hœ)ğ\0ï©½JG‚Ñm§Q¼õ©R%“£ŒK\'Üs}\rùAÍÃœ\0 .¥0°G&°®ÅšxòZ™Ğ¾‰&½…é¥Á,µœ‹Ù\'E¤DaŸ>c˜¨?)â•ÓXÁ0$á€-‰ãRjktÉÑ0Æ£l‡¿•KµÔİ#l²k!ZÔÒ¸€¥åÓ%ƒ\",lrkìS\0î>”œÑ\'(ßŸ§K†œÇ*‰IÀ©Pµ°mø·#Ìp¥QT;«kDãS­ˆ\rs<i\\ñIÚ‚èâc£8Û!ÃÕ(5Q±‰d/!XÛ5p.óœK—H’+tfM`#g °w@Ò‘bú&*¥c¤\05ÃNc:ê(Í\rM¾\0ƒŸ1EµªèU6p®¶(ĞpæFtT”İ”df0ud-€åTT¡Şº ¶I5­oÊ¸Ç˜q$—Ñ2è^ÁšÀF¿ÉÙş´åBú YJÇH’1C½“J{D!FƒüòJ H¨º`¤è5N\0pÂæ¬|Æ·GLa`!î	•P-R›¥hI©ÁZß•p\'úV©}J‘‚)>ãB5ß0êÍèšTÌ2¥ÃNaxçAsP˜/B³¹¢\0£ÍN<ü©Ú×M+H˜d\Z?’3Z±[§cÁ-¬,M²+HÒêİÒƒ,šÈV·å\\	ãà+HT¾ˆÑ*FdÖFû92v$øjÍ\n`¤ÌÃ\"ipLÇUu@¬Ïk`\Z›±ù¬S½2’Z\'n§e`ĞpO­#Rš0°89Á1…Xqtş)‚Y5­m‚‹ük\0åôOD™\"¸k±L\'†BœÃIôN%ït‰Z^ˆëgüŠw\nÅÖy\0„jnƒŸ<+ADõH L5;\0+W\Z¦¬,iÔë,ëHÑ7IÈ^B±¡à]ïµÆ¾VœR^Áõ\08¦\0ød\ri*Ğ ‰˜^š]é&ôî±Ixl#SpÀx«T•¥³…w€.+T*1ŒD&#•XCºH`–BâùW7b¾´O6ˆ%’Ñõ\0ŒwÌ™9qN¨ÒO¢§íº\\­2¥Á3§{\'^)\0ßŸÁ*­Ş¨N58ñ\0‡3ãT¿ja\0a`:—ô«.P	_¬…cpTBq_W\nÉÓv¦¨Ñõ\0v)“¼8UJ’æÑ\ZÕÚ^š\\0¾ØPkeHH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D\'È×m%¦×½‘|êæ²N‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZ`Bìy4VTJË\\Mr\rA¡¡E­aüUÄ+e êáÁ§N”\'ê*Q2©˜\"ŞT\\Õ-©QÁ\n(>‰xPİ’oÚ!ËbŠ8øTåĞJ6F#.rÛ!ÀT³T¤@5\Z…È¼ÇÆÕ%æX]\"K­‘1È\r\0[Ól–œA!Í””×!M$ü¯cJq1<¥O-HZä[]x.b°1¡LÖ‰¦0÷5Ëbª\rj‹&² ÂJÛ!ÃÆ¢ÕKâšĞ&j6ç¶\"¤üÔ\njët,r\0àĞĞHôÚÀpÊª.El¦å5ív›i-%İB~õ@@§•Š\0!n—(¶¿‚æµÆ?-\rÔ’š\"-rØåüVr©t\'²!.[d=±¨â—ö3Q¡N<ããP^T\nI«•¶¹=H\0)éµ€á•ëHcZEE9ìrzP´Ål‹çQ‘À¥’*5\"n—\0®o‚ğ>5Æ?%\rĞá;ì‡–¹} qğ¬Íj¤–N&ÆK–Øøê\r*‹)À	š\näT9&)Æ³?5ÔÙn®-\Z´†ƒrÕ\0ş—ªˆ-[(M{Ó¤µÅq[\"Ôäp)dèU4@k€Ù¯Æ/\n —L1‡å²TõÑ.	ñÂ#%ËdTáPÕ}µJpf£EÂşé™¥æ ºVÈZò¤\0¤¥€ıª¢	½”“ìM{\rÒA8ºöOŞ¢n<¨p€G(¶Äÿ\0ZÀ“\n2W)ßdHC—Ò˜qğ¨5ªDûSÅËl‡ÇK5QßtÀÁ\ZŠ‹ÏúÔ“ÍAt‰ö­qFâ h²‚˜\n¨¹²’@ïE#Ò\ZA8¸­¹TÍÀ§•÷J\0BÔrŠƒ:ÉÌhn†$£0‡¸9l˜q¤kTQaleÎ[&)TU¦‘3t°+‚¸&“™P]#\"\nÑƒP¢Ş•†U¤\\ŞÉ:’±èt€Zmê½ˆáp)d:Î‚†¼#‘P-×àk71¡ºn£¡l„9l˜q§z¦å„0—-’Ü¨©E\nÑ0-j/{ñªs*¢¡269 Ğmµ€?¥k\"¶IÙ±¸¥OÛßU\'–LïY„r*-¹ò©~Zª-ñ	¶\"ãŠpª½Sø ˆËœ¶áÃãT)TÚ’à%6ù‘ÃÃ3V	™4lcˆ\Z4fÛX¼ŠÙ¦c€!¨†À’¶Eª“O*`¬e!ásr¿…*Æ†ê¸¤É‡-ˆTÇ…6«èªãŠ@Œ1Å×ÎÙU\0ÕÑ4§0F€¨¼Šq«5Ó„LcĞ\Z\Z	»JXÚ¹8ÜŠùQOjTív’’ÓeqRˆ¾ur\nYÓ«H[¥ÃÕ§0p1SXĞİX.‘$BGé şµ ­U\n„‘Œ—-¸p«ªHp„hR/ÏË‰­ÏAuOÚ‰Œrz€\r¸VÚÉÃ*äcs\ZÙ	µÈƒI§ªö5¤Á§•1Bë€‰¨à!m|xğ5ùhU»Ù!ñ–¸›%Ç\Z»ÕV‰?h0¸­’Ã…i\ZU4‚ÍF…8ŞÅ9fk@9è.€{U±D(\0)éµ€_*äãy\n·*`¤Ì×!Ò\ZZä\nJØÕÈ)åNÅbp·K¬qâO:‘òĞªâ’øÃÜ¶K<*ïTÒÄb78­²ØÕÕNuJrNÔhW\0\rìƒ4ÌÖ‘T	TDÖ»H] ›XÚ·€2ò„ÊL­rÒZâºö#÷§ @¥“µd)t¹5&XŸ…Ma{ªÊSâ!ÄÙ¸Õ³—T€D©Ëa€áãTH\Z¥9&i\r\0¸C’§\Z ò ºfèã-\Z´ 9ZÃúÖğŞÈ±A+\\”-%=El‹çN@K V[B4¸\0äT%ŠšÆ†êæTèÃÜ¶#?\nêšŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]ì×CÊÖLğJ®!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-,ˆƒpĞ¢0Æöªåú))ÜZ	*y_ô±Z8GÀ‰áı’¦®Å\'Vc\0—! ´(EñÃA€{‚€€¶HšK=ML\\8øÖ&$\ZY)¬d’€_éiúpqær¡‰½ë[\"àİ­,‰é¸Æö§È	}AZ$Hãkåæ´`Õ\"šÜ(‡¿‘•\Z#ûMÔ¨Hp\rR‰|p½D¢\'E: s$ˆ0êhº}@xf`bE¬›¿zll’Pÿ\0K_QÔYj9I½’%¨.·GÔ\nĞ$¶ŞÔù/`§E¡£æ\0’§•ñb¾U$—å’Nn-k‰¿²à•™:‘Lûm%	¥3Çë9@ú).Pé’ K=MoÓõÈfqå-P‚tO’J\Z_éa¾œ	*à/QÊMì‘-eº8† ä \0[dÄaÏ\n9—dTÁihÄª|Í³È­Ş1²IíÁÅò²@+2j\"K\0¤£ûAKZ\Z¥¾8q¬å\0¬RÕV‰\"G©€)n.@¬%,“‚$”ÿ\0KJÔ¹OYò“{ —[Ùu\rM\\\"~Ôr\\ÙIªĞ»ZUnpÌ_ÜáINK\\HCÊÖLğA…A$–4	#û-%	\"›‹ã‡\Z‰DN…-	cãRßSGÓ˜ğÈÖŒ£k)wO”ÿ\0KMôæG><§[$JÚÈ›«PVµ¡,€+p<mG+—Ñ#Ø´\0B€ISËİb´‰Ğ\Z)M\rTåïÁ*B’#Rä%¤\"”*¸şµ™ˆôHŸj‘4¹¦éú€â™XE“§Š61ò€_éiONgÅpZ–&öIûÖD5!\0²Œ9ÑÊ	}’ZÉÁ¦àAıÿ\0LA¤KP)®ˆÀÀBx{ğJNlS²†¨¸An•(Uqıj@/¢N’c’ KN¦‹éÅÃãYG•;ğFÈä”ÿ\0K\rÃRçÅp˜›”Qhl#^«´¤¡Œ8áT\"	}wML@q •ÃqZ¬u\0\\@²%\0èPén…º‹‘C€\nQ/h1bú&ı«3ã’ KF¦¢z€ä•,EŠ)BØä”ã¥¦á¹ÀS\0Ÿ2D#Pq4\r*Kaà• ˆ%ôIÔ-Å ’¾·+o NèHÀ@Ø\n`èRH|AKB)Âøş´ù@“Ü*µc{% /§ê—\Z9Hµ•€G$­¥¸éú\n 	½‘DB«RĞ(ˆn‚µŒA/`‡Ğ sq\0Ø^ë\ZÔ`™KpTi$!±·‡U`lšÎøšJİ*P‹ãúÕr±}¢Å#$ˆ¦b.|RS¢`¤h|¨_éiús#Ÿ#N0‘¡²¢YÙir…\r \0Œ<…o‚_DT„·êh$©å{•ˆ5 -HÕRS†\rq@0ÂÄÏ«¸°	†YßuHsCT¦xáÆ¯ÁP,°HÉ!O©‚éõË¤ZÊIÑ$ úë†àããÀ\Z¸Ä›Ùö+ûAC®\0\ZI¹Ú·Œ“èšv´ª•Ã¡ZĞ< ¸UÅ!À”$\'†A<V ÔD–	è²ÉW9	\"œã‡\Z9eÚ\n ^…b{qg© *_Pı1¹Lme@R4É(ş–œ‘FKÀ\ZÒ0&öN‚ŠşĞÔ¨@,ˆ£v¼`	º‹ z©\r$ƒ(Ej?TY4—$!ådñÁ*Á«EK4‘\0âä%¤\"”ÏhjÄ@/¡LYb{$‰¤±Ğ> ÄRä\"ÖLMRƒ$”ó¥‡/¨Œ¼®1&öUdeºõ\r\0…Š0ı8ÖÑˆ%ôH”Í ’\rò½¹b¢µ-*J?H%\0ğòğJ»‚Ï$`<¹	h\np¾>F˜€î+Øø,õ4_OÔ!˜¹Hµ•¥5²J“ÒÜtàHçÂ¬D›Ù	‚ «pRÄ0çjÔ@>‰”)ˆpÌ_‘ZÓ€7IĞf\ZI\0í‰µPĞÍBKãÅÈK\\\0S…ñıhå\0½Âafs_%¾¦‹éÌ\\R¤Ä‹YRkå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRös W·ŠÑÄ¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¦9\0vœZBØ=XUs\0[E2OK’\0Dä”¸„h‹ÿ\0ABy]GÖ•|ÅJ\'HMÃ@T°ÃÒ³3¶ˆ@L’„hÒÓ™ÄëYk!5’0½MıMxŠb/d[#jK––­€OV­>ph¤„ñõü²2O:Z¸ÑANhùI\nfXâ¢‘í)£û­ÖZT·RKcúVR˜%´RÔ@]$À†\r9æGˆÂ±”‰µÖ:HÀõ´\05˜\'ÄTó‘{$C×U¶9@:UZB /‡ê´s€[DŠÒÜËB\'…ˆ¬ ÜÈ)Ñ9ƒ8¨ò¾lV Üd‘ıÁ¨Œ\0jİ\0	;Vr˜%¾èIRÉ+Q£K]ŸÔAç•qå2m@SØé#\0;ÔĞGÌ¾³ç1½”Åº9 ÕPB Âÿ\0ªˆ-x©5ªÔÅ „<­nV@*MÌ¢(4NH%2ºxƒP]ù¥PT¦ıÀ¦à5º“1O\nÊY-¢E\nÉ(Fú\Zìş¢=Â°”Ì­d´NŒÉ\ZÑìÕ˜×€¨ç\"öIodÔ\ZªÒİE\0#Õ€¿\Z_PÚ+CAõ9 €<,pÉçP{E\0SÁ9¢áÎ‚y\\‘kV¤öÊ  ”Ã .-¸hj€P\0Ÿ½«)dÚ%ü’HÒÃ™ùŠøV\\æUE“ã2D\0w­¸-Ô¼EI™²’×ÕmãR\\µ5XáG8´*JĞÉ\0ÒÙù ©=¢ÁOÁ5­¸$(>-cŠŠ‚u(vLûÔEÃZÕB‰l«MËh•»Ğ$ †ú\ZT/Ô|\rfdM¬•³îB\0­¢Ú‡Ì<TŞ£œ‹Ù–Æ<j\rUª¿ÆŸ8´Sz”ä!KB!åk.%.Ò	L*ğH\'?¨ºÔ“ª—ö+tƒQmÚĞİHPaˆLmY™¹mD’d”#–œş¢<r¨2&ÖO½L±\0ê`²âà=ô¹ÈºLöZ\ZöêÓrÒsïªbÚ!‹&iÄ´ •¬¸d”ÜÜ$¦œ	ƒÌ^ÙñZĞ”%¹íÔEÀhT(–ÇÌR3rÚ&Å!æYAô´çƒˆñ©ç&ÖCt\0ÉãSµ}@xæ”Äˆ½“îOl€84M-Õ€Ká\Z±0h—zÛ—0¡ı1È ­Ô#à€´âá…ÊZÙ‚*ÄŠ*!ï\Z‹T€©\nlyÚpK}Ôq#şä †£\ZGÌ~bº2meA…ÒÁ’ ım_¨}P™²)¢?¸5ii\nQ¿ï[F`Ñ6ö snKA\0xZÇ’ :„ÁIp¸$›a{/Z±ÚQeI¢.\0\n‡xpªç¶Š€íXä2Jo¡§?¨ü(&ÖT=é$@jõ4[PÄ¼R¬NBöNêÄ€;N--TA_Şµ¶‰‡ğKx¹sA\0V±<,‚´r,¢S†sTÊå<TyÕ‹¼ª\nk;än·4¨hj¡@cæ*ş %ªÁRÃ!’fĞÏü¾¢\r¨&ÖT²Dİ.õ´`~ 2ñ­#2/dÛ²è¾ãui¹ij B/løÖñÈmˆÄ´¤ò·$åï­*æQ T=É$R0½”Xâµ ÒR\n VY$\Z‹n\Z\Z©†6ª”Á<`UaÉ !¾–œ×ÔGˆÂ§œÊÔ\nš©\nø€õ7ÿ\0!ó­#2/Pš½cP µl_Ö¹ÈoºšsA\ZJåoÒÁh.âÉ¤•±!u\"å-ŠÕ‹‚l¨Uf’PIj hT6±ı*¹Á—\0)$€†ú\ZF\'æ?¦£Rµ Ht€ë`²˜3V&Eì¨Ô¦}Öê\r\nZ[¨ _ou­£0h“Q-Âî-!åk.\0 AZÖ\Z&ND…ò½¿u§Wæ:¦ÕH’@J\\\0Çs‚[FLî’@C}\r9ıG…DÚÊÂV§ÄŞ¦qsª\"öI“ƒV•%¤-‹ÖÑ˜´OD\'åk^Ù%Xí!Ä‡İj«rŒ“$ ¸¶à4*Kc‡\n|À–Ñ“Y‹¤”#}-9ıGáSÌM¬©S\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆBP¦Ğ~«Y’R™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!êmœm||G:DòÔ]I©Zâs’èZn€-óWEì‚Ş(]’\0Ô¢ÈŸÍNBH£\0§‚¦¤À!p	Á8s5yTİ;f@Ç\'¤jIj$c=ÎhLoz‚^ˆ“¦„…º‚m|ıàƒR~SK©ºÙ	r\rHA½6?ÍêàH¿•K‡M‘ÎC¤´PL’§!$~ÊFÈZ“7Sˆ.D_9’kO5J(šd!¤#@\noÂ³%ŠI±¼=Î\0Lr<jIz$SÀ´¥ùæ3³~Z„JÛ	pRŸüob¾®$_*E=ä¢ĞÑqªß¿g’)åR©€LĞ\\…ÆËá`¹×\ZDÊ¦èNÖCSÒ\0zÌ–H\'FğòZ’Æè~™.¤­\"\nÛE9¯ğiy‹©¹[ qÍx6ö!1Îª$ˆÖÎ¤§¼¹,@h?U¬–uI)e.© LÕr–²\'ï\\byªn–©ßpFàÔ°\0/­Å*$Zˆ=>9D„°7Ò˜ŞçŸ\nÌ—H¦´Z­ 8Úüÿ\0R\rA<µ\nJİœêÒZJ£BØÜUD–­”ñNqq-\r¨%‘+<²$RÎ“ª`\rNBp	Ëù®1<×ºZ­áOHMè%¨¦é±¿Y-ÄXûaPdôÑ±<U¤ˆVê§ ­fO-EÔ:×	pRx²~õQ\'_*Ş\\G¤´4ó[/dI)e<P´	‚¸‚Q>Æ°$Ê§Ì‹STÃ Íâ˜pNuµZ&±ÿ\0p–d±øÔó=dĞ\rV¦£kâ|8T?-EÒ5Zá.Ô„;&ŞÄqªŒ¾Tr!BĞĞlk&XTÎDÚ\'K\r7SĞ¹ØÍbæU7E‘:@Â\Z1øR%¨…mxy-OJcÆ““D¬‰>ĞVØ¢)øp\"‡ä¨ºwºÑxí%¤›6ö ùÕÄ‘Se$kª’—P´4ªÖãD‰jP \0*³§İ\në”EK â˜ÖoÍR~dÙ¬…ÒÔ·°ª$‚ÁT÷š”±ËÎ€^‰Ñ	h„+9ùøf*å¨º.›phÕ¤´äĞ¶#÷­a\"/dZ‰sP´4j	dOæªR&ÖO¹dA3Uè\\(²{ÍH&U7L8K{Än\r\"És—•W3P&F¡(H$sšdÇX/M°JpM /ü`òÔ]5ê µÊm{%mG[#ˆH˜’\n€Óš‹ZH“k+f«Š”K[9Ô‚eSæ@,“#Ã¡,3öåZ	2 “¯YsSÒA\0äµ`óQ3Bğ!\nÒ°S‰_â˜<†—UÅƒ}HZë£BÙ¹8ä@­³Îç%¡ ıV°	üÖ’%©eZ,D	š® ¸	l?sR5MÓ	/”FCô¢ÂÕvUT¸$%ºl\'?\Z°^Š‡bSƒ`i-@Q/‰_İk@yj.U°¹.…§&ŞÄ~÷®N2@­“²DîrCA¶«X$¤‰\"–M`pû­Wb‰l“ÌÔùÃ›«²LpjzQ…½Ô	2¡d€ğòæd(r?\nĞ*ŠKÀ…¤µâq>‚•¤IbÕ°¸R¹lÛØ„Åk“Œ+åJıë<ÅÄCAú­`?ZÒD‘O*°±&\nâ€œ2\\êš¦éŠ,ò¼0€…\'…«PX²­RÄåÍÉ\Z ]\Z:IHZKP:ÁHSûàEh-B¦tlsj-!ÄÙ¡lœs®F2@ı”’f&èZ\Z¿U¬Ÿ\Zy	\"–Mê²™Šâ‘-Ë÷& <‹›ªµ’d0†¥†wÌ~õ`±`¨=’õ‡’ĞÛo’ÕôAº$!Zš‘/‰ğáV>Z‹¦´œôñScú­oŒ+dµd—\"‚\0ê	Êœ‰4Ê¢ÎË)Iš®*àÖÃg\Zò©º\r:@Ç¥€\n}¸Sv¢®\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹ÄK&U­Ry»úTH¼›DÕÈç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Ø‰x:À#\"ŸÅ+İIº8Ü\"°”c°\\5¤([DJ©š„²iZËnÀøÔÎ¥’	q`\Z@3—‡*‰RÈ(”Na™÷5ÉmRLiµ9‚3ä|ê,Y#RŸ#N 4äxÔŞé\Z&Æáš	F?å\\—@ÑÅ´I©¡ÂY4‚[ìî·§!rÚ&‰Ïs˜\0ÌğåYÉ£Q0A†gÜ8ªT\ZÙNœS˜D-CÍàj\r(–«DNtŠ\\dmYéTš©Ñ‘ÃQ¯D\\TNJ)D´ˆÑ\"¨HôZÁ~Ùò Td<ÒmÜç07H1<9V4¢\nb‰Àh°²“üs¬Íl¦ËCH„|8\Z‹QN‹L%Ï¸Ë½’Ñ:\'6)4~€$‹r¤-¢”òá,šAŒæìü@¬æ\\¶ŠSŞ]\Z@A‰KpDÉkHT¦œ¶Ãæ.9r)PI)Tæ‘t¸-Ô8gÈÖnÉ=VˆœdP¶\0¥Eî“9dèÈ‰á¤£\\„.\0ğäµ1<²m)ú„Ò\nµ¸ğ.Tı«<‡šM¢›÷0\r\"ÃîåY’tKN)¶œ‹I?ÀãRK•6ªs„áÿ\0æ?Ú³\'–‰]hˆºAêşEK½Ô¦°¶)4’ri\\\\©‹h‘ìNQ$šAV·nø\nÎgšLl–‰Ï.Œ\r-ôŒOº³‘k%ñF£p¸bI°ãPI\'Š@U“ZD9‚3¾˜¨v¢\rSá.x:ÚàH©wºGŞ2\"“A(×ü«€rØ.@Ò‹h‘¯za-–@ĞU­Uæs2©mÌ=Å€im³ååRI²›¨‚p‚ÃOñRK§dÁ¦¤…Ì><);]™t€—\0™Cö¤HT4Å&‚äk‘\0ã—ª„˜¶…\'VtË hrµª¼¿\\¨œœ¶¤š£H	™áÊ¥Ó%»LãHÉ#öçEì‡@‚‡AãÊ˜<¨TÂ^¶„Êª5½‘P…¤E&‚Q®ÁpÚª%‹hªèá, «X¤¦nş•F¥’ïA1,hÒĞƒ2ö;\ZYPŞ³¹\'\ZZ0¹\',qZ°\\¦²D\rGsB˜øøUEÕKat€—4i&Çi\ZĞ§ÃT DOĞâwÊ¸e~V,[Dôt—–É&U¬Uà]ı*ÉrÚ&)D©‰E¿*§\"5é8FårOğ8Õ‚Idì’H„‘Ä´üoWËuWJi2\\`\ncñ«n˜ìHDı£]ò®EQ9+H“hªé\"Y4‚­j“À»4­$y‹h˜I•Î`\Z@E¹öÂ™$YSU–g¤ãKm™\'kZJz¥€ºëpáŸò«‰dÅÒØ] %ÀiÀV‘/tÊF¡š	F;å\\•’Ö°,[DÒ%p–M «¤ğ.­	æ-¢ “1,\0µ¶Ï—•S‘eZ2Êò\'j7rN\\…=Y0’H„y{şµb”*…Ršã\"—§l~5¤mTÂ@p‰ú	F»\0ª\'­±–“hSj¤ÈD²iZÕ%.ş†´‘rÚÂL®s\0Òfx|•¬Ò8 a‰\'.CX­“ìJÔ!jh@çıjÅ(Sº[	~­@!ÃÛ:°\\*IÔ\"“A(×\".N8È\ZÛbÚ|R¤p–@ĞU¬ØyW/˜¶‰Ø%Êç0\r-¶gúRµ“ºÎâ\'j1$ÿ\0™ª©)ŠÂ¡ñã|ªÅ\'r…®t€—`\nUF´)„¥I¤”c°\\9rZÒ‹h‘@÷	dÒ-eÏ7`G•Q¬™8Ğ •Î`ô€e?j\r,©$‰Â2pğêªJvP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,S¢iŒN	©µJ›š#cD¯ÖBµ¿()wü¥Ò•(HŠM@#]ó Àñğ53¡}	®i\r.·úÎU4L¢Au,ãÏT—ŠACfj“l€Ë‚ŒÖ¢¤—ºF…h‰†0CˆL…°ãSj”‰tÈØ%~²³Wî>œC—Ñ+İ\")ÀF9U29ù\ZŒ‹è•Ëjœæ™K­˜öáXš„1-Q…ñPid“£`¼\0[Æ³5ªKDL,8Û!ËúÔÙ\ZºtmÉ¨…c¥p.ó¦!Ï6ŠKûS´Ş1ÿ\02dWQ“å/¢—íº{šdM.	eŒª‘M\0Ba˜ın•™¥’)ìh™º†M5*JÓLm:²åJ×Ih‰‚Y5¬h\ZWáò¨<&élRk\Zï™ó¨È¾‰h´9¦@İ.Mù>UŒ’©€\r¸ÔŞ@´àyò¬Ï½$èÀŸÔï&Œ¼xÔ\Z¤´BÂÀC–Ü‡õ¨µJZº{%yy\nÖü«pºó¦!äú))ÚRjìPX9qä\rg:ÑK¿zĞæ—††¸\"©\n0ãúT	¦\0!\Z†sÌş•§zG±9­lÁ]äĞpñãYÔ“Ú¤­0°ÆÓ¨„Ëşµ5I:66Y5¬j\"àHÍ9TŠ—SÅ8°E&°¯Å0Dè_D^‰a45Á1p÷ùVf¥Â—LFÀ5,$ß˜ğ¬Ëô|SXÑ8.qµÃZ2ÂçŠÔ\Z÷¤ìS¢iŒN¶ d?½MªPK”Æ0HıD+GÊgğ£SÍ¢FˆËOÔ¥ÿ\02dìCS*m»¦:2à4¸˜öáS/™4E¢9ÓŸ>U6²—ìDÖ‰†§X`\0şNf•ÑTÈ˜c9ÖÈp¥k¢ŠÛe“Y\nÆ¢spÀø\n¨T¾ˆ%”tmŠM`#Š`Ÿ•¡}îªF\0Òä‘‘©º sDSn0p9ó§d2Ñ8.> áÌÓwºµ#-QN¿½Th«à–#¿S‚µ¶oàqæTKdœ„·°DıHv)‘9ø\Z£CÍ¢ ].V5Á3Ü©šÔ&)Oh€jiäàsçÉ*…t­\"v—.\0s>5b§Šc±.6Ãƒœ!Ã5«©GÅ(0K&²¬ùWî<À­!Rú*²TŒI¬5ÿ\0™2\'~õf…ôFœBDÌ2\0\Zà™9­]ÍàB5\rˆ9óò«¨ïL$&\Z‘@Ğpõ«2¡B–Ö–8&A|êÅ.«8`–Md+\ZpÏ˜«€rú&K$ÈÁõ\0qõ&DœS kIRO¢`¿zDÍ/M.¶\'Ÿöª¿r¥@ Íğ#4«M$;u:ÈH\rs<k@©)¬1‡j6Ä´.™¨t\"i5¬jiTBF~U®0åôLY&FdÖ1ÿ\02`ıkCCÁ1d‰šdK†œùóª©²°²¼6¨a˜ãÌUÅ0@˜jv\02ø­Pª –ÖÁÔB-‡.5¤SÕ#@–Bò•ÍÂëà+laË› “â“#DR\0r‚˜*ªdµ¤ƒÑUûÒ%ix¦Ê§˜ş”î©&@ØB·’ƒŸ0<ªÅ¸YÑ³5\\¸”‡\ZĞV© cLk¨Û*¸Ù0]+@–Bò­M+pÏÀV¸Ã—Ñ2XñI‘¢\'ëëÉÄşÀÖ’\r\'Ñ;„©Xé5Á3úW¨L—À`¨GiUPÇTÅJR6v©Ã!ÃšgTšİQ¢4ÆÓ©Á2ú¸Ğ¹@ºV‘+õ­oÊ¸ùZB§›Dh‰úÀF¸]Å|\rT¨_D¡º	\ZdÓ¥Á3A­“I @xÇÂªÕÕ5\0Iğ/,Ö†{İ;Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!>F¸i-6½ì‹çW0@¥’t‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…mŒ1ÅËl‡¶43US-0FP\0•·Šq©óP]H¥Ö˜ƒ´€t€Ò¢ÁKÕÄ{$nèÜ×i²m{ÛßSo*Õ5!hk‡¨ŞÙøğ5xĞİ#tf0ò×dÃI‹—Ñ1dÖF#v¥°ÀT3T©©M´ÍF‹¢Şß¦f¢² ºVî[`k‹F­! §¦Öö­b	²„×µÁ¾ÒÓ™+b£  RÉ¡jBÂè¶º¯Æ1¡LÕ0Æ$s\\¶µ²5$=R4Z#ŒFK–É‡:È„´MjLÔh½½‡\Z–æ¤Rvï[ kˆ¸hhµ­dıª¢äVÊ	Ns\\ˆİ%§ÿ\0+Ù>5@@§•-_U´5Á	½®¾<\rqd9n‹”ï¶àâl‚Ük9ªEhdA„¹l–<j@bJ‚Ğ&j6îÆö#ÃªOÍk¥\"VèZí7@OM¬?ŒiÀ+åSğN{‡N’Ò]{Ôdp8:•\Z´5À**Åqdñ¡º4Oû\"B×“b8ÿ\0zƒR’tqË¶ÈSY‘U6¢s@˜ÜQocä3¨?5Ò[ c´…\04[k\0¾XÓˆ$VÊoT÷1Éd-q@]{æ£( RÉX¨Ñö[¥Á\n-¯à¼ëòPİH©O¹¤›\"‘Q õH”ÖFIÙ¡š¥MÓÀ\r-\0àk2ò ºD­Ñ5Ú@:@_¦Öú^œA7°Kàšæ9=(ZH»¯dıë<,“ÑR\0T·`^47Jå;ì‰Ò¶ (ãáPkT‰)ÌˆFâàl–ª-R‚hÈÚÃÒp½òâœjOÍAt»ÖÈXä\Z4¥,ì´Ã‘[(\'²éc€(…¦ÃQ[\"ùÒ 8ò£â€ÃÔBÛö^±4¡C’ŒÄC‰P@)ÇÎ¤Õ1NôMŒ0’0áãJÕH“ª-\"V ¹Å8|iy¨2+Dl$\r@‚–$X$­`äVÊj®F¸¤Ók•²~ôMÀ¥‘U™MGYÈ¨3^VCãY?-\n ]¢!Ä¨L24ïTÁìT#%ÂÂöÊ˜¢véhW\0··Šqª5’r\n60‘ê@OIKä•¼A!ôM*f9\niÒJâ¶Eó¢N,€k[¬HšR-¸sàjGÉCuwµ’İ‘ÁÄÙ.8ÕŞ©‚Á’¾ĞÎ+éBƒ€ş•B•C”—3Q¡H¹\\¾&´*¦õtMc“Ô ¢¶Öö¼\"¶G™ší$\r%¤ .+d_:¹*,¨,E!ñê!P]xÎùhn˜)ˆ=À“nEjÕ4¯´âå²XpøÕD5U:C‡Şj4locå‚šĞ|ôL¨Ö9.\0\0§¦ÖEò­ñ‚Õò§vt‰Úí\'N’××²UÉÀ¥•Z«’&€át[\\ş™T’†ê…{ÒdˆHC–Ö·õ­\0réŠ¤ˆ„eÏTHb‰ğHrNÔhº]qSh>jª\n1®A«H\0­µ“†UÉÆ	ò $Ì×i!ºt’ŠëØÿ\05¤–T(°¹!n— $-®O`Ô–†ê¢{wÆàâl—jÈz¦‘öÃ	rÛáÇ;ÕD5U‚’ğ&ikB¹½°á™­\"9¬‹\Z× PĞÜ=6°¶5ÊÆ…|©›¾©µÚli(ŠÙšÕÈ)åMı«’E¶7ş	çRÆ4*Áp“$bB×-ˆÃôÎ­œ¦,É1œàJ\\¦C:Ğ\rSd§$Á\Z=@/1á™«ˆ2 NÅ\Zâ.\Z\Z()`8ezäcr+djLÍpiÓ¤´ñ½‘jäòª\"€át[{ócCtîRß{Ã‰±G\n°ª…„a…Åm{U\0ÕTmT²“4†P\nVÉÅ38Õš‚éj‰v› G¦ÙpÊ·€&öAK;IIÊëÙ?zs[Ê˜»¬Ö„ipõ¶¿‚ğ5>Z¦kk%º0÷-ˆTø\Z¦zªTØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ñ^ÍqD<­dÏªàPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“VÖ¾D/ô´tıDsà´r“æ²Z-lŒjB\0(D¶9}ODäÄ«áuºÑWaª—FÜšJáÃ™µªMØ¦;Qš¤$€¥¾?­fbÅî”%’DÕo­£+êPf+4²`„ÈÚùP¿ÒÃ}9™®SÊHª›T-ŒŒjÔ\0Ö¸Dı(ä¾\"V€©¤R¹]Bx\\U,’srk‰	û ç€	YÃe(¾ØÔ\\„‚\0R„_8ÔJ\0Ğ¡	cã\nÄ{EôıC;q„ ck$K§Æ×Êş–ØéÌøğ¬ù	©²\rØãÀ…h\rK \n•>@KıÕ7KskI ŸÖÜ¬V ß”YJ{q\0”O~	YŸÕ–‰ÁC”‚A	Â÷ñ¬å	:*‹_%¶‹éÌ^Ç”µ‘rŸd•ı,?J\\|¤@‘[)%Šß@¼! \"„Ka\n9/¢’µ‹A%O%9x|ª	gŒjéæäHCË!o\nƒR\"K\0¤¦}¡¨ºä†©D¾8q¬å\0‘SD‘Yê`§êuÇ”H²E:6I(i¡¤®œÏ¬ùI½’%»Öèâ\Z”(\0iP€(ÃÚ@K›)Ò«Púš	 WÄebµü±«©tæbÖ’@ÊÙpJƒRÆÁ#dÑC‰BC‚)DçÀßD¢ÅôR‡Kâ³ÔÑ–$\\p¬%-djŸ$ÿ\0KJ88øğ$İK‡[£ˆ!\0Él1à)r‚_@¤Ô²Ò-WÁJ„^jN $S›q!è–	Y›±H¢ûm¹¢”\"æøq¬å“èR«!\r’ \\ÏS_PÌ ÌV2‰E\ns$­çKJ88k€5MÒ$h¶2!¨-hi\n˜cÂW/¢’X\'r\ZIò¹Kò ÑÀ$\ZªŠ\0m…²â#ú¤¤J/´Ğââ	\ZA(—¹àoQ(±}PÜÇÆ	o©‚ú~¡á‘‰‰¬‡DÆ>P½-(tæG>\0Ò&²²\\JÖÈF n\0Q\0Q†7Â«”öŠDö#LZÛ‚y)²y­:Ø\Z$åKY¦ÀVËÉ)VÄĞ!Ğ:©7 „Sq|y¡£”÷7íY\\É\"·ÔĞ¾œJrâ*L¨²t6º±ò\0]éaú~£â¸\n¡odİ7í4¿PP\0B˜(ÂµŒC¿İEè…ÀÜ4’¦ø^É•ªÇê‹ qJ* 8‡•¬ƒ§bÆÉÔ‡ÄĞâä%®¥¾8q£•‹è˜.c{$ˆÃ©¢úqpÁJ‹YSR´I+CŸén:pqñà*ãn/´5„\r)dnğ¬b	}.Ëv‚Jü/È¨­EØ ]%ÂàBxd<´Ce\\4Y¤ˆ9ÈH (…qÃPˆô)ê±=ŒÏSEÒú‡‡(å\"ÖT‘¦IZı-\'åD$sàµ¤bMìªEl*\0L€QŸ\nÚ1rú\"á-ê¥ ’ú›!Â×§\0¨Y ı-$€/,ì•`’yM\0NôYŸCœP–‘¥J%ø\'\Z¾@ÕŠ °HÙ\"Ñên:~ =ôr‘k\'ıéA’JyÒÃ}?Qñ\\X‰=Ê‚Ÿhj¸\0i²l9Ú¹€2}Kzúš	*y]màT\ZĞ~¬Kºbé\n@q!,†<’´¸‰ 	¬ÒD‹–”Ï8Ö‚\0XªX%l‘Yêh¾”õËˆŒ² A)¯”+ı-7Ò¢9ğZq56T¬ÄÒğà¥ª\r”a\\k‘_î¡Ò˜Bòº„Ë¨,l¨¤»\r$ål³6AV.ÑYßC‰BCš\Z¤‚.¼8Õò\0_EZ,l‘4–zš\néú³ıhä\"¢ÊI|·¥‡éúW’+dİ©ª/´5… ±ãÖñ€%şêzªv`[øØğ±ZĞ~¨²\nA_•ÅÂÉã`‚¬\\h©f|cV«B)C8q À	¢XäkâRÏS@]9É1¤\"E¬©İXùnÿ\0K\rôıGÅpª&ê´DØ† P€ƒkaıëa/`“¡+v‚ªy^É•®+AvQ²_\0J\'†CöJª»%Ñ·QrE(—Çõ£‘‹Ü*z,kâRÏSEôæ>4¹H²bÊš×Êw¥¥œÈçÁiˆ“æ²kCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){9ÀO+ÛÅhâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬šŒ/½M˜pñ¥Í!{%¢ÖÉ­*KH[!Ã4Ä€-¢MDî$ÂÅ9`t5\\)8…À­”Xâµ&îS\nİ(RÛ€\Z\nb<¸Vf@–ÑKUS$¡èi²ıGÏ*Ç˜›YÈã2Dş¶«09®5&D\\Q²ØÉ­* …@„_ãLHÚµijhDğµ”á`”ÍÉBsUA JxÛŠ­ft%J/º¶à©¬yÚ³”Á- ¹T]$–j5¤cõ‚Öœˆ¥DÖ9ñ\0ëbâ1¨ç\"öAºŞÉ\Z\Z.İ*€.yß:9Ø¶Š4Z\Z-© €+~‚È<jMÉ\Z$œÜ‰>(¹â¢³:WH\'	Z\\ZT´@–Äyp¬§0K}Õ,…d”#}\r9æGº¸òœ¬„øİ$@úÚ-«ê%\\©	+e$]oŠQ¬6å¤-€\"ø~¼(3Ú)Z[‰-\0yZÊG$÷ÔIë!@§´|®p%O+û¯Y›¼ƒ‚‘ºa‘º‹n\0\nˆƒÓ;Vr˜%´	\Z•¤”ßC\r—ê#‡*ã™™ZÉèİ$Zuúš>¬ÀK)\'*r/e2[ã‘ºƒT–‘©sÏ\n\\áÛB‘ZGÔZ\0ò±†IçP]ù£@”æ¡Î\n…ÕñZ%#dß¸5pu!@~ö¬å0KX)ÑRÉ+Ho¥®Ïê#«\"M,Š\'Fé#¯SB¨xñ™‘²–[¢j\rUij\0\"ÿ\0\Z\\ÀÑN«CF%¡\0<¬Rü‚æ¤ö„¨éàI •ğ¹EÎÅji²“Á)jUAéÇôáYJ`–Ğ ªY$j4iaÄŸ˜ƒò¬L‰²x¦±ÒD\0w©£õ5D^Ê[²ëdrZqi\n¾Ts\0[E$:x´‡•¬§¦5²vºh‚A<¯úØ­I?xÙF¨ŒÔ[pu!\0\0˜óµA˜%´	”²d”#}\r9ıDy`+NFÖK½Ká\0;ÔÑõ˜•qJ‘2/d¯U©¯\ZƒUA\n¿ïu«\0µâ¥11 \"xX§,Î‡ûÑ°MŠ‰!A<®Q|Ö‡ûÒ²¥¹áKn\0j¡¶é‚d%nõ™ÆIA\rô4æ~d÷T™ÈÚUZÉGzÚ>¡óïª9½“½“ƒPn--Õd ©ıkhÌ;h˜TEËš\0ò±Ç+Z¬v‹${Rª¸(\'•ì¢ÆÅEV€›*Yß W6á­j¡@šlE¯j\\À»Ö9$éi±?Q<è&ÖVÁ+T‘w©˜j0óª\"éĞ(„tª‚5\"¹÷ğ­ã0$ßu$+[ôµ…h;B\r‰‚x‹¨ı\nÖƒBUQÖy$\nZ¤45P€0±\\)óxø¬2:Iéô4æ~b¼ÆBDšYS$,‘µêhú† yğ«\"öN…_Ü\Z´âVÈ—­ã0h«D·ƒó4ı,¼\0_i	„ƒ‘p$ÉIğÍjÅÄ¥PSåšIF·6á¡ª–úq°áWÎªÁPXd2Kfú\Zl¿Rxğ£œÊÖLQ#\\‘\0ë`²æ5Å+HÈ‹ÙVªşãu© VD¹÷ğ­ã0u;·˜´ AÊÖ­GëF€\'ªC•Ap$8ñQú\ZĞ~´ª¢Í, »MÃ@T(±ı*ùÃµX*X%t’‚èiÏê#İKœÈRÊ€bé$Aëhú¾ <ñª3\"öUt_u¡Á¡KHRˆEüx­o‡m¢K†$\0<­n­…ù£¢¤—q p½áu« ”Å™ò7QCCU\n2L|*¹Á- T™$\r\Z\ZsÌuäÚÊ¢“ªH¬äsFPñ\\@­#2l›=uE÷F­7-!P\0EÏ¾·ŒÀ?²P‘‹š\0ò±ÂÀ\nĞ\\‰$Ôà ¯ÙF6**Æ„ÙPY_ RÕ \0©a†#¨3D}Ô’C$¡èi/ÔGº¤H›Y]¸¥‡IúÚ/Ô>5|Ä\\Q;„bP¥U¤dKáúÖÂ@Ñ”è€ƒrĞBV·‚Vƒ´+6KàH±<®£÷Zª»É$§Ê¶à4*Xaˆò ÈÚ*j,2H¡¾–œş¢0ò¥ÌM¬˜³!kŸŞ¦ŒÇÌ¾Ÿ1²kCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|BÈâ…4†ƒõZÈœ’”É\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğVÉ>ã‹RÈPñµôHÙ2Ğµ[Š%ñ<ù\ZŸ-EÒºÓrz´ñØ\\$Eì–©’8¡M õÀ\'•DÉ6`T?æj¸«‘8aÇ:ÃÍSt¬ŒÈæµ-kä*Ij*Ñ“cHç7Mˆ(r5½\Z&Ú«lQ/Ÿõ©ò—d¯u¶8\0Ai¿¦ö#u¤I¾TŠsÜâ\n†ü­`<¿JÏ!$RÊE5&j»æÃ‡ë™¬$LªQb›÷Ğ…8¥…g\"ÔB{$Ö\\Ô²\'?\ZÍÜ¤nœˆ+QQ/îàj	ä¨º’-Ğ9ÚB¡iR€-¯êâH¿•A÷§9ÎÒSH\0¯¨%‘?šÏ)&ŞT(Ô”+Š¹†¹5Å‘æ©ºA<Hæ´‹%ÊqÈVr)èä8µ=94Œ§ô--HA-@Q/‰\\Æ%j	å¨º’·B\\\0Õ¤´­›{ûŞœd@­INsœ–-\r\Z‚Y8ÖyI\"–u:ñQ‰3AraÌp\\Íq¤yªnƒt÷HàÔô„Öd²NšÉ>ã‹C})cÇİzÍŞ‰-\rH@-@Q/rm‘ãPO-EÔ—+t.r\rHZJ£ocjq$\nÙI5dç¹ÚN’ĞĞBj	€DåS2M¬¤«jJ×r\"X/\Zã—MÒ°â÷ZE’æşIPK	Ãõ4oY’å’Ñh\0B¥\n%ÿ\0U™<µSu²äÈZN\rcL/d“ŞçBĞÑÿ\0•°$ŠYGÅRfä.Ás²æk^EÍÓ4)æ@Ç%€öµA,†¢drên›CÇÇ…A.Y+&ø‚·ÇÃ©?%EÔÜ­°¸ıHZn‚öDÇ;Ö‘q\ZÙ\"šòâ\n†ƒmVËÚÕ	#‚BÉmV«»ğÁx×j”½7îÖü\'\Z‚jÈ(™\'Ü$\'§#ÇİIôSñL´A[Šw:—ä¨º«-1ƒR²qŞµ WÊ¤’¤¤Q\0ooíz&dE<¨r³ •ªë”EÃõÎ²~j›ª@ùd¶e0à•O¢–« 		S#Ç0jÊ…Ü-V\nq+V-BºcƒF­%¤àÛØƒï­ñ’ÒfqK†ü­`<ªäI‘@Xü·v$\'×‰¬ÇÏSuVJ’@ÄjX%şnÅ•],I¬–é±\rP/DÒœ\r%©©øŸ´–¢è*Ø\\\0Õ¤´ÿ\0ã{Æ·\"öA©â‘;Š\rn/hI\"Œac LÕqW\"[–H*›ªYäxaÒ‘ŸñZ	1eBÉ\"@òæd(R¬¢i.H‚µÁO•h>J‹¦*£\\äõ!i$ÙÇ:ä@+dÅÖyœâ\n†ƒmV°\Z©E,¨\Z²Ää˜+¹Qf¤|ÁÍÕ\nYg|‚7\0–Ìğğ­]¨«VI	æé ¡ÈøğªÓt—Ijj@/‰âœ+XZ‹¦/Å[\\äõi-!}7±\\ük‘Œ+gA¿w8‹†ƒõ[$OÖµ‘$SÊ©arLĞ\\Av¶ñ5#æ©º¡z$K Á¨S­EIpHK@²XñÆˆhä‰ªÔ\\/’­íZƒËQtÊs´•B	T|ë•ˆùSH™ÎÒP€ÑPL“\Z¹E•Ğb)(ß2ğ^5/ÍSuqı©0éKYOÂ­Ø¦u‡¸„²cÇöçZD½j”ô…¥Í@Q/9fµq<µbJ69Á£QiiSé½¼U\rë‘Œ‘{ Ù&wv’ĞĞmªÙ\'•\\‰#öS	Iš®¹Dà<j˜¹º«¹$-j[¾iTQ1^ô¡&·8dÇX/EbÌ–R­ù°¾>\"ØÕ–¢êQ1ÎÍ%Q··u¼	¶LÙ.Rä(Z\0?RŒ?­TÉ\"–@Y­0RUÈ–¶s5•euVK’@Ç%€öµ[µBÙ5’Ô²Şÿ\0\nèš–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™;ˆ–M «Z¤ówô¨‘y6‰«‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊÚá\rˆæíKËBƒTèÜdP	‘JB·E‘±Â94’Œp²à	àiF…´RC£$JğÕVµIæì<Ò¦eäÚ Y:GÃt€™OÛô¬Í,¥Z‰ı#Ï¶5$“¢f—Mk„\0‡Ç—$¨.(¦éÑ9Ò4—-¹Š‘[¤Bs\"0”kĞ…ÉÇ/DK4AMÔ%“H*ÖOì<–ÑH âœç4i\0ÏŸíjÊHÕ\"oKp²’?5ªE=®·K°7gt¿…gdÖˆIx%À&C½Ò=‰ñ¸E a(×`¹d©‰bFŠ$\'j¿H*Ö*ğ.Ãö¨È^M HQhs‹\0ÒĞ™^„‹ &\'­ÂÄ¹?\ZÎUSÚÂ!î*Ï¬N¾TÒjÔ\Z‹İ-ScpM£,¹9Q<¥Êx)OÔ%”4cŞô¬òbÚ)hsİih²Ü¢¥ğJÆTAºf¡8FÛ‹ˆ·€âµ™sE:§´ˆF—x‡…gdµZaqx:€D··*Î÷S$èÈŠM£]‚äW:˜YpS*Õ?P•áª­i$ğ\'ßJG˜¶‰¡Îs¤[3îó¬¤ZÖAìMQ0\r $œ¹+Y—%E“˜áPñ$<f^%%¦\':@u\0˜ËQ{¥Á67Ş\ZJ5ÈŠl\n¢yÔŠH»§jÉ¤k.x\\y¥DêYH	ïs£\rÒ-e)ûVR¥’LÔ\'0“îñ¬Ë’“5Ó\ZáQÃ‰g|êlQtø\\_w\0™s¨©H&±Â)4’ri\\‰Ã4âX¶ŠJv±#ô‚Xª™»?!Q“æ“h†¢cœæ4iÌùáÊ³•Õ‰Ú\ZÜ1.9roPjRLiµÍÍM¨ºtD½¤¹¡ê]îƒum\"94Œr\"äã— iÀò–Ğ©>õn-’M «Z«ÍŞ9Š$y¤ÚÄ2¸±£KBfxr¤íeA%ÄLİ-Ã3îj®‚ƒP…¥®ò#?\nbˆ@Ç9ív à_Õ*ÅUj–\"qa(Ç\".Ê\0µi6‰¥=Í•á «Yï}\\‹É´H%NâÄÒ-Ÿ!IÈ²´‡‘;t·Rã—!ãT˜¢V¡QÃg{p«¢b¥é5k2¶<ªãQT2F¡ôŒr\"àlœ­aBÉå&G	$-ZÅ\'›‘?jĞÖ@h‰R¹ÌH\0f}Ü–¨ÒÖT³<‰Ú@ÃqÏÆ¬9!0“¨Bß0xß?\n±òİ0%¥Ï íš%k\ZİP»$j¼°”k°\\‰ZÖ”¶‰ê÷	$Ò\nµ “ÍÄ§9bÚ&fs˜3úªr••ÄN4·I9xqZÑİV©%Â\0C†j·$«¢z¥µÎ8¼K[Û…iõYõ¥ĞJ1âË“‰Dä\rmŒ±m)p’@ĞU­U¾.ş¤4›EL•;œÀ4€‹sîäµ@²­VYœ¶ÂÊN\\‡\ZĞV‰½’	„wˆ#?F”U¥šKÁÔĞ™Z´‰*ŠF¡…„£‚äâpäµ¶2Å´(¸I{„²iZÑ{ØºëW\"å´	ŠE\"W9€ihLÏ*§eqìYŞDÃKpK\\‡­P.â!îdÇ‘«(«R2jhK¢ŠÒ<SìI?A(Çà¸(KZã-&Ñ3QÅ)îË¤k.x{Ò®EËh@“+œÀ­[xPhh¬‘!là5¸b\\rä8ÓJvK$BØb\rX<ªƒ¡a2jÔÑ§+~Õb¢¨JE!a(×|ªpqÉrZÒ‹h‰np’M «X«ÍØÒªU-¢\0¢	\\æ¤\03>êf–Né/\"{äùØSP(¨!Ş ñåÊŸ–Š‘Fç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB¶5İäVµ³Z.ı©\Z\'DÓ:œ!oÖ¤R¥DÆ	¬…cB5p.Å|(Ôº“Ø˜Z\"~°®]I€qÏ’ÔÌ4ŸD\'HÓ&.	bBåÇô¬Íl¥¡G0\"¤‚;Ó)Œ\rœîhÃ+P\\÷©4N‰†6ãe°µ‡õ©±r‘)Ìh•áä+Z«#>`Qä}éÚDRkà…0_Ø\ZŒ‹èòø¦¹¦@İ.	˜QÆ²•TêŒ$>¡ÉA8Ô\ZY\"À\'n§a€h?¹¬ÍPn´Bu±€ö5EÒ5.ŸD²­oÊ¸3ğ1_E–NÒ\"~ ®UA`ãŸ j2“è÷­q4¸&cu=é!Ã çÏÊ ÒÊ{SØá]Å\0asÄÔÜ)ğZ iŒ;S­¨4ºZ§FÁ,šÈV4#WìWÀTÄs\nJv‘à#=I“±Tàj2/¢‘~+CšéC\\nÖ2ª\rÓ°;‚qæ<+3E:§4	†§a€\0áÌøÖléjµ@Ó:dµì?½f\\]LªS£oİ~²=-ÕK¹qğ1Ò}Ê”OÒ\"~°=.>¤ÈT¤¾‰¡Í/@ÓlÂâ?¥e*Ù\"š‚àmˆáYšw©N`4“Ì\02æx­A©­ÒZbiŒãl‡.5ªRM¢G‡­oÊ¸ª¼Ò¤T™h‘Õ;HŠM`#b˜)+È\Z‰Ğ¾ŠAö§½¦@Ğ×²5”«d‰L!°ÿ\0Î<oY—èºc\0™ºÍ\0Ë™ãRjOjF‰ğ´³æ6ºr¨µÒ	Ìh•åä+ZšWëß˜â¾ŠO½4°Dí@#Š`‰>£ i>ˆFæ—†¡¶ayû«9UN©‡L-o G¼TY$m\r™º@\rK:Ó¢icN§YmÊ¦È7DÀÙ$ÔB±©¥p.óœ#Ì_E\'´]G†ÆıMÇ|É€>\r)}[”24¼\r.¶cßRÎ«T—ÂİCÇuv²$€Ì5; g;£¹\ZX×j6áşõb‰ê€0JâòM+r‚¾´€y>ŠµI{DOÔ1Ø¦Çø¤ƒIôH%LÓ&×Î•M•¤=!\Z†ÄùÕ1éŠ¥\0\'\nï 2ñ­Xrx¢ÆˆÓ­D\"Ø.Ş¬Ré»¤i¿Y\nÆØ.Âëà+hTºfüRdh‰åÀ#]ó Àñä\rY¡Ñ1n)2´¼\r&Ø¸‹Wµ•,òI‘ãÌpJ±B©±\'Kf\n|\0gXs{§d–´°G5!ZÆ•6T.‘¤Jòò=- 5p$|«Xbú\'ªCÚ#¼k…Ó#Šø\Zr²}‰34É§K‚fÂªöT/ÅezB57ˆñ½hÌ©ª’‚pK ^#5«ªilc£!2‡÷­#K¦³éË¬…k@\r\\%|mŒ9à™÷¤HÑõ€rêLŠø\ZÒA¤ú*J™¥á¡®·í…UìšË æòPsçÊ¬QWbAa¨ø\02ñé€éè”ÀcS‚]\nÒ …e#H•åä+[ò®n\\y[c_DiÅ&Fˆ¤Ö5ÃÔ™9s«búÁq[¤JÒğÖÌ{pªg²¸İgzB5\rˆ<8ŠĞRÈ¹H L5;š\0pÃ+W\ZªÕ\ZcÔë]i\Z#±$4Jıd+ò®Ê?P+\\aËè¨–RÑšÀF;æL‰Í8UÈ1},‘+L€›-Ç\Z.h›ÕÒ¤\r€ìBãÎ¨8ïL9JA0Ôì0\0eñZ ûU\n!cLzµ8\"Ø{êÅ.„ Ñ,…ä+[ò®Ü|«H/¢z%=¢95€v)“±_U*Ñ\0è†F—¦—Ì[õ¦kdôJx¡qÅJS®¨@Iğ/,Ö›=îªÅm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆO‘®ÚKM¯{\"ùÕÌ)d\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡[#¸¹l…‘¡š©fLÿ\0Öj4z±+û§\ZŸ5Ğ)u¦0ä¤\0~•®&öP™#\\–\0´”½ì‹çQ0@¥…@ı‘¥ãÔooÙx\ZÃËCt‘˜ÃÜ×¡¸ÔõU¥£ŒFç9lAPCUAsB˜f£qÆöOÍMdX]+¶’\Z\\\Z\Z\nzm`8eZD+dŠsÚàÒÓeq[\"ùáYä\nYH²‘t¸_gãÂ°1¡EÊoÛxq6L8ÖrT“Ùb¹lfÌPnœĞ&Û”^|j[‚é@·@×i\n\0hP ¦úUD*Ü«2œæ»ID-%.VÈ¾u@@§•\n5!\Z^Éª×·>uÅ—ËBO‡¹®&É‡…g*Õ#Døã¸¹mÃ )5J{R`ZĞ®@y„Å8ÖgæµÔëU¾ä\Z4-Ûkâª1&5³©Ns\\ÒÓeuì†³Ê³¥¯D\rß66ÏÇ…q¤hnƒtã{ƒÉ±Õ™¥“ÙÅËl‡Æ¡š©\'µ&\05€^cf~j©<VèCjÒ\ZŠÛXÓˆ$WÊ¤ŠºsÚä! ’1½ˆıêf²’­¤DÈ¨¨9ÿ\0Ç/\n¢ãŠwÛ-q6K<*rêSãŒ3S–Ü8Vd1t´OL¡\\€ÿ\0q¬È2 º•²äÈ\ZÓkâ˜ŞÉ\'¼8\Z\ZZë+ŠÙ2ãYÌ)e:ñBÒ h¬m‰¾|\r`^47AªyŒ=ÁëbÑañ¨!ĞôdÈãW-‚ öñ¨!‹¥Á5¿ón(\rìœQq©?=ÔÙm…¦ÚƒCBM¬ád­\"æ5ò©)¯\r!ºt›â¶Eó¨ÈRÈÑ-¤DÔrbƒÇ#–…+¦ı±!›&EATlŒFIÙi6ªxêŒ$¡\Z¢ŞÄxq©njª5ïZb€ºCAK²pÊ´ˆ‘ò¨ ©#H4–›\\­“†tæ$<¨b³’\"j:Å×>|+&å¡º±K¥¾1#ƒ‰²aÄU3ÕKÕĞˆÄdmşiWLU)É+Q·8ó|l*Àæ OTÆ@‚~[Xo\0HsdÒfk‘\0§\rElGïW @¥‘‰É¥Ø¢ÚøñáP>ZªK|aä=lG\Z º¤±a.[\0PeTU:Ù!ÄNÒ\Z…È·±Sh•Ğ(Q08€\Z\Z?ñµ€ı«xElƒ~)´€t¦“oQ\\¿{Õ@¥“uŒ‘@p¹RƒßÂ€(nªá\"HÃÎ²lr­\0rê…’Da…ÏÈmÂ¬©BC’`@\' ùè.¬(Ğäõ\0\Z	\nÒ–ÇÊ¹ŠÙ\"f¸§I(¯bª`K*U…ÉG r*|x\Z‘òĞİP­–wÆàI²\\qğ­ê©$F#sœ¶\n€û^´ª©/\"vÛ¹½ˆâ™š¸j§¨VÖ¹ ĞÑÿ\0¬ô½rq‚c[:\rø¬óéÓ¤ÛÕ{\"Úµ RÎ©aqµ\0qõ ç€<ê@å¡»+ì‘,bGdÃô­\0Õ=GÛ’å²Xp¢!=>óQ¡N7±LÓ5¬G=¢£Zí%t€\nzmûe\\œo ÊšDÁÚJ!i²ºöE­$ò¦b)@uŠk›ñáSXĞ«‰~ô—ÆC–ÖQÆ­œ $ÃH9aÀV‘\r]j”ä™¤4\\^øùfjâ¨b±®-\ZƒCBü¶°ş/\\Œ`‘[ Ù\"f¸¤4´ÛÕ{\'ïZH?e8¬DˆZÅØß\nÍŒKUW)rFæ¸›‡*€z¦Q+í†8l–&5`5J ú¥”˜À®½­Ë5Cæ ºH˜×g¤\0HôÚŞVğŠÙ3d¹CéÒA){ÛUL)å@Y”BÂæöç‚ğ55\rÕŞÉoŒ=ÍrØ´[úÕ\0õ@ BØÃ	rÙ,=±¡š©ÕKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶Jè¯f¸¢V²g‚Up(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ«c_\"úZo§ê><—)\"©hµ²1¨:á ¡ØSrú$ôNâUğºİh«°ÕK£iÁ¤ \0Ï&ìSŒAKZ”KãúÖf,_E*œÉ\"\Z™êh¾Ÿ¨xˆ¬LHµ“ˆã•ı-8729®RbHª›YldcR…\0²0ı(N|¡IZ¦–•_¨åkŠ£rÒH\0òµ¹Ø\"Vg°è¥Ú\0—! „R„_Â¢P\0¾…(K_©¨æ‹éú…²K+(ŠY\'zjœÆ¾V‚ÿ\0KUtæ|xT{$VöFİj45\n„Cu6£ú)¸Zÿ\0ˆ*	å|xX¨©7\")\'7&’€x{ğAY›´’	¢6‡HsCT¢^ç5” }ğU¥ñg©¡}9ËŠWP\"ÖEÓâl’€_éiº}Dd¼\"¶RHo ^\nĞÒ Ãô£ú)+Kq!¥TòR¡\näV ëTŠ{OÊ×CÊÜ9T\'”–\nMÓ>Ø.¹\0§Ÿ‡\ZÊP\0êÅ-x(Y$@–z˜/§ê–H+bE’)Ñ¶I@/ô´àÜÈçÂ£å2[ãŒjá iP€[Æö¥È	}5ZFa¤•8ÙOÅj\rùE]I=–Na*\ZâB\'’ ğ	SÀ©6Mû`8”$9ºT¢f¿­g(\0_D´T‰¤³ÔÑ}9c(idQÓãkä\nÿ\0KJ9‘Íp³1\'Íe.ØâÁÈ@\rE»p¥Ê	}H[µ¥T®WP\Z“ØÕ8”8¢xbŸ²V|\r””l)rJ‡ÃfbŸB‚…$‰º˜u0bÜÇ¥c(hŠôèÛ$€úZP†æ|xPbMÔ»-Œˆ\rÚ\0Bˆ.0Æö£”>ŠIdğN\r*§•ì™X¨§û\"ÈMà€VË;©=‡E<ÚMÈsCT¢_8Ô\0_DÊYD	g©£éú“—¬e-d»Ñ°>Pı-?NgÇ…H7²F‹SX€(DQ½ğ«Á/h©²bâUÇ¨ı/Hß”YÅZà	DğáÏ¢¤ò“Dù’œÀ	(H!áu\\/AÆ}\nU+3„‘YêhË1áÆ¤À‹YPª\0$”ó¥§éÁÄsàµQ56NÈÄ`¹B†€–@aÎÕ°€w´S\nœnZÒ ›ó7ábµ|{‰*(åd	*»Ñ0³¾0œ„‡\r*Q/ir\'Ñ\0ºÆöÉIg©¢ú~¡áÆR-eoíK\r’P¯:YœÏT\"MÓ°}UˆÂêB\0\ZT&FØğ­ã\0dú r©h*¾·+ ì\Z¤8’Ä„<­oØ\nĞh\n¦Yä¡ÅÈH-Js?­W ô)Å…í|m%¾¦‹éºËŠSå ÒÊ\'Kä\nÿ\0KN\rÌø®V\"MÓSíKv€Ô²\0£v­ã\0Kè˜Kq?+I*[•®\riÀ&MsˆCË+y%Pwå4PìY¤ŒjqBZB)LñÃ_ ô)…‚FÉ%¦‹¢z€÷¥„w*I’Pı,7ÓõÏ \ri“{*Õ_Ú\Zµ\\\04Ø„±¶7µo_Dõà–õõ4_¬Vµ«èÕ!ÊHk‰	ádòJĞ_”Ğ*Yeˆ!-!¢Çõ«\0¾…V«­’ K=MO¨|@£ÆÖTîY#L’…yÒÓô§¨|œ`MM•+ûm/(hQF¼`	{=œ·h*	¾²eb¢¶å•Y%ßø’@²q²U‹€tBÌøÚ¤×\r*H\"÷8qªä\0“¢ °ÈÙ\",õ0—êßG!T¤†¾T/ô°ı?Qñ\\i+dİ»Ñ} ]©@	bÁ¶7­ã\0KıÔõd.[µ¥A+†6<,A­ØY\Z$’UQ	áks°AV4ÙPYŸRë@\nPâ«…ïA€$Yc> ¬õ4Ó˜“)‘k*½uKk*9ş–§ê>+…P‰7T,ˆD5êB\Z\n\r­†?Íj\"åìNˆI7\0’§•òÊÅEj;³d¾\0”O‡ì•Uv):K£\Z‹B)Âøş´r\0_EOE•í|JYêh¾Ÿ«úÒå\"ÖLYZù@.ô´¡Ó™ø-1|ÖMhlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/g8	å{p8­J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“Q®|Hëh\"ãæßG4…ì–‹[$\Z´©-!l„_xĞ$mj\'q  ·’†«€¥rq\n[ZÇ\Z“w)ÄN”)mÀ\r\n1\\+3 Kh¥ª…Ï’V£}\r#¨«&ÖL\n&1ÒDş¶«05Æ¤È‹Š)î[ Õ§Z¨./ñ¦&mÕ a©¡ò²8ZÔÍÉB{rqêıÔs±U¬Î„ÙOtj-R\Z\Z©€µ;TJ`–Ğ\"åQt’j5¦Ê~cúaXH»P$@McŸGzÙkŒEgÎEìƒUº9©­Å¥ªQ¿>ph§E¥¹–‚\08ZÅ9X%A¿0ÑJ{q‹”çŠÖgI\Z¤D­Õ¤¨\rj¡O§Û\nÊR‘ RÕT]$¡\ZŒi[ıD{–°”ämdjŸ¤ˆ\0ÿ\0[EµfJ¼*DÈ²’.·Ç(\rUi\nˆ¾­>pí¢’´ƒ‰h ÊÆöL¿­fA/(Ğ%¼š¶.©åÀ~«Pn% à¤x&F§6àêKéÇ«9LÕ`‘ST²„o¡„cõî•q¥#+Y\"äˆ7_­¢Ú³!åQÌEì”–öJİAª­MH‹øŞqÌÚ+Húœ\0xX…ıÎ »¼tSÅ9Š­q\nÎç<ñZ‚îå-~ëKˆ¸\r\n…ŞúÎRrÚ)T$ †úZsúˆÏ+\"md©ªs$@úšj0øÖfD\\Q&[£”ª´…@z°ıMÀÑN«@Ì´‡•Š\\&Iï©#P‘íOnD‚A<®·ÃfnåIà‹î…-R\0j¡@-û”¬å Kh¢ ée­ô´æO¨ƒüV&DÔY5’ ımê\Z‡\"öRÃEµ“\0äUij \0‹áähæbÚ$A#ŠpÄ–‚\0<¬Rö(µ@¢CŠkUApPM°¾~kHé#dŠ/¼ÒâÒ 5ªDQˆê% O\0Š²[Ÿ$€èiÏê?Ò±2‘µLèšù\"W©¡=X2^ R\"†È¡ïZÙ0P.ZB B/‡ëUÌk„ŒJ>.h°<¬|°J8‹$§8	å×£°›!æj–Ü\0,0Çô£˜û!%e{ä”#}-9­Èò©2‘µªT |`zÚ-«0=ôÄ¤/dÙ7î´;N-!J!Ã5´d¾ê;2ĞBVÄø«\ZÈX %¹BC+ÙEˆ4ïSdÊD’EªCZÕDAlE¸RæÖÉíXŞù%7ÒÂ¡WÔGKMÉ²l’_$Mş¦á¨|Ãâ*£\"/eT6E÷F ÕP[©|?^¼dm(³pÁh.á$ª‚A!Çˆº‹r Öƒ´ªåIB¹ª@P Çô§Ì	àÕa‘ÒH¾†‘‰ùŠøaLH›YS$ê’&€ÿ\0SAù‡Ì>5¤dEìû­ÒªVÈŠMm1m°K~%Íø[<ÈhÆà0T(D‚A<®S÷_* óJ ¦«4’N\rRÃå¶«NpíVT$ †\rL~¢:9Œ­dâ“®H€õ°}YÏ\\dcuAOº5iRA\Z¬‰ŞõÈŒÀ-÷Sà–õõ„CË/´æ\0L]!ÆàH\'ˆºÜV€ZR¨)¬ÒÊ‹phj¡@-éWÎªÊ–]$¡èiÏê ÿ\0ŒÉ² \0+>§ÄŞ¶„\Z³ñªŒÈ½•]•¡Á «t—B.©\ZäBaÛD2K³ AËó­EÌ£¢¢’ïüˆ$l/‡ubà”ø,ïj ¨š€(½õ|à–Ğ\'¢À÷I#Q¾†œó\"ÿ\0¢ÑÎM¬¨]$>H¬äsP×*Äˆ²lõÕİ¥U¤*\0ÿ\0ÈŒÀ-¢z¡ve „<¬B®	V5F‰%~g^bë†8¨«ÙPYŸ RÛ€¥†4ƒ\">ê\0Y$2Kfú\ZF?QêBDÚÊì–×Éş¶‹/Ô\0æqªæ\"â‰Ñ‘6Q©ZBäEğ¹ã[	\0[E,„ææ„O\0–\\‚\nĞv€¬Ù/\"Äòºİjªï$’_(RÛ€¥²ÄyPdå´TÔYé%PßCNQê\\ÄÚÉ‹*kŸŞ¦ŒÇÌ¾Ÿ1²kCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|BÈâ…4†ƒõZÈœ’”É\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7ãC½›hB´ú‘/‰çãSå¨º‘[­1i\n„€&Çù½\\I²FìÎ:l@ş œªrlÀ$5&`.*äOıÍ`^EÍĞhQ™jXxT’Å“‰¬“î8´dn‡áPïE6M´!ZP¢_?x¨¬j.¦÷[`sƒBZJúBØŞµ‰ VÊS^çé-\r	óZÀ\'•ê2E,º¤Á]ó\'°\\Íq¤yªnƒDÃ#c !AŸè‚å>9>ásRÅ¶<ùÖdºFÉÃş­7°¾7áÂ Z‹¤Î·@çt-7FßF5Q$\0şU{Sœç\"‚Ğßş«Y>5I\"U<5Q‰3AuÜs·îk‹#ÍStTï¸àÔµ—xdk9AOd¡ä„²Xñ©p †Z\ZD-©«ÜŸ¤üµJAn…ÎÒ¥%Q·±½éÀ+e&ÉÏ{é-\0!\Z­ao}FBHı—RTbLĞç\\ˆ£$şn+/š¦èÓŠy˜FZÄô‹Ã…fhR.Ÿp¹ Y\niŸ\nÌ—,¤Õ9¤B	j*%î|¸T–¢é7µoÎÒ5Zrh[\"céÄ+e6¢sä(@h*5·FBH¥Om\"P® ¹ÖÃù7¬ÏSt…¾î‡5©d\0Ÿ…D‹Q\"4Mdä€-‘ãPïE6Z…jB_áŠ\ZÌüµH…¶;H.ÒZ¸Øÿ\07¢$‹Ø¥ğMsÊzH\rÚ‚XÚ£#‘K)eM\"`® ”EÃÂëX•MĞ(Y4Ê#sBzP|mn)PiDˆMd¢GéB†÷øT^ˆj&´ˆ[é>¤Kæ>b üµJ÷Zá{’èA*b?{ÕEÅìTZ]6G’’Aú‚`Êô¦I\r¢4‰›©ÇÔ‰Ã9šÄüÕ)V(Ì¡„4‚ˆ/RK*½‘2]D´JsCğ¥tˆE¨DÒZ€á{ªó¥å¨RÅhÎ\0jBÒ~›Ùµƒ[%U$yB…¡ ÛU²NTMÈ§•Yõ6V«®äKrÁxÖU•JlP¾PÒ\Z„Æè>4è\n 4B$% Y,r4Å{“ï@â!n¦üÈ—E<Æ(j‡ËP•Ê6=À+ˆ-%Q¡l‰ç[ÄB„©â\n†ƒ`ëXşh“›Y§ŠÊH•ªâ®D\\8æI©=MÕZ)òˆÜ\Z–Kv T¥}Ñ+œÔô¡Cß‚Õ\nÑ’â!islJ<ÿ\0ŠĞ|µL5î@\nn½ˆJßVdPU&g;I ´4jQdOaW\"M•ÅŒ¤Àr\'áÎùªn˜íYä”1À!KL8VÔ	¥}Ñ#‹SÒ¿\Z°^Š™!ÄDÕj.ÇÉs­ÉQtÊ{ª¸àĞ¶DÇ:ß VÎ’\'{¡ ¯¨\'îjäI³ªà°¸‰Z¹à~&¤|Õ7T5íI’PÃ¥-kü+@X¦(’%3O¥\nÜ¦…Xª¤‡$-V (Šq?\nĞ|µLlsjBIFŞÉÇ1\\œd_*½\"g;I ´4:Ú­d­$Iòª’f«Ğ¸QcËHùªnª7Yß cƒRÙ”ò	VKQ6HûšÉ	n<yUD½Ä—‘KšŠ€_ŠÖ‘ùjr£\\ä\n…¦è/bë“ˆ+åLßŠLîv’„ƒõZÉÆÙÖ’$Š0ŠcŞ°¹%\nï™‡ëÆ¥ùªn¬RdFZÔôŒJUƒTÂ@Hç\0,ˆ¼ráZ¢b‰OHB´…D¾\'Ã…\\O-BJ69Àz‹KJ”mìGï\\Œd[ ¤Ìã¤¡hh#æ¶Å\\‰6òª¦j¸©DµueStÅä1úRÀ\0MóJ°Z‰Š¥	…À^üjz+Ñ’ÊBÒZš‘/‰æ3¬|µKTLs´İ*Q¡l‰u¼	²e.Bä(Z\0ÿ\0ÉFãU2M¬vY­3UÅ\\‰Ã9š5MÓ4µ’ß c´¥…‰ªv¢bÊ›&²Z–C{ßáC½RĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁgqÉ¤kTnş•/&Ñ5r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´M:\':@ueoÚ¤VêmDlp‰ú	F;ÉÄáæ´\nÑ=QêÉ¤ky»Ú¦u“)MsœÆ \0·>îUœ¨h™V­¨0Ìû‡\Z‚ä¤ZáPø‡q©ò–)§ÄçH	p¶F¦ô)É‘¸Dı£…«€r¢rœKÑ+„àñ, «X«À»Ç€¨ÉRÚ)fNsœÄÒ\0\\9-c*Ïb55$Ÿàq¨5RœÇB;Èñ\\‚Ô\ZQ-h‰Åàê[{gQŞvNÂ)4’ŒÊ¸¹*bX¶Š*{Óõ‰$\r3n[ø¥FOšM¢Lç¹€i3>êÂIÀDÁ“îâµ¶H§±Â£°[*sğZ‹\'µi…Åí:€L¹Ò½Ò5Z\"xŠM£.N²åP(x)6NÔÙd\rZÏ™0.Á9QóÑN‰ïs£H\rùrNuŒœ$*0¸\Z[a‰\'ÈqT¬ÍRNc„\0µÁVàŒê\rğZ!yx%À\" öÎ¢¦èmãpŠM£]‚äãdäµ1-&ÑMÓõ‰d\rXÛnş•O˜¶Š@nõ¡Ï,\rÒfRŞ¥f_D¬Q‚&\ZF’}Ş5%É	Ôö¸BØ‚?ƒáYÖ4ÕJÑŒ:€L¹Š‹İ$èØ¤Ğ\\Œ~“\n‘BÊtNÖÙdÒ\nµŠ¼	ÃÍ+9Ô¶‰Y6G˜ÃKZ>U™¡`“U¡8ÒÜ,K\\‡¨.OÏjs \Z\\9µÃ?\nƒE7)±9Ò\\-€(•7½CLcÄriTk°T±6Bx\ZB…´H‡L2	d@…¬Í]ò3&ÑH˜ù@Òyr©—Êš²á8\r—¹\n–ìRÌQ‡ı‘¥×ÌI™™Ì€¨	€?­ ú¦­’6)49È×`¸eäE88-¡Iœ:‘²É¥¤±U3v~B‰Ô¶ˆj*‘æ0Ìä)Ñ4·8N4¶Ãüs§t±\0!Ès`y\Z`5Î©.¼[.|¼©Æ´M’ÃÄri%ï•N%’ÕÆ…C¥½âYUŒUà]ÃT«&L	r½Ì\0´[4¿—*v TÑ%î-¶eÇİÅjƒ’‹¢áK]âKò<*…¨ó qsFœ¹Ö‚´(ø¤êlRi%\Zÿ\0•páÈ\ZÒ-¢«¥HöË ` µŠ¼	Î¬Ô²,8¤Ìó\Z[éÎØ<*íeB‹3ˆ˜in—¼8ÕÖIŠ$—AÌ¨<¿¥XùU¥µÅáÅÀi?jĞTU=R„Rh%à¡p”NKUÅ´L‡H‘âY4‚­j“|Oô­	y6‰€İé<°z@A‰áUQe\\yœ¶Ù’p8áV¦’\\ ik®¥Aà|êÅ¦¹Ò\0˜y\ZÖ5ºz$jÉ ”c‡¥pó­±–-¢bÎ“#Ä²¬b¯ê¹<H™Å€io¥nxU\nÂÌò&\Z[†%Ü95F¥0\\!îd;•P¥¦¹Ò¨[X~Õ¤x¦ÕIÔ\"°”c…—\'\' V¶ÆX¶…6H‘ÂYAV±Ià]…i\"òm·zLÎ,\nĞnxu©Ô*à³¼‰Æ–à—\',ˆjÅS°H.µ\rîH sÏõ­(˜@×:EÔen½\\mTÀIÔ\"°”kğ\\‰AåZã,[D\Z÷¥Há+ô‚­j“À»4Z¹VM¢«¹^èÀ-Ìğä”Z\0:Îâ\'1.ğÈqªX&(RË„\rGx‚ŸÍêƒ‚ÊĞ±Î8¸È§:¸Öéj—¨Dı$£]‚à	Ë’Ö¡m5@ç	$Ò-h+ÍØÒœ«&@A#œÀ4€e-áLÒÉİ ‘8AlÉ8x&ª¦‰Ù@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±M„©Á2Â•®¤Şˆãh–Bò­ùW3ÇÀ%!Rú\"T¢f‘š€F>Å\\y*ÔÌ1}ƒíLsL‰¥Á,£ßYÊ¶L£FÂrQÇšeR\\Õ!tmf©Ã 2àHÍjnkt\n|-1·Ôà™\n‹\Z¤j›D²j!XÛ5p.\\|ÅÍ’vMAšÀF;æLS1}\n“ïNx/Ó¥Á3ÍjÈ‡	üQ „(óù­A¥B£I›¨å`+Y÷F«DMt`‡d9TX%ªt`Jğò­M+<y ¥Ì_E%8´Dòà®Å2v+È\Z‰†“è¥ûSÜ×I§K‚f?zÂAÂ\nj6\00²<Mfie)ìpK¼€Ë™ãYšÕIZa0C®œ³ıèf½’Ñ>&¶Y5­b\0¸3æHÒ}§iÈ\\1ø¦NãÉk9†/¢”÷\"ipÓ‰~U”ƒÙ ˜\0Ü>W4œq¿•fCw Š§1\'\Z®€¹‘šÔ3İN«DM1ƒ¨„ÈrÌÔZé=]>0%~¢­@7qæ•1Ò})ÄŸ¨k±à\nªø\ZÎa¤ú)½Ö‡H®	˜÷ş•™Rlš9Ÿ:’½+Ñ9€L	qğ/5™Õ#DøAŒz¿Æ¥š¥Jse“Q\nÖ¦•À‘ü¥Hy´Hö§\"~¶„k¾dÉÙù¬æ¾ˆMx2\0\Zá¤¢}g õ\n~(ı0Ä1Á*\"¢éTÖ¤ãS \\Í‚­C9EŠ| °N¶C•C5Ò5)‘´K!y\nÆü«™÷¥\09t\"~°®ù“\"yp©bú!İÁx\Z\\:‰²š„Z„!rÀóø%\"9P‰©0ÔO ^<i^é¦Eª0ud8RdˆQºe“Y\nÖ¢.Ã?W’_D™C¦)5€ŒwÌ˜}Æ‰Ä‚ú$ÅI@4‹p¸Ô3¦È@Ûc•;Y6A¨Ló\0\Z`sw¦…€°n²”ä)Ä5Ñt!¢Wë!Zß”	ãåW\Z—ÑA ?XÇ* ÁØşõD1tÅ{ÒåàipLÂãı¨g²`·zKÒ¨Dñ¸ğ«fLU*Ó‚\\x ÌñªÊ\nHs¬¶åZ\nT§Å(,ŸqÁXÏ•p.ÈÕÀ9tø$HRj\ZõÔ˜yd\rhCÑ;¥Lˆ\Z}9óªg¨M!éPq³Ï2jÀj¦*R`§€Ë:°÷T(–Öº0Cl@öãWk¦;V}\"W—­jàN+à•¦1Í.	ÖÚ¤ÈRj\ZìS\'b¼«bú*H”9è\ZàŠ¤.\"©ÖUªÎô€jo AÀóLªÀdõI)8.u’Á áÀ+ZD:mVKcL`êpK2¤itÊF‘4…ä+ò®ƒ4­q‡/¢z$ÈÑ…à#b™;…hCÑV‰ğ\\1Æ©‰²­g¤#P8â8óìS	&Ç€8yfµ`:¡D¶´Æq¶U¤S«>‘+õ¬*æåUğ¶0åô	¤ÈR\0rª`’ÕÈ1}\n¡[İ\"V¹á¡¤&$qÒªéê‘&˜A#À…Ç˜áV)dûQ³5N@îxÕŠÕ;%±¦=ZoØ%hWIÒ%¼CP5swZã\\Ø\"ÇŠT?PÇØ¦ËûW!Ê_Dî—+L€¸iÌ{ü©^ÉŠ$9 n¡àG&©˜ñLT¥£fjœ295aÉ­Ó4(XÓN§Yl=õQ¡r˜ºV‘+õ­oÊ¸üi\nm(Ñõ€uŠ¸ø\Z£Bú&+MPJÓK‚bBĞkdõI BxÇÊªİê”\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ	ò5À[Iiµïd_:¹‚,“¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª0“5\Zp¿03N4ÍAu&†«TAÉ} ŠÛa…²«ˆ$VÈ,‰áÉm$ü¯d_:œ€O**šD#K‡¨…¶\'Ç…`^47LÙ3í‡¸=lF\\jHt‚dq†9m¨!ª‰:hI™¥ /úcâjÈÒêmu²än­:Aúm`?kÖßÊ¢šö¹Òk•±S?eBBİ.@äTß\\r9hSºiŒ<µä¨@£«2OØØÖ9Î[páRCU\Z§‚&\04)JÛS3YòóP)4+l!Ä\rH\ZÒRÈKÕÄ+åH§¼9=(Zë+ŠÙÎõ@@§•O}Õ4ˆZ€]y\nãHĞ¢éúÈq*¬ˆt‡btl%ËdÃØÔÊOaOLÔmÍŠaÃ3KÎ]MŠİNzCAúm`8Y*¢	l¤İ=áÈƒIi(®½ˆı\rg)e6TÒ n—ãlüsÆ Æ†éºwÛ89}(-Šùó¨!ê™íOdB2^\r’Ã.~5™ ¦‚&j4+…Êâœ¸ÔÍAtŠİ\\Z5 h$+JXÚª µl§‚{Ãƒ}:KJ7(‹üÖyAƒ¤ÊšáQÀˆ5ÃÂ¸ÄPİ-x\'èpzØ€¢‚ªAdèØK—«3®ˆ’p\"f£B”[Ûš‚¨.¤†[! jÒ\0ÿ\0Ä¥“†W¦\"Z¾TSœÒiµÊÙ?zÏ$H²Hˆip¾6ç‘áXaCt^©¦1#šâl˜q¨#]Ø&±‚7d°ÈTrµJĞ¦&j1‚9qñ©c*¥PVÈCˆ¤\0H:JXòª-[%ÁÁ¾:M•Ål‹àj\'-d¬”\"\Z^\0v6ÏÇ1YaCt^ÈŒaîk–É…&z¡[XKAû\nLÕ)#S0FÜ¢ŞÇË3I¹¨.‡k­j j\r\r\n=%,ízÖ\"DVÉK¨¤4´”\ZŠØ…ó¥.`)d<R5F—X¢Úæø.`ÖmËCtß±˜$pq*õ§ÊõB`as–É‡\n`5Jh„£KB¸_ÃŠfi€gAtY60â­!£ÿ\0X­¡­’A0xm´ØVÄ~ôå,¨0XË„-G€ øF“rÓTîRŞÁ#ƒ‰²`>5B/Tİƒ±Îrœ,8s>@5Qt§0F…8ßÅ8ªUÍAtõDÀâ­!¡T‚–OÚ·„N¶GuÒ&\0¦’\r†¢¶Eó­$òª\"QmïáIŒ(nÒ¤`{ƒÖÄaí…X‹«‰:	rØlªÀj¦{DÍ! c|G†f˜ùÍ.Ÿl j\r\rj…°r®F8’+d7µ\"f¸4éÒZJ+ŠØ…ó­d,%Â£‚\'ì¼\rCrĞİPJ|BG“éE#itş)l0—-®ƒ«ª¨$¸‰ÚCPœoË†f´š‚è««hr\0t†ŒtÚÀ~×®N0L\\Ù;¤Nˆ\0-\'VÄpÎ´ RÊ–Gc³à¼\rO’†ê’$`{ƒ–É‡:\0uC±#@as–Ü2­\0b¨ºKˆ™¤5	E¾Y[i™P\"ÊØ@Õ¤4-ÁKûW\'$VÈ·zÏ0pN’×\\VÄ/i @§•XXÉ„pBŠƒ>ÀÔ±\nwH‘ä8›pãVÕ4 ÀÂ\\\r“ªÀdôd¢“4†¡v<7ñ­\0æ Tì‰qPh\0Ÿ”¥“ö®F0Hı•!&`ä!ºt›z¯dıïO ²z¬„ı–épõ¶çÇ¨)cuw4²Kã!Ëc—éV—U½„¹l¶U@5P]Ø¥¹&\ZZ=@-ìG‡\Z°òµÓDĞìô€ÓkûVøÁ\"¾Tµt‡iFé œMì”ä·•Pgu”‘t¸\0âÜò<\rH47E$hÑ‡¸9lF~Ùê©FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®ŠökŠ!åk&x%W‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²˜ãËp\0K øUr9}Ê©ù–‚H\'^Äy­.Ğ‹6‚Q<8\'’R­Š”F0©	i\0)C8dk3\0	7È’ K=MÓõdbE¬’k$€9ş–Ÿ§ê#Ÿ\0j9Ió&VÈã\Z–à\0–D·Â@Kè ”ñ˜oÊöO5¢®ÃU%9¦í ^Ü3dêš2e¡î$×\r*Q/sÎõœ }è€¶HA,:˜.ŸPô¬¨²a‰M²HéaÓ Şë€5<†^k)%»ÖØãÀ¡\0[%°Ç…€—´R+HÌ«áu	àV »ò‹)¸NaÁ®)¤şŸ©²T±²E€MÈs@R‡pãYÊ\0û©*GÄ	o©ƒ+êÃ:ãË¨F«Dm’@½-(Sê#šà+>C+ÙN®·21¨8%ˆ\0‡éU\'ûªMN\0’§•íÊÄRuŒjéñt…|&x%A¸‰ Rl™öÚº®Zæ¢’¢øáÆ²–0	»)(tÉIg©­úqp¸ŠÂP ÒÈpSâLçK\rÃ@BG5Â À›Ù%º8Û¬8Ö€–@`|©}0Kè¥ijİ­$©å{%ÒÅ|ª\rØUÔêšÒT5Ä€?d	*MhhD&ÀquÈ#J”KÜá‘¬0èR#Ø‡şHÑên)‰Sˆ¬¹%Y#Z§Æ$”<éiÅ¿QÀ\Zƒ|ÖKâ¶ÆÁ¨†€ŠKaG %ô\nIìZÄ¿¥ì‡‘ZG°j§àš×\\ñaÄÙ+24(!3CuA!ÃH%÷?¯\ZÎPbú%ñ@D‘[ëh¾Ÿ¨zV&ZÉQ1‚I@/:[œÈ<x©ä&öHÒËc5hM°Q‡;\n9/¢\\\np&á¤•ğáúE\rp,‘	Êq-Cîç‚T¶‰|–48’šá¥J|ZÌÁ‹è†ìI-’ ]ÖÁ}8¸U$Yè˜$”ÿ\0KMÃs>#!SÈMĞíe¡¬n B€( ~‚¬AËè‡¢57hrƒ|®¡Ö+M´	)¨Ù¥È…&+d¡´(`Ìn¢ë¸8\0¤‚/Á8Òäbú&ôYŞ$ˆÏSEÓêPgQÈE¬‡èCd”!ĞÃ}88ëLD›£¹8FÒàBµ !!\0Q‡<3­¹²;Õ9È­i.SÊæë…ªÀ6M,¸¨$\'ínx\0*À°6C$½. ¸éº|yŞF/¢v XŞ$ˆÃ©£éú‡‡G!²a‰ª\0$”+Î–”:GÌG>T MÓ¦ˆ¾Ûu(PĞ4”!aÎµŒ¾4qRĞIkØŒ¬A¨\ZÀíºSŠ %Û		V;\nè³HÀJJgëT }±ÈK›êhÁ·Ô<8ŠHòÙP÷¤$’¬éiº`HçÁjÄ$odÇj±.[†€Š\0˜sµkaßDÂ’¥$©ılGh5©İ)Çåkœˆyd<U‡~Sdø,Ï¡Ä¡!ÍE(—RpãWôØ¾‰¬‰!i,:™›—\08qei)$­Ôÿ\0K\rÁÄsà\riCdİ‘}±¨€\Z„„Ø~•´q‚_D·f]Ey›~„V¢ü±¨TJ¡$ád	\0V‚â$°L,¯º‹®A¤„¾8qª0/V)÷,26HÁ-õ4_N`cdÄ\nCYiªN—È¥¸†İOŠà+HÀ›ÙO¶€Ysµo`ÉşêhJ9­*§•òÊÅEj/Ê,šK²)§ÂÈ<¬]“Ñe|`9	\0)D¾?­_ }‰í|`–úØé¾ 9& Rä1µ“:Pkå\0¿ÒÃpÔõÏ…\\`MM•\ZÏ¶İ@…\rIDEsÂ¶Œ/¢OD·¥ ’•ì‡\\V£õcdÀ¢QÈˆyxy%:¿)°C¹YäŒJJ%ñıh\0½Ã+µc{dŒÏSEôßPâœ@£”‹YPJ\r|¨_émœÏ3Â¨D›Ù\'LZ®\Z(@-ãÂµŒ/¢z!8\nşœ?u­kaªAÄ4’\0ğøÙ)‡±TdŒ!!Á¢_ÖŸ î1u•Í|@–úš/§09qJ“-eJ5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙÎ‚y^Ü+G‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²˜åáªKHT\0|*¹€-¢’Ä´ı3òJ8„…‘ğ$XWQû­M]ä’³(]*€5P Ãv¬å dÚÉ+Q¾†œó#?\nÈÈ›Y)¬|‘\0êh²ıCÏ:b.(†u²9@xj’Ò\0	êÂŸ0´PSÇÔ@Aåb?„ó©=¡\"šÜœBƒáÁF8­BuBgŞ\Z´•­BŸN>uœ¤	#î…-TòJ£CNkê#İXÊDÚÉ³w¦±òD\0w­­°wÔXâ\0¨ç\"öH€jØå\ZƒUZB /‡ëOœ×\ntZZQH!\\­o\'AæŠI¬Ä8‚C¼.QF8¨¨:¤¦}Öê\"à5ª…Øg)‚[î„ˆeZ¤”ßC]™>¢=Ë\\yL›P †ª{$A¡çSEµ}@çYó{$@6[c”(j’Ò\0_â´ùÀ“^*ÕiiÄ´\"xZßµ\ZÊ!€KE¡«bàªS+¨ıÔVdWšUOtj-R\0\Z€ÀÇ«9LÀ$«\\’„o¡¯¨ş•Ç”Œ¬“èß$ jõ´YGÌ@­G1²e¹“7Ph$´·U‹ş÷s€XÙI¢Ò.hD±ÂÈ *©1 \nO¹4}.p$Êå<V Š¼ª\nIŸyº‹J€¡\0aŠUœ¤´RÄÑ©$³Q9¯¨òÂÕ”¥QdY:7É\Z½LÁF [õJ\\Ç[)\"«s%hpj«HÕd\"çèbÚ$\n«šC|?‚\n’\Z QJkMÁ\"ÄòáÏ© Ü¤™‚–’CCTa–#Ê²‘ğHË¡/’PC}\r9ıDxåYM¬›l{â\0;Ô—ê,q©&Bâ‰2ØÉ‚†â[!Ãõ£˜Ú)#P$\0?¥¼,”ˆÖ*Qp\\±Ä\ZLnBmØ£¦¹j£CUáéÂ³$ÆÉ2Q’IA\r\Z\Z~¥¹ó\n‡&ÖO½d– ˆ{—<Nu.EÂ\Z\'½hlÍÔˆ ’ˆEÏ;Ş¬I‹h“7rbâ@ ı’†«…,¢àKJúÛ÷†Ô¡’İ3uİ\Zİ@K~ê)å¬3¤=òÊj1„\"àHñËÊ¥É²\Z\"÷KIş¶‹jHá|Å0H½“îNlŞ­+é!P\"\\Úçh´I”&äµBxZÜ\0Ê¬pnÔØ	SúÛ÷Z ,M’I|ÁKn\0\n…\0¶8p£˜ßt*c{ä”ßKM—ê#Ë\n`“k*d±$‘\0ën‹‡çL/dØ#\rZTBÙ¿3Æ¶Œ€-÷RmP8Ü–„ÂÖ½†	çZ\0ne(œB‚l-sçŠÕ©Mg| ¸´’\0n¤(0²Jf@–Ñ0±Èù%7ĞÎ9yÓ:*HÖø€õ4%Öàs\\@¦\'!{*<}æ‡i¹i\n@\0‹øñ­£0í¡@vKrúĞBxZË€ÎµãA‚Q7pP|.H\\ÅÖ¬tø,Ï”j-R\0n¤@±	Y˜%´	Š¬2>IÓèa°?Q9-!\"me@h‘®H€õ°}X‘ÁW­#\".™—E÷Bé¹\n–!ñ[Æ`I¾êinÍÍ\'…ˆıVÉxĞ\'K$9l\\y‹¨¶6­\0¨”ƒ‚«EšI‚–Ü\0\n1ı)™ƒ&û¡0\Z«ß$€†úZF?Q^c\n\\Ò6 V}RD\0w­£ê0/ZFd^ÉĞ—E÷F¤U\ZVÈ—8y­r#0}Ô1Kz©-\0yX¡ıV‘ÖA0’N‚Tò½¸f¢¬\nƒ+*Yä”àĞÕB™c‡\n®pO\0˜İ$€†ú\ZB/ÔWÃQÌM¨\0Cäˆ\0ÿ\0[E”|ÀeãV$EìÓ>óué–\\P/ã{­mM#D·fà¡<8rJĞ]ã¢¤£‘ O+Û÷Zu~bYä”©\r\rT(–Çs[E@,t’èiÏê#Ç*9‰µ•„é\"\0?ÔÎ9•ş5bD^É&6P¨¤‚\0_Çj$›DÍ¨‡‰?K¾\'hÚÄ!	Ä8‚A<¯ú‹­Wa)è‘$ ¸¶á¡ª…\0¶8^Ôs[Dâ³—I(FúZsúÂ§˜›YR¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ„28¡M! ıV²\'$¥2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„jja|O‡\n~Z‹¤ÎµÄç\'©MÑ·±xUD‘{)DrE‹@ê¶ãS2M¬P5&j¹	ÁG.5yTİ)Ÿt0†¥‚ñáRKA	Œ“î\0-‘ãRïDpL	u5‘/sär5\'ä¨º‚­‘9È5!k®‚ö#bœIfHÄ×9ÈP´\0~«r¥2LXR!OMIš®*àÖıs¬$yªQP˜dpjX\"ŸéPK\'pÉ¬”=Å©l\Z‹Ñ-šD-V p·|8\ZƒòÔ)¹[a{j--rØ^Ä&#\Z¸8ò©±N{İ¦Ä\0\nV°IzÏ#‘FåHğT™ªâ¥†xšãš¦é\Z\'	CBXXŸá<«90,„æJ$.j[#Æ³ºZ2{H„ji\0á{ŸèjÆ±º–Ğ­Ğ½Ét ŞÁmåëX#_*‹çÈäôo˜%‘*29³¤©¤JİNBà†s5Æ?5MĞİ‰Æ`Â\Z‡M”ğà•™¢’£”HHÒ„)ÏÆÕ´A¨mSÁµZQÈ—º®c³?-EÔİnÎÒ´´äĞ¥>ú¨’l ¦½îD¡­6Q`ùÊ£#‘O*TZDÁ\\A(–Ë‚ækŒ~j› †ïM285\nò©%»’ºts		jzH!~6¨z¶‰\Z÷§‚!\nÓ{<ó)yj.¥l…ï\0jB	Á¡TU×Ê¤bkŞH(@h88&r(À$È\ZD l€ğOŞ° Î§Ì„ï¼#!©éãPiDˆFÉD„µ-‘ãıêoDh˜!\nÔTE7\'ÏIµIŠ×A©Mı!rıê¢àU™I\0Úè¤yC¤´4dërşjfäR Ã„À(Š,másY1•MÓvDf!©dÇ‡\n“BÁ\r‘6Q!sSÒ–<~ªh‚\n-B«HTøŸ†å¨ºMTø¤z ´İ{Ç:Ò./dˆRY‡Ih\0ÛPN^T§[Y¢fê{r\"‹aüÔ75MÓº`Ç§¦Ê~TQ6*„ÚËš¥\rÎ\nb´C5ĞA-7ÁMñş*€1¨º;“c{jBMb?zÖ/dOÈä:H\rê	…¹%TœŠ3&\0YK„ÍW!r\"ğøš€«+ª-ò†Ò-e><25nÔO‚X›î4JûaT+D2Sˆ„œ×‡\n°9j.š(ŞSÔ…§ÿ\0¶5´9…ìPÉS=Ä-\0[$«“‘K&ÈH”+ˆ.B{øÒ5MÕY\"IDd5= cMêÊ…;Ò¢G’ÇØU\nÓDÒÜD!Z@(—ÏÃ…Xùj.˜¢cŞˆt–’lĞM‘+“À­’ûgs´”-kAú­€Oç*©E,¨{Ö\"DÍÔâ®#M²3Æù¯uB‰J#pj ğ­b ’&9ÍÒ˜ññáV+DÀÔ¤¸ˆsH~\\\rh>J‹¦ÊØ÷ BÒI ²~õÈÆàVÉ¤N÷!BĞÚ”X\nÒdµ<©‹²Äâ%j¸‚@EÃä­d>j›« H|¡„4‹f~jŞª¸$ıĞòà”@xÕÆ´L$’\"jµ\0½ÿ\0N´%EĞ8«cÜ„”-$ü·±	ç\\¬n\0*i9ÈP´4_Õoç\n¹E<©¬n\"fêr\".Øs5#æ©º¦\"‰0€–Ìğà•nÔM,I÷æd±ãğª‰€Á’œµZ}Dr¤ójÁ1¨EÊ&¹ÚB¡ª7ÕdLs®D	ˆ¯”¦“+œ…\0¨\',|iÈ’(À&d$LİN»“áãRWº`1`”ùd4‚–¸À{[±ae|Ä¡åÍKcÇÆ¨,“%¹!j´€HKİVÖáT%ÅÓ7Gpo«Iö½õ­àH½Š.h‚W9’ĞĞmªÖDÆœ‰\"ŒÈYm0W!r\"Xx­HyTİP¢§HàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚Îâ%“H*Ö©<İı*$^M¢jäs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=ˆ˜áôv‘6ç@¤›D“5‰¤ZÅ\'›°<’¦u“h“\"sÜÄÒ-ŸÂ¦Tµ’(ÔN4·I8Cfj‚˜×}.KÜ8>T…Óâqx:€L­í…Mî‰&FáôŒv“‰Dğ4…h¦ıé…âY\0ZËœÁviS*É´HO{İ€iÌ¦‚eY”¢-Mœim€ÄŸàqZ‚—Ö¸BÔpæÏ‘©4¢MTø^\\¥À!ÃEHª’œÇŸ¤”k®ŞÇÖ”KI´)éåí–@ĞUCbì<-YÎ¥´	iÅ9Ï,hÒ\0\0ÜÖR¥’F˜in“—!Æ¢UI=¯„wˆ#?\nÌÒ‰j´Bâğu\0‡~Â³½Ò)Ñ¼E i(×à¹dó¢–M¢™OÖ%“H*Ö\\ğ.ş•9*[E\"ÜSŞòÆ-\Zs<9VRqd¸\"·HÈ®¢?aÆ ¹Iê×ˆ—`n><³.;ÒÕh…îx:€L¹Š‹İ\"*Ä2h%#x\ZWév	È\Z‘BÊHpœ^%”4k1à]ŸDşbÚ%¢kæ¤[>B³•,õ	Àh·àq5™ª›]9¯7Ä¨÷ÔZŠVˆ^dX\ZN8åHV…=BloIöÜäk“Jär¥\01m¦ëI¤kTºö\'Ş•ù‹h’kŞX4æxr¬äâÉ2½ba¤a™#CIGŠšñ Üb\Z†j¤Gµ:\'º@u§\0SÙj@{¥À¢cÛš	F»ÉÙy@¡m6tfFÉ&U­Rxa*R[DU‘¾G0\r iÌÛûTÖIïP¸N4¶Ãã—!ÅjjJLÊÃşÀÒëæÏÆ•‘Ü\'º@Kš#Æ€è4Q’¤ĞJ1×€rşÀÓˆbÚ\"¤(é²‹µ—<°ı¨rÈ’ÈèÀÒĞ™Tˆk à€»ï-ÂÄ¸åÈqZ.SµÕk4‡_Ï‘¦(“=”GH ªTÀ{¦Ì€=±É ”k¾UÀ«€ ¶‰Õ½âY4‚­j¯7gâ•R©mÈ%{£H\0f}Şt\ZY7Ğ$½âp°Ä¸ÿ\01ª\0“Å\0â–^!§ú€Æ¨İWÅ^ 4à\Z°æècâ•¬Fı$£ò®NÃ÷­!BÉ¥¾A$šAVµW5vÅQÅ´OD©cH	õ¼éšY05+3œ\',)#öiß½RYØ§Ä;ÜjÀd^ÉM{ +cı«HÖêÒƒÄRh.F»\0œ¼Åi\nÑ&J‘âYt	w7f<’®U<D™æ\0X\0}É’ÕYP³=Âq¡¸¸œ¹5aÏzd¥¥ÙàäÄs«‹„ÒØòğKš4à-Z7N¬’\"“I(×`¸Ã5¬([DÒ$x–M «ìùU3Í&Ñ8†I™î`\Z@Lù\n,¬]f{„ÃKpÍß\n±TõIs„#K¹•øğ­#DÒÚòö’àØöÊ®5ºm¢PxŠM£.Ü9[B…´)èú¤=âYkqàOô­%Y60fy`\Z@A/*u=Vw‘0ÒÜË\\\0ñ5Bª’ËÄ\rGnñ«¢u@Çº@u\0™[\Z°†IHZJ1ß*à¨œ”V‘¡åÑ2)î?H*Ö‚·ÅÆÇ•ª¥Y\0˜ K•Î`\Z@LÏô§k*!äN4µOµÖ¨U\ZñB\\!\Z]âÏÇÂ¨Q0–çƒ¨Ëø«nPŸ ”cÑ#‚x\Z¸RM¢lèá#ô‚­b¯ê©VM¢Hç0\r ™÷rZf–T„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj­È\\Bµ©¥p$gÍ)Šm(ËDOÔ5ß2`	Ï©˜bú!Ü#{KÑ\r–üÅD¾k)L´ 9§‘|*d\\&4	Æ§@ûš–~ô¬›1üÆÜ8\n–k Õ1€I&¢­³WìWšRÏ2UdÂÑõ\0Œv)€rãÈ\Z™†<Ú)ø§9®‘­\ru†#:Ì±îC¦z`ÍÀ p9óä•‰²c\0šîò.ÅjMj‘¢|M,j8ØaaSk¤{S£Wë!ZÔ\r\\	ãÌ\n˜ÅËè–œStˆŸ¨c±Lœª|¨È¾… SœôépLÅc á-S}0…o%û•\nS˜“NÃ\0\\ÏÖd:\nÑ\\À6x\n†d®œÀ%~²ùWî<À¥¹}’ş)È\"“P×b™ÇÀÒ˜bú)ïOp/M.ôÙG\ZÊAÒ)–€jo%ãÎ³!””Öiœjv@\0áãÅj>)L!Ñƒ©ØËC5ì‹¦Æ,šÜùWî>‹—Rœ@†M`#]\0ïrÖsx$šğdM.	˜ÏÇÊ³%+w£B/1PCY\"˜“‚]à\Z‰ãYêM(\nÆq¶C…K5ÒâšÍ2É¬İ­M+pÀóœ*]\"5	Öú€F»ÉÜ|êf¾‰ÄÇ+ôépæÇãjÎAíd™-„+O\"ÓŸ1RAŠ.¤Jó«‡3Æ¥¹®•“âV®N¥šöJıÈ›¦Y5‘éj\"à\\3ğ¢¾‰T\n#)õév)‘ÌùÒi>ˆzipLJ¿¥DƒÙ\Z¨H„(Ã1ï¤Cw¤ÊÁlÁ\\S€½¼x­.ROT#‰c[._Ş†j”JIdÖnÖÙªˆ]ÇÊœC—Ñ\n‰úÅšëÅ|\r)E‹è‹©*È<i±\"×¤CÙö@âØF §ÿ\0!z|¤w§[!Q0S†Apà£3LEßµ\rUl0Cœ ¶J`5Jzº¤ÖBµ¿*àHÏÊª!Ëè‚B$RkÒï™0>ê©E‹èŠ”«ÑlÇ¾†{\'d—‘Q…jãÏ’Urò—Né~™s&´95@(²+ÔëdÀZ¸†©Nå,$ÖBµ¿(8ˆ)ÀV_DÏbKÒ)55ß1àUJ…ÓR•*È®ôæ8ÒbSIy\r@ø´çÎ¨ïNôI$L\0`¼š°P€Æ§º\n°\ZéÔÕ(,…ä+f®ÜyZÀ9àšL€E& ù“\"ª¾ud1}I˜\0Òëp\\yùU3÷*²Îı0\r@ğãÎ¬;ĞÕ&ÓN¶ \0pæxš°d\riŒçzF«H†©T;RJıd+[f®nÅ|\0­ ¾ˆ=‰2õ\0ŒwÌ˜b¼ª”XóhU‡n)‡<\r$^ä[éMŸ¹P¢CôÀ5ˆ9ó`5-8ÔîhÃŸ:°4\r€‡:ÃÃúšÒ!‚w)%~²£å\\	Å|kŒsĞ*=‰O\rŠM@#óp9ò¤ƒĞ¦,‘ 2I²Üq<©³¦^ æ8óª²b¥-8.v\0¹5b©šP%±®®ÔmáVi!¢Wê!Zß•p._W\n—ÑñKxI¨k¾dÀ;%ª!6‰Õ¸¥Êˆ­ŸóûU^¡PHrAêiäAáÇ’U3w¢è-8.qä\0ÊØóZ ½;%±¥‹¨ÙmÊ®?-JÑ+õ­oÊ¸Šø\n¸Tóhª¡À‰ú€F¿À\n¢óhT/izipLÂûaHÖÉ¡ BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}Ÿ#\\´–›^öEó«˜ RÉ:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹-4ÛR‚…\nY?aZÄ+e&¡rzP´7²~õ\nYŠ]¢j8\0QmÏÃ\nËÉCtkDÏ¶C–Éqğñ$9t…Ù5ŒW-‚ øÔ3Hİ\"f£B„ÿ\06ãRG5Ğë\\AÄP\0~›aüªˆ&öSÁ6@äô€ZP+¯b<ê&²]÷BÒ!®Åk‡…bAˆct]7í‰¶±N5%\"HMla„¸d=±¨fA$¦‚&Ğ¥>\\37©åæ Sk­‡5 h)é)`?j¸‚E|ªh\'<8H¤€¤­’ş5@@ı”™SH‰º\\\0(¨1¿uÆ Æ…;÷¦ı±!k–ÈqáYåJtlkJØÜ…I\rT“hW%x“YòóP)±[aA©A7iKâ® ‘_*G‚sÃ“Ò„›Ø…æµœÁˆ£r©¦ª4ˆF—âƒö^‰7EÓ¾Ø‘ÁÄÙ?Ş tR›‰[d2\Z‚\Z©3\'&j5…ïŠf™“Y·5ÔØ­°‡ Õ¤4ôÚÀ~×ªŒI²F©ÏÒÒA(®½‘pÎ£$Hò¤®5¢ Ïá\\r9hn•\ni`{šõ²Tº,›C\\X>5&-])ÁÂf£@.@H<¸q¬Èæ º›]k„9¤\r¶°µi“\ZÙ&Mxpj7Ii(	½ˆıêfdße¡¯±!B_õçX‘ËŞ’ah{ƒ‰PFX<ªL^¡6ìMcC	rÙ\np©åj¨ïF™¨Ğ§Ó‡\Z–2 º–¨µ Õ¥OJ‹\'íW’+@¥Õ”CÄ­“÷©œd+ µ¶ÄøÖ$rĞİ¬´=ÁËbŠ<²4Œ^¨&´0¹Ê,>9Råj¡ÔÔ&Ğ®\0¶ñN41•ĞáhQ\08\0ĞqiK\nÒ1$VÉQI5\0\0´”RVÆ”â@¥‘DB\Zà!P_8!¨c\n¦áS˜Zå²øp£•Ë A¡…ÎÕ`¨>9Sj¡Êá3Q jE¾#Ã3M¹¨.“&1PjDø”²pÀVĞŒˆ­mÚ—.¤:té<JØĞÓ”H¨BÎH„#…ÑmïáRÆ7NõK{Ü¶\"ãW+ÕRXhc‹ğà>5B-SdØê–]÷k.ìJÙ8¦\nj€æ º5} A-µ†|«hE|¨nÔ™ƒéÒZJ)½‘mÆª`ÁSv¬…ÂQ@øğ5›Ğİ;Ù*F‡¸<›‡¶b/Ü¨	A…Î[&\n±NıÉN\"véhÈ¼\r¸fjÀæµÑdlÒ5†‚G¦Ö†W®F8’+åM\"`ä:t–œÜVÄ/\\Á–tÇjÆ\\ n—|È üx\Z–å¡ºw)20=Àª„R8ü*ÀzªgîJĞ#.rÛ!•X\Z§j$8‰š\nq+—†f´š‚ê¬­š“Ô ‘k`8e[@ùRojLÁÀ:H9¸­ˆZ¹<ªÃÜ¬np„#‚Pk€8!©åå¡Në<Œ ª‚#ø«ê«D ÁsÖÙ\n°’â&j6çÄqñ­\"9éBˆ˜G¨\0Ö¨±Ko\näãŠÙ\rT‰ƒ€:t–“‹ŠØ…ó« SÊ«VYD#K‚Tøğ5\rËtïd§FàâlFØU³ª•öÄeÎ[d8ê‚ÊKÈ™º[Š-ñjÀ2²vGqPhkl¢Öö´\"¶Jİé3„„-\'ê+d·T–UU”‘QÈ¨¶çü\ZLaCuN–øÃÈzØ€£kÕ3”¿¶#%Ëd°áTLö%ZV£BœooïWç ó&›\\G¨44¥¶°µk\0H­Ræk¾”-6\nVÈ¼Öª@K\nĞµš‘m‰_â¢°¡º«¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]ì×CÊÖLğJ®!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà˜	ô‡öËÈ\nƒv*lUı¶‡„‚J%ñÂ÷¨”½Â\nQl‘)g©‚ús\0cY˜‘dÏÆÊ…ş–›éÌøğ¨å&öLÙkdcP7\rDPs~”ù/ RíT¯2¡<4Ø ¦°à×CoãÉ*MØ©(´7Q(H#J”Kã…ïjÌÁ¤ú%Ğ$@–zš.˜¸ªq¬Ìµ•^‰Ñ¶I@/:XPé1àj9	©²›w­ŒºÔ(\rj( aúSä¿İRåhÜ4’¦ø)±ùE’)­uÃ\\H\0ş†ÜJVdhtA¨ta$‚A ”KãÎük9@úø,:š>œH¸¥a,dZ¡Õ66É(ş–›ƒˆÉxTr{)‘k-ÑÆ5\\4\r%-ã{\nLö\nMV–æĞI[­¯–X¯•AwhÙ-ZJ€Jáæl•=\r&Lhq(K\\…îSÆ Àå\'µQD	aÔÑtÅÉËŠVFw\"é±‡ÌyÒÃ’zŠàµŸ$rEnc¥\nF›\"[n‚ŸÓ¹ò©O‚H8àr¾­A±Š›\'U­%,3°\0T\ZS@(ô7Qrn„_/z‰c\0êİ¨@[$M%‡SÑ=@\nÀÀ„¸j™’Pı-7L	/©ä2½’4[Y.Ô5£J„Gì(ú`—Ñ#TàìZÒJ›à¦×ÂÅxÒ!¨,•SC°À¥\'’T—\'–T	kUe.MM ¡ÇÃI€êÅ\"qYë`¾Ÿ¨f|k3,–©±‡ÊqÒÓôıGà\rA>dñZ˜Á©B´\0–D¶ğ§ôÁ/¢UMÕ‹A%N6¿éŠĞÚ’0p •¬ƒÁ)p)2­ 8›F•(—Çõ¨0\0½ÂUJ?r KìL\\$Å+3,‡ÒÅuÊ¡¥›©øK›¦á=­n nĞ›al9Ú¬crú$Q¸$ŞÉàTSm)¨Ø9Äû O$6…8 s[¨œA¦øãúÒ0bú\"É×%¦‹éºËŠTrk!Á¢¡÷%\0½Â…0qñ\\¦ MĞOµ7@.[€Y\0Q‡è+HÀöª„â±ÄÚöCÊõm )²X4“cúyœ˜ÆÉ²KØ5ˆpE²^ç4r\0_Dş,ñZu0_OÔ8 ÌR#Ê˜o±®Pı)éÌøğ¨@›¡`Ôv´±1áZ_DÙ‰*ĞIğ\nmËª,jèÕ,»¸¶od`Xš*­’Æ‡!-pÒ¥¾8qşj¾˜VLQbI%¶‹¦.ø4¹mdÁt²JyÒÌQÄ{–¨@›Ù;w£ûmÔ…­hÓdEc|+hãğíBJ\n¯†j2±´o»\Z„Ù$›†’€go$«H‰¬ïcu\\‡\r*S<pãWôÀ/VT=ë’ K¦‹¢z€åÆ—!Ê‡jHJyÒÓtDqø-\\`Mì„Z¥\n\Z’B\0£Ú¶ú&én7-G•ì‡«@©¨”ãò‚HCÊÙg‚U± 	è²¾6‡bÒ\0R‰|pãZr\0_B˜²Å#dˆßSqKê\0pâ.B-eQ ””’P5,ÇHù\n¸ã&¦Ê™Û\Z”(\0%‘=8s°­ãŒöŠÜHV´’¸ó±Zâ´AdÇiJ\'\0âBË<¬~©²C‰ á¥J{œ/z®@è›•ŠFÉ%‡SF_PKŠ‹*¸â”“\0_éi¸j\\|\\`Mì»ÑhÚ‚€Y\0Q‡;\nĞ@ÿ\0t!Ğ¸”-i\'Qå~<ŠÕ‹°M(­šJ!ådğ¬]Šl’øÆ¥»\0)B/áÆŸ ô)›¬oˆ¦‹éú¼¸Òä\"¢Ê‚| úZ~œ	ñ\\ª„IºD±â˜#\Z”(\0%xŞÕ¨ƒ—Ğ&Ú	+á{~…jÅØjƒT»¨kŠ!åk&x%_©¨…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³œ	ò½¸V%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4‡•¬¸Ÿ…/g8	å{p8­>%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉªkŸŞ¦ŒÇÌ¾b/d-\rjÓrÒ5 \0‹øÕ‰\0[D‘qsAyZË€Á)ñDÕ±p$Êÿ\0 èJ“ÁY•º’á *cúVR“–Ñ“j%¹ÒH¨ÖœÔê>c\nÏ˜ÊÖI‚6¹ñ«ÔĞ¯¨•qJi5¶2Q¨5Ii€KáúÓ\0¶ŠY<RĞ‰ábœ2ş´ˆ«„#j«\\A WP¸fµ\'´©àŒÊİE·\0º>”¤å´I‹qAªIAkQ9“ê#ËPfH¥“¸”Æ>H@G°[P]@s\\R§˜‹Ù#w[™+u\0.T¢¤ó½é‰€[î©#M€qsA\0xX€¹ ñ©:‘¢›„ÆâAC†(¹âµBjY˜j\"à4*§‡\nÌÈßt™Q|’„j1§5õ>u„¥#j5#|‘\0êkl¿P/\Zb/d™Öèæn¤\nZæ­‘øøÓæ\0¶ŠCê´I4V²à, ë(Ù#Dà~RZPW)Ï¨j¹ªD#ûÁKT€ ,0ÄZõœ¦¸,ê‹ä”#}\r9ıGÀŒ³22µÍDÖ=ñ\0ëgşX¸kÂ£šBéËk&n Ğ¤&¬ˆ*Z9À,|¥I÷-\0âæ‚\07±r°J’.cFJéÍ&Ä‚A6âmšâ\rAæwSª#8-¸\rn¤À[cj‰J$µyPÈuË0!†OÔrò„¤JD#d’D\0­=Cæ/©æ\"öJıëls€àÕV¨\0#Õ‡ëO˜;h¤Äå¹sAn“ÊÄpûÔ‘¨²ZO¤¸§\".·óZ’+ÌC„¹Y™º‹T€¥€¶\"Ü*%0í H¹²Y{ä=\r?Rú%KX™J^[\"É‘ñ\0ê`ú…Ü8~”„Èó$CÙjdÃPjêi‘ÂüêÄ€-¢VNĞBxX¡²d4›P¢ nA¹å{sÄ*Sd2†q¨µ} *c…ë2A-`d“#å4hiÏê#ÄaPò6²6I\"\08êh¶¬ÀËi9A\0­\r”jÒªTEş5b@Ñ&LSrĞ€Òß²PÚ„™E6$XŸÖßºĞÚ”2[¦hq\n€BƒJFN[DÙgt’JiÒÓeúˆò©rl(Ÿ(\n„ˆ\0ï[EµfJ¸¥0d/dQÓ›8Õ¥}$*\"ş<jÁ\0µÂ\Zª‹®\\	™Ká’yÕ¨›!.ÀJW·ÁòªSdQ%ó\rD*5¡P¢[ğ K&j²½òJo¥§ê&äxó¨ç&ÖLº_Ü|Hëhú–íxLJBöO¹4LİZnZB B/†<kXÌÚEÙôBã‰h!+	Á,•lk!@Ÿu’É µÎê)•Ô(±±Z°56N‰N5©\rP€\0ÓŠsùƒ¶ˆgºÆ÷É(!¾–Ÿ«ê#Äq¥Ìek+oj_Ü– ıq„õ#…TdB\0ö£ûãPj’PŞõ¼doº‚rĞ‰¶,­ªd\0šA8	òRO\ZĞ\nƒ îŸÅ!ó7Q@\rP,\0ÓûÚ¨Ìßt*b‘òJo¡…UËê#Ç%¥ÌM¬šOÜ|@zØ,¿Pñ\\jã#ÙQ\Zj‹ïÒ¤‚À5¨˜æoº†Õ,Ÿ˜´…ŠÑ<ë@˜h˜íJ$¨qœ-ÁsÅjÀ±6T*Vy&\Z‹n\ZÖêË,yÚ«˜Á2ë’Ptú\Zl¿Q9Ræ‘  TÍŞ’ø€õ´g˜øÖ‚R²`Q™º‘Ii`¿>f·Œ€-¢-Ê¥Í\'…¬¸\05 í	Ä³‘ O%$…ÏC´¢É•ºˆ*\ZÖê\0 ùq\0bµF@–Ğ*b‘ÒÊj1®Îúˆ<8Ræ&ÖL]\'\\€ëhú‡Ì)V&Eì¨Ö×L·Ph¸!J\\z°ÇŠÕÆLXÙ 	Ø’Ğ@iåbŠm’V€jK\'A \"öıÁò«bîU$>P¥ªRÀ[Ó…3\'-¢ds¤”>†œş¢<°¥ÌM¬ªÉaï5z˜,¿P×\Z®i¡½©¢Q¯N-E(„_âµ¬dm\n\0£¡ve „<¬ŠxY*ÀÔ v¡½œàH\'•íÀâµ\\J§Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„!‘Å\ni\rêµ‘9%)’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹${“Ò@h?U¬‰åDÉ\"ŒÈj!	3UÅ\\‰kzÂ²©ºB”VéjÌğáH–,,„Èå%©dÇI/D­âš«~l/šâE¬jËQtµBç\'©*P^ÆØŒjâH»2—cÁ1îv›i\rÚ­dòÎ£!&ÌERv«Š¸àƒ%ÌÖåStY”Fà Äğ¤íMNd¢B@”(xøÔğA	ÃL-V› ¹>*Æ¡MJ×œ\ZIi*½ˆøÕÄ+e&‰²=ÄX´4l~æ£#‘O*L´‰šˆ%pÃ²šãÉåStÙ4ÈàÄ@˜Ô{&Ç(y !¿…Eè‘¢&«JüóåQXV7Su²¹¢%m{\'ïW¾U.é¯{ˆ(Z\Z·/ç*Ï#‘K$;4‰BºîÀË&¸Çç©º¬še!©`€Ÿá*_”ğH„èå%©éLi\ZÑ+÷§!›9øŸÁ¨?-EÔ²ÙÜ\Z	ÒZN\r½ˆıïW@­’#Øšù’AQ¨\"eåQ‘È¥K-\"f‚â‘[ÜšãŸš¦èôß½öÜÖ¥nˆmj‰!´MdÂW†Ù\nc|jbD#@¤*\';ğài\ZT]OzÙ@¨ZâI\r\Z¬Bb1Qp+e${S$‘Ä-\rÚ½6?œªr9²8j–%j¸©D¶I‚ækG5MĞÍŞŒÊàÔ°Oì‘¢_l”<–€Q3Î¦ôA	â’Ô‰ÏáI¹+¥ŞµE#“Ô…¤¯¤-“÷­ KVÊHìE$C¥Í\rZ”ÜŠP\"¬–•ªä.Dµ¿©¬˜Ê¦è²·LCJ§…#BÀQDÙµ’Ğ=)ïJôCh¦¡V 8)Æÿ\0Å\rÉQtrºÑÜ©NM½ˆJÒ$‹ÙK)#Î“§Hh6Õk\"Q76²#P”+¹|0ñZÍŒêMS»Õ:`Â\Z–Loo,m¶md´`˜ñı©ŞŒ¢áV¢ásyZ`rÔ]$Øär\rEºJÙ·µÿ\0ZÖ/dª‚Y‡I ÛU²§2ZŒÉµRñ3AqW\"[$şk&3©ºb–K|Á„4‚/ÛÆªÅ“d\r”<¹ Y\n4ïE_.p„+HøŸ¨Z‹¡‰LîèZn\nPoÚ¶E©ªTò8‚…¡ ¨ÔÀ\'•êääRÈÚ²(ªâ¥Q0ıÍGš¦ê…ß0Á„zl	¾ÍR¦)_{î7O¥\np>>5B´M´KqZš”ãÔƒZ–¢éüQ2G%Ğ´•:ob8æ+‘À­’nÛ¤Ì÷”-\rÁÖ²\'óU2H¥•‘+UÅ\\‰k\'f¤|Õ7Oà“$¡„1\nfRÕb…U’D¡åÁ,–)7rÚ&É.\" KHÁN7ş\rPù*gDÇ¸\0¥¥·>¶#÷½rq¸±AìJ™î ¡h\0ÛU²D«“‘O* ±˜+Š¹F6ÁxÔ?5etÅd”1Á©éõbŠ€z$ıÁ!s@±ù,ªÅ{•Ä·V\n\"œü8UÅãP€5EÜ­%¤ª\0ªOæ¹0p+åS~ô©â\n†ƒõZÈ†®NE<ª‚ÆRf«®äNÏ3PæU*¼½éO”1Á©éáTì˜	?tHç\0=)c‘øU\nü©”\"êoÌ‰|×>F¨|µNêØçİNMbÎ·\"ö@K™ÎÒP€êµ‡õª‘&ÌÁ>)IZ®*äK[9š‘óÔİ0¤”FCRÈ‹ÂÖıªÁbÉğKlä€,˜ñıªèš¢µ[ó\"_>c¦>Z‹ ÕowÔ…§&ŞÄ~õ¼	¬Èf\nHâ…4†ƒõZÈœ’‰’EÒ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚Îâ%“H*Ö©<İı*$^M¢jäs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!1Ïs\0Ò\0í…ª%KYKUYp˜ibO»Iy&ˆ8@óCÇÇ…*Š&©ñ9Ï¸2ş¨½\n.‰É¤ŸK…ÈŸ»h¤§9í–M ‚Æ¦g>V¨•K\'¢cŞèĞ´\r9^ê‰R&Ñpœin—¹5ÊLÉ¬x…º]|H cÈÒ4ºWO…î@&DŒ~5\nM\nloI ”kÑ\0ãü(¥\ZÑ¡Ó5‰$Ò\nµª¼½éS“æ- HYæ¤[>Uœ©d¬Su	Àkr¹qËãY”\ZÖ¸Bß¨÷ÔZ‰_½>¹àëIùj.¤¦Æñš	F¸\\‡èhhR#TíbIAV7æà\\¿ºTdù‹hN{Ë\0Ò-ÇİúV%Âhˆ8Ly¸‹yqZ‚M»“šñC† àÒ-Z\"yz€C…&&é3¦Ç †M£]‚á¨ä|iF…´SÁ4È%“H ±˜ßgÉDşbÚ$É¯‘ÌH\Zs<9rZÎ@„ˆö¢Ö\'\Z[†%Ç.CA÷¥Şš×ˆ@Ç$5ÔCO†GJ°\0Qùq¨d›Dq½±JXJ1ß*àrä´F‡‚’\nax–PĞåkqà]ŸLşbÚ$ÔF÷º0E³9Â ¾–O†Šõ¶p‚Ü]ğ© ›$ÉâÁøåPÍŞ“U6\'™Ô-—:WºG±Ø¤ĞJ5È‹€<9N4-¢DP‰Ò	$Òº˜Û›âì<Ò”şi6ˆÈŸ)`\Zù{ª\"È¦ªËÄáåÇ.C#J¤¥GV$‚9‚3ñ ïC#BğudSáLVèåQ²¤Ğ^C]ò®NÈS‹Ú$ÅGH$48–³Pœüh“Ú!Š’ÈX‘lÏì—¤KY6@ç‰À\rÄ“— ˜ÒwïC*û‚AN Œüx%Â(ÉKÁ/B2¶?µ0æéÓD\rxM$£p¹Dä\rT>RÚ\"¨] –M «[Õ]üZœşbÚ \n!•î`\Z@LÏ\\–‚âÉ„§<N4¶ÃOğ)³÷¡ˆº\rb†ù‡{pª\0Š*d,{¤P	€µ\\Gj|ˆ¤Ğç#‚à	øŠ¸PğI’äx–]\0«X¤ßgU*	‹!šGF3Ãà´|mw¼nN\\‡\Z°PK/\r.¾aÃø<¨Á$t€—§#Ä~•`=Ód¦È\"“KŠ1ß*äåÃ5¬(Y6)rH%“H µŠ£\"sñª•KhŸ©^èÀÒ-™áÊGr¦e™Î-Ãã’d8ÕôÕ1ÛªYx„#¹¡ÇûS¨Ÿr8¼BÇ\n¸ÕU’5Ÿ ¹ï”œÁyÖ¸ËI´(ø¥=âY4‚­n<İŸ+UÊ¥´J™î`€\'Ôxró§jªYÜá8A€Äü8­]ìªÉzÄ\0‡x‚3äjÅ(T ÷<@!6çW\ZİUÏ°ñš	F»À8Ù<\rk…´(6t·¸K&U¬Uà]ŸŠUÊ¥´LY.gº04€™\n*Vw¸Lİ-ÃN\\‡\Z±UVJÖ \Z]ÌƒÆùøS¡cİ :€L¿_İª!î›h–×ˆäĞJ1ß*àãÀÖ‘¡m58¥½âit‚¬n<	wª5,’\\®,M\r\ZF\'İNÖV(á8A…”ŸàqªRuF“|H<oPxİ0S^ À·\Z¨Öèj²‘ô’wÊ¸päµq,[EJœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D\"x/M.	˜_l*dÉ+)\0§‘>|ªY*€Ùš§˜\0<xÔ±$½ÒM„4‡d8qI˜¹KTÆÊòâ­D\\	ó”C—Ñ#ÚoÔ5Ø¦GáS0ÒæÑ\0èšæº@]lÂâİYÊµÕÑZêoƒÏ˜à•1Jô)I›¨ñ(Ã™â´™ÍTš¢ci.pL¹qıj[BƒTÈÀ–Md+\ZšW7qNT£/¢9uMsD2küS\0ïëS0ÅôJá1ãî¥Á1>‘„`ˆF¦øN#•A—æ$ÃS°À4y\\ÔéX§Du±÷©bj]:0%~²­Áp$gà)F.\\ùT—²iH¤Ö1ÿ\02}.Å|ê2E‹è¤v¦¸¥Á1¬ˆt¦Z£Ì.<êk%tÆ$ÃQÃ\0^<j{¥j\'Äm:œ/\nQ¥Ôêú§0	_¨…kSJ¢qò¢!äú$Y2Ñ?P×b™)S’-\'Ñ$×ôÒà˜‘ÄJÊ@”ˆ.[\0ÔŞAÍ9ó ‚!ÓDãS°\rgÆ¤‡ïJÉñ:œ£.U,×Eê‰,šÜ³W3Ç˜F.\\%Ş˜à\"“X‡üÉ“±^KQ0ÅĞÈß©áº\\4æ=¸\n‚É+$BiQ`Z‘Â¥›½&FÒ&\npÉ áÌøÔ³İ*¦Ä¬Q¶W°¤\"Eì‹¢jK&³v5p$gåDcÌ_D3\":b~ ®ù“\0iN-\'Ñ*£zÈ\0c‚YG·\n‚	K½S´ÂfŠ|©1EÕ‚&\nIÍáÌñZî“\"T`êu–ØZ€\ZöB¶ÿ\0ÊıEZ=*—w\0)Æ<Ò}\\w¨ïø¤Ô5Ø¦NãÈ\Z%“èÆêŸª@_lÇH‡²¸ˆB‚rP¦üÇ\n¬›*\Zf\ny€÷<V†&è²¸Á`:œ!ÀS®ŠitL¯ÔBµ¿(83«„^O¢uTä‰úÀÒ×b™ëNQi>ˆgA\"½ÖÏŸö Ä›Y0”çBŒ0-ãÍ9Såk]>ä!&\ZœP\\\0Ï\Z ½©‹ »Ó•P\rtèè\Z²¬oÊ¹»‚UÀ9C%½\"“[B1ß2dëßÀÕJ,\\Ù4¹VDÒïN|ùùPÎ˜Iy5[†ù`7z.”­œjqA€.gŠÕ\0Oz`2ÀCœÈ>5 \ruBév•úˆV·åxùV˜ãÍ\'Ñ	O\'ë\ZõTÀ;%ªi>‰†J”:@\\Tß*%Á;İ!å°CãÎ€\ZÊ¸%Za©ÜĞ.Ã:°; `su¿Š¸†NåÊPY5±·åT»…×ÀV¸âåĞx\\¥=\"~°®±LğáW(±qeBÍªL ½Ö8øSgT.éHF¦á˜9óä•`2.”H™¥Îğ\0eÌñZ°;Q-€°N¥9\n°4\rh–BòD\\†åZ@9}R¤u\0ŒwÌ˜gäjå/¢z6©rƒ ®\ZsEôT(³½!ipä9óä•lÄ2.RÑ³4¹ÜÃZÏ\Z`UZˆÓHs¼à*Å›\"å-ÖBµ¿*æî>@ÕÀsIôLÜOÖ5Ö)€\'—\n¹“èT‚ğ4¸iÌPÎh™ìI B50N<üª«Å4 	s\08s<iŠ÷¦h…€°çXaz¸Ò¥î©­¿Q\nÖü«wiU\Z—Ñ5E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}Ÿ#\\´–›^öEó«˜ RÉ:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7NèÌbBM(ãRC—SdlŒ0’¶ÈpãRÍR‚ˆ$¡7²siyè<É-‘4Ø! ¡Ók\'%TA\"¶EÂ9\Zà= ’’¶#÷¨˜ RÊP‚\"\08\0q·?+(nÑ˜ÃÜ×dŸ…IT“Œ—dÃ!RÍR‘­5Li\r-Bq¾^áIŒè.•VØCi\r=6°2«ˆ2² ö¦È¤€\ZZl®+d^kQ)dqKi7K¾lmŸáXHĞ¡0°=ÍzÙ0ãPC „èÚK²aÃõ¬ÌY+İ40ÒÑpöDá™©åç²N¶B@\'H\0ı6°°«ˆ$WÊ¤§<9= ¹¨­“Î£$Hïº¸B4¸%–Üğ^Ç1å¡º7@{šâmkqáYõJÕ	¬`a.Ë!Æ¡›¹+İ5¤L·(·Äxq©å3 ºG°­êKé\rÚÀpÊµƒ‘Z1âšğRÚH%%l‹çK,d,‹Ù\\!\Z^šÂgãÀ×Z¥ğL1‡–½l˜\rIPÕL¡„¸å—ó{TµtHÔĞá3Q‰«IÃ2j[š‚êlµÅ©†€\nzmdıªáE|©P¢~ =:P”õ\\!3åK$H±C„=°·KÀ7µ×Ç1\\rhQtF0÷­ˆI“¸¹l‡¶4¹Z¨ïE¨LÔbXm‡7¥ËÍAt™j‹R\ra¡ t”°¶CÎ®$pSÜŠM@!¥¤ ÔVÄ.Ñ’$µ\'P…¡¯ä[\\ßáXcCtèU–‡¸;U“U?jF/T7b&€Â\\!G+U\"\n½_y¨Ô.Eçıi75ĞÄ\'Å¨¨44:JX’Zµ„I²LT—RzCKI@\\VÈ´ç,)\Z¾ËQÈ\n-±><<ëå¡ºlêœĞ÷\"ãÂWª`¨\0Â]ªÙõ¦ ÕCPêhW\"ğ#Šq¦ÜÔE“¢ÔƒVĞPé(PX­¡El‘ìC.¤! ’€›ØŞœâ@à€ú¬º„\rG¦¬Q©ú³c\Zª›÷¶#5\\¯TĞˆÃ	rØ¿­0tÍºZÁ	[\'ãT•®šc5 Ô€•ğÊ·ÇE|¨g¦‰rêÒSI¥ïb*§,‹¸@Ğ×üÈ ×Ì\Z†å¡ºwîK‘î&ÉòñøU½UØ”\\å²XdX‹U6ª8Lİ-\0¸+—†f¨k]LKé\0VÚÉÊõÈÇc_*mÛd©µi!ºt’ŠëÙª`J„wXË„MG 8 ¹>9ŠË—–†êîit§°=ÁÄÙ0ÈÕ3ª	ZCç-²<jÄ@Eïd§3t¶ç¾î5q=vDÀâ Z¸ZÀW\'$VÉ3Zé3!#Ii°ÔVÈ¾ur‰‡•Pu¸D\\.BÛßÀÔ7-\n§J{ÈrÙ6Áj™Ó‘¥­qrÛ†@V€2`{P8‰ZÆşìÍP=5à™v‘¨44[kğK×\"\0‘[!&`ä!ºKIEq[\'êäò V¥cq·KR—\'‚ó¬ØÆ÷V–ø„k—Ò˜qªgªÄa.ÙûÕ\0Õ)Õ,‘0F…6>şKT5™U»ÑÆ~`A\"Å,0ğ­ VÊRåiC¥M‚•²pÎª@K*!\"!¥Ø¢Úÿ\0¯\nAáCæOŠÆA&ÉqÆ›=SB#’å°ØÓª‹”»L¨]1ÇÆª² ºvO®@¨\ZÒRÀy%kH­‘u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]I\Zà-¤´Ú÷²/\nY‘hZMH¶Ä¯ñYÖ7Nê:0÷-ˆÃÂ“=P£c%Ëd°öÆ†j¢ªZf£P¸æ8§\Z+*¢ÉñµÈAúJX$­b	²WRF¸i-6½ì‹çDÁ–C¤Z£“R-±+üVu…\rÓºŒ=ÁËb0ãğ¤ÏT(ØÃ	rÙ,=±¡š¨ª–™¨Ô.y)ÆŠÊ‚è²|mr@Ğ~’–É+X‚El•Ô‘®ÚKM¯{\"ùÑ0@¥é…¨äÔ‹lJÿ\0aCtî££prØŒ8ü)3Õ\n60Â\\¶Klhfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ©išBà˜âœh¬¨.‹\'Æ× T\ré)`<’µˆ$VÉ]ì×CÊÖLğJ®!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è„‚$ˆÃ©£éÄËŠTk „Æ	%\0¿ÒÜCRäsáSÊMì“µ–¦Æ	+@	dsµ1/ JÉ ›´_¨O Š\nBüZJ†¸‡•°ò	PF…j¬FĞâH%®	D¾<ïYÊy®@[$@–zš/§êÎ²1\"È(ã”\r~–†¥Èÿ\0ê\\)R•¬¶20«p\0K ÃvgÑIO›«á{~—G²6BkJ£\\HCú~¶@*ĞÙI\rÜ‹í´8¹	ªQ/ëjÌÀú ¥–¾ K}L}@q°ºV&ZÉß½1’@½,(tæ|W\0jDªl¤¶8Æ P´\0Bƒka	Oÿ\0u\"´‹AÏ²eb¾U%İ£d¸&5Å@%\0<²		PCÒTdˆG¡¡ÅÈK\\O<p½ê0è¤¹ï@D‘[ê`Ë09d@¬%ŒŠ‹ ¦©¬×(çKq\rK‘Î¤c&§Ê‘¥–Æ0h\nŠ0ç…Lÿ\0u+§‡µ¤O+¨ı\nñ¤GİI“AÀ@•Š&x%\'>Y\Z$\"Ğ’¤ŠP‹ãúÔËô) ?rK=ML\\.5Œ±‘k&™| ,9\'¨k…G$rKc5pĞİ*,‰ÄÛİLc¾ŠSƒÚ	p\'.¡Z¼bRdÀë€Månà•$DM\0C²š¨›[¥J%ñıj%Œú©¢Yû°‚Xu0_I¹mdq‘Ü„Lû“\0^t0à3><©úd÷\"‹[#ÁÁC@E0Dæ¨cú)dĞqhq*xb¡ ùR#îÆ¨G«\0NòJLIå%€Jˆ¨ºä8\"’øáÆƒŒú!»R$ˆÄsEÑ.’*VF6²°I(ş–œ#%\\£ÊöAZZÁ¨-hH ]¸cz¡Œú\"¨õ|Íi$8ŞÂöB¨P¯•6ĞU*©«åk‰§• ÄÙ1v6EP9€8¹	ih\nHKã…ïÆƒŒúUfp’ K=MK—ÉEAÆck&SD’€_éi¾”¹× @›Ù=¬n }@\0„ƒeXğ Æ	º„Z±\0ªşê$U¦Õ1]B\\¨ÒâòğÎÁ)‡~S@Ks\0sœA-pÓ¨¢_Ö™Æz²cy’K¶¦`râ*~™Ê¨„}Ù€/:Xn\Z9ğZ¡Œäw&†\rZ®Ğ\ZŠaÎÕ¤q‚_Dwª.Å­*	¹µì‡•êÚñİ€ºá¤Ä¥“ÇU3‘h›j’æ·Q7!Á5KÜù\Z£ˆú\'UA$@–MO¨x&\"§åA(}É@ÕéiB˜8øğ«2od#\Z¸\0\"‚\0¶í[G2}ïBI¸A76½ábµVxÄº.”\\lÒH\0òQoĞ%0,Š›²é.cC‹ˆ%¤i\nAøñ§ôÀ/¡M™bÜˆÃ©¢ú~ 9)}2-dî–’\0]éiº}^|®0&¦É’İèÄcP!C@BB\"Œ1½†u´q‚^ÁÜP9Ä«A$/ëb<\nÖ 5¦t·”‰áÁ3Á*‡êš\0Ÿ™ñ€âä$ŠQ/?:®@èSØ±¼I%¦ôßP“KÆ¢É¸%,5ò€]éaB™æWUSeNİèÄ`¹Bµ %~•´`	}\nœqh*	ıMøZ´\0ùcdpJ.88¢xpO\0‚¨DĞK;˜.BC›¥J|pãHÀ	?İBÆñ$@èõ4Ò 9&4¹µ•^¦è\ZÙ%\nÿ\0KÓõÍpZ¡nšgÛ\Z\0†€…-†kjÖ0rú.&íG•òğ½h.Á05K$Ù¤¢xZÉä‚¬\n€l™I,h%ÅH-E)š®½_D,¯F	g©¢úQH€JB-dÜj€	%YÒÓtÀŸBù“TæÆ5v€È0ÃÚ´¾ˆº+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ìçA<¯n£‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&‰|@zš,¸‘Ãjyˆ½”÷-L”jÓr[Ãõª\0¶ˆ#TĞQH…­{6 ))U!WÂöQnTÒ½:`¤\\\0\neˆòáY™[E,€¾IZô4Œ~£ç¬œ›Y01ÒF¯SB\\|Àd¼jLˆ¸¢Kk%rR\0	4s\0[E$\'ŠZZöÊ\\YJkIPòÙp8¨ èHLö\"37QiPÖ·RËâ8Vr%´\n@Ñ-Ï’PCF†×ÔG–‰”¬›{Sc|‘\0h°v`s\\jyˆ½’!ê.µ²a«J’[!ıéó\0ZñR;tZ7sA	áÁp\0Tö‘dˆdÀ~RB©Â×·;©j¹²8Fa¨…! *Xa±µg)[@“!/’PC},9ıD{«JFÔHâ|@úš-¨.¡â¸ŠiÙ[c˜j\rUi€KáúÓæ\0°ò©!¬´‰h!<-cÊÉçIæ	Q]pâ	SÊö\\ñ¤‹d¸#3\"àêB™cÎÕaÛî…<¨’Jo¡§3ó1…fdek&ÍB’ ÔÑ$|R§šQ½’!ldíÔ\Z¤´…!Ãõ§ÌmïNĞ@±öÏ\Z’	<Ñ°RŒ:áÎ[WÏ<A¤bo à¢á[§¤¨º²cúT&Ğ%Ê–d–PC},?RúˆñÊŞu‘$ÙÑ2GÄ\0©‚Ëõ—!)Ù\nÖÙš¥Ij²%ê„ƒ·İRÉšËr9¢„–	H‹Èº0ìBx‹Ù|ÔRbâF ¡S§n¢Õ 5º œBcj“ KUÎ’é%”ĞÃŸÔGCÂ³2&ÖC{Tl’B\0­‚Ú± yãH;’nÅ¡³·Ph$´µl‰ß:ĞHÆÈmQêÄ€@±CÃóÆ‚óD0ø)¨úI©ımÏ|¨f<Ò¨(@éÛ¨µ]¤5RÉlG\Z-¢ÖwÉ,¡44çõã—•gÌOrl©²KèöjU ~Ê)‚Eì†tñ;uª´·Q¾Şõ ªÈeeØ–ƒcÊØŸ$ªb^BC¨Ø¸X!M—<VŸ-¥ îŸrSçÅ¤Ö·RÓ±µ3 í¢¬|’‚èiÏê ó-G1•¬Š\"Ia\0;ÔÁmX¸±ËÆ¨.Šhš&\Z’ä«\0EüozÔHßt¡—\\¹«o‚yÕ±¬¢*BNÀOê£÷Ê˜y¥PšCçn¢Õ \0©`-éTd	mYù%ô0æ¾¢<°©æ2µ“Ú–$|@zØ,¿PıqJ±#Ù6Ğ]˜jLZB C­Ã°ò¤\"…Î¹p!åkpÉT±TÉÀH\'õ·î•PÙ4‰&\Z‹U\0\n…&?¥W0\'öBl÷Xù$7ĞÓõ}D)sJV²¤°ù\"\0;ÔÁm_PÔÜUFD^¡åõF&\Z´©,-T\0WÆ÷á[Æ@¸CU	?1\0„ğ±CÂÁ+@ó\r²Q$çSl.QF8‚*†„Ù0$˜j-¸º ÂŞ6ªæ·İ	÷,’:Ik}\r!ê ÿ\0<ÄÚP\0WT¦¾H€õ°[Pù€ËÅ*Äˆ½“g®©Ÿyºô‹´…8+[FLx$hËšÂÖSa`•cRD¢IBA W·Áªì&ÈÕ%òµHR\0\n–b<©9m2Æ÷I(:}\r+¨ø&sk*ˆ\Z÷ÄÑ¯ÖÑeÅÃ…ó¦ä^ÉÛ(ÔŠ­ ¸ 	l$åÑ&TåRæ‚òµ—’¬v…V	Dª	SÊê8f\r[jRd§ÈµH\0*\"a—Pd	m\0³=ÒHo¥¦ËõãSÌM¬RÚçÄ\0w©£1óïªæ\"öT´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|B½œàH\'•íÀâ´ø”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&©®|@zš30ú9ˆ½´6A«MËHÔ€/ãV$mEÅÍ!åk.§Ä!KÙÎ‚y^Ü+O‰C¡tƒQmÃCU\n1Âö©3¶ˆH.’Pô´çõ…G16²jšçÄ\0w©£1óï£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞBV²à0J|BÈâ…4†ƒõZÈœ’”É\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚¶É¬¹ºl†ü~?5Be¡\nÓtKçÌs©òT]H­Ö˜œâÛé äØŠ¸’/å)¢sœ–-\0j	—Æ§!&Ô	j…¤JĞ\\n‰Á8d¦±/*›¦Èİ Á©é@	ñ©%¨’6JHÒ˜ñ©~j&jš€jj)	ÄŸb¤üµQu®\'9.…¦è/b8æ*¢H½’#Úïv’…¡ ¯ªÙ{éL™Ğ)à„3Ar‰kx.f°/*›¦Å1Ò†80‹ ¿µªM„ÆK¬–%¡ãË•MÒ4ªjˆ‚´€Q/p5ZÆé]k…î\0*JúBÙ+H¸ò©¥´L‘î é-\0gZÃø½FG\"T™H”jr\"~Ÿ¹®9ùªnŸÅ7ï85=6SÃÃÂ °H5Ld¡î dxÔŞ‰É¡Â«PsáSå¬n’ÙÔAiSédã\\\\\nùT‘ªd$-\rÚ­døÔdr)åH …uİ‚X/\ZãŸ¦èf²a˜1Á¤ZÊxTš$ŞÔl”=Å Èäh~j¬š!jµN%yšGå¨ºûÖ¸¤pR“€½“÷«ƒ[)!’’ĞĞpu­î¾²sÁĞ””)BäOlÍ`~j›¤ÈÌâ75¤ä-ªHj!´FÉ„…ÍEj<|joD˜#ÔØZ¬(Q/‰ğÅ\r/-EÒb´Å#´HA¿¦ö#u¤\nÙ]’³š\0?R‹\"xcK\'1ò¥Dá3Cœ„¢(Ä\'óX‘Í{§ËíVé„n\rÒ@²‘—‡…ˆcem›î6úRÄ­ş7¢Š+Ö!j´…@/Ÿ‡M¹j.‘hŠW ÔZZoéb8çZAÀ­’RY_¤é-\rÚ­dã•ŠY>¡3UÄ\"(Ï\ZÉ¹ªn˜S§ĞàÛé²›çÃ+SfM•	„…ÍBBbp>4^ˆceEÂ—5DS‰_â›rÚèåNG\'©Í •F©±EmÀ¯•-PË#éÒ\0?U­‡óNnE<©ºÌ¢f«È.Dµ¾$Ö~j› :Ì#!¨\0x.	OTÙ\0œH\\Ğ		c‘ãáL¢}È	A\0áÎõcä¨º67Ñ«Ii[6ö çm¶tP%Í+ˆ:H\rÚ‚ròª›‘ÁÓÑe.´!r\"û\\š†æ©º \ZéO˜1Á¤²<i¸Sk%‰ƒËš’Ç5M™,¸D	jjÁO>ÅPù*bQ±ä¨´‚¿-ìEr1¸ò¢ÉsHâ’Aú‚Y¯U7#AÀXË„ÍÈJ\"ÿ\0\\IçQæ©ºvK|¡\0‹fxpJ·j&Éwî5=)\Z¡TÛÚ”â\"µÃ™şµcä¬n«â7¸©JØ²qÌW\"|©2\\Ò8‚… mVÉªnE<©ğXÉ…q¢(¶\n˜Ôyªn¨S¹.It81,Mì¾úªÀt±(ys\0²åçT*™ Kq…aº%óğàjÁ1¨Hº6½ÚnZZnõX9Öğ&\"¶F­ªT®q@ê·,iÌ’)e@,„‰‚¸©3æµåStíd·Ê\ZàÔ°åıjß–Š€K	š¥\nP/D.\"­7D¾\'Ãª-EÓ^äºŸüBØ„ó­±’<ÖJå®v’Ah\0ıJ95S$ĞP&.Ë5¦j¸«‘-l?sQæ©ºdµ’ß(cƒÒ/öªv¢`{U6Mdµ,†÷¿Â‡z&¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,w,šAVµIæïéQ\"òmW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¦DçHxdSö¯u\'‚6<E&’Q®Ár%-Dh[DÛ˜#sÄ’i´)æì?j™VL¤\n#sÜĞ4€™ŸwL¾[Y”W¨n\0h.?ÀãPjPh]1®.ñÇëSåH\'DâğC€LªotI ”kşU88Ù9@¡mß½x’M\0«¤æ°#¦u“!˜:k¤s\0\0ÌğåçQ ÖH\"Ô\'­Ãã—!ÅjJF•Mk„#K¼C‡ñ|*,‹Ô\'D÷<`&GÛ…JF–LcÄrh%\ZäEÈàtF…´)õLÖ%“H*Ö\\óv`Tä©mM{Ë\0Ò\0ü<Åd\\!™^¡0Fù“ü\n“Z%{¦µâ‡W#PCP¤ES¢{¤¸[*ôˆLcÄRh%áeÁ®TN@Ñ\ZĞ¤S5‰$\rS¤ğ.÷¥NOšM I“^òÀ4§3Ã’VEÂ+e5	‚3\'İãRj“jšÙ! ññ©f¡HÔèçƒ¨[.\Z@l¤„l‘±I ”k‘\0îœ(idFdl’iZËnş”§óÑ #£H\Zs>ê‰C2…âq¥¶¸Ÿàq5$—z ñt»Ä8f)3!6)ğK€ ›sşÔ€{¤Å[$I -~°wÉiÆ…´Cv¢2	dÒsX¤ğ.Ã,R¦4›E,I#˜–€ÜÏU$†T^\'­P1.9r	&~ôê¬Iö[¥Åq!ÀcÈğJLÈª8¤t€—4&\\Å\rÚ‘¥ÔlŸfM€Ç¡“‰ñ²ÕD1à‹¨é>ô¡¡sÀ»õºQ:–ÑIdt`´&g€©nÄô@ç‰Æ–Øb\\rä8šûÑ]U	\r!×Ì1äx%6dêêãÈ	sANb˜t2ñšƒXÿ\0•RÇ¿\Z¨P¶ˆ`…Ò6WéSX¤ğ.ÃÁT¾i6ˆT²¹€€ß——:D5“b”\\\'\Z[†$œ<¼iİ6U¬@4»ÄŸ0Ê™#¤P\Zr$\nqtî–ØäĞ\\v€wZAâ[D2È$“H*ÖãÍßÅ©Î¥,—+ÜÀ4‹f}ÉH“¥“Ò^ñ3PXfOğ8ĞÙP¥k8‡{P\rDÀ¯,yx:€Ó€<}…XTø%ˆŸ ”c°\\œr^u¦:I´C{RŞñ,šAŒ¹æì?AW*É´	è‚W¹€-™áÉ(µ“	xœ °ÌŸàq5@=\0ªYx„#°Ä*€j*·z<¼àı*Ã”Ù(8E&’Q¯D\\Š¢rZ×bÚ#€K{Ä’iZĞW›³ä*¥óĞ \n%Ì÷0\r &g†Xs£à¨Is„ãK|I9ræMUÓµJ^±t»ÄüªóBÙö@!Àò«ˆ{¦”\"“A(×à¸‰çW\ZÑõK{Ä²hZÑê¾.¦k&Ñ;(%{˜\0h	Ÿ!áÎ­e@$¹Âa¥¾$ûbµ^bƒt:„\0µÃ‚3ñ¦(T{œ	p	—>Uq×Lö\rpM$£_‡\0åDä\r\\h[DÏÉ¤cxgU*–Le{£@\0fx|‹w TÕ(‘8AæN:’”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÓ:Ì_ï@¥ì‹£h¼¼…kp\\†~TD9}ÔQ\'ê\Zìx*ùJa6‰üQ<\"f8ÿ\0j‰k)Gh@sOy7z.˜Ğ\'\ZœyŒ¹5,ıéY6&–|<?­!òÔÙ7FÀ%~²­M+9*Q\'ÑIGhŸ¨k¬äÈâµ3_D\\&<\0Òà™…Ë•A­”£QQàAÏúŠD5‘tÆ$á]Ì4\Z‚¨¨N‰¥€êvv¾U,İÈpJc\0•åä+Zˆ¸ü¨ˆrú$hŒõ\0v)€*«àjgRú“©è­˜ãÎ³{%nädˆ@s|9óÈ!1¤L5d\0>u$=ÒN‰X\n»šeìjY…l‘	ŒIdÖG¥¸ƒˆÏ˜F.\\ùR.ÌŒšÀF¸z“\0q_S8±ºRïLrÈš\\œG|ë\"pEÑ!ÃÀƒçRCY&ìLjLÛ\0>îu,èM‰X§[ÀT³ˆª6$¯ÖF¦54®Ü|8EËè‘FR7ê\Zï™2+ˆà\r)ƒ>‰7µ1êğ\\>b¤üÖIÊŠ!\Z†s÷Z‘‹Zè¦ˆÚDãS 8|jYĞÉ‘jŒfÙ™’DÍ2É¬ü­ùAÀ<À§’x%Ş­ÀE&°ù“\'.)Î”ƒIô@dOà½$._Ò¤‡HŠª.\r@Û0N<érµ®†P;u.€>4¹^÷F¼QÄ±‚A^ÀS¯d+hÉ¬…c~UÀ»•8Åäú!GšÃQù“\'cä\r\r\'Ñ\n¤ÔôBƒRCÙK„PÃ1G+ZèTœj&Ù\0pñâ´Ä^÷C+ŒÁu²d¦]0*© K&²­ùW7qLÒªæ<x¡~˜¤Ö5ß2dïu9E‹èåR¬‰ „Ì/¶T¹]	n\"¨\0<ùSf²l€0ÔpÀ—\Z¡½Ó¦ª˜¬S¬¤TÀåº±\0WêwÊß”ÏÈUCæ/¢l|RÜ‘?PÇ.¤Èñä\r9Å¤ú&‚Eziu³çñ¤Î	N-„(¾Dãz¦k&‚ÓçxŒ¹š ,XÁÔ|‚ÕìM,,šÜ­‘‘v+à+Lqrú$_DH¤Öˆ×b\0ñLª”X¸²¡d©VDG[0´ÙÅ%äBxû\n \ZÊ­d°“\rNğ\0eÌÕ\0èZ±‚§Àp«ˆí²²É`	­ÁZĞTBìWÀVÅôM´Kx?X×â˜|*¥/¢w¢\\€Èš]lÂûaC8à˜`”ôÛMÎÄäU\02U¦\ZÌ\0ÏT§d,0u:ÙB—².–\0‘úÈV„\r3ÿ\0—€«€rú*°d·õ€zªdî>uR\r\'ÑA /Iñµ3[Y7ö¥9 \ZÉ9óåM™AiÁs VÍqZ ; `-Q¶CßWËtw¡\r?Q\nÖ‹s8¯…T*y´M€‰úÀF;æL<ª¤¾ˆ©¢	‘4ºÙ…ËúPCÙ1D$B8ùQnôÔ\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢äk€¶’ÓkŞÈ¾us\nY\'H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtYh„\Z4)k\0¼’µˆ$VÊMB9\Zäô¡i JÙÎ¢`K qK´MG\0\n-¹X\ZËÉCtW 9À“n½#j¤{Bs#qzÙ0áQÊÕ(¸D¿x#¸\0JÚÙ¥ïRÜÔSe® â \0ı$‹â®1&şT]Ã“Ó¥	Ì®KS0@§•\"áp…¨à‘P{(¬0¡º<ÈÌaä9l˜ZLåôJÉ‘µ¬%Êˆ,8s¤bİÈMNÔhÁ\rìmÃO/5Ÿ)[!-Á ’–ò«ˆ$9ò¥EoÓ¤‚@•²RÉ<¨²\0D@ (¶÷¦¸ärĞ¢†¢Èô‡¸l˜qşõ&/T­ÜœÆ†å²:†d®ˆÁ\r-\n@^œ8ÔòóÙ\'Zá j@éµ½×­\"	ò¤Bdš€¶’Ò@ŞÈ¾u9\"@¥’µÒÁ\0×X¶½uÇ#–†é^¡ä8•	úÔ˜½PšÆ†à}<8Tr²F&\ZYwbA¶¦f—/5”Ùj‹QP\0MÚRÀ~Õ¤\"H¯•*\"“PÒZs%l‹†–H)åCdâ&£‘QPb|s¸æ<´4)]h{ƒ–Ö·\ZL†DÖ8%†Cİ@`j’ á0FãŠ¸§\Z×A=«LZj\r\0ô¨²~×­aE|©QŠ‡Ji<JÙÎ–HÈ\rĞÉAÿ\0e¨äT^gÇ1XËCt2·4HàâlGr½RelhŒ—d….Vªj	š\nìNGšq Gš‚éWU¢\"ä\Z4’–†U¬ H«2JJ\\”-%q[%FL$k·K‡«ÕƒY˜Ğİ4.h‘ÁÙ QG+Õ%\ZÑ.Èmí­TÕ	šEEæ<34Äy¨.“&Æ¨5&~’–ğ²VğŒˆ«2l†UC¤4´ÿ\0äVÄ/9Æ@RÎŠ,åÂ¥Ø¢Û5ãÀÖMÉCtÁì@æ	rúS\n(èªÖ°—j¶B†7M—	šCQQyÍ1zYzˆ\n\0\0â-aüVğ‰\"­Ê›=ĞË¨7Ó¤‚QMìE9ÄO*Rá@xG\" Løğ5¼´)ŞÈĞòO¥>tù]0€%À ç•X‹T¦„ÿ\0ÌmÎ7÷.&¨zø”qê .”‚E¬«xD‘ZE.ä¹u\0té æâ¶!|êç<ª€+)pˆ¸zˆ[{ø\ZÏ”Æ…7K{ÈrØ€£\Z¦tÂVÇ–C÷ªjè‹÷ )(!·(·¶	úÕÏ@‘Ç©€\0$YE€·…o\0d+åJıÈe\rF†–›+¯bÀÕN$[Êª²¥ãÔB€?eàk>^ZüİÉR0<‡’ n<<ªÀ~åBÉA…Î[&\nlÕÑBH™¨Ğ§Ûš`P];\"`r+\0~’˜Ú·„I²/D‡i:t–7±Nq\"ÖUe•~ÈG‹›€8dRÜ”7Jõ@ö	¾”\n*¹^ª…’´8mÃ‡Æ¨EªQz¡´­F…(¨m‡Æ«ÏAtÓckjDäZÀ~Õ¬\"¶A¥’æDn’ÒP-ìkU @¥(³Ú£“R-±+üTV7Uu{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶Jè¯f¸¢V²g‚Up(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\4•\rq!\r¹Y<’¤\n’5\nÌ`8¹	\"œ/j\0/p›¸Js_%ˆæ§ê	ˆ™‰’z±º&	$\0¿ÒÒ…3#šà\rO!7IÀ+[#\Z †€‹`-†<)ò_DÊrKA%qçúX­P™ÿ\0ˆTOpç‚TÕùdè¡`]@IpÈÔ\0^à¥b–D‘‚YêhÅ©qà‚â²0\"ÖN„Õ1| ú\ZPé\nG\0ÔòŸ½e$ò•±ŒirÜ\0Ô²l1áV 	{EJpqRĞISúş–½i$CU0F¸¢V²g‚TjÆÈº†6‡„‡\0¡¿ïR`}d²%¾¦Œ¾ <±±8Ìj,Ó$ïK\n7R9ğ¤@Ê¦ÊIbµÆÁ¨:á %ˆKa\n¯¦	{{Ó”İ­%Àø^ÈpãKöBUL\0I\0eÂÜğJZTd]BÀ\\‚\0º|25\'ÍŠLÉg\\`–zš/¤â<-zÄã”mPÍQ°>D/ô4å™ñ\\©&öRie±­n n\Z(D¶íT1‚^Á.û¦ê7kN Oë\"†û¡&Ã°kŠ!Í-€ÎÀRÚ$AVZĞâH$\Z¥øà‡Î ã\0¾…	NF˜u°_OÔ€ÄVG²tVÁ$ zZo§ê#Ÿ\0i{%e©\Zµ\\\0¡	oâÕLöŠ\\5\\´Tò¿Åhchš$ÊÃ®\Z\\ˆy{ğJÚVe@qrE8_8Ô˜D«–wkˆßSEôı@rLEA4L‰…ò€^t0ßMõ\0Ğ Mì‚x-\rhÔP\0E²[TØUŒq2sd»Â=fíU<¯d+‘ZmxÆ©x)¯\0\\ˆypAà”5@•\0G‚Ö‚IRÒ§ã€[Ò8âèQÜ³¼¾ K¶‹é¾ 9d@¨01µ“ôª¦ë”ÿ\0KMôıGÅpodÉ)á€¸:á !DÅ¸s°«‰/¢UÖê\\´SË…ğãU_(²V»†’B_%4‘`d·´\"‡\0¡øÑôÀ/p˜Y$ˆ7ÔÑ}9Ë¬Î2-dĞ´I(çC\rôıDyà*„	½ŞÔĞÆ—(PĞÔP@\nÜ1¾¬q‚^Á\n‹±h*§•Ï•ªÀ6N¨55ÇHôó%eLl†	NkuÁÁá|yŞŸÓbú,ŒÓ­¢éu’b*~œ£k*@Ğù\0/ô´Ü4bG5ÀUG•ì¬˜ƒ®Ö€–Aq†7µm`—Ñ¢„âĞëÂæÇõQUWåŠt	dª4”\rı¿SdªBQT‡±¡ÅÀ+HE(qÇßW ÍAN×Y$ŒÏSôßP“*N3\ZŠ„İÊ‡Èr5§éÌk€ª2¬¬“¥\n\0 „Q‡éZŒ`—´R¿r„âĞUO™µù««ò‹&–]ƒID?§êl•@hK\0†~ä‡ÆĞâëàŠP‹Üá‘§È\'î§¢Æö¾ KQí\ntßP“*9HòÙ0yŠ\0$?ÒÓƒF%x®¨@›ªµ“`»UÀ,ƒ1½«A\0Kè‹ÑQº€l}ãô ÕÔ\Z§d©\0’\0öÌÙ*ÃØ¡!ñ€âQZB)C?­€Ñ0²¼>0K=MÓ˜¸¥.B-dÜÈ\Z×ÈŸéaºf|W#UÊMĞúÑ.¸hY\0¶òÎ´rú\'`Ú¨ã‹ZISñò+VX$÷ ½šâˆyZÉ	UÀª!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½œàH\'•íÀâ´q(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„){9ÀO+ÛÅiñ(t.j-¸hj¡A†8^Õ&`–Ñ	ÒJ¾–œş£ğ¨æ&ÖMS\\ø€õ4f>`=ôs{!hlƒV›–‘©\0_Æ¬HÚ$‹‹šCÊÖ\\	OˆB—³œ	ò½¸VŸ‡Bé¢Û††ªc…íRf	m]$¡éiÏê?\nbmdÕ5Ïˆ\0ïSFcæßG1²†È5i¹i\Z\0EüjÄ€-¢H¸¹ „<­eÀ`”ø„)u O+ÚØâ´ø”+3-$€\Z©a…fd	mØğJ.’@C},9Ÿ˜…fdM¬©‚&¾H€õ4Y~¡â¸¥O1²’=«[%\Z´ª‚%ıÅj¹€-¡H?‚p7PÊÖ\\€šäŒ(BA œ8Û÷QHèJJ[¨…!¡ª–ßºŠÎRrÖ5K.’PC=\r*§ê#Üµ™‘6²±òD¯SFcæ+ˆ©r/d™ëªÖÉF ÑpBÛŸ}PŸ)oºT±ºx*¤O\0–à-aM¯(Ù	%ApU<¯¨©\"ÄÙIŠÌÍÔZTµRÉlyÚ³”œşÈEûÒœù%4haÏê\"²2&ÖM½¨Ù$‘\0ë`²Œ@ËSÌEì‘\0÷­Œ˜j\0ZB Bøß:± h¥õM©sAo†Ap	H‹‘dp)€à\\\rÎ\n/ŸšÔ5‰!C3u’CZ*%±ı*e\'- ERÜ÷ÈzZsúˆñàk)P!$’ ½lêhËÅ*yˆ½’ojÖÉ›¨5I* Ká\Z± ^)š\n)\0„?¥¹`tš¼ÃD‘\\9ÀO.ìWÊ¥¬J™Æ¢ÕF€¨l-¹T™[@†I/’PC}\r9ıD{«#\"md3Y%’ ¶/ÔXœ*\\‹Ù\"–ÌİA· …(„)<øÖ‚LZñB`8–‚ÂÅèxÒjó˜+Õpâ	SÄ\\¥±Ä*\ZÄÙ©Ó\rD\\\0İIa…Rd	oºd—I$ÒÓõå‚ÖdÈÚ6ö¨ÙÄ=£5R> R\"öC?zÒÙÆ­8*€/ã{Ö‚@ûªHµ¹¡\07äQp%\rr4EÔlâl.qÏ¡¬J(…Ó…-À\0¨m†<íHÈßt Ågt’Jj1§5õîZ‚dmdÛ…U6GÆ\0qÔÑe\n {À¦%(Ü8MµÕ<L5iRàBÙ¾W½h$oº“+\\\\	ábœ…xÕ5È²	88‚Tş¶ıÁò \n¹²mìKtÍÔEÑ¡P Å9Ğdå­Yß$²‚èaÏê şãÊ¡ÉµÃäˆ\0ï[µ]@Ë@ª\"öL‡NlÁtª‚Şõ¨…b“2…×% „ğµ¸5MyĞJ	SÊöıÖ¨bl†J|ÍÔZ¤\0-–8p ÉÏì„ÛÚ²¾I%7ĞÃšúˆñÉjL¤mdÛÚ–×¾ ½MV`eŠ-P”…ì›Q7ï7Vu _khÉ‹}Ô*\'&V¶~*€¼£d2Y%CœalQF8­P%;ZéO˜I\rkU\n?zf@–Ğ!ŠÈ÷É(!¾†ş¢3¾B§˜›YS\0{JÉ$@zØ-¨|Àeâ•BD^É³÷¦‰›¬4]¤)D\"øc{ÖÑ“Ñº’Ğˆy[?Uy$İ©dCœO+ÙF6+V‰²¤—Ì5UU\noŞÕ2Ÿ1kD!‰Yé$KM—ê#’\"T‰å² \0K’05úš(Å£,qª\"â‰ß½4J5iUi’^µŒ€-¢,¨­ËA\0ÒÜ¬‚¬\r@B ‚A+à¸(±Åj¸”ÀI|¡Kn\0j¡A†<íG0%´Lö,¯t’\ZiıGÌaK˜›YÉŞ¦.cõª\"öT¢é¢`§–ª\0¿i\0[E7*%Í!åkpÉWÄ*¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\n^Îp$ÊöàqZ|J¤\Z‹n\Z\Z¨PaµI˜%´BAt’„o¥§?¨ü*9‰µ“T×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ†G)¤4ªÖDä”¦I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁIP¦Ğ~«Y’Q2H£\0„‹LÕuÜ‰Ì|k*Ê¤ÕQÒ85,\0SíÂ‡j\'ÁFÉ¬–¥Ş÷øPïD)hBµ‘/‰ğáOËQt®ŸœP´äÛØŞ´‰ U™\nHâ…4†ƒõZÈœ’‰’E$Zf«®äNcãYVU&¨²1Á©`Ÿn;Q>\n6Mdµ,†÷¿Â‡z!KB¨‰|O‡\n~Z‹¥tøÜä\n…§&ŞÄ~õ¤I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BHIF§|È‹˜øÖUŸšèfFe!©`€Ÿ†U$±d™[eqjY,xÒw¢lD#SJ÷ÆŞT¼•S{­Q=È7@ÉûÕÅÀ«2O¢9â\00Ô\0U3r(Ì‚5@Ó÷Z®*äK[õÌÖ\'ç©ºUŒ¡„5,—Å*Ij*½²Q#‹@²cÇáRïE$šbjµ“I_äT±…EÒ¹ZbyA©ğScZ@Ê7ò©\"´L|ÓbĞ\Z­`\ZS<Â”Š\\5KLĞ^T¢ZŞÍ`~j›¦ÌÓÈjzS\Z’€æˆÙ(ys@ô¦9\ZWA	Â­>¤Kã|S˜©òÔ)­–¨^PjBÒU\ZÄükH¸ò©!ìG”(Z\Z\rµ²\'óS‘È¥;Ã„ÍqR‰ÎØ]Öæ©º`#2†Ôô€>?µI¢„L”<–€@LxÔŞˆàS„!Z‹‚ç}/-cu&.µE#À\n…¦èØ5¤\n³)!’\nÖƒõ°ç•,E•\0%‚%j¸‚Q-cçÆ¸çæ©º±Y˜FCn)E|6`ò[§Ò˜Şÿ\0­&z!{aj°€Q/î\\\r&1¨ºuª)ƒV’ÒU\0[\"b1­`àWÊ¤…%‘ÈP€ĞmªÖÃ©L(Ü¨b”%j¸«‘8~¼kóT 8Véƒ\Z–²‘Ïö¥dêÊ6PòZlGûÒºYp„+qÂøüV˜ùjO‰çHÔ…¥l/b8çzÚì¤êK!ÒP´4ÔY>4¦äR‘MÂ@\"V«®äN®f±/*›¢Ê(a\r ¥¯ãNÉº¦Ì\\Ğ!Bp>4]¡p…ªÒ‰ñ¡¦>Z„˜”èär\\‚Ò¶mìœs´­Ê“2Èâ’ĞÑÿ\0L“’S›‘û)²Î^&hsÊ”Krâ˜ÖLeStÀdœ0†¡DÅ0áNÅ4\"o¸KrLr<i†B¢D!Z€á~¸\Zcå¨ºî™„\0¤J£F«Ç…r àU¹PBdr-kA¶«d˜Ù/N`‘O*e.…r&>¹5eSu@2ÌCJ‘Ç ¶ó§cÁW\0€J$.jzP¡ªJ¨K„-V”(ŠQO‡T5M»S÷%Ğ´•ôŞÄqÎõ¾7­Ê‘­æyB…¡ àëXÇÆªnE)â+U”¸LÕqW\"ZÆØ.dó¬üÕ)Ú-ò†Ò¡øøcUb¨\r5BÙD…ÍÒ…_Ò˜A§zD!Xn‰|O†`Õ–¡÷LcÜ}$£}VDÇ:Ş…|©j•+Ü…@êQËù§3)Z‘LT¬Ê%n§(–¶¹¬ÃÎ÷Uk%¾PÇ‘`\0&è‡…SµlM	~á-Ò˜ñªè›2V¢¢_.¨|•Jé‘½À]q%\0T	Ç:Ú|¨d¼¡BĞú­’S“‘FRÈ¢a©Ä‰nÃR>jŸ2,Ò†85-e?ÂSv¢¦T%.jzP¡ãL¢L€‘ÔÔD¾\'Àñª%EÓdèÜä\n…§&ŞÄ~õ¬I¬È°RG)¤4ªÖDä”L’(À!\"Ó5]w\"s\ZÊ²©5E”t\rK\0ûp¡Ú‰ğQ²k%©d7½ş;Ñ\nZ­@äKâ|8SòÔ]+§Æç T-96ö#÷­\"HfE‚’8¡M! ıV²\'$¢d‘F	™ªë¹˜øÖU•Iª,£¤pjX\0§Û…ÔO‚“Y-K!½ïğ¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡iÉ·±½i@«2,‘Å\ni\rêµ‘9%$Š0H´ÍW]ÈœÇÆ²¬ªMQe cƒRÀ>Ü(v¢|lšÉjY\rï…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤(SHh?U¬‰É(™$Q€BE¦jºîDæ>5•eRj‹(é\Z–\0)öáCµà£dÖKRÈo{ü(w¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿ&²Z–C{ßáC½¥¡\nÔD¾\'Ã…?-EÒº|nrBÓ“ob?zÒ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•Óãs*œ›{ûÖ‘$\n³\"ÁgqÉ¤kTnş•/&Ñ5r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢8‰dÒ\nµªO7J$^M¢Èç0\r ™÷rZF–BDá™8xtªJVP!Ş ñåÊ-Eœğu\0™{f”\nİ±F‘ô’wÊ¸päµQ,[D*qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â2pğéT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$LXbN^#ó»Ó„!¶ ŒòCáSå¢Hâs¡l\\é\nİ#c„ri%áeÀÀÑ\ZÑ\"¡,šUZËnÃÍ)N²m8¦=î` ™÷Vr¥B…Âp\ZÜ1q?ÀLjM{Ò²0áCäïq½/-\nwM‰æ@u\0™d¨©½”I¡Å\Zï•rv	çDh[D¯ŞŒ¼K&•ÔÖOì˜¥Y2LÁät` ô­ÏÁ9ÔÊˆïD\\\'Ü1$åÈq¨5B6¼@4»™1ñğ¤Ì•]6\'º@u\0™OÛ•JhI¡Å\Zü\'`‹ÌSh‘âŒÈ$“H:šÕ\\ÕÙùTÏæ“h£\"{İ¢Ùò\nõ‰‚‘\\}Ş5$=‘P˜Ù-G_0áŸK5ºdOsÁQlªtªL‰’6)48£\\‰À:È9N!‹hQ¢7HÙdÒs\Z¤¡ÅØğ§Y6\ríDùÀ4íPC#•Bñ;tŒ3w¸eRÏe6DØZñ1äi3Qé‘=Ï@L\Z]é2¶HØ¤ĞJ1Èœ°OU\nÑenK&CšÌy»4¥0òm¨Ÿ+˜4\"İ25„ÈÙ‚lÏÃZì…bFÂË™ç‚Rf¢Ç!x%ød ü(\0”QSdloÓ©\ZûµU°NKU\nI´I”t’M:•¬¹Å°óJsù¤Ú!•É)`\ZpÌßôJ‚Nˆ#g™#B÷Zš)÷Bd6j(ÉğKš%ÌPİ\n› M.puÂäåDğ5p¡mÄÙGH%“H:šÕ^nş”çRÚ€ Us\0ÒfxTšY4·=³\r-Ã}ÃØ”ì«îBÌ<6j3ªdx:À#/í…ª¢6Ñ^Øß¤,v“—ö®“h›{P¾FË&–•kUH¸.Îœƒ–Ğ%¢^æ\0‚ÙŸrRµ“JsÄá†%Ç.A1¦Î®ƒî6†ù‚3ñà•`5]±îál¹Š ›!¤ĞJ5Èœ“5p¡m\n@÷‰dÒ\nµŠMì]ïª•dÚ  •îŒ\r\"ÙœS’RVœá8ÒÜ1$ÿ\0ŠÕ2Ut\ZÄ-Òì1gãÌ-1DÛÚ©²9à¨\Zr<xÕD=Ğ–×ˆ¤Ğ¨×Ü.\rr¢yÕF…´C=P9âI4‚Ö\\ß|*¤9‹h˜ A+ÜÀ4€™œ|“*\r-dÅRœá8A†gÜ8“USAtÙˆAÃxß;åL|½èºŒyx:€#\"ETCİ0Ã„OÒJ5Ø.N\'KW\nÑ9âI4‚­h$óvôª•dÚ \n!‘Å€iÌğåA¥¬š[ˆœin—¹8S©(²\rB Ä1ò¦¸Üçƒ¨ËÛ4¦+tÏb\"7é%\Zï•páÉj¢X¶ˆTâ%“H*Ö©<İı(‘y6ˆW#œÀ4€gİÉi\ZYI„dáà9Ò©)Y@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅ\ZDoÒJ5ß*àÃ’ÕD±m©ÄK&U­Ry»úQ\"òm®G9€i\0Ï»’Ò4²’\'<ÉÃÀs¥RR²€ˆAñ.Tyhš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sˆ–M «Z¤ówô¢EäÚ!\\s\0Ò\0Ÿw%¤id!$Ny“‡€çJ¤¥e‚â\\¨òÑ4Q¹ÏP	—¶i@­Ğ{i¿I(×|«€wKUÅ´B§,šAVµIæïéD‹É´B¹æ¤\03>îKHÒÈBHœ ó\'Î•IJÊ!;Ä<¹Qå¢h£s /lÒ[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌH\0f}Ü–‘¥„‘8AæN*’•”Bwˆ<yr£ËDÑFç<@&^Ù¥·AìQ¤Fı$£]ò®Ü9-TKÑ\nœD²iZÕ\'›¿¥/&Ñ\näs˜\0Ìû¹-#K!	\"pƒÌœ<:U%+(„ïxòåG–‰¢Îx:€L½³JnƒØ£HúIF»å\\¸rZ¨–-¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!Qh‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH…qò¢İèP0$Ÿ\02òÍhg½ÑbŠ6–¨Û‚Øz.TkD¯ÔBµ¿*à]ÇšUF¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `I>\0eåšĞÏ{¢Åm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡[Ra©Ød\\<hnnôŠl@Æ§Ë\n–k¤õDÀ$“S‚µ¶jàN+à(ˆrè è‰ÍI¬k±LÇô4¤¾‰\n†(Ş€iu³şud¡VH€<9óò©!B6¤ÃS°\r÷4™ûÒ²l`°<Àà*E/dî‰ Jıd+ZšWî>TD9}ÑI©±Lõ¥0ÅôEè™ 2&—ÜÇ¾³5²•@57’‚q¤C!tî§È494™4èŒnôåËÆ“)\"®±%“[‚±¿(9»€¢1rú$ôctn)5¶Ì~)€w‡Jqbú!¨­ë \0bÉYö@¢²[QuEñIšÈ¿z&¤¡Iâ€9t™êR!6%`:²åSÊÉURY5ŸSZšWF|À§¹s`Šx¢:b~°®ù“\0Oº”âÅô)1Fğ^\0kP·JÌ‡Cê¡-€(> œyÒf¨B DÃQÂàğK­&{¡ƒÑJÀUÜù\nL@­’\"¨š’¿Y»\ZšWî>œ\"åÍ¬¤OÔ\ZwÌ–\0ü\r‹B¹@4›YEª] ©Å°M<ˆ+~b“23q	€\0à¹Ÿ\ZÑñE,S‚eqoÒ€I[@‘úÈV¶Íq_*¨G˜¹²\nHß¨\0\Zï™2+%¢qå/¢©x®¡n*Ht!ql!AU±ëÏ•ÖMP-˜+°\0-¹‘šĞÄ¢Êãÿ\0ŒFÙ{q4ÄHB ’¿Q\nÖ¦•À¸gÌ\n¸EË›\'UNÿ\0‰úÇ¥ùXWÎ‰Å‹è‹¡‘^ˆëf“8¢\0@H„(Ã	ş)³Y6cT ‰Â“n\0ÛÌSêQk+`,Q\0]*`2İ,Êıfíjixğµi’_DWÅ’\'êK]ó&\0û§8±}\ntÕ„½4ºÙóçK•Âè”â\"jŒ,\\|<*™¬›{U\r36Ä\0·ñ\"†z”\Z*c9Ê2×P	İ@–B÷c~UÀ¸rÌ\n¸/¢b¤RkhF?æLÇÎªQbú!éÅ« \Zl¼ÿ\0µ&LqJv˜ ysæ8U3Y4µ…w0\0ËÇ‰4À~ô)1ƒ¨€2úb—BXId/EklÕÀ¸|i\0åÍ•X2õ€Ì™WÎœƒÑC 2\":Ùørğ ‡²vJzB¦Ù´ùß’U3w¢è-8$ø\02æxÓïtÀQ€Æ£l‡ïT]è–ÖıÙ5¬hFƒ8¯…\\j]”ÕÀŠM@z]ó&E}ôÈcÍ¢b¢¨dDÒà˜¢‚È}œ…nÇ2i·-uL@	$ø—–kM÷NÅm,Q·°şô\n]\Z¨Ö‰_¨…k~UÀ»4ªKè…E¢\'ê\ZìS\'qó¢A‹è…oizipLÂûaRkd! BxÇÊ‹w¡@À’|\0ËË5¡÷EŠ(ÚX£naıèº5Q­¿Q\nÖü«wiU\Z—Ñ\n‹DOÔ5Ø¦NãçDƒÑ\nŞÒôÒà™…öÂ¤ÖÈB@„(ğ#•ïB€	$ø—–kC=î‹Q´°FÜÃûĞ)tj£Z%~¢­ùWî<Òª5/¢ˆŸ¨k±LÇÎ‰/¢½¥é¥Á3í…I­„QàG*-Ş…\0Iğ/,Ö†{İ(£i`:¸-‡÷ RèÕF´JıD+[ò®Üy¥Tj_D*-?P×b™;_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“à^Y­÷º,QFÒÀup[ï@¥Ñªh•úˆV·å\\¸óJ¨Ô¾ˆTZ\"~ ®Å2w:$¾ˆVö—¦—Ì/¶&¶B!G|¨·z\0L	\'À¼³ZïtX¢¥€ê6à¶ŞK£U\ZÑ+õ­oÊ¸qæ•Q©}¨´Dı@#]Šdî>tH1}­í/M.	˜_l*Ml„$B8ùQnô(\0˜O€yf´3Şè±EKÔmÁl?½—Fª5¢Wê!Zß•p.ãÍ*£Rú!>F¸i-6½ì‹çW0@¥’t‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’ºÉÔ÷›^—²Üõ\rôñm¶;X6ãq3’8¢hRç +ËM±®^Ïa½ê[¼}?§ã–]ŞiˆÂ¦Dè?N‚¥^<y2ÌbÆ²H°«È½Gó7TßwßJÜty÷;~ÛÚï`Ùÿ\0€^øÛÔà–aûä!ÚKŞ±´İ€Ö¿Xt¿É~—Ó}ºÛõŒx²z—.	ä9X†q4aD;i›H“£/i‹¡aÇÓ§àÑ‰/ú¥¨øö¯_ÃË^ª8ü+ò‹•âTla„¹l–ØÒfª*¥¦j5€^cŠq¢² º,Ÿ\\P4¤¥€òJÖ ‘[%u$k€¶’ÓkŞÈ¾tL)d:E¡j95\"Û¿ÅgXPİ;¨èÃÜ¶#?\nLõBŒ0—-’ÃÛ\ZªŠ«J¨N<ÇãCsĞ]\"µD@Ô\Z\Zíµ‡ñWZ¶Rè¤\0€…¦ÀºåÍjg,\ruJQB\0(¶çÅ0¬¼´7HÕ#ƒ‰²\\|9\ZF/T;SDÆ0FK–ÈPpøÔrµPB5ûÁÁ	^\\/|i75ÔÙj‹Qä\0ôÚÉûUÆ&æÈVğ@¶’Ó™+d_:S‰å² k¾ÃQÈ¨¨3øV$rĞİ+£1‰¶KŠ–E‚&Æ#%Êƒø˜Š¤Œ8LÔN7Ä{Í 9è.…ªä§H$zlrÊµˆ$VIäDn”%=ElELâ@§•ÂZˆ[¥á‹kØà¼\r`A\nnêËÈr¨#\"ØĞÂJÙ,2©åj¤]\"`\nq#Ãâhåæ K½jˆ8«Hh8‚–ø­\"	ò©#±\\À\r-&ÚŠØ…Ã:S\nYŞ–!j:Åk‚ğ5-\nnêÜĞ÷d¸ãÂ¤ÅêŠh‰­kœ¥ÃãI™QjûÃK¸!+—½èåæ J¡i‹Y\0844¥,íZÂ$ŠÙ%$Õ¤€¢›Ù”â@§•“¨BÔr‹ÄŞ±1å¡N‡½[šàâT&|Ö‘‹ÕkC	v_µ¬†VH™¨Ğ¥˜ğµèç C\'Ä¤\04¤¥‡è—­ 	nT™IT¤Óÿ\0‘ÉÎ‰Æ@SÊ†)Â&£‚[\\ùğ¬LLhSgTæ‡¸8à˜.>yPbõM”kC	r„ı‡ïG+U%Z„Á\Z„‹ğ#Šq¦#Í@Šx§Ç¨¶è\Z\nX¥€­¡E|©*“XĞÒÒQ\\VÆ‰ÄO*m_e =EAÏYòòĞ§R…Ì!ÄÚÊ=­C=S\0ªkDd¸]\n|­Tw¡.5r‹ÀÛ‡\Z¡jEÉ±	\04ZRÀpÊõ´\"¶HŸjC€:t–’€’¶EşiÌ)å@ãu˜¸B4¸!EAïàk61¡ºª {Üª\n?­6z¦`a.[pÀP\0U?ŠDÍFpÃÅ\Zb<Ô%®›¤õ†‚G¤¥€ı¯[ÀÙR\\ ˜9\niÒmê½‘pÎª@K&Ê\\!n’€ãlO`ÖDrĞİRF$pq*>tÙë¢ˆÄeÏ[d8S‘Á\"véj.<ÿ\0­09¨.“#@¨\0Í¶°­áGÍdÀ{¡—Po§I¥ïb(œH·•*ıãpìRÜ”7Eêì89l@Qğ5\\¯U@ ’å¶C…1©C½~ğAsŠ~œj¼ÔdY:0ä\n âÛX9V°‰\"¶CµÀ)¤Ål‹N@K&şÕ—P‰º\\€ãlO\n–ä¡ºbª{ƒ–ÄaÇáC=SQ±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[‡…&z¡FÆK–ÉaíÕET´ÍF¡pÌqN4VTE“ãk*ƒô”°IZÄ+d®¤pÒZm{ÙÎ‰‚,‡H´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨Q±†å²X{cC5QU-3Q¨\\óS•ÑdøÚä\n ı%,’V±ŠÙ+©#\\´–›^öEó¢`K!Ò-QÉ©Ø•ş+:Â†éİGFàå±qøRgªla„¹l–ØĞÍTUKLÔj\0¼ÇãEeAtY>6¹ h?IKä•¬A\"¶JêH×m%¦×½‘|è˜ RÈt‹BÔrjE¶%ŠÎ°¡ºwQÑ‡¸9lF~™ê…a.[%‡¶43URÓ5\Z…À/1Å8ÑYP]O®@¨\ZÒRÀy%kH­’º+Ù®(‡•¬™à•\\\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!KÙ®(‡•¬™à”p(!£\0’„‚\0R„_25&\0Ñ;šø-õ4_N`râ•$ZÉ¨Ö¾P½-(tæG>@‰>k!hlcP7h,ƒ1½ªÄ/¢WE{µ¤•<¯dÊÅEW\0…/f¸¢V²g‚QÀ „.ŒJJ|pÈÔ˜\0_D,îkâ·ÔÑ}9ËŠT‘k&£Zù@.ô´¡Ó™ø-$ù¬…¡±@İ ²0Æö«¾‰]îÖ’Tò½“+\\½šâˆyZÉ	G‚º0	(H (EñÃ#R`}³¹¯ˆßSEôæ.)PbE¬škå\0»ÒÒ‡Ndsà´“æ²†Æ5v€È0ÃÚ¬@ú%tW»ZISÊöL¬TUpRökŠ!åk&x%\nBèÀ$¡ €¡ÇI€ôBÎæ¾ K}MÓ˜¸¥A‰²j5¯”ïKJ9‘Ï‚Ğ\"OšÈZÔ\rÚ\0K Ãoj±\0Kè•Ñ^íi%O+Ù2±QUÀ!~~÷ßäëîn¡¹Ûõ-Îï§ìcÿ\0½\Z\'M¶Û5Aªx	i™ò¦¢^¹%«÷×¡½éoMtüYú~<[éù¿!ÍÎ‘•yDlÑm^¥}\'§ôİÓeˆFY/Ìj|Á|ÉÛìw=×Ğ™Ô÷›mO¨A¸İîwr¶YÙÂw4½ŞéBÙMw¾µÜo¶ş•ßK¦áÉŸ-¼¡c‰”Œ¦9]…X;r7òÉ\rCŠ&YH\0T¹¢öWPü½Ø=,¹¿û‚=óšâ{¾çvASa$q\\êüa°üüÁê KÀáÆEòÎıÆ\\Şåáqô>¥–£ˆâ@÷/±Û]óÓ{ºo·Ó6]pmĞ“¼Üô©¶Û1Ï\rÿ\0-î1—;J\0äWOêOAuJâçêùö?Uÿ\0ÒÇ3Ëpa©<V®›f4±óv	}‹¶1¨´\0–A†ŞÕãD/¢ëîŠ÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º5 –‚H\'•ÿ\0K¦Úˆ&ƒI@énx%M]²¢ÀI´„SÏ/zƒ\0è‹).kã±ÑtÌIˆ¬ùHµïtlH¥¥‘bG5À\Z\\„İ\'bµ21¨9h	ÃŸ %ì5M\\ZÒJø)ı-z+`¥85Åòà™à”š¬QğVX‰¹ªH\"øáÆ Àú „§	\"Ìõ4_OÔ.5™²3\\ =-7\rK‘ÿ\0ÕÂ§›¥k-mŒj(h¡\0Q…1\0KèM×by^×äAª¯”T)¯‚0ìŠ\'†A8Ù&ĞÑ¨Æ.MM (Eü8Ò0\0¾…’~ä@–MÒq–DVRÆEªL`’P–)õî¤c&öC©±‚àæ«ZYFpC%Í”ŞéªnUıÔ\'Z\Z¼±²MØ¬8úZJ\0Tad	‚Rm\r\n48¸‚A\0)#>	{Ôœ`Ğ¡!Áñ‚Xu4_MÔx%ˆ™Ç!j„^÷DÁ$€úXo¦ú\0iSd,´±ƒP(@J„Fì*Æ0KÚ(~ÔzÊ–´’§‘[~…E6ĞYÕXyP×Cí˜-¡ ¢§1¡ÅÈ­ $40èPÉ×%¦‹§Ô>5™ÆEEBl£uÊyÒÓô¢9ğdÔÙ\"–±ºƒ®\Z* ¶ğãV1‚_î¤È•­r¯‚›!ÂÅE66Cz°kœ€x[,ğAChtC·1¡Å× €Ü_8Òú`Ğ¡–wkŒÃ©£$õú^ ã”j,›(İr€_én!¨„øŞÔdÔÙ6Ok¨9h	ˆØcÂ´Á/¢MÚ¬¸İ­*	ñ_Ğ¡QTÚ\"Šµ›5Î!+%¼’†ĞèŠ%¹€8”$8\"”\"øù\Z>˜ôC¬îD	g©ƒé¾ 9& TdZÈĞ´>@Î–§3â¡\0¦ Mì¬5(­\rC€¸ÃáZ`—û¨ø¨\\nĞT§¨L¬V©¾è²l	Dı\'’ScFC:Q¡ÄK\\ĞÕ(—RpãA€ôO¹ex’ K=LO¨àSôÈµ•8ñ@>ä -?HÄø®ª8É©²›.BÖ€– aì+A\0KıÔ”.Å ªø^Äx_²,„ª9Ã‚\nuòš:S˜5\\‚4©Lñçz“\0Ü*Y® K=mÓ˜ğLirk*½Ğ$£SÎ–”:~¢9ğZ¡od0MÊ4²l9Ú´¾ˆe	Å­*§õµğ±_*°°(=ˆ\0â€ÓõÁ)ÕØ¡)ñEÈ­!¦xáÆŸ î\0Ë+ƒâ³ÔĞ§IÄ\\@©ä\"ÖC½µ²J¥§éÌø®Ÿ)7Cµ“DcP!C@BB\"Œ1½†u ƒ—6FœU“‹A%N<~+WWaªÉ$†’@Ü™àU@hSj t`P@\nP‹ã†F‘€ôMgs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^ÍqD<­dÏ£A]”$”\"øá‘©0\0¾ˆYÜ×Ä	o©¢ús—¨1\"ÖMFµò€]éiC§29ğZIóYCc\Z»@	daíV 	}º+İ­$©å{&V**¸){5Åòµ“<!t`P@\nP‹ã†F¤Àú!gs_%¾¦‹éÌ\\R Ä‹Y5\Z×Êw¥¥œÈçÁh\'Íd-\rŒjí\0%a†7µX€%ôJè¯v´’§•ì™X¨ªà¥ì×CÊÖLğJ8…Ñ€IBA\0)B/\Z“\0è…Í|@–úš/§09qJƒ-dÔk_(Ş–”:s#Ÿ DŸ5´61¨´\0–A†ŞÕb\0—Ñ+¢½ÚÒJW²eb¢«€B—³\\Q+Y3Á(àPBF%	\0¥¾8djL\0/¢w5ñ[êh¾œÀåÅ*Hµ“Q­| zZPéÌ||ÖBĞØÆ nĞYc{Uˆ_D®Š÷kI*y^É•ŠŠ®\n^Îp$ÊöàqZ8”:H5Ü45P Ã/j“0Kh„‚é%ßKNQøTsk&­ŸuˆÒ5\"î\0]O L²}8óOÊu¹Ã³ÛOu¸<¸qÄ’x´ØqMd­P.ZæêÀ\'«kQ0í¡XN9!‘òÈíª>.h!+Yp%>!R—³œ	ò½¸VŸ‡Zv;]×Tê;>•±†MÆó¨n¶Û-–Ú&9òOºİLÍ¼Çmt’I¤hk@$“…I%´N12ŒjI¢ä¿’¿wgâÎùîÇé°=+º;GªMÑúŞÈıĞaŞDÈä!†h`”Ç$RµÍ%V¸ê	“°[n6ùv¹å¶Ì,¸;\\ø€õ4f>`=ôs{,V†Ê5iUº\0EêÄ€-¢H¸¹ „<­eÀ`”ø„)›K!Ç•ì¹â§Ä¡ĞºA¨¶á¡ª…á{T™‚[D,åÒJ=>†œÏÌ~DÚÉ¨×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²ZUZB \nøÕ‰\0[D‘qsAyZË€Á)ñRös W·ŠÓâPè] Ô[pĞÕBƒp½ªLÁ-¢¤”#}-9ıGáQÌM¬š¦¹ñ\0êhÌ|À{èæ\"öBĞÙF­*­!l«\0¶‰\"âæ‚òµ—‚Sâ¸/}ô­Œı¨ïOkEÜ}DÀ\"Ûm¡Û0ï§|k\ZÑ¹7QÄĞ}E ĞQ\rëÜúªu=wmµ=N};§œÓœ¦~”@¹\'î‰S™ì{›$w€Ìqbz’iìv>+Î½ğïp÷Vøuånß¶zcÿ\0øÍ®Éû]Ë f}®ÚH™@Ÿqî‘ç¨×è.¿ùËéßJìÏNôáÉÔº™‹ıiä‘ûÓ˜‘2:òDF:P½6ç®ívpú[WË•¼Ä¸~Òuî{öÿ\0âŞÌíò$Øôx÷€Toz£¿ÎÜÿ\0†%oØ…8±€ó¯z‡óSÖş¤‰ÅºİËĞôğÿ\0J\'¿”óKÆD/9¹êûı×Ë’dG²4¥v5@Ö±Ûh\rnš\Z0\0|øä™—6G$ÜÜ®µŞ÷Z[ Õ¦å¤j@ñª\0¶‰\"âæ‚\0<¬S†IUÄ\"Š^Îp$ÊöàqZ8”:H5Ü45P Ã/j“0Kh…œºIAÓéi[ıG#áPdM¬šsâ\0;ÔÑ˜ù€÷ÑÌEì…¡²ZUAn¤\0z± h’..h!+Yp%>!\nÂ‚A \"ö·ŠĞ{JEˆQÓ5Kn\Z\Z¨@b*œ¶‰\n%I !¾–Î$ráY™eL5òD\0r9¢ËõÄTó{)#]V–ÎÖ¸6ä;H\0!ÏpkG—S3—åg\\]ŞëÇm=ærØ`ğñ¢jßSA	ád²Y)Ş¢Ë“¥H.çõ8çŠÒ ÜÙ*3D_H\n„±ı*	µ‚LRİ#åßCNRxåjÍämdÀtM{â\0?ÔÑ˜ù€ÉW\ZO!qD7bÒÉÀv•%¤jD	|pZ§Ú)!88SAD²ƒV	K”‡!&E¨ØHòSaú­\rQ\"U_}ªB!º’ÀzqU&nXØ$Å(ÊùA\r\Z\Zm«ê>c\0j¤E,©€ïDÙ$… ;ÖÁe#€+HH‹Ù#+c\'\n}%ªB/‡ëUÌaP Å¬˜‰h(+“….Z™\n2¯tZ°%®BrÌ‘Ï¤Ö‘²\0t&vêsTékC’Él€Ç*R\'°ÌR]$’‚\Z44¨_¨ñşk2dh(\"ÇŠ¶Jø‘®:š>¡ˆ-ïIä/P†zêµ3pJ’Ò\0[êø­X ÑIµ3UÜZCÊÅÃ$¡˜!”ÕpKIä—(¾µ&4&Åª;u¤5­T°Ã3µ#\'- @‰ñYİ,’§ÒÓ.>c\nÌ™\Z\nùYFÉ$`j!Í	êú›â¦é@‘\rBV–Î5Ü´…°	\Z°@-p“un5…ªàÑ‡ÌA(ƒN4‰L/ú?Ç½qsï0íóbÁ”ÿ\0W4Œb5,àOÚ¯Q³Ü	¦JI\0àlWÊ©ª	\\ªÙ§\Z‹}A­jÜ\0-—\nD‚x1eÒI !¨ÆœÏÌyY ™JÖO•Sd’4õ´f>aúã@‘ìƒ¡³·Xj«KuY½h$Å´SÊYÕ—¹ åbŸ O:ljF‰ò•5Kˆ$Ä\\·â´1¹C%?pÍ¸k[©é±O\n	¶ˆ+3å| ´zZs[yåRL¨Ø*…²¾ ½m]ÀeÀ¦…ìWïZíÕ¥Iin«\"_¾xV‘,Zá*õ\0¤ÂÆëà”Ø¹”tI•jÀ‘cÃ2‹æ¢˜Õ	/Ü5Kn\0n¤ b‡ôáMÜğ	ò“u•ÒI(!¾†da–ê‰µ•²Èø€õ°[Pù€Èß*„¤<ÖL‡Nûà–¶D¹ş/V&Å´RSV% n°É3¦Õæ	ò¡.å7ÂÊpãˆ9U1pHº)ó‚Kn\Z\Z¨ƒ\"AÂö¤áÛDÀY^÷Èo¥§™XÒyYP[#â\0?ÖÑeÅÂö¾tŞBâ‰É¢a«MËHTEğıkHh¦ª‰hDÊÖÇÈ%[DØ [‚ë¯ı³ªk²[æÅ·\r\rT°Ã.4Œƒ¶‰Uf{¤ÔkHÇê>c\nbmdØ ’0½LQˆñ\\i‰{&Âú§6f‡ª´…(_ãZ‰\0[DU¤¹ €+\\2J°5	†\n¯g8	å{p8­>%7Bé¢Û††ªc…íRf	m³—I(!¾–œó+Î£˜›Y>\n>!êõ4f>`=ô	H^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ ÉÄ(\'•íÏ§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\nPH.[/é°ÔrÓ¨•Ü#!DKï;|[Ùnâ¸Ùw˜0î1mrË››—‰ˆr;Ú­ØbH5Ü45P Ã/jÁ-¢ä¤I(FúZsúÂ£˜›Y5Msâ\0;ÔÑ˜ù€÷ÑÌEì…¡²\rZnZF¤\0\Z± h’..h!+Yp%>!\nf‚©å{p8ƒO‰C¡tƒQmÃCU\n1Âö©3¶ˆYË¤”#}\r9¯¨ùäµÄÚÉ¨×> ½M˜}Ä^ÈZ Õ¦å¤j@ñ«\0¶‰\"âæ‚òµ—‚Sâ¥ìçA<¯n§Ä¡ĞºA¨¶á¡ª…á{T™‚[D$I(FúZsúÂ£˜›Y5AÏˆ\0ïSE”bÑÏˆ£˜‹ÙCd\Z´Ü´H\0\"ş5b@Ñ$\\\\ĞˆyX¢¢«ˆ¢—³œ	ò½¸V%…Ò\rE·\r\rT(0ÇÚ¤ÌÚ! ºIB7ÒÓŸÔ~ÄÚÉ®UØ}¼ÎëïnÎí-Şı½7kÜıÓÛı½7Ttş¶.µÕv9û×C÷\"ûÍÚ7r_§[uiMC\ZßkŸsÏ,g8Åû€ş¯L±ÆK	HieèO÷ı[îïôÿ\0ógZüKİ;¶u½“v›^¹ÚÓµÚI´Ø÷7nuN×}¾oñ÷0JÇÁ¸„I\'Ú–3ê ´ß¯ôlşŸêRØg<ĞnhÈ\nJ&Çâ{®gRéù:nèíòV7´vş•å®.h!+Yp%t¼BëÔ½œàH\'•íÀâ´ø”:È\n€„†›Y¨¥8)·0xVV2™€vˆãı‹‹yƒ.ë&Ï|Ø„L»3°ï`íØGjAt’„o¥§?¨ü)sk.Z¦¹ñ\0êhÌ|À{èæ\"öBĞÙ­7-#R\0¿X´I4…¬¸«ˆEÈç\'¤´4¨%‘9%êfI²-3U×r\'1ñ¬«*“TYGHàÔ°O·\n¨Ÿİ‹Pêı\'¦A›ıóa~œLQÁ>æUQfı¸TÉj3LÃkŸ8ÿ\0•†Rñ ùˆö/Ÿşaõ·éPØ@´÷¯îcù¶\\ ğC t~­\"Pç5úUÁ!úVàjTåN	BÄb÷[v–ùy\"ŞÀ™œP´äÛØŞ·‰ U™k`¿]ÿ\0ñùı‚üKÑ¿)ş-ÿ\0`?	uı¿WpIŠ^êsz^ÿ\0m#ã“£õmô=]ÏNê‘ 2C.Í`{MÚC‹—1µ—¬ÙúOq¿Ú\rÖ×q†BZ|ÔàKPğeñ?\ZñÛşĞ~ÿ\0j×ÿ\0*_‹z¦÷´åüÉØãqİıšvıáÚÂ—\\ÛõË¼ŞôâùºTo²{Üz„;_CN&Õ\r\"^WQ¶ôÿ\0SØõM¿âq‹ëGæÍ½ZŞ,°ÿ\0ó%ØG²?İ^æëú¶Ÿ‘{WµûÁR­İˆşƒ¾ŒŒ´KÑC©H±G«öÿ\0G¬ÊbÙ!}‡à¿*›&²Z–C{ß—*—z/.¡HZ­@äK…\'ŠSòÔ]+§Æç T-94-ˆıëHl‹$qBšCAú­dNIDÉ\"Œ-3U×r\'1ñ¬«*“TYGI¡Á©`.oíjnÔO‚“Y-K!½ïğ¤ïD/Nşÿ\0Mÿ\0?°=•ßß?v¤›şŞüyÒ7=JY·M’»Ûªì§Ú™Ù=‘Ù‘ıoº™Ò§›yö£F·l{fÜ@×ø?QşcúsÒİWIŞÌÏu\"s#i†B\\¹óöDÈGä“é™æ0Ç\'÷>ô[õMÏÔöøÛ`F.gW  ˜ÂÔ`cÌ~^sêL|Ö±>HgñI²Ã<Føæ†h^è¦‚h¤\r’)¡•…¯c€s\\ E{ìa—sc”g‚qŒ¢D„£ àÄ‡A8 ¸^\'.,¸2KxÊa\"% ŠA¨ ÜóÛÕ6{©ßµÛnc–FDgFµæ3f“jçÇ8oØ‘¬ÜÄøÎ—21Í(Z@äeÃÆIG—,š=¯bıÄWïk¸Ë“\\D	ˆyI¨k«\ZµY>Ó5\\š‘‡Ì×²©ºäÙGI †¥€\noûS%¨à£dÖKRÈPßô?­\'z!KB¨‰|O‡\n~Z‹¥tøœä\Z´œ\ZÄ~õ¤I¶E‚’9Éé-\rê	dNIz&I²-3U×r\'1ñ¬«*“TYGI †¥€¹ºyxS%¨à£dÖKRÈo{ü);Ñ\nZêj*\'|Tü•Jéñ9Ét-\'ŞÄxÜ-i@«2,•ÎC¤´\0m¨&IÊ‰’E,„‹LÕwÌˆ¹5•eStYGHCRÂÄßÚÔÉj\'ÁFÉ¬–¥Ş÷øRw¢´!ZÈ—Äøp§å¨ºWOÎ@¨ZrmìGïZD*Ì‹$s¡hh6P–DãDÉ\"”H	3UÉ©?OŠÖU•Iª,£¤pjX\0§Û…ÔO‚“YsRÈPß÷¡ŞˆRĞ…j\"_áÂŸ–¢é]>79¡i84-ˆ<ïZ@+dX)#ŠÒ\ZÕk\"rJ&I`”)#P	lGâµ•gY]ŒÊCQ\0@OÃ*F…´IŠ&Ë¬–d±ããÊ“½_G¦m»ßí6JŸåÌÍ±½ÒcöÉ‚®.ó/á¶ÓÌ/şÂºT7ş^İó[èÉ|şŸ,$*è§ÜíäjzƒöÛ‰¶ÏÃÕ¹Wc’?O)Æ?Ó¡Ò\0q‰é zBÃ)—Í‰ñHö˜Pß\'ŠÖ÷’,€ü‚{^±™$Q™z‡Ğİ\0?u ¸©Dæ=æ±nj›¡•º@Â\Z–	tä–¤KIFÈKSÓ‘öãCóQSèŒ´¤`§ãÅ\r/%EÒ -1½Àz´â‚èmc•\\	²LÈ÷é:H\r@u°d3±©››0	Q‰š®#R\'áæMcYTİ¢0†‘dCÀqÆ‡j\0êÙ&²ZD±Ámq…\'rÚ\"Èõˆ-MH‹™^QåµĞ*µE!@I\ZI+¥JY1[U¬\n·*’ŠW»IĞæ†ü‚`Æ”ê;\"“\rRTL5<ú€KY8s5yT¦Dù„d5- [°’*U²Q#‹túQV÷åI=ÚsHÂøŸ?(x¥æ¢ÓŸ¤)kšnb µkùT–\nå{’Å¡­6ÔB`§+jS¨§•\rØ³‡}Ö«®äE¾X(BI¬ÍR©š[¦piœÊÆ_¥#D1ñVÙ„„„ô¥ÊÛ>JôIˆïW¬B§ÕapOékCrÔ\"¦áNŞïz¬ÁÑô}Å\0 Ç÷:”û†K€S ‡jy`™®¹£ƒ¥ÿ\074‡„ şÇö/o:€Üúïoµÿ\0—·Œ¢ß·<r‘-Àr…¦iZQÀ4F¥\n\0ó4ææÌËè‚†Ë>±(W;Ô‰)Æük2©N¶GLÖ;JzlûY	 ¡‰ïT&8´^éüş´ÀMŠ¢á\0%¶(—ÇöÎ˜ùjA–«Dnxj%¤äÄ\'(kXP1ò©=…T¯r.¦†‚¾¯I#JXÙœ(E,€4:‰Û©Ädp!-s‰µeYTª”¡|Â75ˆ£3~ÓÑSfûs@FQÙGµéİê‹„!XBqññ\\êƒÆ¡MÓ£‘È5éq\'Ò5d˜İo[@+åIªèf{´”-\0®Á8S›‘O*`:Ê÷š€.Ã0G:ÌüÅÍÓ @éƒ\ZAÓŸ‘±`HBÙCÉ\0 ½Ê•Qznô(e	\rMÇgŸEãQtïtl‘æÅq&Ál„\nÚY’`ª•åik@*5(À%9¹nTVë2‰B¹G/IçPu7Tµäp	k]?Ö›µæÈ[ y-K!BoMÜ²JœDAZŠ‰|O‡\ncä¨º`&1äé-7ô…Ä&7ZÚl‡­JI4†ƒõ((‰9’Ôf­Öu…uÊ%½éQYÔİ4.—CƒSÓe?ÂSv M‰CËš–B™­1Z$Å	\" ­MH—ÄñNŸ’¢é²tnrBÓ“ob?zÖ$VdX)#ŠÒ\ZÕk\"rJ&I`‘iš®»‘9eYTš¢Ê:@Ç¥€\n}¸PíDø(Ù5’Ô²Şÿ\0\nè…-V r%ñ>)ùj.•ÓãsjBÓˆh[œxÖ‘$\nÙ\nHâ…4†ƒõZÈœ’‰’E$Z`®Bäó<V²¬ªn‹(é4Ô°MíááL– O‚<–§¥,o…\'z!KB¨\n%ñ<PåOËQt®ŸœP´äÛØŞ´‰ U™	ó@é:OXŞ4‘ÿ\0UÓwarÃ¾ÛíäNÉ‰¿\nÈÈË{‡\0ÿ\0˜&x0÷†ñ_>õæò}<ì7¸ËOâSD@æÆ$…‰¡\\…ÁBGõ+@?Ps²÷Ø²G.(æÆ^ˆî!ÇÅS¤pjX\0§Û…ÔZpQ²k% Y\nŸ…ôB–„+P9øŸüµJéñ¹ÈNM½ˆıëH’Y‘`¤rÒ\ZÕl’‰’E(‘iZ“R%¬‰û•¬ë:“TYGI¡Á©`.oCµà£dÖâÔô¡½ïğ¤ïD)hBµ5a|OáåOËQt™Óâs’èZJ£BØ„ó­\"H²,‘Å\ni\rêµ‘9%$Š0H´ÍW!r\'‡\ZÊ²©5E”t\rK¿MÚ‰ğQ²k.jY\røÒw¢´!Z€¢_ÅTüµJéñ¹Ét-96ö şµ¤I¶E‚’8@Ò\Zµ‘•$ŠP!\"ÓrjD\\Ç\ZÊ²©5E—|ş8ÿ\0X?Ø¿Ë»vï~ü•Ş4ú[Õ:/juiúSÏ¨S~Ş-„…¥¤2!\rëµÚt^¯¿²ÛfÉÑŞÛ{×3Ã{¹ƒä;@-í²ç=_ı/ÿ\0q;ğõ¾­ş¹şdéné{ˆ·ñï6ı×:Œ{WìŞ71îŸ7IÛo~È†HÁR\0­rrzwÔ;VÉ“g¸‹~Ij½k>™Ô°üòÃ7ì“ğ_Ñßû7ş¾îÿ\0ùÿ\0ã÷ñå­hu‡û\rÚ=…µëı¹Ó÷]1Û>áëS§Cÿ\0[İİ›<Á¶Ü;iÜ­„›¤?|DæYëİg¥KÕ~•Ã¿†9¯4C4‰œ*ŞbqnÕíwÛ3Öº>=À‰ÈÁÀj’(cãp¿’mïOê]½é=ccºé½K§n÷£ÓwÛi¶»í÷k#àİm7›YÚÉöû¼Ì-{Ğæ¸B×Â¹rb‘Ç”4b¨=„}‹çRŒ yd\"áa•ä4•kXÛ«¬€ø\n™’E,¢rœ‹DOpLBî‘ÒºƒÉqêg¨Ì®Mcü}ü»(Ç¥gÙÛµ<ëŠeÿ\0{“n|ØáÛ(™y_>ô.øõ×QßLüùrÂc÷O8ˆğ\0,®1Á©`Ÿn«µÑ8(Ù5’Ôô¡½ïğ¡ŞˆRĞ·SPKâx¡ÊŸ–¢é]>79.…§&ŞÄV$^È°YÜD’iZÕ.æì<Ò¢EäÚ\'Ü®G9€i3>ï:F–BDá™8xtªJV_w±¶Ÿæ÷ïFÛ»HnÃ¥wP/ éh—dÍœo~\'Ğù\nr^5Çês8:æwú™1cö\"İá½Ëâ˜û“>µòâÚ¿ŒÉ·€åò¥/|û¹şyãxì?qÊÇ\0£S\rŠkM¹æÃ\Z‚9EF´_bØÈOc†B¯Šü¡%¤Fı$£]ò®Ü9-mÅ´\\µîôGıÈïõ+ó\'Gê»^àŞm¿÷?WèÛË»û¾û·cßEşWWéı5ÓC£¸zNÑò¼ñ8HZçFCÚí4Ì3h»‡Õót­Ø˜‘Y&ş^Ğ;F‹ú©üÅÿ\0ÈúÑØÿ\0ëÿ\0pşgè”»¼6RtÙv½­ÒûS«írõÎàŞF\"Ùt½†ÃuÜì:İò}ÙÊÛ²7@\0Š£ ¯¨nú÷MÃ±–óXÌ7Ê\"jO`\ZñMWóÃşùÿ\0½Šÿ\0Ü¯õëğŒ\rè[Ş›ùû´{›u{î7!ìÏnAÒº¶Í³tş±’E$={6Ûxí£Oÿ\0m6¶Ü5®tÌÍuà:ç[Úõm†ÊFşù©£%‹h¿$„>!Üy-Kò¯*¾UÜÏ·èı[u“îíºvúx>Ãc|ÿ\0r´²GöY,rÄùCÚ4‡5Í%j×>®hã,ÒµN¶§mBâoÿ\069¿ßúSúnsòGqÌÔ\\{²:îã©ôø™¿™ónÏc¿dòÅ2Ï³êL—ì;sÅ·‹w·İíwYZÆ´}Í¾­-\0s7»a¶Ëòƒ˜‘p%vrKc!ûÌåyÿ\0HuİÇZé³QXÚf–\rÄ@aõ!÷€sIDƒŞàP.dç	dÒ\nµªO7WU“h½Zı™ÿ\0ã¿ı.ÿ\0\\ÿ\0Ù?Å=g¾? mûã©÷gkw§QíN½Ñ6ÇGímÆÕûM§\\è{í›zoMÛõØ§—¦uàŸvökJü£ùÇù•ëßIú«/Cé¬;nœv¸sá”pc^Yóã˜œ²ıLe³b™ô‡Ë 3/Ò•ş„ô_¨ú>§Ôvù2ïDç‚Y&!Íh `@0”˜Õ×é°ÿ\0ã¯ı>Ûô÷ôÖ~é2Àö=›sÜ=ã¹ß£Ğ8·©MÜßÆûsdoÒBšü§×;?50f;¬}{~3FÍôDiÛ8F#Ä1Ô\Z/³aü¹ô\0Æp—µä<	—óx»¯Çÿ\0ş@ÿ\0Ğî…ş¹ôn—ù[ñ$X~4ŞõFôêèİwu?Vaõn¢â{¨ÅÖÉ:†ïµz´~ĞĞ“qµİ¶§;¶6/Ğ¿úpÿ\0Ô§Tõÿ\0YÜz×K\'©ã·–}|q#¼† ùğÏåÆ7âÙbqˆÃ&/¨~?¢Lşù¥ùUÓ½==kÓüĞésÍe&C4€Œ‹Ë–­!\"H$jD£Äİ­Ğ?~4ì?Çİ§ÛoÛıÚ}¢ôÓ³Šbİ·iÓ¶ãqÕœ6ÍlrnºÖìÉ»š[ºY¦sÉ%ÄŸÍ¿ÿ\0ÓÎï>N£¸™ÍÖiçÊI/õ2ÈÎ@“_‘Æ8ƒå„#\0Â /Ñ»>“ƒe²Å´Á0cÆ!\0|±±)@ö—&¤¯çÿ\0˜oÄ]ØŸš;Cò§InİıGó/Mê’õßÆ»HÙ³Ø÷zvó¶{]ÇyõiöÏ2ízûe»„õv}¦Á¹İÆó,û§C7í/ı*zë7¨ºwUôô‡ı‡K8ráÌïô£¹32ÛD\Z8œ%“š1‘ˆÇ(~4ÿ\0Ôç@ê~¯Ó1zs$pn:ËÌ¢>lxğˆrå$3&1Ñ§Æ H|ò_’›x^e–}ÜíŞo÷iÛíãafÚ9b\r¾×iµŒ˜¶=/§ÀÑÛlÏD4\0Kµ9ß§79Îy€)ˆ;vz’N²&²:ÀÀ|§¤ô­ŸFØÃa²\rŠ5$ù¥#æœ²‘¹ğ\0\0\0×#Ë–¥®ìP[ kKP.Ï”³µ’\'‰ËÃÄÒ¹Sez„%á\ZÆ‡qtÒÖ…¹+tH\'\0HOË.Ssö€¹›Œ8²cÃ’B9r’\"5$,8SohEœğu\0™{f”Ån·=ŠšDoĞJ5ÿ\0*àÁyÕD±m£ˆ–M*­j“Ìÿ\0J$^M¢Èç0\r &gİçHÒÈBHœ ó\'Î•IJÊ!áÄƒÇ…ÕZ&Š79àê2·²¥1[ ö*cšÂË·3$eA<+o’ŒA¸67Z!!Ìb4$xñöÙa·Üàİc9pHJF%´1,AâeD²iZÕ\'›½ôä^M¢İ\\s\0Ò\0Ÿw#KYI„Ì“‡€LéT”¬ \"AñãË€¡ùnš(Üçƒ¨ËÛ4 Vè=Š4ˆß¤”k¾UÀ;‡%ª‰bÚ!Sœ%“H*Ö©<Î~)D«&Ñ\näs˜\0Ìû¹-#K!	\"p€\"bN\\iT””Bwˆ<yr£ËDÑFç<@&GÛ Vè=Š¿A(×\")°wÈ\Z¨–-¢s„²iZÕ\'™ÏÅ(•dÚ!\\s\0Ò\0Ÿw%¤id!$L[2}Ã*È¥Şˆ<BpæÇÇ*^T›±rÕ.—¸:0-Pî¥´j ôµÓ±®ÿ\0›N£ÈW©ò_õ?Àñ²ó¯Ÿ\'¦·‡_¥ö€¾6íŸõıÍİ½5Ş†m»©h\'ùs»zÇ‹uÇº\0Š Â»!“ëmv»rmaíÈİÿ\0¼å¦s,[Í¡>\\±˜î”XûãşG<I&AkBø»0+9VL¾ >G0\r &gÛ\n™µ‘ej\'\07…Ü€˜­ArY=QAñ`o/-dq¸½I2¶<­æóY›#c“CŠ5È‹d\'øZ\"9Kh’\'<Hı «ZªFgô\n”¥óI´LUId{[fGÈøáŠ&tóÌöÇŒß4\r)á@‰”Ä\"@©°\0Iá	<ê:çVÃÑ:|÷¹˜ÈRıi›íOdA(œ×>7HÙu¹ˆai\00²˜o¤’®ÄÜÖ0#$Aˆ 6·cPükádt3»—JÁ—}#-ÔáÏ\"{gó3h\0,€Mx…¤;ÉÃ5çOÊWlj\':E%4ßOö¢ô)+Í†G0ü0F¸äxxÓ‰ ¶‰ìˆ¼K h*ÆğqÁ1ÀR™y1@pÉ+˜–„ğL–‘˜d¹LbRâí´»¡ärlæ’›jµÜ¾\'\0J‘3“˜yÈGÏß¬<Äq‹‡ıšıÚù>£Ö2ôPàÅ¸?ı3uŒD=¡H‡î—4D¼…8?üpAS˜pKàâˆ´0²õŒèâyæ85|¯I\"l­ŠMÌr\"à¾ú¨-¢L{j¬È%4XÕ%0.À…P0¢u-ØŠôR¼°\r \"¡$ªg†uš_caÛ½Ã×:_Wë=\'·ú×Rè½ºÍ¼½ÁÖ6+}¼é-ä†£ú¶ÿ\0o›^šÍÜ­,ŒÌö¸#TÖƒ\\–HFGn@,;ÍƒñV!31b.@ ïì__Ø\Z\\—¸p\\8bQ³`8z\"‰î+€E²Š“\n-½AïîªYÿ\0©Ü}7bĞÜ§ì[ºW2Y‹h¹ÑÕd!›¦í´e?şòR!ûÃğ»;[\rÄú›Ì­İË0=Ì\'ÈÙ¤\rcEø9ßU*–Ğ/ºĞ*åyŒ\r#Ò·¶	‘#STÃ%—·p¢Ø’E…°F42,j¯_Ø\Z\\9µÀ[Ã<(àÙ\\O/¼zr8xqÊĞKĞ*l‚4£p¸jÈ—T([D‹õNK.UŒ¹L­á•©Ì9mÇ[•R=Ì\0µ¨ĞnqNI—‰©)·µ÷Æ —ããM»(u¶ZìîÒ8cÂ˜šŒ•ÒKA/òJ`=ÑEM“íI ”cÀÒ¿IÀ…§Ä€‘½âYEØÅ^ÙÙ0	NNKÀaÅT®s\0-œ	±L-Â‘¥b[Ù€hñ\'%\\8-dQeZşËKHæg‘áL|·Nª˜òàu\0rÓˆQ×²lôB$lrˆœà>ãÚÕ]#V€\\Ÿ#\\àCIù‹J*p,Høÿ\0ãáÚ0Ü`iíá scn`/jÅûÀv»1Ô(ùĞÒ¡¸¦\Z³Ã!U òceª¹Ì³9xr ÒÉ”·8N4·ÎCãEÊ\0U¬Bw2Ï‘áL<S²Èçƒ¨2æ?j¨k¥~åLpM$£òò*‰Á\rTh[D…ò¶IXÀàZ^ØÁ[dpcZ¥\0Ôò\0\\Íí>PØ²Í›×·‰aˆy`;OŞÅR½ÌM!e0å‡\nf–²Ô â¡)î-ËÖ˜©L\rJBC‡0m~X Jcå¢®äQ¹ÏP	‘·ö)LVè=ŠšDri%\Zì\'pä\r8–-¢qÉ¤kTnş”H¼›D+‘Î`\Z@3îä´,„$‰Â3îñ¥RR²š„ ‚8xòSa@ùSEœğu\0™Y=’[ ö(Ò#~’Q®ùW\0î–ª%‹h…N\"Y4‚­j“ÍßÒ‰“h…r9ÌM\"ÙğÇçH–²’\'0Ìû¼iT”¬ \"C¼AãË•Z&Š79àê2öÍ(ºb¦‘ôri\\¸rZ¨–-¢;×,è[?û^ß›6Z»G¨h8‡NÇ2F4%Ëbÿ\04×s¹ü7TØåÒ;€ıÄ€~-â¾[ù›!ôvxûe—ıØş•Áö{‡Í±Úî\Z\0lñ‰‚\0d¤¾6\0\0hc€Ké!1Ùg‡ÑÍ,#îHÇÄûzÿ\0HnNïÓ{<²/a=ğùOÃíZÉ„nËËer½”BŞ!Ü|r?*h£.x:€L¶(”ÅnƒØ£HúIF»å\\¸rZq,[D*qÉ¤kTnş”H¼›D+•Î`\Z\03ç†¤Kw!	\"pƒÌœ<:U%+#‰Yb`CÚ]Ì“Ó·Û´ˆ„Ä8¹îÜHÈãi³ë‚&y dmÍ÷“aìyDF„‚¼§¨:ÎL;½·DØI·ûœ‘æ\"ğÇÍó@à$nÅEÎj8(v%-s™­Íuëb¶‘ô’wÊ¸pä´âX¶ˆTâ%~œZÕÕÀœ¾TH¼™\nä.`\Z\0\r¦$L©ÖBDá™8xtªJVQDM-vPŒÇÈĞü©§¹ìG(Mµ†x$Pá<iö¤~ \03G<nl­\0ºà\0àb<ğ2¸ç= ƒnã%¨-R	^K õœ¹zë¡o¤ûÍ¾Y˜HĞÏ3ƒøn\nSHúIF»å\\¸rZÖ%‹h½j§,šAVµVøŸéD‹É´B¹æ¤\03>îT,…û¯ş¡ÿ\0óoùCñ£û{±¿Ø.Şéÿ\0‘?l£ÛôÆ÷?nôíŸBïŞØ1cŠ_ğöcmĞ»‹oµi\Z¢1m§siK¬~›Ğ?27Û3\r¯U€Í´æˆœGphÈp¡â½_NõFã.-èÂ(â’a÷/é‹ğû\rø¯ıšì%~ ëïëı¯/PŞt©%ÜìçéCgÔv%Ÿäm7İ3v»ÚJÑ#Ku´´êj‹×Ù:WVØõ¯ã6æÀäT1hA¨^ãg½Ûï°ı}±|nİåæOşAÛ‰ÓnÏìÉ[ießnz§tÍĞÿ\0ö~ãhÍÏGï”[#¾ê/q½fuÚê±m£2lºŒQî\"Qö÷:9½7ªúñôößğTÊ|¼I†rñ-Q áèCÁëDôÌPÎ*L™´=£´Ãí_Êÿ\0ÿ\0\"¿œÿ\0±¿›úgæ_Áİ#¬vô½íÚ/uù/£õ®”Î—6×¿vÎ~×rı[yæÙugØGŞİBCg‘ºÏ¨šø—«:ŸKêıLu™Cêc !šbÆ—\"åxµ»ÙïwCuµ&QÀ†ù¾Şğ¿>7›†Åârm’È¹µ&DËPbéËV5åÄl±Â/)âHo±xŸTîeµôîó4OèHù|£ŞW0êû):ghş<Ûé+ÿ\0¶a’W%„³¹»‡´¯ÖLê|k­ãëõ½şQc‡p2à¼7åŒ¾mæ>Á‡ş5Å‰„dáà9×:¤¯«Ù@D ‡xƒÇ—*<´MnsÁÔeíšP+tÅMp‰úIF¹4©°qÉrZ¨Ğ¶ˆïPõ\0v)€wõ¢A‹è…oi‘4¸&a}°¤kd! BxÇÊ•»Ğ¹gâi¾ÿ\0ä>®S·íÖü»øœæøÇ™®\'¨\"céìsı}í| Ëó÷®frz—t4<cü±ı+âu?Çê]B\"@k7»Ğâ\0cDÏ@rií26ÏI[é€ªûOGÜÄô-¶æoÈ6°\'[@?Ú°‰¨¡cSAÉÇàp-B¢¹xÈŸÎ<«µÇ’±Œ¸Ëãp{A²¢Ñõ\0v)“¸ùÓ•è­[ÚdM$&cdl€¾Ëû{©m»v>ét-gG›«‡²JÆI¹ßG´v÷p6Ğ8‰&ƒk#ÚXéXÓsKRÄ8ü]½¬}…d3c9ÜêˆóØ	 ?y»Šø€	$ø—–kC=îµ±DÆh ƒ‘BëntÇËRWTlågIîvÆš!Ù÷÷¤¼iV¿¦wƒ\"ë}5áª›~ä{ ŒàĞ÷Ø)®ö_÷;ZÖRÄ&?{Æ^ØDÈ÷òM¦sĞ¿5w=>_.Ïªí£–#·,¯`\'éå~Ú.Ö-?P³_¬\r¿šèåBú/­¯Úÿ\0ş\'¿Ú¿Ç_Üß€!ozoiî{Ûº6½ÉØÙ¾1ìúOWë»†Û£îûC®õ†ÃÓúá›Hdé“îØwt›böMş;\'ü‡ÿ\0¨ÏCõ£¾¾é¸òîºHÙÇî0yÏj1Js†â8ÃÊ[r2J;@e„ˆæ18Yâıù1ë·ÛLoŒ0î¾¤¥ˆš}^~Wƒş¸#åÌ>X¼€ş‚œæ7æ@˜¨öÊ¿ú“ú˜LdKƒ‚‚\rˆ\"„Ğ¿HÈùWOşgìÎÕüŸøë¼?÷VÔîº~tÿ\0kïaŒ1Û–ËÔ¢,Øov%îccê]/¨¶-ŞÙê>Ôğ5êkå}©z—¡zï¤õŸJ9õ&×‹.ÜXJP“Êÿ\0İÎØò½9H\Zú‡JÁÕz>ã§õü.\\R‰pìáŸ¼i«²êîÚÜ÷·áÂŸ;7¹º‡Gî_È=´z?fG»èÿ\0æï¶Mı¯±gEØõÍæï|Ø’iº^Çm.ò7ú¤Ü¾S¤ú¯}‡ÿ\04oıB7sÁÓºÿ\06ãĞ\0%†9¤seœ^˜²NPÄ!||€Õ×kè““y³Å·ê$\r†Ëc–oódj\0ó	LiMˆŒœY—REØQw?|ì*şCìÃü‘ÜÛ˜:Ç¨w_nÁ×›Ó;y»íßQ£·xù¶;C½ßLöLÈ†ãSÈ/ÒH<îë½én“¥ô\rÆò&a—6”qæÈ!säåå™<‘ˆšP+¯OÕ½/ùu×÷QÜåÙâP†/§Ñ/8€\\›š&¤“@üÒí^Øş	ÿ\0Y¿#lzwpõ_õçğöÿ\0y»n¥øó´÷[ı´ğÊè$ÚM¹‹¥³ï:7³˜D¯Ğ’üÅŞnvóíw{¬;iÅÌcŸ.1?77$â(ÅË/“õÿ\0Ct½‡QÉ¶İáÁ–X˜‰ı8´¢@€Ëùêÿ\0ä“ıƒü}ß?7?ƒ?v§ã®ø“ñwXÙêë]“Û]¡GÖûÿ\0¦ìzŸKîsÓgè½?mÿ\0 l¦ê.Ú	‹Ëw;£¤f¸¾Ôı‡ùWéş¢qYu<»ˆæŞm¾,2-ƒš3ÇšBEÄò1”bCŒR$HÊ#òïæ¨ºnâ_ùk§b‡.ÛqÏ,‘ınYDâìù\\s5œhëó)>ÒiR¤\r!Iw€Jû!ùjëã¤ˆƒ)\"IÓ¿‚Óßït˜:›É0õ-ÿ\0PÛìA¼g¤¾ŞmÜE=gs»ÜHÀrdv]E#%7Cni–ã9v¨ü±?»çö¥_(_:ôşş^¡õN~¦ùM®.LC„äG1²‘îa¢ÏL`ê6áñÆ´ºú>ª5¢Wê!Zß•p.ãÍ)Æ¥ôB¢Ñõ\0v)“¸ùÑ ÅôB·´½4¸&a}°©5²!\n<ãåE»Ğ `\\|š2·É 5º,QFÒÀup[ï@¥ÑªÑ¸Û1›n—¿¿ØŞîw½0@†îÆ?óÚ\Z-¤ï¶Û§¸¾ %ÖŒX}ü\\²=¦< ŸÜoİzE|ßQ=ÖyúvRİ?{(Î¿w,À\0ğ11?ÂtYˆI¨c±LáÀÖ²_Eô…ÒôÒFœÂó÷R5²¢!G|©[½\n\0&\nOƒFCÃ:î‹Q´°FÜÃûĞ)tj©­?Q\nÖü«?U\Zm¡h‰ú€F»ÉÜ|èbú![Ú^š\\0¾ØTšÙH€AäFG˜¨4µĞ a©ÉÈ¿kĞÎ‹Q´°N·‡÷ RèÕF´JıD+[ò®Üy¥Tj_D/µÔ{w©ôÑºîâÕw7ga»‚VMŸe0‡wµ˜ÆOØİÃ©tn¸l9	0—‡ÇüaYG69ä–ŸêAœkPà÷\Zû\nø²4½4ºÙ…çî¤keª †dœ…\"âº¡@0Ôç5£”kU\0.\'‰53œb¦°Ün1mqı\\ÄFy%€´•Êûîãé­\'å˜ÌÖ‹Ş&ºCaÿ\0ÒÒN8W]ÕÉ†Æo©Ş¼·®òı?Mçı£ûfÈî¢Óù/½áB÷úLå¨I_Ó!\ZŞ¿øh:SEr®Ïcè¦§“(îlŞú÷â?-òrõÆ/ÖÛDû%‹û–OÔ1ß2dN|¥ ÒæÑ}šè>à®	e¸ÔÈP•T´#Sp²‚ly	H†ïHÕKg»˜‡©å\'½G¥Ò0¸z#VÍ2Û’â¶\\¼+31	ˆ4Ÿİ©ø.,÷¸c¼†Æùç	JšDj{Ím{9ê}¦Èû7·;Ójç¿kÔ·İG£uä-Ó·ê{\'º]«™e1ï6{€ÈÄhÇ1,ÒÆÕˆ¼cíØ£ëŸy—hCKc!ÄIş.@‰Ú€!³“\'YW Ò}2Å}^ÛûşâİîQv½ŸĞ÷½qÎdgy´“mĞ¡*\02@é.›‚­ZË1ƒ¥ÿ\07w”ab@å=Ä´{hWÆ=eÔeÕºş.‘ˆ¾ßãŒñIÌÿ\0K>‡™|Â‚àmñ°£öÛ•™}Œ\"!(´O¶\'ˆ÷pM¶‘ÑÃ3bš\'Äóâ&n6óh‘­s¢	Zö8YÌp!AÌ$	q.Â›U@Æ\n¾Ü8\'\ZÌ‘©ª¶$…Ä+GÊ ãap)ÄsÑn\nÊFı`×|ØYßÀRiH1}Ş´î6›¦Á¶Ü:)cÛnşéÛÌö=±n>ÃšÉÌ9¡²ı—¸5úIG4ŒK	7Êl’ú¥´Ş§Û¡Â3ÖúNÿ\0o¸:\rş×nş£Ó&k“SwûHÅ±$W.q°Ïƒq(qÛ|³1%|÷ól2t¬[ªócÌ#árŸxŠâı3tş¥°‡s¸ap6Ûs\n˜·›Yê7°5¡lÑ’˜\0Ev­¸Ûn§·‰xEŒOl$9¢_Z~ĞWué¬z·FÇ<…÷X¾Lñ?Ä÷ºúP2Eµ^ç¼5ŒhRç8£ZÖ€Iq9\nÁšëÓ“©\\Ë½ûTv§qÑÉ š]ŸKénº£=CyÓ Şn›šĞ]·YË[éÀ}Xœ¡–2Æs\0Xsx´ˆ§€]n 2ì§½& Ì€.D	â@\\%’F‘î)›«†‡A	d6ñ­d<Ñò•ÌÛî1n°Gq„óc”A´ÙAér(÷6¤C­è¿¦ÿ\0ş\"?ş=îõò\'Dë§u–÷¯|÷Aïí†úåÿ\0°éìé?m°éûµpCÃtçÄä‘Ïj:õõEmvÙz&\\y\"%õ2HLCÃEíz,9:|ã 4ˆ—±~bÿ\0»üqşEÿ\0^{¹{·ñçCîôü·ÛÃÕaîF3o¼ê£êG6~•Ü;}¬ÏßKµér´u°Ø_ÚdÒğåò]ÒÛ®™–Yö±–N+ÍsÒZÓµ—IÔº>mœÎL12Úİû8îÕù˜Àakõ¹A$YZ€­¸×’bË Îy1J}‘\'Ø!üvF÷ñpÌáêÜ÷7YÜ½ÚB9ìŞmf*ŠºPœ—Èçê(ı½¶Ç÷a¶Â<—ç_Of8úîË)ÿ\0÷?ï_µqçÃ&µk[!Ñr¼«ƒZ,¤€Jrğ­r˜ÂAìWè|»Œ8RÜòæÁøè®]R¥ÃM”[&“:Ü\nñ@â Í<\ZáÇ\n˜SfMPÓ0WA¢àp_uèf²û}_ u>Ú›kµêñ·o¸Ştİ—Uo­®š·PÒíÛ¹Œ{mÃáæ7\0àÇ4àE1ÂTbşâAöGxYbÍ<Lñb$bú<Kaw¯ŠĞÙdÖA-j\"¥Èj—ª€ræËGnô/HdÔèu¬Å9Ñ qd>\n¤/“N—zVã\0W</áH€lši„/+‚qN¢¢È©Tv’p¾–‚©ÌŞäĞÎktYaÑƒ¨€\né‹sÌĞT¥B€Ë&·|­³F:ŠãÃúÕÀ_EUS’954#\\ Œƒ6^‰E‹è*†Exô¶Ç€¶ö@@Kb\nÜ3Å6¦Æ=é±ÕU¦õ;÷Š`s?jh‘>á›®ãu7ª8#/ĞÔ÷(ÄÅ@d–G4fç\nÓ™rÇ<ó,>Òx\0äğu}kªcèı7.ÿ\0%eÑ­3HÇÄß°t[÷>]çü=Ò»sµ‡kşSßóÜûhw;ˆ‘-Òiİ`¬hu‰ cƒ&<ò–l_èHGº$ÅûäÜÒâZÁtˆÇ’}.}K9æİnóÎr=Çºi¥…ÆàØŸ¨k±Lç–5´›Eìƒ© 2&—Ì{páH‡²ª·À¼yòJlBNö]ißSu¶—¥¬ó@ÿ\0şâ_øÜCi‰­HnlT!¯ÒŸ~šé={gÕ¿¼mğn0¥Œ	Ä$ÄŞ/J†.(h½W§6˜7ÍõãF‚·×Ø¹7lõÆun™şD®dsíÉvÕ\rkÖêû¡pd¿\"£*ù·æ? óz/Ô§§í¹òtíÇÏ·52 –0-yB_/i\'UÕuN-ïéAÎ)V?£¼[Š­·^‹©õOğúvİÛÍ¼ÿ\0ºŞêÛDŠ@a-&g—\0‚¡ùwºô÷§¿¾ú›<6›ÌÃşßjÜÙ²˜p1Ä%ÜØ	F^™=®×ñ¹d—–‘ïì86\'‡èk˜H.k€,.P„À‘_8É]‰Æ‹£Şmã¼ÚeÚOË“¢ˆö¦õ»ö½Gu°/‘ÿ\0i»]ìrLàdŸeÕâvÿ\0c)â[ÌNEõÂêXä3`Ç¸€0´eŒãà~aû2‹Äú¬Ës·ŸFİÉ÷{ZG8ü­Ç’@‡ì1YH…`Zp#Â®±¨ºú€	.·\02(ÍhgïEŠ(ÚX£naıèº5TĞ%¸…kSJæïéUç›D(Z#~°®Å2wKD¨_D+{KÓK‚fÛ\n“[!	£À>T[½\n\0&“È—–dĞÏ{¢Åm,Q·‡÷ RèÕSZ%“Y\nÖü«›‡òTj_D(Z\"~ ®Å2w:$¾ˆNnıäû}¼O‰h¡k¦•Â×Jö±®–icŠ6—+œâEÍ&2 \rRv_C¯t>¡ÚİSwÑú¬o¾Ù=Œš\"u1ì–&Oğ¹=pn6ò¶Hİõ1ÀÔ‚J%İg‡6=Æ8æÂy±ÈP¯\0˜+“4Àá‰§SŞµ±GKÔmÁl?½—Fª€l¯ÔP†ü­&î#mn~\"”g¨#÷ˆø,e¸ÅñÛHÿ\0Z`Èg>õÚÿ\06¬ÿ\0¹¦K?§KÚ‘ÛmÃÏÿ\0­ Ú¼ÿ\0]‘¬\0~°?æå™YOãvxœ½¦#ì]Ûvã ôÄqHá0è(2½€4ıAÀk+ƒœF\0W°ê¸Ì:–aÛ7ö€~Öîz?Ë¬†~œˆ7lƒŞÚËî!\n<ãå\\w¯t `I>\0eåšĞÏ{¢Åm,Q¶(¸P)tj©­¿Y\nÖü«›¸ÕF¥ôB8~ËeŠg‚vîÌ•¬PäŠ_·2(hi.c€ğ\\ë?¨%’@Ñ ôğ!pöûÌ[¹å†\nŒ3ä\'C&Üìx¸ÑsÈ=¥/hw.ç£¶GK³t;]ÿ\0NDŸ§ï¡dğ9È\02@âèŸaëŒ¥ªqeñŒ‘£½;$xFÃv7›hçf‘pGa‰ h\\47í–†bâ¤àT§–5r<‘ç6o›6=¾çÊ[\"dO`Êû/lïı—¼ëÒ×÷G\\‹e³ éè}9Ğ°¹ ˆ÷UæPàˆh:ËzG÷<];]¾)dŸÿ\0#_÷ D{Ç½-¹Ÿ]õ”ú¦käœG`¦<cÂ24³Öì¾nËi¹ÜÏ×mÛ­ÌïÁ¶ÛÆé¦–BºcŠ(Úé$‘ø€I8W\"1‘,.¾ÍªCZ%“Q\nÖÙ«w*\"º-?P×b™;_D+{KÓK‚fÛ\n“[!	¨`[ú©¢İèNŸk<RÉòv»ˆˆl›y£tRÄ\\Æ¸6X¤h{\\ZàP€jŒdMÄ‘b¾–ûk)ì¯ûÖ·[ûO­ÿ\0÷¿_Dë°2\ràqhq-ÚoaŠbH:x\ZãlÈşí>œhw8„£Ã.2y{¹£Í.¾9êüóè¾®ÃÕp‘†9 qñ€Ş¾YTÎB#(Ó‹\\VÎiÁÍ\"àÖøˆ˜ú‚Ä‡ûW×6ÛŒ[½´7XKáÉ!ÜCÕÌ{´_Ş=áÒ:^è6›ÉŒGrÀum¶q÷wrµğ$tmÑˆ2½£:ÖOÃâ–v~QnÓ ñ+-şèlv“Üæ\"ƒ´’Àx’¸vé¡ds\nFÉZİ7$5ó›vë—= ©KãÅåÉÎ#îÈ°áBCø÷;Ì[CëÒ9f \rH‚Cğ,ÏÚ–@„jqçåUnõË]ÕøoıŒüåøyÔ:á¯Ê=ÛøönªØÛÔàíş¤è¶Gíö_¿é{†î:nòX!’\"ö‚@ \ZìºwWê}.rŸOÏ“	•ùMx±ö.NÛ{ºÙÈ®IAîÖ>Z2ÿ\0²_ÿ\0Ø]ßKŞşlüŸÜßdèQKF‡­î¢˜ÙÈ;‡lúvÊ\r®Â÷5È#û\0â\0ú‡XêVQŸRÏ<¼¶æ4À0Ou¾İïdç$¦Ö{{Fµ¢Wê!Zß•p\'4®º5/¢â¯‰Ü¯ÿ\0£u7´ ›i,$aöÏ;‚¶Î¹İ;?SÀ4öWì^/óOÓ€ÖxÇùÁûwşAÛ¯Bìç·Ò#é›hƒQcúvÅØÿ\0ô}¼?ú²ÏÆt™Ô7\"äÎ^éËôÿ\0<—å¶N^§»ÅúØ`–Mÿ\0ê¢\0–¦-ÃN [%¥<\rzqÏÈÎßãı«ëQÜb–àíAş¼b$G¯ê\0&“à^Y­[=î·±EKÔBb‹azb—F«éôN‹Ô;“«ìºOJÛ?y¾ßL Ú@À¥ï\rsŞóÂ8bcãƒZÒr¥Íƒ’e JÏ6l{|RÍ˜ˆâˆrO`X¤k€ô¡i?Q[¾u¬Á–VéA!a/UhThÖ÷ĞEÀR”kVäV—Ó\"|ÇüWô\\èwÔ¶û]Æ\r¤Üîwå„EèR=‘ˆ©>\0NŒ=ÁËb0ãğªgªì)ü8\ZßÈØ0#´ãsÿ\0›¼ÚWÔá½9´ÿ\0úÉºWçX“ÿ\0˜÷Üß±ğŠÍİ0}®äëpµ›Ô÷S…ÂyNå 7:%\rÒ°é§ëôìqù9Oğü¾6__ô†Hî}/´¬F#Ç”˜‚ã	œéw{9O¯e0\r?.­¬í2íˆOü\Z\rÔ\\‰ù=ûAi{Øø®?¥w’7HÊ^{yË•ïÉÌC	§ˆ[¤k€¶’ÓkŞÈ¾uÌ˜ RË×º\\Q»Tp1…óJæ²60jt‘Á¬húœâVu\rĞïUê_Ì}¿o~%ü°‰‘µî¡µíkZ%ÜtÎ‰Ó šHÊ5Ìnç¨n÷R¿7ªàÕmw[ºÿ\0§áÏõ=¯Ú¼wIê8ç¾Şõ\rÄ„pF1©Ò<Òëvš]p^Æì^™Ş¿û¤lv-ÿ\0Ş¿ÕöÛ®Ÿ¼ŠIŒİGi¿é»¹¡è²mşñìÜ;£îÄpîä†0àà{‡ˆŒ\"ÃšYAÕÌ^#Ç–C¼Â½ë{ø\\ø#6ú¤`ú‰ğğ,AâGÒ$²@Ö(=Å±µ	s\Z^ô\0.˜ØÒç`ĞxÙsr°ˆ&dŠxÿ\0ßÁÈ[î¡e,xÈ3Üå˜Œ\".N§€%u~ìæ©¹Ğ†µıo·g†0†§Wí½ã:LvN~âºGÊ½OËË‚2Ÿ—_lf+îÄ¾KùµÏÒ·}#Õx…v›£5È¦P°ÇHÿ\0Ú½?xŞ©ÒöJ\0ÓPÙm·¬¨6=Æİ“éT¾€ô+ÂõÕn±¾Yb“Rf5ïo~‹ì_ŠÁô¡”Î#NQHiy@:“§n‹‹÷§^İvÿ\0J‚—²RëıkyIè6\r¬ÛıÆó{¹ql]?lç{+ac´@À]4¥‘š–1‡2nw’=®sÎR„@°æœš1‹ÖR%£)hºSu¬ı¤Oy±Ã-ÏUœá‹m†/Í—q–B \Z­Ìy¤ÕŒˆ²ıÊÿ\0Eûÿ\0—­¯gô-—WïnÚ¿Çû½kùï·¶ÛŞ¹Òºl»Ÿ½Ë£Áï™6Í‚`vğnv›m„1†6:üùÕÿ\0L™:†ã¨lvKq×²Iò˜àÙÎ|¬e#—›iR>yíş¦IÈóÎRšı;ù?Ò¿õµØ@ú·©mg	\0~–|l6şœeû‰ò†ëdƒT@Wì÷ovïåM‡kô×wÏuöÏww¶Ër7›ÍÏlöÜı«Ğ·\Z‹˜íËm¿ê½crÏµ\r–G#€V²¿õ­Óz®±uŞ™²ŞaôŞ)!—,wˆå,x°FEêcÓBWë>•=èØGW8§¹—Xâcá‰”Í8’¸ŸWŞ³¬õnÎáÚO±ÚNÍßGvıáñı©%µÑ6Wí¶ík—R9¥ÍQˆZö=s®ìºşm–ó¥f†lPÉpå„ˆ\"RÒ h\\Õ{M¶Ç~…»Útüøåœ´¹¾rÁ‰ \ZQÅÊïñÛ]·Ú]Ÿ0îbvÚ(¯ÜLZ1c@è^îK~‡ë}£bèêYN,xI£\nYèäØS@*¾]Ğ±u#Ôÿ\09e3f¯øn×_üÿ\0°ìàşÆíïÆ½ÚS´;WóC§¿ò§Oß:n³Õ·}@Oÿ\0aøã¢³k­½Õ§èÌÏ¼šFî7[%;6Ä`ÜK^§ÿ\0L—¾™õ?UİîıG¸‰ÜtùÆ>Ÿ’$Bx9‡&ó,7c2!-´ôòı1¹æXB_$ÿ\0Õæ§Sô~Æ1èøe=¾HCâcXŒ€%‰&I¤†7”Aàû_ú·“æ†WíÚ#xÚµ£hÙZ]ª=©Ò$|Q`s¾m\n\0+ú‡ Ê>¼D„gQÍs…5,,“Uø‡Ó¨o6‡«õIÊ[ÉæŒj#tF6Y\\—\0š/™ÔL‚\r]Oßï]Ç§FÔ%Ûİäñm`v’¦Féµ‰‚×/oŠsÄåoÃEçşÄ\"dG‹ø®®ú¤úwC8p–Ï¹—Ò¬A2o\0Ü¹sîğÙÃÑw]\'¶6ê íƒÓº~«ı¹73EşfêVÙ#ä›ÖF\'˜®›§föYú®VçÜf‘î€w\rYùmµú}3>ïL¹¹Gîã‹¼d¸T’°†ƒ\\Œf·(lny,cTy¥sZË˜®n\\’Œ¢ŞRàöö¿p\0ºö]G¨—o,€~&O§#¨2w8cŞú.]Ò;c}Õº_ë»WÄè»mİ9Ûí¨¿kÔ_¹Œn \rRæíß·&K\0ØÕÄ„CÈç”a6Äàsrîa‹.<3¾R@ïÛÄ;.9#\\´–›^öEó«˜ RËwH´-G&¤[bWø¬ë\n§u{ƒ–ÄaÇáI¨\\¸»[wÚ»½Ï$gy¼é;.«,\raÙ\rø|íg2i?}†¹ê\0\Z¬¡b3ÊÊÜH?\r>+‹y‹&	î°ÀÈÂ‚{¨|\ZcÛº‰cP¹šÁ+êk‰toh 9\réb”ò‚Mù€n%ŞËÒ·³êA½å„å.Q¯(,‰g=í¢åİ7§Ï×{GºúNÙ¤u.—Ãºº#Û‰ßôyù\Z\0cy‹H?ù‡Y4•ãK4v]_o¸Îß„Î%ƒ\'îN•ö¿â¾cù“µ”7Ûmä)õ1JÙ((ûD¥ÜÜWƒpÍæÖÔ }½ÄQK¥È]Ş…“}·¨ÔÀô®Ï.,¸e,3c(ÈÅûX³ø³¯£zw©ÿ\0wè¸7Ä©(4¿z$Æ^ğş+^Ûe»İjÛì´Í¼dO\r‹‹ZwÂ&=òíöÒ\"Ç½sÆ­yn›\rpç<{l‘–w9–2¸‰>S!úº*\Z‡§õ>ó¨ô\\˜úŞÈ™í\\C62~R–CõMâã´8+çÁ,è£ÜÁ&¸#K˜ö=„²HeÀ>)¢{K^ÒW\'&,˜òyG.A°ƒ¨\" êÑúÆÏ­lã¼ÙŸ”ĞÄù£!xÈ€EB{c%Ëd°öÆ¡š«´ª–™¨Ô.y)ÆŠÊ‚è²|Mr@ĞHô”°ş+X‚El•ÕJÒ´ñ½‘pÎ‰‚,‡IQQÈ\n/\nÎ°¡ºê­ñ+ÕÊÅ¤TeÊ¤4À”KÄ¨Å—lc.	ãpAp{•ôàG l?SÊ‚ñB¤òJqÇ)@sLÂÏÃÅméİ?s×·Û.•ÒávóÔwì6[v5$—y>àm™—&™>ùÒAÀãkÒÁ3¹éœµ;ÿ\0Ç±q6=Cÿ\0l7XKF¢@Ş$y£.Â?ÛeÛ•{[¢vl}•ĞznŞ#ÔYÛ²õ>»Õ£šbş­¹Şõ\rÌ0Êa|ÒGİŒØ9Û`ÁvÚVji~§;‘˜òm£–-ôÉ•F HÇãt`@Ğ•×©cÍ²ŸPÌD6‚R öB%¹yğ»!½²:ßúåÑ·Ä%Üm¤îöÍÚƒEê›£3ÂÔî™.ğ-ÆàŒiAÎcÖ\'ƒîËoŒ?4Ãü@ÿ\0jée¼ú¦¥Ÿ,\\SíŠò}¡hV6¹+üWeXPİzë¨èÃÜ¶#?\nLõBÄ]ÿ\0âQmšQ›x$ßnCKƒ¶û8”‹‡¾G8ßÓ•pó,‘‡í€<>i{\0Òê»¿Æõı¯I|xæ\'1Ú@æ\0÷\0ş+²?F\'îH&\08í6»ÉJâß»·“lOûè¼ë…×rÁˆk)u~Çğ]æVnNƒ.Ç&â><¢Rohqnóÿ\0Ê×y©:è‡Kaq8]P*àMŠ¨ïzPLl‰¥s{9×“ü»¯¨rµ¿	öãÿ\0áiK&’@Sê±‚ßõ¥8>Z…ö²à8©K4( ¸jBÒ×ş™ätr76¢°Œ©ÅpzwRÛuL_liÈÆQ,bGíVcs\\M“\nlõ\\õmŒ0—n\nMËó‰\09°Xvr—/P™·c÷‹l!ÙµÛwÊÒIA¹Ü¸@xØã,¹y¾ğ…ˆ¸aŞüWŒôîyu.«»ê‡ÉHG÷\\‘î\0÷’½eHgQÿ\0[¶;›Fî›Ö:öì½­rÈø:–Å¦\"ÒCZ×m·ıÑ†‚Á‹—‹+õ¹måÿ\0íâiÀÌ¹ğpİÅrgŸéú¨@ÚXD|XÈì+Ì³rHâLcä{Ï«LLa{Ü–]-ó®Öq›4’Xq&ÃÚ»ışïÇc›{?&,r—°8&rÎÙˆtÏÅŞ·(M÷yõqº.hGˆİÈÛì¢Í!°ÊR‰õ B„u`ıOPbéñ®ßgŒCø„Lä{ÌÈöV‹àş”Ç“©zŸo“5drO<Ÿ´	H™™|>­Ñ:—FŞ\rŸVÚM°Ü¾Ût!˜\0]·ŞAçm+Òæ>9¡”8OAÍ1sş4¢ı	Æaà\\Gˆ,}†‹¾ºŸCw~~íŞèÚˆäë…´ê½¨–•Üïú7I“m½‡l!Œ9ßşÑw¿åµîÒ×Cì’âÀ,ÆyÆs‹š\'·´ãáù>‹¬©mú©Úe?ÒÍh~ğ¤£â7{êW™ú‹·ÏÚ=İ0DíÜnŠO·,BS,,•®ÜÃçg·2@\"Õ#d@ç5¤¸k·reÎãw#JPØĞ°%œÑv™n?#´äüP—ùIĞ*³‡k±±î_õïñyÿ\0±?”û;ñ7fÇ´C»¥ŸtŞç|{Ù;k¥vßL2¿¸»‡ª¸A÷¦ËÛ±mŞÍÏNÜ¶\rÙßhÚ³Y–)_ĞzçÔBz/_ê\'›exñ‰F3ËšmôñÆ¤4ŸY#Ì#ˆK))Šäş^Â˜=gûŞÛuL5Üc˜ybˆ¼ƒœIhã JR‹˜ó/×Ÿö÷ÿ\0‹ÿ\0Ç?ô.ıü+Ö:¦Û{Ø[…Ó¿+3¸f—|{ÓaºêciÕÿ\0&í¡a{:G^ÙÏÔXíÏNƒNÅİ>&„rÂ÷n~èoÎmßPõF>‘×scË²êLb@oÃe!á¼¶òäˆ›æR$e!Œ ¿0,v]/Ó\'«ôÑ(çØíÌ¦.2cÇiskõ\0æ—8a å‹D¯n¿ÖïÌß;‡mÛŸ†¿õ>­Ú¿znß²÷]hî¶ØØu¶:^·Õ¶Oî>§ºÚl7İV\'uhÿ\0ÈŠÉ)yû†6‰/ô¿Z~qzĞ“Á±õFúz®\\Í\r®8Ë.§IK1#\0@åçÉË–$‚¾5èBz·Ö;¾é»nlY$dg9@=DA•eËPyA­êSş€ÿ\0·}—ÕúWßşëSi´‘“Ê{[©tç”éè[´è]W}¾‘ÊäwÛ‰Ú‚è.¯5‹óËòÓ®í¥‹m½É$ˆo«ƒ<ïÌqòŠ[šAµs}kù#ùƒ“ nvØ6pÍœÀJ\"q’ñ\"L¥\ZÒÚÙx³½:4İ£ù;»ûoyµ›§O.ïqÔ¤éÛ˜dÛîv=R	ßÒû‹¦î ‘­“m¹éİcc#eÀ9’WÚ:^÷ZôÖË­m§¸y>˜˜.%>¦Ñ(J‡Pİ«ó·¤!¿ôï©·>êøåƒy(´ñÉqŞ%‰bNº\'öîó¤ízÏNê]g¨3¥t¾•¸oVßõ	ùÛoÓß8¶(šùe’W@Æ1®{ŞàÖ‚H|xg¹—ÒÇ)hìì	gÓ¾Âô_Kê»ˆm:n}ÆB#b‘$–‡];ô]›ù«w³ê=ôİÿ\0MÜéÛÎÖìîÒT™†M®÷´ºF÷m*nÀOìz9­{C´¸jMŒå³Ì\0”Ä›´N@ÛˆĞ÷.·Óy1n:&,˜È)‰125ñª;­tn‰Ü‘É×»{mŞ]£õyåİöÖÿ\0¨õ.•·ë=&`ó·Û¿¨t™v½Gb\Zé…Í Ä,A ò¶³å	f€6 ) â·i]şnÅÀô†ëèäÏÒ÷\0Hà™ ?İ$‰a ÿ\0ÅØ¿Q¿÷7ÿ\0_’ÿ\0ÅèŸÿ\0şWÿ\0^:¶áÆzïEï¾·Ş½¯âTcß.÷wUê[X›!PdécYó>Ä×°Ûeô†äŒ{¬9¶¹¢fQö—#ùWÓpÏ¡î>\\°É†]¢Dµ½‹öŸıü\'ø_ğwi~Hêÿ\0ë¯æmÿ\0ç^Ìî£Óº‹ú.×«ö¯R=ªôıœÌûPîzwø\rªõ\rŒ¬k™ºÿ\08DË5	¯wéı†Ça‡,úfs¸Á2<K85Híeèú^ÛmµÇ3´Èrã‘vqB>ŞõÖßìŸÿ\0)CİŸw=ßıÕŞßô“l·½§ÕûoÛı7g½ßí_½»Ö7±õœøDƒî±›Işì/l‘#{^xSÕİ;h2mN<“ÏËå#”WI9~ò„®·qê®›ø¼İ/g=Ş(DÌ3™»FD—vÀ\Zj¿–Şõëû~íîîîm¯L‡£íû‡¯õî¿FÛ;\\&­Ôw]B.›·~˜õÃ²p\"aÒÕkpWÉ3düFyäˆåæ™-ØåØw/Ô$eƒ6@ã3Üà¯§ø!?â>¥*ù:§t0ò•°Å#äU¡XšàúÂ_OÔÑ™ 0ù—c˜m÷[\\îÜ›/8ŸğêLšM–é}Á¥…ÎG$¾Ì}$Fâ\nVû¡Ëš_é‰e¸•úÔx¾§HË8’\'§.H.<eØocÜìvû¦«Dñê-C©¯kœÉáô¹ir±KÑbğ•dû®gHßÿ\0sØcİÌfì¡Ú-N`y&É‡ñûU³÷.Í´\\ßñÇC«wJxşşËi7ı–öĞöI·Ø$ÿ\0ãÈ×zKw“¶8=JKƒ…IùG1°\\©ºü&Ã&qçaŞh=ås_öoş7ä\'tËìûsµ£¸ò>N‰³ŞO#È»ä’mËÜiL\0®NÊsì±LÖRç/Ú>¤Ëş+®è9ñbéø1erË\'(ÖM\"d|5=İ©İïÙ[Ù}ß=½±gµİô>—qm6¯HbŞ“¸éßöÍûÓNè[¼ê½7qÍilp»ìX:p½´„g2\"\0å„$@ìgş`_¼jë±Ã»ßeÙOıHÊ<a ŞÑ\'¤$xsä…kİct·Q%ûŸm¯#Ò$“í¸†® Ğ¤\0[«ŠrWéÀ8­}ÛßÂ¤!Ô1dêaˆsNæ™Ò/åI¿ìKl#K9Ò…x.`Õ1î»[!{#ƒÔÜaN6¡,âÊ\\_WèsGërór½YÙÛ±èı¨CCœ\nÕ3ªj•§dıák»åá™^TÍ@*—q‚té%ÈbkhFD|Ö	İTÈSIi(­“İûÑ8)dì¿h#^8øa…CrPŠ¡ÃqI…’uô›\r‹£û›M§ùİKu\"»mÒ¶eÉ÷ƒşMÎéÃL0«KÉÔH`¹”GÅf¥)rÄ6Iş¬^À}é±À[Âú‹Õ“ÛnGFèÀdê’‰72 C75Ò\"îh™ 1Ïv·8Ó«N­ #uhkZKZƒ\0´¡@ŸÆúŞ«×l6ÒÙí1àÉ9dÉüÓ‘$ÊF²5í.ÂÀP-İ·Ó£î~óíÎŒo³ÙÏ/_ëNpí:_Ø“iÁB>îöFœQÀ\'\Z­Æàì:Vç¨Í1±öód~r; ƒ÷/”~cuIK{¦Dÿ\0G?«!Û3Ì\"p·ï÷û×õMşó¨<\rŞê}ÈkÔHÆJ÷=¬x –4€F!*v;sƒk%š1\0‘Û¯¿UôÎ´üEÚíeæ¿ïò÷’¾KæyûpĞ?¸Òò¦F·­àiK0hÏfSN2ÄP§}	ÿ\0¼]@©“¦ånaÎ¶%Áˆ!ûŠä=[¶÷¢vÿ\0]‘Ì›§÷Ûs.ŞXÚõ†}¦êm®ãk>-lğ’Û«€%\0@”c3ï†÷…Í†ãLù0õ1³÷H8?à¸Ó£pq6L8ÖŒõ\\…ÖİÛ]_Õ¹Ù°îvÒDÆµ¦F1»W0#ÁpF¼ú”*“Ê¿QşOşcz;Ó>”ŸMë^¡4¤O$¤s	‰x‚ò•‹\0\0k¯]Ğú¦Çk³8³L¢DØgµ»,¾WAìîäë=ÃÓ;/£‰¥ê½sŞ]®Ü½ĞÇ¤pî\\Àà†éâ0\Zúo[z?¨t\\¾¼İbÅ.ŸÓù¿\r—($²ƒ(ã‰¨‘—,9pN‹³Üun\r”ú¶p?„’Õ\0v’Àq]·FÚöÃw+hø÷Qì÷³mºo õ›; dÁˆÿ\0$€@ÒÜĞ_Œ=cêÎ§ê«—­õI’E¡ü¸à-ƒ^QrMIâY|ÓÔ]w$0K¨e®i‘GG•\0Ï\0u¢Ó(7ÓvƒYÔt¢…@<ë¡\"B:É‡0€c6«vê¾÷smŞşÙ]ØØŞ·}™ÖšßS›·’ËÑ&y°s¬Óÿ\0‹dÑˆ+×ôÃÉ“yÒ¤Üñ?ˆÅàÔˆï‰#‰‹¯ƒîwôç¬òn#L0Ü9Ññeig1ñˆ+ŒèlºdhpL AàEsL\\¯½â–(÷É´Ù®÷	ztSG¶ßÊ\Z’ôÇÎ\\6»ËXÔOÜ¸ˆşåŒ/µkàYÎÒ\0ş!Œ ş¤uzóÆæ?xyXĞüóu×·^–ë\'eÔLòôlÇŸÍeŒÒyF2¸.DH è¨¤Á\Z…È¿ÔäáXùü·_@Ç—lqÍˆ‰bPA«‚\\P4¤¥€òJÖ ‘[+º’5À[Iiµïd_:&²\"Ğµš‘m‰_â³¬(nÔtaî[-ÇÃ…õB¶E¥ÎpR\0%ØqçŠT–…dC,òæÅ‚<Ù¥ÅÀr@rK]I¢«LÔj\0¼ÇãN² ºÒÉ\"6%sY¾K†ÆĞ.÷¥ÛúÒ.Q O$±ÄH‡0½ÚÜ{*Ë¿ßG§àœ±\'n$ˆû –æm@,ú÷Ùvã®ÈÜw·síziŠCÒöÏ‹sÖ$`!íÙÌhö‘¾Á›¥¼=¼eU®“RÓU–c	n(p€\rîşPüIgì®ˆßoñìöRŞ”XrÖ’2ò€F‡·²«äwË:NÓ½{š‡³‡§ô§^ßm:v×o$³ÁÛi¹~Ö#³Ë<Æ)>Æ ^÷V&¯9<æv¥©Cí»-å¸ÇŒãÃQŒ”ÜÒr°–ì]óşÎv¿Úë.ã!Ï‹§uéB_Ô6òu~–×9£J·w½M±¤±­k:n•›ëa”eç\\ƒ¹¦C{oßÚ¼ß¥÷DŒÛ_Ì€ì@ş }«ÊÍŒ1ÅËd°½¿{×hÍUë*®Ó\r-Bìy4ã¹\"DG4¨ÍÓ¤;§î÷6‰Û´\0jÃ³û’¥®ss;üZÖ¦°Ûÿ\0Spft…ŠÃÙ{Éí^; îTë¾¢äâˆáØ\"ïï`|x®úük·t·9ÿ\0ÓÜ·pÒàWÓ´éÛ·”À´nÁÀğ¯7×æûè@}Ñş)Ñî^ó8Éê<XoôğD1‘ıÅæÓ{[ĞöØüû‚ÜJ€X \rN7[ä>Ö¾^¥“µ£şìW®ü¶séé?ÿ\0¸ŸÂ+’Úç8»J}-.]Év0]ƒEÍ#©•6Ÿâİ½×:U{>¡¾ÅÓv’ŞgèA¹ˆĞÆM¨åªÖV#¹ÅlÙ~ªV˜{EÊ†Hå€ÉŒ‰cb\rAê­3Q¨\\óS•ÕÙIfM¬Û™\0,ÛÆ÷èi-29­:#…d†Ú÷§31Œ	,<uğºêºÎÿ\0ûwMËº²´zT¼¿‚\r¤R3i¶ä>O¶ÆÎò>i¿ı)=K\"ß…\ZË\0#<GË);½Ë‡éŒ\'EÇ)y²Lÿ\0&¾Ôì·I‹gÕ;o«Æ4\rßJ‹göƒJh‹k³ßmåÖâ\\ñ¾{0gÛÿ\0È¸·£çvù£>AÀ|Å‡Ç½q½1œäãÓ1à% ñy?¬:Vm4íÜÊßËKÚ4ÏQwøÑ–•Vº6¼¼,¯A²Å»¨œŸèÀ’ıÜ1ö#â¸>¿ê\'eĞNÛlÛ™Œc÷o?u<WxwOonŸ¸ìÎÂíİœ»İßOé.Ûív;`ß¹¹—N‡hi#îLçl¦r«2Ey“–{ÍÖçªf?>I½tw‘ğn_gç?-ñCŞõ„q€\'@9¥/+[t~©ºèİ_¦u}‰1oú?PÚu¹!ÍÆËpÉØ\\/ë\"ã\Zô”£1(˜_YpÆÄ.íüåÙÛn×#ï>‰líÎï;~£p¼È6{Î£Óv½T:W±¿f1ÕâÜºv±®:&fâ$e*pdúâb_êbÈa>ñXËºqiw¾‹«é[Ég„ö¹‹î°LÂ\\Gİ—ñx+¡dk€¶’ÓkŞÈ¾u¤Á–]«¤Z£“R-±+üVu…\rÓºï?Á½µîäË×!dİµÚÿ\0s¨îãS;ÍÖËg¸êb#!Ò×C±Úìİ¸‘š‡Üsb‡ÛYåÉô£õ2dŒ!ûÒ İ¼Ïp…u]Wy=¶àÂî³ÌB´¥ü ¿{.§î>¯¸î.ãëİÅ¼‘ònºßVê=VwH¬Ë¿İË¹v Äbƒ* 2­¦Læfu·Ø<,»8ˆ(;‚ì.Ñè›˜7ıÑÙÇ±Ÿe»êìo:ví¡²mÛ¹†2Ó,j\\ÍÎäN\rrŒ@\"¼÷YÉ“m—o¿ÃL˜¦÷4‡…·ŠùWæN(äÇ³ßãcšp$j$µt¿F3&Ïràw=#u?Gİ…!í›¦ŸñËŞJ÷ÚÁ\"ÿ\0õ•zİÔ\"7&0Ø2–=Ù>jwIÇ‡İ~_uºèŸ‚Ÿú»\\†ÂI”}G‡^°ÿ\0Wz?ù=ëºêˆé±‹g·lÅŸ}»™İ¼ü€9é\0!Rñš/œõQƒaÌlrDm_‚ìıWŸéí1cıl¯áoâBò¾õ‰ò\0ı2=’ı™o÷šï¹·v”qgüÌjğ­s·#–!i{¿åuËõ&Ät\\Ì>h1ü$îvA£İÃáŠÖÉèõ9Æ94¹·N1H­$Ü‘WšQù‹È\'µµñ|W\'¡oÏQéx·2/›—–½\ZmüS›a.[d/ñ½[5WmU-0ÒĞ®Ç˜ğãEÇr™Î8âg2\0rM€tøÂÿ\0ù­)¨\r-pÒ©‡êŒ­`r²x‰œyˆh¹ï§oguÇzáôış§µÍ¸?‡™<¤ıà	İÄŠ=[Ø¸×yŞƒ»#å.‹ÔªƒX\'Ä¢»n÷,]İ+É~b’=5.Ï­âW¢¿\"FÓÚ½¹¸mÛ= Á»®‹\Z•(,è\Z4æ«€5ó¾““©å‰ûÒÈ<Dßô×ÃUâ?/ó}?SO¾¦	öä—Økáªè}óşÇøÛ§è‰Û·ÍÓR9,€x˜¤C^şƒ9åÏ1‰ÿ\0+<A“qì¾ƒê-Ìº_RÙõ8¿/Í	ñ…	ö9 -Œ0—-’Ü?U+\\°>ö‹Ø		DJ$àö‚¥¦j5€^cŠq¢² ºv^¤ÿ\0Xû]K¸eêû¨ƒÛçoÒözlA½C©H×tíáŠZ5&àÜë:ÎààØHZR >ŒH{Ç½y?UnÌ6øö‘ÿ\0˜I—îÇOiÅæ5Dv1%\0I6\0\nîIo5‚ôù²cÃŠY²–Å™Ø\0r|Øíş‡½ëÛNŸşÛïïû§¼¢Ã#›’tÎ’&†yhëÓ#š\nj1Æ2ÄÍ!\rùÛ`ÇÍè2L?±\0İæGUòßNuÖıMŸ®îIl8HƒÚ”„aÜLDäO¢øG,íGzšèÜ{J9¥¥-\"ã\Zß”-—Õéuõÿ\0Nbü­<ÿ\0kÚ½F¨@d†nSGÙñ¬ıAIÆgÍ‹y{¥Oµ~zõ˜oSï#Û>X•È;óm£º·ò¡kg‹g8rNÕ´¥ÇÑ\0U×t/Ÿbû²÷¿Úëé_—y†_NŒôóLw9æï:êŞ£,}?¯m7-qnÛwv[‚ë€ùX×ÿ\0ù¿åEcÿ\0Ôï\nÛ¥¹bOÍœİñ7ÿ\0)÷ÓçÜ•êéf‘lrÊÒıÜ€ğ¿€\\ÿ\0©vïTé=+ õn Æmö½ÂÍôİ1†AşKöÛ	 û©a!a‚y&H\\JÈ\Zâ!=œH“‡ò–<ğ#Ú¾™Ø²Îxà^XÈàHvö3ö:ú]ƒÓáŞ÷·mC<?äí‡UÚnw18kl»]‹¿ÎİFZ%¯ƒná•L€ƒÎ¤2Ë—èl²åı\\r>åêoöjÙ»Gğ·Oxiÿ\0·î—	5k2\r´RicÒCHwø¥¯_™¦¼Jœ~«[\'ñó/‡õmü¶»m [ëò?v3ÎŞ%—ÿ\0XÌ¯ŞşBØJ‘9İ±´ß.—Å7Jë[O´àı*4î7-p¸õ4@®ÛªÊQéÑİÄü¸ób;	åøM}OÔ9ú>-Èò‰B^\rOh])ù·]Ó;Óªõ6Ä!éıl»}ÒãˆhÛì ”µÛİœ\r$†¸u¹÷\0ùCĞ€\0;ÄæÜıSş˜ˆ/Û2ïü¢ß¼W_éènzŸSÉÕ·¥şœ!Ø	½;@¿i™_ó7bÅãnÊü•ÛğHİ–×¨tö÷İÒ:s´›s¼Üv~ï©E,…[´Üõ£‘—û/’$$HŒì:væ2İî6\'ÍôÄ‡\ZğÈwx®‡ó*Gé£Ó²õ¶ãxØBQ”Çïó ÷®ø£GSé[‹3ô7iÖ7ı	ÏaÒí¬xÿ\0ğfk‰líz~ê\'‡W•O\\Èp@î…[fÆ¼Æ,$ïÈ7úvìuŸÊ¼’_.-¬A­y¶òä\'µÏÓû‘ÿ\0ÃoúÍ±ïÈ_¿Ø®ñèõ	ÿ\0èüsØmŞíŒĞl;÷¬Ë&ë»zşËo,nˆozg@Ùl¢ÚÎÒLMêR´`‘ù÷ó«}©-·£öùAéæŞçƒêÄ¼vp\\Æ2úù2BAŒñb‘ùYÿ\0SéËc¶ë:±ëxã-ö¹0à”ì%ˆåÏ\rÏ(d„Á –xWÑ.ë¤îÚ\\]µÜÏÕ %ÄµG~Xë~—†H™^Ú/ØX:†Ü€ÓƒiQúW^u«²“y¼è½\'s³êgö£İô½ïm¹Üô—î¢m¥ëŒ†G»¤C,$HÏ¾ùv_Ÿ}cĞv¸ñ¾ÌG.û,O bòË$¦>^X	‘—ÊÎíİí78%Í’r!Æ¤â \\’*ö\0»®E²è±íú\\}>fÇ¹gÚpÜ	#c¢ÜI)sçsâst9¯{ˆ¸Æ¾]‹òôÃ(œ\"yÀê\r){ÕpÎîG?×.NgP‚ôb*ãµuWn÷¯àı‡õ¯Çï¿ÇQ~CèWe·ghõñé0÷FÇwÕv_çí¶;>…Ôú“\'v÷üyu6-´n™‘=ªÖ´¶¾Ïèÿ\0Fú†=oú¾Ûy>•4Æ\rÎLyNbƒ!¤9¾37\0˜³’\nãu?\\Cs¸=2{üg6HÄOL‰\"‚\\€Hóó4ï«{ùƒğßk~oümÜßŒ{ßk(èıÏ°’-¯R†&£Û½n¾N‰İ=iXæÃÕúPÓ<.»$\rtRE#Øï³zwe¼éû­¿Wèóê[iıLS¼	!¥f\'æÃ‹4A¬$ñ\"q„£ã½KÑºOªº.ã¡uXG6ÃqŒÂqpìjàé(%¤€-F_Æ/æ_Ä=Ñø7ò7s~2ïS´rv·QŞôÎ¢íŞ;I›÷uÏ¶1’\rŸZéñC¾Ûª‘¶ÜÇ¨‡êúé¹´õ7BÛuİœ%ã\'ˆ2Å’$Ç.)5±dŒ±’)#h¼H\'ñg\\èÙ==Õ³ô|•	òÂ@0œH\r‰¸.\rA\\±vgªşIè[$2ízß}Ü;¦s4;wAÓË…À-šsÎâÖÜu26~Ün²g”pÇµ‰æ›w€=‹óçæûñr;QşÛùçSîå[ûÃpş¡ÜınW8égP›isw€FÄ¤éi;{\nàôœ&?Øoæ<ÃÜWÑ=·ü?¦vİ³Œ§üò2âİÂ$ÚîZ¥„Ã¦\0?ıËÇí@Líh®Vê@d ëKü¤­ıY‡ët\\¤^K¸Sì%wïúäaêòwÏpd~ß{Ù³<7‘¯lOa·İ9ğ”l³·g,ÌR„¼š¸=O9Ç·Å0~hî\"‰Œ£ì.ë¨ÜõnºÓ~ıÄ3Eÿ\0z\"B^ÖÓ}O§î:WRßtÛš73{ºØÎcv¨şöÒgíätnpn¨õFKJ\\^» mZ/o	G&8ä–@Üj°:0	(H (EñÃ#R`}®MØ½ıc»:.Ài|åÿ\0—¸dŒû;~Ÿ›é¢,¸wŞlX±s€8ÖŸ)L\0¸}Kpv»¹ÁiÆ»Í½—Şÿ\0a]<’úöÀI&¯¹ĞºKUÎ{™£ tæJØZWL,!ÈÅ@Å\0á]nÏ =/YyLıüŞòoÅx£½?IbÁõ3¼|9‰™ññ]qXöÆö\r1}¶†ip-Ğ\0ûzl¡€ Ú`Âa\"Nâ5ï×ŞëÙô¼†éØ0kQ~ösâî»ñ¦é»~çdW·{´İÂZSK¾ÔæÈ\\…	0í\\æFuÓú‡–ÈN\'Ë1ï=ä{ŠüÉÁÍÑğî…ñnù¢GÅ—X±èıÃÜı´ğXŞ‘×7çl#6¹Nçf.„4¶giE·•ziLn¶›n¢\r3à7ïÀrËÆuß–»ênº\\#!–#„©//µs^‰Û½_sÓú·tô­GÚÓt¹·‘‡<îXÍä›ƒê&1„:Ÿ´?p¨-ã]~ã,°8ryrDwø>è}S×w·—Lİ–†æˆ:;?´\\qæw·K‡§ÿ\0‹ù£4Úî!·=ÏµÛ€öt¾¥8llë1G\Zµ$À²pÛ`×£n¥¾Äz.r?ºmÁú2?ó œDŸl	·sƒğ>‘Öw^šê²ÍŒóã„Ì3D–qa£ê%İ¡+á5®”\\ß¶ä-,!ÁíÄ9®´µÂàæ+—fÓ†½ÍÚè}¦ç÷m\rŞÚ\\ø2DJ\'´·B4)â$uÃš\ZĞY4Şé¤ÕÆ1‘æ_Ğµ„á”sc\"PíÅ(mÆ‹<“ı™âÛ¹ÅÍİË(d\r“\Zèöàê2		?0#1XË$¡¸1\'úf#âA—ubx:ç·]R{¹k¸?ö[Œc—öf$G²O{Õªê\ZJ!åksÁrxèÈG³Ú¡ÖºWHÏê2ÈıÃØí/ƒ¥ì¡~ë©nZñÿ\0¦DL±Ø‡¼©Xnd6ÛlÛÉÇŠZ¼äZm\\ÔöÆ$j¾{ëŞ¹=–Ğt­¬›s¸‰2\"ãÓøÍ;¹–Yuµò=šœá[¤F	>†4X5‚À,p”1Ä;Ğ|.½ÆÃv»;xÒ8ñF>È€»C{Ùô?Ç÷/\\†aÖûƒªtí§DÚ_:N“g\'U›3£q¸İm>ÂFò{¦»çkr†_©º–ßõ 	ï&ƒØ$}‹‹‹~wN{<?èáƒÎ]²&‘Õ~4í_Oğ‡nHîò“¹dblc2\0âZÃÕ÷°¿e&æ_}Æ×¦Î÷Èä±1œZ\rašƒÅšvˆÆL{70ğ&ÅxÎ­\rÇIêyá€¶Ëw#‰\'™»¯„—&üáß~h“¥5£ìí6ı¡Ót\0«}¦Jæ`‘Å£ÿ\0€°¬qÊ{nŒÈüß‡ñ˜æøÉv{Â6ş‡ËÌÀKk/ÿ\0ÿ\0ò]İøKo·ê?ëßlí÷1‰6Ç¯õN¸Š1#Ÿş<ûíÏAßp{¿ÈnàZ\n;J!àodpz»”ùÆ4È>+ÃtŞ£=Ô0n&^xF8©úDî^ÜmŒÍÁXŞø\\®k†¦8µÃSI(ÄX×¨0å‘_må½ı»Õ!í£İŒÉÑYÕ_Ò\'‘²‡M´İ7kñÜBÇ·šÌ°‚·V3?O_ºKpû=¡q³ï0mÌ†RÒ†3şè¹ğ×½p„Í=K¨ÈN­îåŸi£éÛ´ÈØÎa¡‘@Ö‹©Ôy×	KyFĞ2ıâÎ=¤ŸÁ|ïÒ™\'¾ëÙw¹+#	Ìÿ\0€ØO³¹wâı©Uê±¨°fÜ¦ÛÜ:£„.ñ-å]g¨¤#x“ì\röû×óG0ü>×o©œåì?ñ{×Wu½Ãwß“?!îZ¾°İ”g\'G´ûi@(‰ªs¯SµÃéŞ›‡S†R?ÄAº¯Ë¡Íê\rÉÒ;vÿ\04\0ûWÕé½;}Õú†Ë¥tø$Üï·»ˆöÛ]¼A_$²Ö‹Ù­h¹q³@$Ø-g)‡™h€ç‚û>IÃ3“!C“Øõ­—ıd};xZÃ·“¨o»oªM„‘·ªm˜w?tdo¤³w·s¶ú…ö˜r®.ßæÏŸjÕÄÙ#Ç˜LÜŸÏÜeÚ¾W¤}=ë<Ø²:~òp%èÔ–c±¦dueóN¸Á,:š/¤İÃ³­µ—Õû×f÷kí¢ü-Ñ mÈz†Û¨u.ÔY¨–o¢ù›µt±tnct‘F\n¡d€§¢¸’Ëõ3Ëi+òN.²„q~Èõî³-Œw[b[›\0úgQ)<Hÿ\0ˆqv.­é;sÇlË†67p&]n~»‡0µº(p ğ´ˆË)æ:ËÜ\0o‰÷,}ˆC¦äË¬³7„cñuì¾ßŞ7§ş	¢u«vÌë7¾:ß@ŞÄIƒ«Çµé½AÛÍŒ¯Ö‘u†¿f_`¿N\r\nÒğ²Ÿ\\úø¦†(ÆB€ÄJRå<ArçGW½ÜË«ñàÍ1Í9ãä,À\nCû@}Aà¼KİSKIvŞ³ïgƒeGÎdâ8Ë\r2–ş¼ëÔô¬b{ØœŸéãgº!×/ózvİíàZ{Œ‘‡|o/hà.üï½œ]µûS¶£kD{(âÛéV—ô;™\ZdûıHâpyÌW…éY¥Ô:¦}üï>iã—Ëîƒq^7òó\0Ÿ¨2å¼píÈ~2”b4«òË¹¸ªüÔÿ\0ğ¦üVâ\\çõOÅ}½¹%ÏûÛÀÑ¨•ŞûÁÀã«PLÇe·Êg¸Í\rc˜ÄøÆ2†¯Ş;´Øu)m½K—§Ê_ĞÏ9°ìH#÷¢>‹ºÿ\0Ô½ÿ\0iîİŞ}½ß3õM‡@•½¸ºï¢ôÈú·Rÿ\0®éßö}u²‡¦9ÍQB^à†	aÃüY&qD+Õú«qÕö&=K¢â†~©ƒ0äÇ)rÆC\'Ë\'$†,u­«ÙCaÒw½k`:Şâ[^–3ÈdËæ€8å(àŠä„\"h|Ëô‡¥ÿ\0ğÙÙ]Õµè=İÚì¾÷sÙ]ÍÑú_qtRí7{İ×Eë8ºÅğõ(;ò-“Üv“´ı‹8n |_©~ynöñ–Ç\0ÜD˜rd$âLe	C—„‰ùÁ¦‹ôv×òW¥ïñCwµße;I€GË	86\"T¸b>[uÌÿ\0ÿ\0«İ¿ş“~qê=ùøïò_Wü—ÚÇÚ»şÙïşİİöŒ{ÃºˆŸi¸é·zîÓ¬îv\'uÓß´0îãÿ\0?ò :\\ùF/ÌœŸY?2:M\r¾(õ^Ÿ¾úØ7òâ\0ÂXóa9‰J|Â@Âq›Fq SæûGåÏşœ¥é_RTÃ{o=ÆÌàÉ4,à%˜‰0åiÎ„d]Ç(èüëİ»şğü×vßºtıÁ¿ü€ş“Øİ:vó7k¶‹¸ú¶Ûc×wjxcÜ³¥mºwB—M4ˆ yiÅ+á—ık¬lı_´ë^¬Å›¤út²osæğq9a†äÉš8á^@’)UÛşdô®©‹¢nı7´€şï»‡áâoàã9AjÂ1”¤ôò±»ÜüYøã·\Zv\'nö?o¶1Ó»g#¸2:¿Xßî&ê]ÇÜ[Èã1Ô;—¯n÷íÆ”h’rÖ\0Æµ£æÙ½mÖ}{êíÿ\0¬úÑ~¥Ô÷RÍ Œq,1a‡şïoˆC1úä’yı¥`ôÇGÛô=„9vø1FK&¤ñ$ê¹ßRêµúWUî^½Ôö= öïKßõÎ¹Öúá›NŸÑúWLÚË»ßu=öêRØöÛmœ—¹ä„N5öÿ\0OË4öç!9gÈ>8ÀNy2|˜ñãˆ¬²NdF‘ ¦ûu[YäÏ!l\\’\0åÉĞ$Ø\0I _ÅGçØáŸ«v¯{mwÍüî¹Õv¥¿Œí÷ıCoÖækg¾ê0—Èø·{©%2ÊÒâá#œ	%kú·ùwÑèYzæÅŸÏÆ8hÂx¢!8@°x€9Aj†_Æî·Ö0Ë×›®»²Í,ûsÕ³Ld!¥<y2ÈóûQ&‡µt—rnaİõ-ŸAvãü}´ÛhäßMê ;ªoaèİ$5±»îLøŸ>ãtÖ\0®~É \\×³é˜LAÜ\0ò\'”S\'´{&{ªüÉêPÇµÙôNfüväŸü?ÕËüÍq+Ñ–ºnë¤w/NéóìÓâƒ³û6Ÿ¶˜¹ûßú½ŸoìúN“¨¹Ï{[¿“i´oİcJDá¢å¤×ŸÙ´°sÂbbsÈhõ\'Ì\'®·^“Ò<ÒèÑ•#„Î\\¹\"Ór{Ùt®Ãi6ç¾z?NÛ½‘»¸gI|Ò5ÈÃ&ÚIàzWÿ\0ÍD©\nµ@£%(Jœ“2ğ?ø‚¼ÏâIõnL™a”åÍİ8óó2íÏÊ]§ö×wn:MƒìÁÓº_EŠPçÌıÆç¦mwóK¹\"Çs İd\09\n­¼£ŸÎË\'ö9osxº÷İ+q“u³ã7šfG€Å‡€¼¬ÿ\06~HüÜ~øüiÜı_ u­¬ûf³kÓ:—QÙmºãİ(fÛ¤um·Oİmì¶™¤\r|o(„˜×gÓro6ÛÈKg’XäîKEdd8\0Ş\Z¬ºç¨2zo§Ï¨a-¹q-)›IwOû/ùÓò·ûCÜ°wßä}‡i·¬v7nô®×ë®Òé3ô–Ê×î÷\rÏS‹wÔºœû“Qİ?nÉL–7a¼ëYıC”o·‰2Œ9C“ËÍRæçNqú_Şuí¤:ŸU£¼Ìe˜G—šÉêI/ÌEm`¼¶× µšÇB\0‰\\qÌ+Ì4¶Üƒ-¾HŠ“ğ+˜~—ïöwqtéuÿ\0ö}×¹d¿?Úê;¤(BàÂœk…ë¨Õ0gƒ“eç‰ÿ\0jü´I^-òä“vYÃø…Åš\0‘°îZÎØÈDDa	`D®FGÉµ<†¦ŸŒh¿L’7½ú»z)ñ\\;´şäO{Ğçİî·qMÓ cuI;÷nnÚXcåçrÆ#SæyãKçòèaÊ{ÅG´^x¯Fo¾–ç.Æe±Ê<ã„£I{E|:ëı}Û=WÑ·†îúlÂÓvòıøÙ0’6È\ZĞó¡è,ğEÑkAÂQ/\0Gq=Ëè˜sCqŠ9á\\rh6]Õş¾lÆë¯u\räñ5Åz?MÛ.×º‡Qnêg‚¨Ğı§K’21\"JãoIÇ³É=DÀŸ±yßTäåÙCûùG¸ñd¿öî¿1÷ n]¶»NbæêWPdQ9²j:uG·ÙÒÎ¸=#äè»)Îƒ&l‘ğˆ‘Kü2ğ}©J~¨Ùmd¥„dˆrÆr\'¼‘»K´£ƒ©~éĞN#s½î~ß“ïc£İï¶ÛöÌı\Z=MÜğK«RµÑ‚¡s§#‡«âæ?ÓÍ·”’DŸ÷½Áz¾¿Ÿ.ÃªCw€â§e	ûEAğ^Dè=.>ßêÛ>›Ü°Mºn©züN‘Û}ÆéÁñÇÔ	•k¡z62ÒÆ·\'?”’@áHÛO˜ö™õØúwc›oÒl„ş393$Ôê\"ı´ùË\"v<İ“×¥Ù«÷3téÏNİ¸(sa”Ç>ÒW€\Zw;Ræ|RE.–‰Z*vÙ#ŸÌèxqíÕv½+¡µ›—(<²d…ü\rÂàRíf+«u\r»]$jŞ¬XÅÜlâ·ûR‡ÖFÖWLÀ…\nò5½Å¶‘aà	û³g„»‰§„—õ¾ç7JŞìzÆ×ıhJq#IE„ŒOä\"wd­x0HĞøÜË‰à­xÿ\0ésn9UrJÓ¤¨ÔqàW»Ùnğo¶˜÷»rør@Hx‹w‹.‡w<[=¼Û¹Gx7ÊKYMÇ×4¯k3TbÄvšñØ\0$ğ§Ô0ôÍœ·yjÔ¶FÃüX9L‰Ò:0d¼’:Fz@AXø›¤Í*MË”Ñ·2– Irjı ’Aö³èùw9ºn,û¢ùòG˜ÿ\0$À\0à™{j°EKl¤€A­láùIªìFHœ`ƒ0!ê±n,Xğ,¾GUÜË¶ÿ\0gÓà;îµÕç§t}ƒ¾}ÔşŸ¼á–ßlºãoİ5Á·†\\’ÉšF,PçË?ÕˆĞ~Ô¬<Ocø¿Yú’]j6{3ÿ\0ÔóƒËû±—~‘ì.t¯gtîÌİì[Ğ¿ôEÔû«¸÷qõâİ¹áw[Ù]èšg€÷³§l´½À¦–G\Z€Vº/Æ­¾—P”~ËqCõ`ƒµªu$¯è=¾Ú[ìİ[u0aµ5¬ŒäÉKŒ»Wİmßçs¶|±Èİ¾âh~äZ„s}™İf°ÇäÒ£P\rÀ®ÛéÉÚZ/¶Æ0ú’ ûµ\\¯ñ1ÑÒ w‘\0t¾Ÿ&/n×¤lßº±<*½× Zä\\TÃ–[(L~¤ÿ\0{,„C÷DÚ¿5ïsK­u©å7İnÄGî™GÜß¡qş–›Y3²&9¨®Í›å\Z¯Ò€r`Çêò\r³¶°òÆ)Z ñ&tM{Üä(Æn>Úò<ë‹Ê€HùL}ñzá2^#ÔÙ¥Óú®Ï©ÇËâ¨şYIzgÑÖÿ\0×àèœd›¤÷7^Ş7ü‡—68únÇg¿š(]ace½İI\0++¤R²ãJqYúZKmŞÓÉú~³É¸½M\0C.ÜÆ³1ø/5¸I%¾¦‹¦$@Y+±ä\"Ö^¡Æ¨@| -7\rqø-1n—rô?ú÷Ûì—¯u¾æûb/úÎ‘¼“Æ4nƒ¢Ønú”Òí÷\0j‚]´\0ÖÈÑ¾V”!Eqº¾÷p6Xv3É3´üD`I1Y\"	vs«6^wÔ›©;}—18ç$HiÄ¼×<æN«z‹›¶ü£ê@íÆéçi‹€%’F%tŒ8—5,H5{êä!W˜§.ğ@\0÷•Ôu¬ßõ&Ï¥Çı,R—ŸÄrÅ	/©{5Åòµ“<¹¼\n÷D.Çéûûÿ\0Æ]çĞá~âeêbQÎnò([¾Ù:\Z_Ó]æãÆº	æ;ÔÛmÜÿ\0Ñ”¢Éá\'ïæ_üÂÛòz„Ì—6Ş><¯°.é{Çï:v×xÀ­’&—/hÓ)j\'¥²4Œ®0¯CºÛKk¸hÈû.=Ì¾Ÿé¡ıÇÓÛ|Ò/–úrï…+Şø®ÖéwĞ6ı½Õºä{MÇjwŞÏuÓäR]¢véİ;q´ŞÖÅ<;.@J‹‹‹tKå‹ñeËºÛÈN$\\ÓühGjéıs¶ÛoúN\\€»ÙÈN´xÈ|Ñ~an1]Ôºı•Üíô²KÓ÷L“wÚ}NG(İl\Z}}.wŸHŞtì\0Ä·Š¶»l;¬]_j:¶#–$Gq÷fm~Ìõì5¥W’ô7©Çq‘¼›ôüÇúr?rgî¿a4kA)·$±¤»QÈ$Û,V¨´_hœáyŒÉ ÷ª¹F’@ıÈ16A=Xª\"‹$Okçİ@UÎÛ}¦jr,ĞHÂ#Ü!­Y¤†@àÛ5ì8Õáà™20ÉY¼½Æ£À×PF®¼çEê³ÜnsôÍáÿ\0¼Á’LZÔ=ñÚ7tE¯ŒÃ©¢úq rã[˜‘k/Hµôİ»º†Û®ïŠÿ\0‹ÑÛÓöaT5ıW¨Ë÷ÂÏş\'Oa)ôÉ3]‹Ea¸—!Ûâ—ú™ç\"8c€.xsNŸ»>ñ_1İuSÖ½i¶é˜¤û®Riid„%\"Oî–ˆş.Õ§¦t½ßVê;>Óà|ûÍìñm6Ğ°µ¦I¥xcsÈllúœâ\ZĞ	$\0k“ÊšÑà¾—’pÇ’e¡äöUÏ?#v×JíÏCè¹¹ê¡CÔ:îúY$,Şnº¤“¾\"ÚÖAµ§67­Âbêmqğd÷o)ôå)ÚÀ³÷¸\'…;×S´È:ÎÃ)Ìm”Ê1\r^QG<IsÂ‹Ğë@“·öLv÷WŞÜÎîâ‰Ïs„ìéİ8oE…ÄNßy4ÑZÑ\0®³,“Ç¶Ù\ZO.êCˆ““ÜEm«Ø…à±Kx\'£nKÇá¢5{C9¼ƒ¸ˆK°ë]VVÅµŸ£nåÔ­al½ÃÓ„á\"Bvò=@Ë\níÈçêXq}ì£\'´@‘ïeØúû}-Øn [&=ÁÉáğ\"D/wÿ\0²;&MÙ[‰–x:Woõ¸eŠÂ=ÆË©EÒå\'P$íß²î	¶%Ìa_J/éœ’˜Î÷ú³§DÀûJÏÒùßªDé“ş\"_§Ú¿>Ú çKJzp\'Ç‚×ª&ö_I_C½ú/Rìİ´_ç¶&ÉÕ:NÓ{Ò\'ÛLÉöû¸z›]ÚX$\0j0Ê×µÁ,èŠ+P˜È##Ê-ÌÇ¸Tû‡¼//ê>«GË,ş¬äqqv—¹Êù=*·é›M»n~ÙsÊ%ÎpkAwÌ\Z	ÿ\0ê\'c²”²¹?Zl<\0û_ÀÆôVN—<šK)öDñuß]·#º_ã¾¹¿}›IîMğÈ[`vÍp<uÆUæ÷±üO^ÇƒSŸ=à¯—zÏ0Ëê¼òü¸ˆÿ\0.1ö“í^ní(;§¸´ê’9L‹ˆqP5!1†×Ğz¹ê™ˆ¬€Ê>Õô?Ëgÿ\0ËuÜOáµ×3éİ©îàê[ıœ&MDÛ3}Ô§y\r‹o›ˆöÑ1Îr5òîf1‘üÒ]]>X<N0k @öîºö=GÆÒ{,¤>xJ\0v“§¬=Gl6]cuÓ@1mdÛìzÇHoÓ\'Gê	öñFâqØÊ×Äân«Km3ºÚbİ›Ëš3™`Z_Ì\ZCø—ôYœ£>ƒ»?ÖÄ	Æ÷`Zqş\Zv\Z\"‰l¬yh,an¦Ÿ•Á¤.B¤€…ó®@€%ô_K5¢ç?;GmÚ]ÕÓzwLkYÒ{†uX¶Ááßã~Ì’Å§KÇ’B×1J5’i\'Ò§­ü_ÕÛœ£îÊ@÷‚b=¢¥¬WË}GÖ%ºØâÙÌÿ\0^9dgÄAÄKqw X…Ãv‘K¹Üí6ÌÒd–x!‰²4Ç{ÈãlÆ7FÂ ´Gv†İ(ì5ogÅ}g‚XzF,Ï.A€\0nÇ–í«ê¿ö#©C¾èİ7a»Ú‡^è=W¥ô¯ÓI)´‘vëjâC·+©G>ÄˆQÑ=…½OEÚœPË–36óË)FBò.ãCôì=Œ¼£wC6ÿ\0s†D}hÇæ§œ´‡ÇeäÎÕé£­~JíN–ñ÷6½9ówí¦ítÈäÜ5’‹ÊÆ\'w{Ì¿€ôöót?ÔÈ#†=ó5oæ¿1w¿[¬aÙı=¾#3ûÒÿ\0`½vËºüõÙñ‡)ƒ¸;GdXé»~×xøKXî¦ñ¦Úƒ‹\Zó}+‡GÉ’4q”á>_sê»¿D`ô†ç1Ë,ÇùcÉáX‘ïÕuOx¶{ó¼ú{	àw7[Û5ÀùôÈÙNm!»†ƒÿ\0Ô\np¯NŸ×ÁŸtÂ\'Ú-àD¼.ÿ\0Ò}N[İ¾]¦YeÁ 7ä“ò÷±w\0½‡ÑúNÛò/àÜé»xƒgÚí·½¨Ùö¿áî•Öw]c£oÄmxkcÜ¸İ‘•Å§Fòg! ƒ‡Öü?¨NéîğDÿ\0»–¸ñYîsê_¨KaÏów‘ÿ\0†B\'¸•â±ñ¼Ã(toîcØá¥Ì{=.kƒ´°„äk·¨-*2ö$%˜½VÁÀ4f«KŞ§	=ÁB÷ã¡GøÛğzmgÛ‰7rt˜{{v[öŞçuşàêı.n­)ÏûrÇÓ†Äì~ãÚvìxº\'O“\'ÕëğÛc?&×æ~Céû^gÂ.¼v<ç¨úš&%ğàoáùIò>È¯öË„ıÛÚ½#©w/EÚã¤²7ïbt²:ëÿ\0¥€ÅBğ<­äÎ,&ròˆ’x€-â[Á×#Õ}N[¤6ø‰³ÍŸQæ>.‰]éİ;?öºairË×:ÏLn¢@Ûìd™‘+N˜›ø\r	êÓ 1VõÔïã,İyıØc\'Å£ãæût^oÕø>§¢°eÿ\0¢qK¹şGãæ×Ñt?xìGEü›ÜÛÛ£oÖ™´î n¡¶aÜ†€“;3TÓ–~—¦f–óÓ›\\ä¾L&Xeü$òûŸÚ¼ÿ\0åŞïèuÌ›R§¹ÁÌßµ\nq’õOúİÕcØG»ÚA¶vû¯u^¶:OCéÍxÛİŞû¥=¿zivİ/¥2?s1ô°JĞ=O\0ô½{lrí!<“ÛÂbS&¼¢&ƒS\'`5b½_­·C}¾0_$âycÇš/#û Tğ¼¯ÔvÎÛõ\rôR45Ñî·0H#kô1ÍšF=‘ÆíR†®@…Mv¹°‘q?4¹HzTöø•ìsá^—<eÏ–X&ÂG–üÙroÁ§v÷¦ó¥õFşÑ!w[ŞíË‹Nê¹{¢sÙòíà–r…ĞAr¸î~–ßëk.XŞ\'”xÔ\Zİ|ïÓb[-¦}¤ıÄ§Ó›å‘nW‘g’G€#‰ò=Ì¶FÖ\r\0Ú».RMhÕE“6;Võ±±é!®1IóÕT}‹Òà;ó‰ĞíÀÓN*òEÅFç ÚíroOü°ëe‘h,^G¸hJù¿¯úÜ°aEÚËúù‡4Úü®ÑñÊœ@mWØê}+³‡cÔ¦„3a×[ºİtÙâC·•n_·ÜA†¤€0²ÚœˆªÁ§Œawœ@½¯ãr{W·éXqm68ú~29°c„$8òŠøİõ\\»Xé:ı¢æ±¥ *ÖŸa)Ä×mÒ§ÉÔ°óÿ\0a^có/éŒ‡A’Ò½Õ:·âÎ…¾h×¯·ûkxÛ£…læsÏÿ\0Ö@Î¾}Š?…õ&\\R ¬±öóïgà¾aéãª¶“6ŸËüøä.…êfÉÓ÷•!Ñ\Z(ÒLŒÔEƒ~ÙwšW Ş	ãúy\"h2öµ—Öıg‹Ÿ¤‰ş¦X“ÜAh_[²:/Uï8]¶éâ#/Iéı÷V–Wı˜v›>ƒ·.Şn·2\0ò\Zæ1ˆ@:¤m±€!?)˜ş29}å¸2¯LõHeèØÿ\0/êãÈ1q$–‡¸ÜÛÔ\rÀhÓb1c{W$@ú/Uuïõ§aß·öò6\"É·^·Õ$™Èw;ætÍ¹qêûPô§BZC^SÕrlâ,g\ZŸĞÎ½U”K¨rıØb¾DŸpóç¨C¸Ş—HÙ”ß÷PÛt]¢.¨ÿ\0ÍÖ\'İ«H-nÒ¹ş \nö8¥s;¬Ãşß9e—FåñHíZşaõ9mzLzvÙwRcû‘c/ms®Ûë{ı·kwwiC±|lûKiĞÙØyc›ÓvıÃôéG‰%Û¸]™éÉ¼Å¹ÜîäÏ’Dø€ş\0›w®åæÊ9ºVó4€åÍ—éèÀcÈø¿‡ÚüëÙÿ\0ôĞŞ§Ó¢.‘Üÿ\0ØBvñèÛÇ4‡î°´0ïv2C¹!T:g\0€W;¦î§¸Ù‰KÏŒ˜K¾4sŞÇ½Šõİ¨Œ>pÜÉ§¶xÈŸÕˆ¤€ şé+£»3w.ÇòçbÍ+Óo¼’M”y,;ı¾ê\0é¸k~¦æl•ÚopÇ?¤z„@ş´$${àbXw1ñuğ¾·ºÉÔ:äº–PĞÜƒÉÿ\0Ã\0Â/ü®»_òT½k£–±Î“}µ§²&ÿ\06é›é!šŞàÑ#Îå­à\Z\\«Ìú{1Ñ$rŸ¸rÔÒ¬\\ëuë=×1ôn‡Ô3î4qNŒu”¥­Lö+©àíÙ»·¯v÷CÛ¸Ç/Wİlâ/\n¶\rÀÜî$ThÏ7\0ò®ÊDCzò±gâá80\\¯QÃ.Mö,™š9ó`Ç95¹™‹^Ü ]z‡ı‚ém&ìí¶Ãe!é]´öìİÉDÇµŸ}Õw¬Û¿tà\"íb‚6)\0¹ˆ/ŒtŒß_l²«î&´ˆˆoq^ÛÒùi3“šyÍKF/Şº³ñDÏÿ\0Ğ¢{Lsîy`8Æ7}½¾ysJ4:4s‹\\…ÆÕØK\'>9Hy3\"Hÿ\0Äv¿‡÷˜õn‹¾ æÛäÉŠMo–MÒQcŞázGóşö6÷úÛ°risû‹¨4]$=8!o¥à§^S¦c—öî¹˜Jğ9*¾Cê\ZæÅ\r>œ¿İeÒÿ\0…w’ôßÌ{îÙŒ°Ç¸é}ûàâånÏo»Ûnv[pULÒn!c‘Ö-eìBs÷YN~…2OËô¢;ä%Opgï<´İuÏÆtm–Çœ\r´%“÷¢Àh»óÇEÛìûJMáhí~æ’I4+:gutÇu£[Ó¶İts%Ê0Hóõçô×?L2=ûbO(²ï½?Ôğì¶û®IÃBe«ËÍòÈ‘v\'…Wè»ûÏıküµÛÆ)»í½ŸTêû]höÏ¶“¦»ª3k³ í¦û¤:g®Éš¤™nÓÔ;à¶,ïˆöT†~ñ9ç\\Yíá¸c<ûiÅô!ˆ¯h”fGrñwâ=ëGVëÑ1Î\rwPè]¤\0u£¶jÁe	Ò•35Şõhsôàdˆd°	|dW‹ü©Ü~3òûÓ§ş¦æ\rØ\'ˆH›™rMÏ}wOHÿ\0bûÛcÛ}éİ}¤Ë·—¨OÒzGru~™Ò·=Nßí]†îYºvË{ÎY¤—u;µ¹…äµºL=¤õ‰‡sÕ6[MÆ|Xá<˜qÎqŒ²æœZR‰•\Z `é~Zz¿®ôÏZ¶ßnğì?pÍ’Æ\\²É“›–2æ1€‹³±]‡Ö?\'şF¤;lÎıïA‡i¶Ûéë®^à˜Ã„g¨hcaS•PuÖeôß¦^sÓ¶<ÅÌ¥ô1;\nŸ¹©aâú/·ú»×^©ØôŸ¡‡©o†\\Òä\rŸ(ayóvSÅ×èÏÿ\0\rÿ\0œ¶ÿ\0Ø~ìüoÜûÏğ;wóHèİ¯Ú³Ë÷ÕİõÛÛ©zœ.Şnª&ÍÜî¶òiqöáû’\0ïˆÿ\0êÑz¦úO«°cæÇs \0ù6›˜Æ0ÌÔşŞx#,HãÉ<„rÄ‘èÿ\0ôÙùŠv³Ïè®£9Hïv‡q	ÊD¾â#’D›äÛbõ”€\0¹~İ¼¿î_m©£±è}.]—Uüİß{W³±{rvÆÛ·:l³ËÓ¦üİphtc¢tÛİ–Íå²u}ìN‰;©¡ø£¿)sz£©K¢qt³Ks”3Äy†Uÿ\0_,l@#Õ›ÈâÇ—ôïægæ$=Ğ3î¶‚9z·Ñ™ÅÍH‹¹kB?xĞŸ,K’aüŠï&î?ÈŸ”7ówïQê;ıÛ{¨wõ]çİŞõ^çîmçSÜn·-d[HÎã¨õNåê{—>8bŒ¾A+‹X‚ß¿¶›>éïNcÚt0;x`Úb—\0&Vâ\ZR‘¼k\"I_ÌÏRzË«ú»¨Ç{¿”†|@Ï$åÈjfô€D8^Ğü?şÌÿ\0±]³ßİ#§~ü¡Ü]­ÓúDoÜozûÉû‡ñóµ‰ñÁ°î.”î£¸íÎ¥t[hö[¤`–P»ı¼í×‰ÏùièÁµË½ë[lrêçÁı‚D‚I\0È’~c•Ç$Áqô?Eş`şcô.—“}´êg²æŒ!ø‰K4EÃaÇ’¡¹¼ÄÄ\0)	ÕºOı–ü±İ_“?5÷_üQ‡½fÙt™Ü»î¡/F~ß©wFè»^ŸÔ·]8t^•Ñ6›>“¿vÙ»„.ÛıÈàDù&|znO£úxé;&Şá\'ºË–Æ&91Î@Ã˜NS/¤È‘ß3.Xz^£ù‰·õTÛ~2YoÂcÇ“&QŒ¸™ŸúQ„>œ’äÒ\Z®\'ø+lfŸ¿;›F¹$Şôş…³.±1Â×ï&bÒ]¢0Ew~²ÈqàØtá¦9fã\"Ãí_úÆğïz†ïzo“p@î°ö\0»»{#gÙ¿·İo¨Åµê¯w{c¾x/—dÃ3úëüR+[cŞ\Z§\\Êtµšgi¹1Í”kXbüL˜GàXqÔ²úçNëØíğ‰sjÛmñÂDvX}Iòƒ °$Ö‹ KšIê![¨&¤Ô.3Øn$ø\'P`W®ê°ë¤ç2%	à‘T•ÁàWwÿ\0©LwçvôÇ{c|[ƒˆt}Gs°RÇ1Ë…À@“]YŸÿ\0Hú´ÿ\0Wâñ“êğ_0éÛ‘.‘›i#Xî1Î?Ä-ì÷®)ùKdı}õ¨ä!ævô­ú´ªôNÔÚÃ¨\rRFİŞ‡¥¾ã\\è°Á	ÜşÃï}7¢eú½\'ù÷‚Aø.º2¼ÙÌkba\n‹Ã„­-Un‹i-r­“(æ\'1r~™ÒŒ˜÷îyÎŸêùúÇ6IÒ·9§‹	b¯Ùó5İâË¼ÿ\0×Ş›\'Qï7€°C²ƒmØJÊÿ\0ûöŞm@dlÚ@Î¸½W/\'OË;4\ní}Q—éôñ\re’#Ù_±p_Ï3~tîÈŞöÉÖX·®kCÛ\0í[6Ä?Ôù ÚíÑÒ\\9A©ÁÛ8èûxqc€Ò¬ø»>„ºğS7âe±Ø@Ò8bïd›W‹í\\²²6¡$ÆØõˆN$ã^„LD¶‹ë;­Îß§íe¹ÜÈCm.O` &‚«ÓûNÈÚn»{°ûï¢Á·éûÆl¥‹ªm ÿ\0-ë¶CuÒú‰•Æ1¾,è€¸ÈâTÆÕóİCqõñîv†ğ˜à([ÄƒÜíeó/Su9oº.çàJ8¦1æÅÍæc1	7ëoÕ%ªB~WÛGÓ?$ôŞ¢\0l]ËÛ;ºëivï¦Ní¤¥ßıF(šW%àMvş›ËøMäÅ/ÿ\0Iº?Ë?Ä¯!èíğÙz‡k–d9a,rrÂÆ¥ìÄ›ø÷cİ=ı×·½™ÚÛıŞÇ·úÁÓw~ãlKó¢ô‰›»İFÇ¶í‡[L{Htyh:	ÕÆßoaŠ1”ØaÊ„ĞÄ‚XhšĞzŞ¿×eÖ·i´¦Êpu™¹¸Fì5w=ƒ³:?IÙl7½ãøç}“¤l·İÖ)€.Üt\rËŒ0îØÕĞXı´»yØ[c¬8WIÕa=¦ëPÚ<r|³‰zór5\"ş+ÏzÇ¦í¶Y6Og]çA²ˆı¤Ä‚Oh+Ï½ u®İ{¾Àê\"g3¤î&Ü3©1ÿ\0Ó»vû÷±½ê%Ù–²3€•àd•í7»íë¦¿„rCæ†¿[Ê#K<«-yCŠ—\\.™ê^¥Óºnn·sõHä°ŒèDxÉÃvM×ßé“lOUØÿ\0›¾œíöÙûÍ¼otM~ÑÛ–âl?uš¡$(:‚®5ÇÅòF8É&—ãÛş(¾ó²ÚGc°Å²ÃA‹ñ¤ñ&§Šå?š¿îû/tdÙ6SÑçÜ¸ìåt½?}©óm ~ä’\'íâ#S¾óEİÉê¡º†â8÷\Zƒ(O±œƒNñán+æŞ¢ßÿ\0rÙàË&óåx”u¼|…À6{†îö»]ÛT·qr–àèÜö:´“êÄ´ÿ\0äŠ,Ev¸¥#²ƒÅ¨ş7àíp¾Ñ7ÿ\0Üz^Ô¿Ô1i~ôhO‰â¹‡ã»7›®úîY.Î“ÓÚı4‹†I$Ro:„ƒ KÜÖBº¿Qå8¶›M€¡Ï3]Î!ìâ¾×7§«z“&h—Ç-Ì1Ç÷c!{?ŠÑøï 7º»¯§l·Qëé›w;©uHËË$İl6E²Ë²à\'ê2íÙ‡®Qq\\ü¹y1™\n\0)ß§ƒß‚ûÇUŞ~a“<Ô£ûÆ‘÷šğ]ËşÌïbèŸû/·^ç¯Kè;Î»Ö7!àmßºê;“aaõ“³‹¦=JéI[ò•éz.àdÅŸ?.LäŞXˆ€|I4íuç};—Ïa¹ê;©61:ÈëÊ\'¼ÈšjWg~#íÈ¶}­ÚŒs\0Üÿ\0‡Õû³}-.;§ÔOGÛ#I$ı®ÓbR=*ëb¦½GœÃeqv˜cÀÈ’}Â+«õ.ò;ÌL\\`D³ƒ;¿‡(<W7é:×çNã‹q¡Û…Ü{ˆ_¡ÎIv[>œ6½6hõ÷FÇbXN$\n]S\'Óèÿ\0IÜK080‹Ä÷rÓ‹£êlÏÒyºfB>¼rb„xÃ˜KÜ\"Ş!zı{ß6OÁıÉNÒ:_å~ã‡nøÔ9¡İÁê×/¥ÑßN	Yuxú›i’B§§ã”¿‘—Ÿè2„Êúd?Wû¡Çÿ\0r÷<QÄÚõ é!f–Gµˆõia.-kKDm\0µäK^s1œD©Zº–%‡\Z?‡¾ÉŸ¬GmÔv]&#›>àHÈŸ»ÀŸl¤hÂZ²ô/ã^ĞŸ¹şCí¾¥´“e¸ê;ï¥É¹ñÌÈ:—K–&oX×‘·›sÜµ÷)e^§wœcê[a/ô§‘<Hå#í¢èı_#)cú2bqä‰ ñˆ1>Ú…ä¾°İm¶iÎÜÅ»ÿ\0¬—n-\'ù4‰Ú.A.šG4*A¸ÄV›&I0\0\n›ià{—Ÿè;¬½+§ïz®(	Ø™p;$Àk¢ïÿ\0ÄH7;ö•‹q¾Ù·QÒ\'nÜğğÓ¸åu®Ôó˜Íô‹¼qšvïpQëİö.£Õv‡o!-¹ÛÆQÿ\0í$I~-ıÕæ®…½›}Õ{¯©¼´Á½î\rÜáØ½³O¹œ°±qd¢@ÒË´×Ğú(mql°Šd†Ö ör€ØÄ÷s.¿Ñ;óÓzÉßda²Í?£2t3$À¾Œc^¯X~íÿ\0úş‰İß‘÷­kcè}¬ÿ\0ÕºF¸HÍì[V¾ódö–¹»‰z‹¡Ú²F¯Ûû’9=6óG10lÇŸ6@ÿ\0»Ì|)Yµ_^ë[Ÿ«»ÛôˆÍœe?İƒ¸IíåmWXô^–;¯µ»Ã¶Änòx¶ıSa#Šº§³¿e;3vâ6µÇÃq·›Ïí½km¿#ú-É!úĞ‘iƒÃ–_óïÌ­°RÛç`!—‡Œ$ãÙÌÅu®Ëxş¥²ÛîCD/š%ÜCõm÷,{áÜíø¤SÆæƒ‰»ÌØ§¶Í=»¼a&ıh°1—ŒH~.½ÿ\0¤:¤º¯AÃ›)}ÄÓŸBxÄ÷®Éê]×³ê¿‡¶Ÿš7“Ş’õ¹Ö$bìÚÓtŞŞÙi;Ş­»˜9ïŠİ¼l.‚@=^x~uöBæxL!ææsş®1a/¼iÕóïZuŒÎ¤62QXJñíÚÏR(‚b#‚\r\ZZ„Hß¾çl’ÊçknvØ´p¿ëJGßÊk@\0^ÿ\0Ò8>AÂ\\™LÊDö“\">\0/|múJê?ëwmô~¨^ı„:}ä{¶¹±nö[‰º—\\ë#y³‘ºFŞ~›½İÉ\\.c“ª¼ØË˜ú£q<TœqE…ÇËPµÄªã@ZáxŸRá÷¨nDi9!ÈuF-^-àëóøôİÜ¿û#¶·íl¿ÿ\0QôıØÜ±€mºŸNdŒİíº„\0ztn!‡ÔÑò<à+ÛáÜcŸßuLŸ…”@š4”%Æ&€ê*¼§[õç¬Cg²Ş7;s.r~ñ£4iŞõÜÿ\0•7¥Ûí†Ø’[$[ûÏÒíÌÆ\ZWçÒÒHK\r<PxÏNãoåŒcöş†ñì^¯òÇ6]æìİ¡i”‹ûx¬ŸìcçÙõoÅ}:Uhè_{WjÂ]3£ß™Û(p\ròƒ)\r&#NÈ“Ÿw!÷³Láo|kÁpº¦yáë³ÜÀÖ`{¦¹WúÓÔ¤ØşPéû\\}g¤õ™§Q/vá›\'õ-”LÒ÷$vû§ÆĞ**ó:¶3Ÿ¤î +ı#!üdøD¯§õì_£e”4ˆ˜ş%ğöıhÿ\0f{Çñ_rt¯ÁSv÷r÷çfwÿ\0unú/fm;kmÿ\0gÜ…×»ª-×X;î›³‘Ífó°÷o7}V=ŸõŸfMì%Í3Äÿ\0Ë€ÁÔ}¹üÁéœ;>¥¶ÂFçCË\rËG“Æ@-¼‘ÅŒ1‚qã<³i¯¹ÿ\0éÛó7u´ß`ôŸW†MÏO±ı2‘ÇA\"@Wéã “\'ù\"àƒ9Uz/ãşŸ×»Ku·ÛMÇªE·|.Ü½©.×w	p9ƒ›÷#”<)™!¯É^ôHêİo7QÆLÃ´£ 4d’à¯ÛŞ¯ë=OR#o\"äH´¢j\"„¨]oÚ}F>ÔŞu®‹Óş÷U~êh6û¦ìcãï·ñÀön@drFÓ$³ÚIhÌ\nğ~œõ× aßeê™¡ƒ§äGœ»Â/0>Z\\Ñzn«Óso:>Ç/S”Fâ8ä~bÒbAw©¨¥n²~IîÏö+±zM›ñáNÛü½¸7»¨ôİÿ\0å§bõŸ#¨àÚÅÕ:FëoÕÇÙ:};ˆŞ0u—ÈşYt¯Iu½îãûÿ\0RÜôm±Ï#‚C§ÏyBR$sGlrÆÎrH7bù—¬z§¨vhåôÇN‡PÎÕŒóÇ	\r¨2„¢_°˜÷¯çCıëÿ\0p?Ü~ïî¾Ùü_şÆ~?à®Äîiÿ\0Èè=ĞºSwLê=Ge,#m/wïz‡Né{şçİÁ¿ky­ÙE+ã“kˆ|Íş©şF~VşZt®}Cé¡½×°óÅN0ÂG40í£)´Œ¹²,Ù#Í	äŒZğ—®5ÿ\02÷Ş£¥ıoÒåÒ:Fë˜mÎ3)cË89bË3ò0‰œ93ä!¹ã_>~M‰İOğË÷eûvßYaÍ’Fñµ˜Ü’Ò’Şæ¾Ñé9\r¿ª±áû“q!è_wøºİí‡ü¼²Ë2Mş\0Ûì»ßóGoo7ğ7u´Øu×qÅÚ~Üö^ßoÛı)ÒFâá,1÷/W›tÀÔC]^Ë«c–Ç§fÛÄ´£„À·nG™¯DDø…Ø\rôıQê±¹Ê?í¶;8˜ş¼ÚrñGkÑzãı¥‰Íüƒ°İíÇltõj‡h;]çSÛ4HpÇ^U}N9XxoLJréaí“ÓÌ}ò7ºû_¤æOOœM£šMî?W–\\?ş è{ØæfÛyÓ7ı7¨ì?Èsbƒw¼ÙoñìäÜı÷­&ÊïCïR×i,ÁšTL‚¤TÄ·3jÌä\nµ»‚õ¸Í¶ëGu†±ä„¥fqØCU—c~FïŸŞİë×zÿ\0NÛïvNí„tî£ƒ¨tíîÃ¥l6{Íö&9cÜmİ¤‚Y#ì.k:möòÙí±m¦c!QiF±˜o4N û‹‚Ä2÷ş•ê›.£Ò±Ço sc‹N:ÄñíB(t.¸·hôïıËß}/jğ°í»{|\né~şI´èÛWâ×ŸºLØX\n7ÛŸÀôlÛ›eÜKèC·,²á¤WÍ¿0:¯âº°ÙÄÿ\0Ûí!V·Ô˜û\"ÃÀ®ßüK»‡«w×qt}ØfïiŞ=;¸vğmf%ğn·²Nş¥²kÚZY‚\'S†’¸õs96}3Fc„@æia.½Æ-¦M‡¤ösÇMÆŞçã*Éûù7mWW÷gK›µº÷Vè’k”ì·’möo|zFö)eÓÓ÷MiÓÿ\0ò²EÒå\n•Ü	s@å”9Ÿƒ9>Ç§meÕúŞ=¯Aşã‰\\±Æ;rN€	rt…_€·R3}ù#¦nñîº_RA‚Ã¸İm$sş!®jr©õ®~¥îqSÅ({Ddü]~xúRÃ»yùñäŞä}‡k×º¾Ú(Ëÿ\0ÇŞÏ¹x°dIº„{xÜ=NsÙ÷7Mdy¸zŠ\0Eqö3ØáœÍâHíOc7bûWGëÜ½3¤tÜm-Şâ\"»`‰HÛæ\"\rîË‘~ì¿ûÿ\0ÊŸö’zö}¸&/VÚ}Öÿ\0rÏğĞ(Q#t£ÿ\0®.MÀÛôìÓ41#eäcXz†A‰„§\Z]œ†ö+ü§T“¾û›wşÌÚõNéêŒéò†3u³gYvÍîÚHX3¶ĞâÑê.\0%k™†\\»X¹lbö~ZxN_OË¿7ÓÇyŒ	ÏŞ2åâ\"Ç°ö®Úÿ\0Z%û›½ËƒÄ»¯öál ‚æEÖ˜Z\\P«\\îŠÖTd;4dòKÜ?ÚºŸPn±ov{=Öø2üÃ¸ÅÀï­WÁü‘#:¯åÏö0\ZévÃ³¶P\r‹¦ìcİ9Ä*€e€’8òZáÄœ¢ä4ÇıYw’XûŠùVÏr6Ş§Ç¹™hÃwà”¿+•¯{ŸıÛÙ}İÒˆcº~Ó¸w{\rns¤é›i7Û‹¶`’}³C]Š71O¬å82ísıá)RÍËNò*}š/gÔú‘êFYşÖ&Pîê|nºóódíû³¤õ[İ}§oœC˜“õŸ¶=\'©ÈÎvësÓ$—‹Î§W)é™»Ê-ãË^ö¹âÏíºGTÀv›]¾cı\\”bt‘ÇF~ÒÚ²îşùéw¿âî‡ÜPÀá»—¶áêQí[ˆz¿CÚiêN™Ñú~ï^Øl%{@´‡ìj\0·ÓÑl³ı.¥¸Ø¹ä9Àá	[öfHñ].Ïpzw¨2íÉl2˜‘£Ëæğ$ÇÅy{±\\İ×[ÿ\0s~Ï{²Şm·Ÿÿ\0KÛy#‘¦çèyªë2”pG>:NÃqï/Ìlıqxn#ì”d[tÖËÓ_Õ:î/“¶ú¶÷£Ûm¼š¶2©í^Ö\ZkÑî¦2Oúú[¬1Ê8JT˜ş`O|–_—;ó—a›¦Ì¼¶ù?»7-àA?Ä°õ©¹ßôŞ—~á®û[Ù ‰A–gNı®Ïl\rÚù&œ‡\\zHn*S®Ï9NQ¿–=äO\nâæÍ\\=i½mî>ŸËˆsÃ)P?pø¯AõŞÀµmzßWòwSë\rœ%’\r¾Ê6ì÷Û­ü-Û¦™Š&É¯å’M,)Œ†Ğ–yí±yqB=ÿ\03³øD÷»¯]Ò÷Ãq¹;=·ÿ\0\'ƒCµdlïØ÷İuOøÓÍ°ê[³&ç¦m]ÔÄ,M{½®ÙñŸ·\r6tÙ¹Ò°âdS\\hÇuŠ9i§a\"¸Ÿ”÷ƒpGêıÎ~‹»Úõí¨&Q\'Hé8˜D÷4¹N…ö?tÏTêOò/VŒ2&:n‹ÚÑH\0Æß^ÿ\0¨FJ\0ÖDñ^1sÜ†ÕÆõfû×m mÌ[.r;~ìs;h\0í_ê]K?Uİåê›‡ú™¤DGêÄh8\0Ñâ\\®uÑûWºûªàü—ÙC{Ó;¯µ·§¨öÎçjÇ±ÛÎ—Òö»‰ú¬16P[»ÑøçC†ë\"¼iëáôº~×s†) lI#Ş	`xuï7]+Ié,PˆRúG&B?h‚Ç´Ä– İç‡õïÿ\0ŞË)û{Í¶ÕÎ–\']©Í\"9¢sÉØ‡°”r¢ŸA±s¹Ç„´£’`Ú¯ØF£[‹°ï3ú®Mî¥•¡Ô¡„†—3DJ=ÏXéİoHvkn$ü[Û=½¶{6»µÓŸÔ÷óÉ„Mê[£»šGÿ\0ı´-jsAs^ªn?êìÙOúxóìA›Ä¯—t)cÅÖ6rÊü˜æ&[R`x½dü½Ğº_ioûo·znÊ$‡¡3{½İ5¤î÷›­Û˜óşkõ8kƒn#±@e|º\0`\rge±Üş+Î<’œ¹x_c‹êOp_mé}r9w#o¾&9·™Åú§‘Æ?h;×ÍR4¤:¼}Œ­pRñöÀ8ipÖç`ÀÆÔ<gW»2Ç—A/³áuÄõÆ.m†,ºG+4Hû>ÙŸ¶îîÀ³@%a›sÜ[­“¤˜?ş	w=3¥ô­Óf(D±¶yŞK‚¸‚T›Óîå}wmo b[°IÃö–=İ‹¡ûê~rÿ\0<pãŒ¿$ùKñj¯>Y%g 5È‚ zÀÕk¯C9ƒÃâ¾‡Õwøú_NÍ¿ËQÛ+Dx’Š\"ùcOºÆ´İDeÅ­\r:Ai7À]I:”à•–“å™2mMë_·ØBê}7Ôwyş¯Nêrê9$M>hd4O…E›Uí/À{	6ı…Ü»á$zw}»7›w–¶ôïúİrFĞ²º3²û¿jáí@lä®Ÿ®J#s³‹Ğî OğÉí¨íı+­õA.³ƒ¤cÈş3w÷{—…zQlÛ®«ºi/cº–çošÿ\0$;Y÷1íæ\0ƒ¦{XSHssÒ§}º%/m>{ÂêzA¾õn]Õâ%–C¸L{ˆ÷®qÛ³m`î‰&ÿ\0móhz–Øîv›†‡Ã¹Ú¶F»wÃfŸñƒóÄ <Ü„ˆĞ94öÿ\0Šq^çªõ,;,pÀI;½Ä¹1Æ%¤dAyp26¦¥z‚^Å±»««7hæ;¢õ)v±°qÑ¶|.Üéÿ\0sÈÚnv»·8ãó†û`ŸÕ³öÓê>~YG² ´~…ñßXïÿ\0v{¬§şêP•(CÄ‰Ç«\r—ˆ´3·ºŸvt)åÃĞûƒªBÅ¼ÀıËİc\\ã$ZCZ’m¾½Îw;]§Qˆs¸Û@2³SÙÜ»Bu¿KÙo°î¥òcœg.yœ0\Z’ÃÂö]ÑØİ“İŸ{;¨õ¾­¼êµ{8uXû7£4‡5ıË4ê’´2ßäJ[¶ÒqË0ÑêÕ«ÏÎ›ÈíMrHmC°»Í/ârô¢Ûm¼k®CuÔ ŞSŒ4â öÔüÄİÚÔ_C¯ô7~Iüu{G4÷KoıH˜Xê23şFÑ¯$½§µhN.Jëz^øz®“”>ÆÓÈ4ús´»>W~×‚ë=4ôÎ­¸éb‚9	ÇÀy¡í‰nğº¶_¼êıÖ7>l?Çé²2@Ö·qÕw+$ÍûhÒ2^Ò©$ŒQkú®§Ówi†BFr2‰\Zc†¯ûE€:#­=§Cë»ßSï¶3tÁ·ùòú²Æ	‰—ò†ÖD“¢íÆ·Ó»·®îúP†ieŞt^£\'L|˜¥ƒ¨mD;¦ÌÖéîÚE(Ğÿ\0I\\ˆqw™ÿ\0·;™ybA=Ä€}Åø2ú—VİåØìëÂQpu€Cé{ı‹­{Ç£oûG»›²ê-@Ù£Û7tÈŞÈ·3w1Ûl÷Ì‹æs#•š³!®DÔ®7Ô,Î?+s$ààS‹h¾o¼ê0Úz’=SlOĞ‘Œ¤5åq=„7µ–}ÎçìíçÜ¼µ°má–yOÌÈXé\n¡ÍnUÏˆb1âóLˆùôn³Ô#ÓºN}ûù1;Í#ï!s®ÄôÅ}\nYAÿ\0;¸z£û‡¨»êqêåIiB  ®§s¸oSÏ?ù}¶?¥\0ñ$¯~_ÂY=GÎ²’?½#ı¢»“ı{íÖ:¬İfbÁeÿ\0¬Ù<¹ÁûgŸ±¼ê›ãÿ\0¦ôåÛ—5Êå:®³½üÆs‰ùšœ]À$_IõVøáÁ”¼¥û‘ÓÄ°îuÀ?$n÷WåŞ·³Ø¶XßÔ{¢^ßé{yœÂö˜Çl™L#ìæ2å­!¤—òº|\r®ßnÌãˆñåOÛÚWa²ÜíúvÇiµÊO×Ë\"5%¹¤ORJõïYÛ³¢v·|õöÀØt¾¯²èæC©±íû[¥ŸÓ¡v‚§m·h\r8¨ÆºmŞãêú‡I\"Ÿ3÷»\0±|ï}»œ÷’Şb?Õ9¥0{|¾ÀöÓÁ¼üSù­0Ãºè½?ìUĞO´šIİ´Ø>9§kl—iå]³Éê^Ÿ‡ïÂdÏ˜1#}hBê=oÕáÕ¿	(ÚÎR«9H?Éì!{ÇóäõÅ½/tÀ{øÛm3Úß—KßÑ¦R¥HkáÔ:š\rtOy¼„l72ÁşÅè},_y´\"ò„½œ«óãe·ŞîåÚÁ²ÛË¾;©ÜmÚùešv¼Göa.ÆAW”úMzÆF3¡\0à^§½¨8>¡{½‡ZÅ¿ßï6Ğaƒi(DÈë\"$d^ÌåïÙ—£¿4vsºÇá¿ÆıÄØÄ{ŞØèİ&N¤ÀÒ×IÑés2@dÚDèK‚YÍv%Iéñns¼À|ÑœHà%“ïuóÏRóöh‚~ÍÌÚÊ+ßUæ½³]ÊH&(ÙµkäP°Ë¼pÑà&F¡}díØìË@ByËvòš‘àÅ»+¥}Hê£¤àéÛlà\r¦ğdÚÇ —ÊIıY‚°‘Åw\'tH:GáNºWK¦íİ¶İÖs_×º”S:7bD›‡ŠŠèú<e¼õ~İëÿ\0s)ìq,{¨|‹­nã«ï·R.ù2¿Ê<9@n¡û}ó7£tØç!FÍ²F[‹¡..LõÆ^\Zrùs5ë÷¦¨n?Óú§ù…ı¬ãº]‹é_–ûÓƒm.„¤l\\bO,‡xØ½9İ\rİ‘ø_¦ìeH:¿zõè7[²\Zø·oØí:~Ó}»Øn\\	M·MŞ«DNTî{V:8ç;©“|›||¤~ÔÉÈÜïõÛMÇ÷¹–b¸vĞ0c™4{Ä‡ìWSwnÌIÙ›İÑo8tªû¹ç¢ï·á	d\"î?yr¢ÜÌÔtl’CwÑÏ›19q>¬>`?ÇÅ|k›\'Bõ^mÎ*Ko»3a¬&yŒ|c&ñp¸¯ßÎs€‰±ºW¸–†5€ç9ÅZÖ‚NB»xÌ8È:wØxöv¯¿O{µÅ´üvIÆ;NA.bXràşÛ\n®uùcº¶=ıÜı¹Ü›X7[-†Ó¶:/Fèı?uÛßõ-¼§¨u·A ×µÙï§oÚÚ	\Z%œ3Z½&HGgÛ7Í,Óœˆ?.3+AÇšQ¼š‘âWÁ7[ÃÕº¬åµ<»3‡jiPpwïoğ:Ğu^½Ñ¶[™]:—VéûY÷†k‰»½ÜQI;&¦Æ¼¸¡Ew€ı	Ä8€ q  sE÷Ü§èm%È<˜ËW°R«Ùí?AÛõé6=R6Ç³îm¹1ì°Æu½Ÿ{¸Bİ’†VºVŸ°âÚ”¨@Jø¯LnÛ§óæ$íNV‘ıZ˜ıÒj5‰#±¾!,›¾—YØëâÏÙ(;oÙ«À_Eãÿ\0Â1÷{wŸU’\'Âş›Ğ éÍféš	·»è£\'·è‘ƒlæšõ^®|e¶«¸”É„F%‹öT/9Öz§÷§ºê11ÉË\rÀ o]‘ÙŸ¨şzíÆ1Oøáµ’ƒ“£JíãÜ^í¥‰ŒŒVİñt	ŸÖÁø˜Ëü:¯¯z{Ûú¬ğe—ó7¹ŸŠé¾ëß?sù7½·2¯©uîµ4¬Ac]¶ê›¨Aùtá…É#^OK?OoŠ2£_lAowøuĞz?q,]sÒ9qÎ\'‰H|\nö·úÍ(êİ‡ŞİXûÛN³·ÜíX§\\-ê½5ñºG€Ğ#kwı\'oöÈ$ê/Ã>©Ñ–Ó~GiDÿ\0‰îIzUá|›|ÂÇÅˆ÷…æïË½(ô®üê’ı·úó?÷Ú6°»ñA³bkv½RwÆı%d\n¯K<¼ÃfqâE}îÃÚÕ+±ÛõÜÏo7ûryyEşQóÌöF>ò@íl¿‹:cz×}ôh¤k¿Çé	Ü›ÈœÀ²íº;¥Ü¶‚9’Şçf\"n«+½C*pËYÎÑÆ	àà8Ä‡\nóõİ¼Fóoûl<§Q!òN=±&ı„1Ñı?şÌO/KüaÚ}»©ƒqÕ;š>£½{œñ4èı\'~%t>’$c÷Ç)™Ä‡ñR_ÓäçÍ¼ßßšq€<Èÿ\0ÂºŸJb\'>|ÒsËÃ¼ù¥ïeánßİKµïşÍ—ÒãÓºÏIÜÄ§ItıOm\rÜA\ZQ¨W‡:ì·ï-¾HêG/°ö¯;ë=ÁÉÖcˆ±Ä7÷†]ûù*I6Ÿ»…Ï~§ï{ª\rôîiÕ\ZõÖmw›ƒŠ$-ÿ\09ÚF\r`Å-?Nã‰6Úã>1Œ~Ñíö®÷«ãAÈ~®Ö2ñ‰ÿ\0…—Y~saØ÷Wbõ–µïvï¥oúTŒ‰º¥™ûMá;xÚĞ=opÜµ­Ùz8œİ\'µpøòÃ z\0á‰à(]|w¤u/í=GkÔd	)È.EA ¯Xÿ\0«=‰»ŞõÓºîiÛ$;¸œıléQmdÙîÙÑ6Å¥Î…Ò?IÜ¸\0d’Ø4æ½O¸;®)a?ö£#Dşµ9CDi5%ı(Í»ê›œİgş¦H¤`|¼ú±7+ÉçÚwtìşû·\rÛwZ³¸1¦vÅÔw,9±€Öº@X^»_«Š2•\0µ\rÃÜ]}»g/©³Å)\\ã‹øÄ/£ø£ºv}‘Ş=[»70î·»I{{®ôî­Ó6q	7û}–ê)%Ùõx¶ìWnöı;tæ³yaÒÃÜö‡\0EtğÇÎ<[\0D2G69D“òÌÆAàçË)7ÈOË\"Â‹àÜË¤u€w-˜ÊÏ¨åG\Z\Z¸O:cs^É¢4Ç,okØæ?ä{$i,|n‚.µÜ˜ÎgpÌC\\j}ëûi¸Ú\rö‘–ĞÃ›˜Y€sÜÚƒQ¨\\Ç²6­olw¯zLºz¬söÏI(Xïú½´ŸáO4z—íÿ\0ŸÔ7¥ì3ÂºŞµş/gÑƒsBQÍ_çŸÍÊ{y |â~ õV<ù+øäH­p8´câ»{³z ïŸÄ}£ÀÖËÕ»S­IÔº~¸İ.ê7>}ÆÛa³õªïöóDc\04q\ZœLÙÛªbÇ¸‰‡ñD¼|~b;»—ÙwÛíıgr[x}9v8—Ê{Á—±ôÌ=ï—Ô	ÃW—bÈ£YmÔHï•¡8ğ®çjaøì/—êÄx›xj|;W—üÅß›Ñ¶ìg(ı\\œ!Oæ—ÃŠï>Å”u_ÂŠ è}g§<üÄ?¦n·Ä±.kZÒĞ·)•yPÀí}]¸6><ƒºB/öºù_KÏø~¡²İ\neÆ— w¹tÌ¿sq´•ìn˜$nî6ÈnéeÚ¹ñFÿ\0ö…­$§«Â»ä‰ÆE(\"[°ÂGŞ@ìBû/WêƒªÃ¨ì0D¾Ó]¹ªß³\0=¥×¤¿v“º?âÏÉ=Úænûƒ ÷\0é­#ÕİÛ3ÒãcA(¼HSÕ®}ÃfÚ`ie/ÄF2#ì^gÓ¢C{Š$Ÿ¥,Ñ“hà\Z÷Ñy÷uï¦îw;mşÖm§ømÿ\0ï¹a…ûYŸ,1ÅÑHĞö	„¤‡hAÿ\05İŒƒš0‰s-8jGuvĞ¯¢õµ‹§î¶x¤Ço»ÈaÍØYâ{–‰ïB¿AîÓ±º{Sü^ÅİN\ZàD=G«Ê–%\ZCÁ<Ö¼§©‡6]´\ZŸ^#ÚàWŠõ4›¸?«ûşÕàŞÂèİN_ÊÓízÃvÚû¥n÷SI´:¶»­æô3m°ÜF\n˜¾ôS:ñ•èúÖïoL»S#öXÄ	RQ„R‰ícG¡_8êk{Ö²G&öBSÛáäyÏ™´‘z·bÕŞ²×sõpä\'o;6`Œ\0ÚCñ,¿¦¸\Z\0tøH}ç—´ŸñÜËìş‚Â0úc‡üÉN~ÙŸ°èŸÉû½—rş!üIãr×uNâİô!dƒîô-¦ôõ® ]gGÓ§6V=,æ®8ı<–ó¨Î@ıB9Ga”ƒF>2/Üáx¿Tîót¼Û­–Çs#?`söâBñ_ß—pöÇ_‰Ÿdl»š@H†º‚fÀÁ‡ÛŠ%¿HzŞ‹ˆîz~ó§Î²Ò¼dÒ$ë©]O¬ö_ÛgÓ í!Ú˜šòdIíuè~ñs:¯~7eköİ›Û¼7NÇWPİìgoAÛ¿ÿ\0!÷@—Nhµázhü/Cæn2n³cÛÇ÷A)+¯#¶Œå½ü0\'éĞ‰¦Så~ğ$Y#ğoKÿ\0?¾öû×³î‡°Ş?Pµ’îÊ\'4épsw’YB§*îwO†GË$oûØıY€£¶aòÇù‚õ\'{ˆfüájo\"dİ;¸ÿ\0Ë°ûGSa3“Õ716Vµ<¢.$VÒ[örŠèzFibè2ÜÄüĞÏõÌŒy½él2Kû6\\¸KgÛîcp“ÜC¸Ôyƒ¥tØ{sóßAé»W–ì&íùbØıÔa\'oç·Ú6Ü·o¹c\ZÌ›zMŒÆ~—<Î¡¹Í{FOêyŸµxÿ\0Oudê;ü3`7xsH9ãÊ›±v×û\0èâŞÿ\0¬½qÚÇÚëıw È÷\0ßò¶­Š&ı/2J-˜®·¦ãæÙõı¨óı8dğ~ÅÖõàö³íØ¸ã>‰ş?ûÑµÿ\0ş+ÛİC{.˜õ;m´[yCˆ_µ{s°Îº¼y¥—£eÆ+ôñËŞAö¬zå„±\0L I<0ÿ\0g İô­“ºæËşN—×ú6×¡÷vÈ‡_³‹pæôş±pfób\\øñóm§p859ŞšÏ<ÛYôï¿11·˜#ı¨¹´.ãu¾=+r7%Î×s·–,ƒ€ ã\Zç†ÿ\0¨[¡Ô7»3|ñ,stÈZñ%Ä½:s6Ğ8µN·IUxwÿ\0L¶}~dlpîáçÇ2(\\0·ÅÔ?Òqà™æß7Ê{qÌSØiÜİ‹ÀŒ&Û»7;6¼1è[1(y ké}E»xœn °o\r{¾©ólrßêñ§¸//ùI”ãË×úwİÉ»h³ØY.ãò}÷=Şİ§zËÑşàÀÁÔ7kl#iEğt(Ï2BUô¢%Ò¥²43ÚÂc¿1Ëã¯éıÄ¶ş ÜuC{¶ˆÿ\0ìñDŸ™ûWmnc‡{×zVËq!ƒa³Ûïú¯T˜&>±ƒüÛ†¯N¨öĞ<·ÿ\0¬Šé>™Ï?¡\Z™Ê0%Éö7‚ûG­7?_©bÛsG.btNIşP<p~!Øu-§Kü‡Ş{97+Ú= ÇôíöÂSµİt¾êîâÙuîv¦8wı\0ô˜e…í:Ûè-!Új½GëèômÄ#—e¹ú‘–9\0c,#±˜ÈÆqŸ,j\ryOË\rÖqêŸüÇ·2†Å¤E~œLÅ{@úC¾+äşfü·ùó?äâü‹Ş½R^ğüŸßûòğ	e¿ÆÛG¶Úìv0¹ÿ\0âô.×í‘\nı½¶ÚN/•ÄÉÂô—¦z@é›n…°3;oŒFy&yòNŸ6L’\0sæÊnX<‹E£öŸÌ¯Xn2mw=g{(Ãu›úxâåƒ‚Ñ„I%¢€IyVF¤¯™¶Ü6^¿Ûı{­\rã·ûò=ÖÇªw.ÍÒíãîMÏKéÑEµÚô¸µÓû#vÈäk¤ro:ñGÎ[²1mßÙî\'¯LÜôŞ“)~7bÄ‚Æ‘çÿ\0R$Š—€ú€È~a‰ÈĞ“|ÜÀê;»ftÇ æ~_J®Q§×úöøDÆÅ/Xè>&DÖÇµÚ<u¾¥¶ÛÆĞŸn/¹ÒšÖ4#Dpr®ƒªóíz!Å\'æä5í“*ê^oï_kê[SÒú.Ç¥8Rã0D~i“Åuû1´‰ÿ\0”»ÚwZaé‚Ç9[Ñ6[‡…Çïıù‹¹@ƒ\ZŠGg³–;ÈF%†¤³÷\\ğö]7ZéÀzwXÂ>hã1ÉÅÉ‘nÃNâ;Ôÿ\0_v/ÿ\0Ø1ÍÎ—¬÷gQœ\0=r}©v{8ï‚«™V³˜Éê£÷1aÅŒŠùl e8Åe9ŸywÏû\ZÑÒ;K´v‚(ånÛ¹Ù+Ä˜O&ß§îİ3eA¤Ç+§!Üo]OHÊw¹·ÓÏ@Äş¯/?/ØİÅ}—¥í÷mÔ61ûÛaßfÿ\03{\nñWUØ3 õ®£Ò$~ßnø÷›¹uï:Q.Ül¤±t‘0¾lèÁUrSßŠÙÃ{‰„òÄ‚4X€&8I!˜(ô/XÉ¼ÚeèyÏõqÀœOú††?Á#OÙ=‘]Ùş¦‚ïË½bqòî»#w\"–’C¿í6KHdgíÎ…W€ã^c¬^ˆaú™b>ÃïÉm„ñgä)ïŒ™|¿Ïm—oİ0LÂıæÇüm»}_~.³Õ:l%¨KuFÔàÛ`z}ƒåÛbÆKEƒ\rÌ}‘uïS—NôlĞ-˜NxáûÓ•»˜Ÿ×{šÃ½ëİ.^ş™°ê‰—É\'DîÌ‘un£ÚÈ×}f¸Xs}XàÜH€3enáÈGùI‰Áyæí}Ó·˜>\\ø÷?R\'°ÈÌÄøõè/õÍÔ·;èÜ×E¸ê]\'lÇú‹\"Øu}á\Z‰Qqa-ÍÍi8\nÇ¯™—ƒ+Ş7¼¯W×wñßtıã“,~ ïä·ƒºcóHşpü‰¸{u·şÓa\0hif¦¿¤m#h:œN—n7 —\0¤«\r˜3Øm0Š\0ÌçÅ¢|WŠéĞã¬àÆnsA»¢ÇàŠâİd7›ıôå¤ì{o¦KÖ:_DÛ×µĞô]ƒÈÔ¢MÑ39¥\nDÒ†Æ»möO¡³qş¾yı(vµ>¬Çp<€e.ÅÚúË©Ïªõœ>œÛÁã’d\0?‚%ûÏîßÄ›#Õ?\nt¨ÃCæ„wæ´šË™Õ:œ²GêôúÛ!·\nòıG7Ğë†\'ı9à#¿™½…–Ş¬Æ%¼Ümâ>_ÃDû±,¼oşÁíÇø}…ÔN˜º‡Vé’¨v‰ÙµÜÔ+éuz?C“8õ²ÛÂC¾<ÁşäQ—.y5OĞWs¨½>8»Ï¸ÓIÓÚÎÛ:•\rlO§G÷B\0È‚°¢…‘s·Ÿë€Ç¤Ì¿Ô–h‘İSí-ÍîÑ}wû`Øô[¼¡·[ŒÑ—t9O,âñmËü•¹oo~SèÓÍÿ\0{î´ƒxç\0Ø¿Äfû©ôg.\ZAÅÓ^\\¤>2pJíw˜åºé\"q(‡µ€‘ÂL´ê[/î‹É‡Ë´É)Ö‰yüñeÔ½O¯º^Ôüƒù&@fRŞm»;·\ZëúLŞÅÍŒØéßnÜçZsvı8£±ô×—–\'>c¯ÔœIû‘`İëã¸³æÛ{œe³€ÄöïË„í·É¶ƒw·p-(åÙö‡&hæ›W:qÊ¦H“Ş(ÙÁ~¡éGVéØ·ø­’ ‘Ù+HxïWèÿ\0ä~ÙÙ÷_km ÜÆÖmúÏLƒd÷;]ÿ\0Ú¾‘ºcîİPn}\Z…‹	×éYÜî¶R·Õœ€áÌ_ô¯”ï \', Ú9¦;‡1obüËéÆ~—[éÛ¦îz/TßG;pqû@7í®\00Ä@	f¥zÌBY\Z Ïà\\ƒöx®óÓ]B[^‘¿Ç)7Ğ„§?¼Ü?Œ¶Cmø‚]ãM×7}©Ï#Ê5³3i£b±ó®›ÕyŒıNvãı<ÃŒp£ŸŠùgK¯PÚ?šYâOy˜ºÿ\0ÖîÜÿ\0#pş¨ğCwKü0„{>‰ÛªîCšªşlÛc|\\Ë|¦¶ë¹ÿ\0\rÓ¥-då¢>\'Ø¾×êİÁÔ—æ™ğ ÷“ì]OşÓõ¡Ô?.nzdÒğº?Dé§¨…Vÿ\0ÈY¼d\0¿u¸ŸXÍ¾¢£á—öœ1rdp\0ÔÎGáïà¼gQêxöı3Êd¼_.V×š_,}{Èì^­ÿ\0_v]GyÛS÷]Õÿ\0k×\"è}:\r«”GÒúOÚ:GN€2IXû“Œ›‰\\N\0·Õ;±—<pc àÆd}éE£)ws8àí·yz™ÜõMÅ2fÊ#¤cH·´ÕyÃ¥ô¡æOÊ]f]m~Ç¬îö$É„éûŸæèÈ®l‹œA\\êºÎY0ÚµØø\"¼çXq¼†Ş@‰‰Æ]³ş¹3ğ#wú\\OqşVî. oürCTqŒ´ß\\f05\ZïzÜşjÇ„ßOÇâ\0ı+·èbeúùÏ±ÿ\0Bèÿ\0Æ½µïoÈìŞ¬á½Ùÿ\0ßtøZçËûxÖÉÕ÷\rœ4¸Ï»6™\0#ä8O­nÆË×6B9ˆÍ”Ğ$~Ä®f÷«ä‡¬ïØÒ‰5.#{ÜÈ÷¯X~1İÿ\0Üwç˜ÃkÓ:¶Ç¦mUÎ•Î=6¯°Õ…­oÛ×ÒD¥ TÀß\Zèz¿>>Sÿ\0V$	ÂD]øÈ»ö²õ=jGÏm\"~ ÀL»^U/Ä_µ—‹ûÃh:ä¯$qı°şºÍóZLF\rÄÌß-ÒÆOŞHp*îÌ±îpŸ!‹×0 \'Ò6ßSÓ½O”dGkŒN=à.KÛ›¶v””»}ÿ\0ñÑ=o­ô×ê“¤u„’ôâ¿PÛÍ\'Ú\në·øOSËÓ·Ñ¯ã>œ\'ÿ\0ÄÇ \'í›Ş¾7$å¸D˜ˆs‰aØÙtã®Ÿó¦mv›‚C:äÛİ¤Î%dİ¶M¬£!B×mw/dŸı& x×µõFybŞÏ$\0#q–à+(·d¢H=¢E{‹ÓÎçÑCpÏØäî\0Kå^%{qÖ6»_õohv’Gó«um·lõË˜%ÛïºWWŞoº¿O,Sd“y°t¥Êˆ†ºÒ\nòÙ±N^¦:áÅ¶6#%±Ç}t^ÇÒ{¼İg¨C{¸<Ù±â—ï{œ]t¿ã-ág]š5/O–C‚Ÿñg‚@Î.PãúV ‡ÔÛC$®\'ËüÀş„¿3°Ó¶Ûa¸#ù¢Oü+„ÅÚ}J_ÉıÙÙ{MÓzoOBNá—ª—µ³lzı±îîÇƒº•òéÇÑ%ç\nô:–ÔzwiÖ³Çêeú_Kéé<$s¤@¬…ä\0—Í¶½s}Óv›™¶—&\rÁ”…Ù«şğ-#v\rª_}ïºOÚìŞ™Ğ6ccÑznÇ¸÷ÛH ù˜Ù`ÚÇ»İk:¥İÏ3eÔ÷\rD´œĞuB;ƒƒ&ó}#=öcbthÀ€»\\}#éGqMæL<ò¨	¤{ÿ\0[‹„Ş©ÓİÑwnÙ™#ãÛì¤jYºÙm÷LkIÿ\0N9ÃW4[ã]†}0å.LAşo›í_jèÄ:6Ú1.>?Í_µzõÊ;µ½7²¶.0öoã¾Éé²w/ÙkÃz¿yî»F)¥é¾vı¹µ™ÆXÙê;×‘ó2¸}—öş¢säa¿Üf<y0ÂBß’@—ıQK¯”æİËyëÂã?ĞÇ¼y6²„ÛØ‡2ò/bK/YüËÛ#pçIBé=JHC®\"‡k·Şº Íh|á8Xc]·V„6~İA¿¸´˜¿À®‡Õ8ğâõNì`\rLg1€2nòIï+˜~H\"~ê9®ÿ\0ƒ¤t­»	Òğÿ\0ò7…şFI¼s\\qp\0e]B€ü¤áÎYxPaÀÒ½«è–pè¹²ë-Áá„°Ü\'µ?ı¢Ş2ÉNtÄÎ“Ñ;CeZİ,Œ³c·Ü€\ZàĞ>ø>›V}(	HËîÏ&SàIâº”ş®ë<ê^G¾¤¬Šºä]òcuy§vÃoÓû“¢Í¹œÈè™Øo!fé»‡0ş#¶îsfmÃâ.i±®î9¡ôM~¤š&?jûoÓ;–1šË&ñ0ÿ\0jş©¿ÒßÂ½#±ûÎıáOéİËŞ=2}IßuYvû(;GñæÏ¨MN;íë¢‹i½ïæÌn÷µ61í!!¯lÚÿ\0~do÷^¡ÜC§™ŸìÛ<‡éAé—qËË“;jqƒ,8hLGÖÈe\rú_ò7Ñ›_JúsYê?İ÷xã)x@´¡¸KC2?PÎûŸıÿ\0V÷İãÑ{mù±ú—zw/Wéım{S®oz³ıÜÿ\0ãÃYë°7=`É÷Ndw{¸Œ5ò¹À‘_õåw¯³t-ßXôæË¨cÚÂ<ùóB3Åà‰W#HÃêr@ıØÌˆ¼ƒ€WİöŸ™]¦nñtÜ½Gn&dĞ„¹2|ò¤c0æ“\0>PKR½Ô;m‘ôñ´éÛm¶Âm”­›k fŞ!<%ÁÑLÀæ‰B±Î*àJ•¯Îy¿.7Íõşig\rÊfe+C»ĞêİëÒâêû¯Åä\'!—˜’æ@ên£EÖÿ\0şY?ôÎèŞv\'pşKì.×ï®›Şn§ÙıËİ½¡õí¤[½³7{yÏ©ï¶ÎŸo>ÖFÊ×Æ\\n(¯¿z/Ğ™·}:N=Ä6§!‘Å?§õ ZqQLhâ\\ƒ¾õGÛnÿ\0=ÖÅr‰sÇŸ”Øò?8şUÁ?ÙÍÿ\0_?Ù/Âûø“½!ş%‘ÁÛİLv¯YêíÙÏÜvzmvçyÚİÓÒ·/êÜtİ×Jë°mäsâ-û‘‚Çjkˆ?|ô¿OËé]şßÔ{	}=şÏ É}HÆ¹0I¼ğÍ› \\|ÜÀ	\0G„õ–Nz—¤féıOéOË.bÏQ Ç(‘,¡&“èb~Y”n¨Ùø3»ş67q°íé“s&‹tÆMĞ:®úRèçÒC<R³g­c‹K‘sû¥î1ÏÕ=ÎÜŸ¡=Ö\"ü¹b4,AÌA«‚ëù=êİà}aÔºt¥“<âeIhÈ±,K8¡bº[ıPíßû¥İ;©v]O¦v\'Jé]/¨mË†ëaÖDÛ>¿¾ŞBğm{w;ı³g†é\0—4W¿ëÛÉSËŒreœÌM¥xæ+‡é\r±Üz7©õ˜|¹·D‘qM(û	?Õè_Ê}òîşè½“Öz†Ú-§sô÷w7l÷–Ú&id]£nºq’H@Ãe¿ÚobİÂ2fá¼ÏNéñéñŸáşnŸ–BxÎ¼³ˆ<§ŒKÄ÷/©ú{øí†iÉ†hå]æ.íØn<F‹ÏıÛÓÿ\0Gµß‡:‰ë›(š,ø]Òöı.}Ik=İBÜjó|›¬y4%½‡íuÖúŞ\0uRÖXHöñuÏwİ?oŞ=eÖ:OÚÙ÷wLíƒÔ7\Zßö¶½ÇÓHÙî§ÙuıÎÍó‘à©A¤«Maã§n¹yt¬Ù)å‡!-ÍÓ¤†!×Œ-ï¦²mzÎÆDmó@˜ş«ƒóâ—lN‡Øh›øb)cíNéï)?Yê;évŒxPİ—ol¦tq¨\09‡s©¶Ä‚k?XÊŞíú<KÃ‰úù¥Sì ¯=Ÿ>N¥¸9óÓ&ëpIáÍ!`æöúÁéñÚ›ö¿íÇ¶ë0K$@v²îcÛîµÈG£^ÚW‚ë–ª×+>/Ämç·jN´2ı-¼Û½?&ÔXâ1Ê.Ëüÿ\0Áÿ\0’úÃ¶=»Û}4nƒ]hz§pîæ“e´x;KûÎõ]s@@Ğ+Ó²dkÎÿ\0W<Ìkÿ\0OyÂRaí_\"ÚçÍÔúæÇ¤’û\\9†B8±™÷Fß´{WGş\'Üƒùg«ôâtG×{orFAóÃ;àò0W:)çjï=E¯èü›Ëo¹nàe(üÉu¬?C®ïğX™ù¹‡¸¯¹º˜õ-‡uwƒ4ˆúßxíû{¦9ß)è½cÕòÆ¸×SŒ;Vi]g\'áòm:QóâÛK4ÿ\0ø™Xè.óòş3ÜuüRÊIÃ’Cƒ4@îùä{×¨ÿ\0Õ~ŒÈâßï]«¿šFÊæ•t{.Ÿ¶‚2\\æ…k\'Ü¾ên+¥ës”z^C÷§œcúy¿Çôú–îV|Ó>ÿ\0µ|î—²Ø÷OFï­§TŒ“Ú_’z—WÙÎ‹¡vç|é6òmØçöñíwğ=í\næ“6¢˜Ó\\­öcƒo`ü™v²ƒö˜Nò\'!úWaêMÌğtHî1¥¸Øı)vVÑÌk¥—ÿ\0[g“a¹îŞ›+€Eï=œ?kÿ\0Ò¶=÷ªH[‹bû=J6®w½V#>ß-ÉŸf;çŒó{dÿ\0ÒtÙÏéüX$k·İÌÇ;ûdVîîÛC·ÿ\0b¿9ô¢ÖzWkõv„/fãdİ¼ïoşQ‡î¬xWE»ş‘éˆÛ²À÷ßşã:¼97Û˜ÅÁ‰\\ÓıHég¥öÿ\0{mô¸GÓ;º-ˆ×G÷?Æ\rx2¦G½¸µl<k¯ë™N}®ÕyJGÇ”5W¨é‡›=Ã¦à?€z¯<°;^£Ñºô½¬Ùzf×}Õ:×gî¦]Œ›‡Í7PèšÊ®Óg¹ŞË6İ¥KcÜ9¿+Ezm¾àï:~<ò¬±H¼³$ı®	ıaÅb:†M¤çÑ¦Hú{““µ‰ “ì¨1âëÖ_†:‡şçüÓw¬qûı8oœ\Z\n¾)ú~õûÉaÔáÛïÌ8F#‘JóÛÉ·¨qd491ˆ“ÅäıÕè÷»¿Ææû2dÃ	‡›ØE™\"éc şMê]Ûg½êGfAı„Ñ¿qÓÄ$&ÎhŞ#]¯Y¦Ìq1?ÌàWoëŒ±ÜzJŠ|óÅ/h?¥uz@Ş™ù_¹6ì	[é½+­ŒÒmÎ6À½SÄŠî:dçÒÛl’¬ğåÉ‹Áù‚ò?—û‘‡ÔİÏ¶÷ÅØW)üÛlîöëÁ¸îí;r]¼]>4º9zÃÜİ¿OkQõN[ÿ\0’\ZâÌXDÌ÷>èĞ-wyNÿ\0ªçİ\Zóe wÑğ—¤¿Ù›Ó;w²ºc®÷©ºWÔév»M˜•ÏÈd›¨8‚r¢…ê==œîsn·ûó±(ğûWµôsn[NAş÷ÚşÕä>‘ÜŒéïÚ\'5¯¨õ\'m÷lpQşïm>ÅÑ¼náÍ!0^“w°–÷¤îóŠÄ£§Ì?åüBó_™}gbèøOÌã$ü<£âO‚æ{~¬îÖÚw¯`K3µt=áom‡’ÿ\0AÜ_ssbO›üR7PÀ–×I¼ÚrÏ­@SuËÙõ10‘?¼·zğŞœéÇ©uì6|<Âg°@|Ò6nÒ½—ø\'¦Çãøõ0ˆfín á&–µÉÕzZfîRZZtB6¢äêÑ¾Àëóÿ\0ºÚá4<\'Ş&¾™×3½j@ùa<Pn‘öó/Ëï†6ìL¬Ë¹ÜÉ 8Ä™íÒÔ$xkZˆ4ó¯oé¼F=dÿ\0Ò3>æ§´ğ+Ézó¦lÜòc\rµÏ.hğıhâ_¸…úEø×¢‰:—Hé¦2!é}»ÓÙ0hn–ÇµÙlƒØõ°l’+P^ü¾iø³›ïŞ‘ÈÇŒæ@÷.ƒ£ÀK¬¿İÇGØ\0«?:l[ü™¿èÀÇëwÚ»té¬N¤ê{]ü»ˆÛƒ6Hà©]çJÎ6\'kº˜|0”£>8ç9	7#²QuîzÎ	ËÒ{n¡ˆ˜çÛî%ó9àö‰rx…æo?ÈÙ¾\'E+œı±É¯k¼l§m¸†TÒ†°ÙsAjïz–)GƒƒJ%ÿ\0Z,d?xG±×mºêß½\Z7¥†ãâ2¤âZMŞâCj¯h­­0~\rîl@ÛwX•šZZt²n›¸asœÒæ—Ø€ƒ5¯1¿<İki-e‹ßQö/)³”Ä$4\0·´å¾£±w§\\é$,}\'qÜ»íÆCF;²Ö $»r\"z]ŞNM¤òy`?{$„G²<Ş+Ôzß}øŒ{.“\\ó„ä8sF1â$÷…ñ¦kOIÛõ–õWôÉH$\r[½¨İlŞğ.ÛÌÔÃÖ¹\nœg›u“¸Çç0ÿ\0pÿ\0]Csı«×˜2Æc—c(ÇÙ8À¿cW»ì†ÃñVŒ!ì½æñ	İB.µ»:ƒ\\×½Ä8„\Z8WëÇ›}´ûÖöúV>¥Í9uÒãÉàâWçwm¤=>Õ|¬d¤¥h“ï¥UîÜ¶Ç&ußâ/¿É˜ù\"=Ä†ör•—¢„qï3î²1ãÛüÇ±È/şR¹¯KÛ–ôˆ»†P\0ë^>ÒìÒzTÚ·[Æ\0­Õ¾ßÈ[¨L¹\0V»œ‡û†=”oŠ&OßşOÖœ–>Ÿßdõ«çÔæÿ\0‡ÃŠgıXŸ’2R6©à¿Bÿ\0&lúNÛªµ—fçm·œ±4“:\n£Ğ®‘û×€ÃŸ›]±¯.s1âH?bò~£‡6ÈdûĞÎAî“ı¡~jşEØ2/ËıÉØ4oY°ë[1eØ@çJ@\\­rg¨Úõô-¬§›Ñ[YB¹1å–?óÖ~¨éx²î:¾=¶ùsÄŞEıÄÀëŞ¶Ÿoğsßd®‡¹·{èKˆ{Y&Ön“Ø˜kHşãÔ#›0U½y]ã`ëÛhD³à©í<Ó¯‹bú_XÚcé›œ{Löğ$êd$I—y!×•÷4‚;ş·şŸwÔ¤éHOİwPÛoİÓ6ûvµ@2™-è\'\ní÷}\"]O©mğÄ4sŸÌIşBê1öd¯[ÄêÀD·ë74Işû=ËŠwdã´6{[rC÷}WoÔ:×^Ü¾ÆN³Ö%ÛI4ò\"a)1…]-»>›î™÷ıWl1ãˆÓ<7¼·¥º¸è½æíˆäŸt®|$ÇÁ—bşœÅùG¶B\r2?©Âô¡Gß†ºä.‡\r@bHµÒ¸½kçéYÇİúRø/»õúôlä~£heÙìßdG¼è]Sªmö÷ı¾ßû]›ã\09ı{(vö§…¼Vãêã]IÜÎÓYVP<’ğ¡~ğ¾K½Ä\'~Ø¿éÄ=wvw·µ†hwRgNÚ\r\n\Z×NèY#\Zª ¡N\"½wEıè3.1sÈÿ\0,şç]×©ú”³ú\'m\'Éšqí<ïâ¯KşDÙÇÓúDé±5­‹§³k±cBªmº|,:Gÿ\0	>5àº.in7ù3Î³ÉÏ\'ï“®¯òñ¿óa0H{%\0½kø;·ÇmvÄRÎtş—µÜn#qkw=N(úßR\0…iqÚ¶&;“COËKÔÒçÜaé÷æÈÁƒ1’ïzöÅu\\€ŸN8‡…ıä¯öWã/Í}ÓÑ{¿ı’íĞßõŞËìÈû.ÎßwLLfëaĞ{£­=»¦õ^£·;—ô­®éñ·\Z1ÎŞ9×NÅìrz‡£ì:Ö.™¼Í{£ˆå4qóB&ÆsåŸ,]ËHè»ÏMõ>ó¦o=mÓ6¹2ôm§6LW”\0#,‚7113ƒØ· »ç¬3±»¶;j7÷uşÑîÉzõîdûÓ¹;/ı–ñŠIwRõ.©º –– Sò±]?k“©o÷=C)iáå\05<¥â\Z€D\r~%xˆÂ;}¦ßm\"NyÀ‘©21–I\0*¼…¼gÑÿ\0uÍ¬sÂ7]p@á¶0Í««õ(YûAÅúLq(¶q®WBú›¿Vm²y1“]K×¼ûW‘ŞãÏÏŸpa1†‘‚Ît{V¥—·ÿ\03}®•øö>$vŞ.™øã lŸ$¤Fø£“uÒ3\\\\¡¯vÙ®iéQ\\^‰óäÜçƒ>MÖR= ~•ô~“š;Csa‡m)×„I÷®ü%Ñv;ñÔ½õ»ƒ_Xé=—ÖúŞ7êŒCÿ\0cQŞmÛŠLrkyC‰Œ½§ç5Ìßn\0ë™68˜¯\rÛ0æ—û•ñ]O£7³î\'°\\ùqNcSËÍ2¿ouxìz_ıÏúçÛÍ•ÛŞİê»P\\[3zœp9ú„t01ëu$\"eÔíÈ¢Üa%ã8âáQÜ»~±(çßîLkªG²‹Ä}£ÉÖcîßiIz‡@ê“í\\-$]_i$Ofö“ò÷0¸ °Ê»qºü\ró\'’!ØJ&µÇÚŸ«0úK¦äœ%øK÷¼b_½hü“ÜÃ«~ííÄ_ñO×ú¯KØn!o¤E7EÛÏşt$}\"=ËZ£*çz_¦şÖy°Ê°Ûbœí#”øÅ×Êå,œÜÎS\0.I+âôx60m İïZ_µíÎ¡Ñz–åˆÚèãuÿ\0]Õ¡\rpI#ŠìråVí9ÕG,³uÄŸş`Lß8óóã!}\'¨ŒıgÑº¾ÛåÉ±„¸óg>™\Z½şÏõcë=—ĞöÓ6h6=¶ş¤çFñ#&—¬oe#z¢ãü¨6lsARZ’º^‚\'ô³n&MÄïqËò·ƒğ¿ô–0vywÙ2S¸\0>.ºë¶v#º÷?A8î\"êı?n8Oşß¨í\\EÛ—&×u¹şİ×ğï…£<s=Îa/p+æ¼ÛŒ^¨˜ÿ\0­†ñ\"Qÿ\0uG`t˜:Ÿo;º{£CºD’ŸIk‹åëıso,,öQ‚	éû)C_öı+Ú\\ã¥–õ=wqı¿~v1ÿ\0œ™	é‹œüŸ¶Cƒ/»\ZF²¯[·ßõQÃgéügäÆĞˆîwÉ?Üƒ°ì©[elİËù?®BÈ$Ÿ®É±‰ü;cÑ:4³h„#’&M´!­/†UÕ¶<Ce-‰í2•_‰×UÙì6xpuHlq—Ä7BnZ@x“uÍ?î6oÈ]£»êÓC¶é·µßõ=Æà×§ì·{ÍÔÅ=0í¶ğºGôµ¤å]–ïlûl˜öñæÈqÉ‡i4ÿ\0bû7YË\'sšdGÉî$®ÊüÜO½;©şLêB}œC¯ôoı•Òİª7tNŞØEÕdééèfû¨Æ×îw/“Æ×ìvx6Ø²tŒdKo<³—ıL´p$Ä6|¯ÒC.÷6î»cµœ9M¹.Gyw:».¹ÿ\0^ã;¶÷÷X•Ã_Qî™·tÎ_•®İîäqRlÓ0$O×gèÿ\0oÙÆØ¶’-Çå½ŠùœO.ÖR~qŞXï\\‹ğ>èn?/tÍüğ–#»§ªÉË/Ú•İ\'«îœ\néÓö¤“Ò>”\0]+ûcèòÄ aĞDS½·_¡2Äm=H mqÅÆ®\"Åë©^vİï¹î1¾U;Éú¾ä€¤‘>ùò´©$”Ö\n“€ã[ìşLe¯D{›à¼¦‰wjc¬ä<d½ƒş®w×¢õşï‡¨o™µÚn{UıJVË+›µû=¿¾Ûõ]æğ·ÿ\0IÛ­‡NŠwµÎ#D&P>cXzƒ]ÏI8 9¦3â ¹—ÓÔûWÑ=]’7¤qeŒ‰áQö®­ïN¡Õû¿§ï%O·“mÓ;§¹·0ô}´®)Ò»skïíİ€iÿ\0ÓwQÓï%°l’8\"è·8@Ãp6ä%cŠ0”»sL<€(î+ÄúËªuÍÇTÊ?ÒÆÑ«õ	\0á‰~õŸ³÷g¶úWÿ\0”–Ú]Î×´;‡aÿ\0c·@êıuåî^öTÅ›\r¬{˜ñÉ%5]±–èms\\ØK—êåˆ|rÿ\07)á «×â]3«íº®ódŒ‡ë}2	¾2ö€»{ı£î[ê]„Î¼½ƒûjn½µÊçíÎÓ¸÷Ÿäì÷`&!»İí6ìÖáwE@Ù¢ºÏOàË´éòÃ˜6_Ädq«Ç–SÅ{Gräé’İB±Ë”‘Ü\0¤/\Z·r`î·![ş é»€\n‚‘î!˜¹T¡m\\Í×ÍŒ>³#Øx?TÈË®ne-9€ˆ^ü÷¹É»Î«¶„¾}×Dìş¦è£ÜK?kô‰Ùöşm2O›â¥MÖ¸ı61ŸH†2@’&Ã–R‹æ^çcï}!,S DíòEÍƒs</şÃB!é™Õcp^™İûÈDÍú&‡o¹Í-¾’í± zÓĞS9w;İ¬­—dqw0_‰æÚ‰Ôoñ\\ÿ\0°;“«öÇbm&ô†Ï»ê=3®u=çtô°K^è=GkÓÏ[ÚH«B\0Üm¤ˆ#%b›í®ß>=\')ÙÎ<‘—ı9Ûûœ\'ĞÕ}3Õ’}?>Ê›xí#^ØH^4pnë­ÿ\0,OÒúä.éêFMÒº–ú>©Ò÷„fç§uM×¨ì·lÀ–o6û–ÊÓ˜}r6ØsaÛcÅ¸¹ã ÂÁ×ÔºhgèûløÈ0‘ÜGø¦…pfG\'m~Dívktw¢Ã#”è’>àéY\\É@Ò\\Æ»~š—-À×má”çÚN± û]Ãq¾AÕv¸³õ|ÛL‡úGtA#G•Çêû÷§múwoKŞ=¬EêÓO±êÎĞz\'ZÜ¹íôÈõ87i¾•åÏ€|!íF¸×cĞ÷}¾+©?ãq1ı\\q«dı¨Ä±xÉÈ\rÕn7İ[ÒÒŞt)IálD¼¹!ÙÍ,j)Ù½k`îÖü_Û½êÅEÚîÿ\0óÿ\0#s·İuÓ‰ÇÓº„5Äâµæñn¿¸ú“6øZSÉ(÷Æ?Ê\\.g¡¶ã\'ªpÄ·ôqN^\"\">ßŸÜ»ı`ßÜıÅÑg±mú·nÉ;\\_¡±n:v÷k#7aø®Ö	äyB4´ı5Êõr\r=ÄCËxH5êyÇ™}WÕxØC9¶<¡û¤OÄ.‚ë±l·ßu\ráw\\ë»£\0\Z%è»mÙé½:61£Lpn_âFµ©éBZ»|Ù\'\rä õÛÂ›’_<x#ø{×Ïú`Ï×°õ©Ÿæ—àşœx\0	\ráŒÚJ×ø¯¹YÑ¿wtó¤í®­Ô.B%VØ±›X@TwŞŞ4„Ôú³§KwêÍ®<tëşì1ğŠù©™xÊÏ„\Z…“­ôÉ:&ßµºÁwöŞÃ¨oÜ‡[ºÇUßõ\rîñÄŒQÆ0I\\	n£»İÖ/ôŒåıŞ8F1ø•õF`3ôßSÊ\\å‘”\\ëËˆKÛÍ99^ßƒ¥‘şº÷ŞC&Ûö®ÇfæI’-¯ù:@¸H½{–ÚHºçÔîˆşÿ\0µÂíÄŸXô™Go½ÛR#4GÚºGò÷DÙuÏÆ0÷¾Ö]ê]‡±‡D]#çwHnÏw¹ûòú~ô¯Üí\"éÔ˜Ô¶6×kµÜõ¼[¾_Åß³›cÿ\0â]ëlÙğå4ŸéÃ>LíÑæ§šwàY£ê—Óvïx–.«Øıkf?ĞıçSšZBJİ´Ì·1\\?PÆP,¹œyñ“á\"ÁvİGp:„Æì×ëí1È·o(bòá)\'ê›È½Á¼x“{Ôz×HéÓJ>Rı¼RÍ;c#OüzÚÀò®o¬#\r®›°Æÿ\0KŞsm~b\0~,¾c¸ú1oÃƒøsœˆ½ù$9ík®Õ:¬]S©õMŞÙÁÍO}·—\rL“m¹“nZñt.‡-p9×;m·É³ÚâÅ18ã!ØD‡0#ÚİàŞ=Ôv»ïNáÅ€ÿ\0W\0äœ{’q=âà®Õü`ıÏ|wJéİAŸw¡ş?íÎ­Ò¶ûg9ÍŠm×vo7]O«Ìç°±ñKÿ\0VæC©¤9\0´ƒXõ9C×&ˆëp%\'ûĞÁ`x’PÎ}YºûÕ¼¸€0Ã(@$aóMøS”Š¸¢¿&t‡tÖõ®–ØßıWX“í™ÖØvû§íb.\0‡–n\ZpB½/B—Òê‘¶Lr´	t}ëÑşeá•´ê0›xd‡0ÿ\0t.ĞüwÔw}w¢~Cïà©IÓ:4MM_ğt~‘OhÔÓ÷‚5äıG·Ã±Ï±é¼˜Äòü™ì_2é?Öê;s*	î¡î”Wj­Ğ´w/R{µéièÑ°ú2fêÒ4‘õ$ …P€¥êº˜åÚå ×éH{‰_kõdÏ·™ó|ÃßÜ»KóR“ ~}üWÖcÌû›-”S±ÇK#Ùßn:gPÒâ×5“iÔİˆ7+jèı?­Ñòà&’#şZ¼WMĞH-öØŸ>ÚG»—›ô®ƒï.¬Ş™ù—ñZ™ïo?RëmÜÌGü¯ÚMÔŒå„Éx-w~˜ÕéèŸ»—ö‚=î¾uéÂOWÛ¿üÉe4%Oi\\Ëı«ëûø×°:{‹‡pôÈ[¾±ÓÚÉ/Ã¦6¼‘Ì0|ÚX×q¹Ş›ÚË\']Ü‰ÿ\0òûŸÓ<dÄ{YrıBDv¸d|ñÊ}sŸÇ¿*v¿^…Ìõ.Ùë°Ã\"HK£êu¿Ú63Ë«vèT»ÓéC^+n³Şí²ÿ\0©€µb~Å¯¦NdßÂêËnğşjûˆ÷®Îü·°Ûun—MŞÆÙ¶{Î¸‹rÇØ¼Ó¿l÷\0OÌÖÊ£:y0ì²np3aÏ	Äö?À+~½n•\'êd÷\Zâ/õÓ­¿²ÿ\0:ô®‘Ô$ĞwÍëİƒÔğû†1òô}Ëƒ³”ÄÛÿ\0õ\Zõ¡ÚÇsÓ§¸Â?£šÜA´<|®¯¤æ })\ZÄ˜ø^+Ëİµs»ÿ\0®JÔk:~Ó¸$nMî™¶cT£šùå^“{ótÉÄÜòIş•—åvSSõÜ2,gƒ!ñ\'á÷‰ö¬½½÷gíNıëï\0É/åq#Ôøaî. \\¡}.A¥W:Ó¥ÿ\0vÇµû§g—ÙıÂWéræÁ½Î\\su)û#CÜÇØ¹©ß0õÍæÎIºØì6aÎ-fÌK·İoZWS7OÚÃµx²sXô¼Fb[œŒI$û¢$GîıiÕHÅ¸ÜI†\\¸±â\r ”?ù#:èH^İí=–Ã´¿Ö.èî®àİÇyíºŸXÙA —Ô§İ:Ú7hÇ–™·KkÓà|-T×9.-n¢<¶ï,÷ş²ÅµÃåÃ@öGå”æOt‰P–~ÏÒg§öûLûé}<8ñœ¹gÔ™¹Â\0\n’\0H^Ş·¨õnµ³ü´‘’õîèÜôızõ=£œcÙì7³C.Û°z<£C¿ëÙõ9ÈF¹ºeÑÒqş¥tü½O\'ú8!)Ddú’âì\"44åyy®³×÷~ªêc˜lã#\r¾#÷CÖr¸çıcúÃ”\\c›ÖŸ•z&Éßº¦Û§ÂÈáìùznÿ\0¥†0µ¶éRAÓçûa¢Í“k)qNòJnòÿ\0|Çø‚L·|ğnr0ıÒ¢ëc”Œ¹g’Œù£ß]³ş§KşOFé×é2u¡ÔwRénŸù£èÍÿ\0•ƒü×èÀ1]»sıYòì\'ŠÂ—¾Pğ¯´uÍô:-îIíe6ìç§¹¼N¶¡»~şë;€Ç²N©Ğ:>âi.#ÿ\0#gÒĞ?Ô2xºCG¤¡™è1Jçz?ú»mœİ“?9·s¿\0bâum×Ñü¾”bC™Œ}üÙa~àW>üÓZ;kñfÁÑ¹ãtÿ\0ó%–s›ºê{½ÉAÿ\0æ0WõFnQo³~®FşX\0¾W²÷i‹¶Q>Ù¹Oû/Ü}/¬3eØİsÿ\0¹úTÿ\0¼ë©&®•Ú}-®î/pï\Zİ¦ïr7:¢Û3^æO¶€4ôîß&Çm“¨ï§´ÍÈ!úù%jc¾o1hN‹ßm}I.‘ºÍ‹eëoò´b4‰æ,íRKÒ\"¯v^Yïnœı¿löŸvCÔ·ıI‘îàèOs»ccé’è`ÈvŒ.nÛiçj@ÎwüÎswÑ2ãÜo7]6Xá\\‡.8Šx¿;ËYJ&¤\0(À\0¼ÎÃ>ë¡z;àqpÙ\04ÈâlÔûÏJ\n+º¿Ô§ÿ\0ìNâœ±FËµ´kıNkİCb#õj’=¾`İ|kÎuÙôìíÊ‹Éÿ\0Ø»ÙÃéõ±\Zf—¾DºÃù{¦£ù_ñŞÔúãÜnº†êh‚v½©õü¯{5!/xš¤*Z½<ŸC¢î7\"†;qûÙbòºãõıÿ\0/NÃ°9ÜO,‡î†‰÷û—^ô	ã¾ÜÉs7»î§¶œ›ıÖîâ±‡‚NDŠë7`ãè¸¥\nrŒr,Bõ]k‡åîØµ#o/k{.»ŸıUÚ¿d:†ÊW\r}7½z‡K{OÎÙvqõ	õ.Ùñ9>Q•s}Nc“e“qòåÃ	ér“şg^¥ïÒ6ûwûye‡tI2¸û—Rÿ\0°qG²üÃŞ“=¿në:‹Ë•£C:~ÁÂf‚â]ª]°Ì\náô‚râÚF— ˆï<Á½ëN™–^©\räé1Cü0•<mì\\¢ô=Ë?ìzãªÍÓwıİº;©cÜúúVçnÉ—£3¨ÂÖıİ´lfĞ9³FK£k‚µÍQ\\ş£¹Á½-¤1Œ›m¬y^>q&ş¤£V•eX›‘B\nòı\'\'SÍÖUÙ@dŞÇŸq(šŠ’ì5¤¬+¨­µ?×¿Ñwı¥aîı‡xtº¤{¶wd{×í·ÛîãoÕºQt]O£Íá¬nâ<Õxa:Gœõ×,wêØHÉÓgä&±¼%_)ö•êg×1uıñÌ#ôóË) Ú$<N±÷Bò·ûµwşÂÚÎ?¤÷vÕ×Å‚h7[b¦Äz˜Õ®ûĞsåõğŸ.M´Ç²@¯›3må¬r´.áÿ\0OØÇõêß295·¦ô½ƒ%ú~ÄıFigg¤hYdéñ9…T°&ºÿ\0WNŸ%úÀÿ\0,fïªû_Rİ~\'Ó]6dƒ)Ç„øÖ£µp/ö¿p6.é»¨Ü(êÏ¶c‹A:cİôİË#l‹©ÂWî^\\\\§QÒzwİaÛm¦&§¸Â/ğ\'Áqrõ°ôŸP#ıILÂ=ùb#î|ì½®çñ¬=‹ö›÷ÚmÕ¡YÖÿ\0ÆoUe)ÿ\0+÷nÒ¼ëÈÏ¬e‡©?½¹a»s_ùoÈGw-WÈ„c-ÀÛéôÌG{_Ú¼£Ø›¹7[gt™õ¶»–mâŒÿ\0êÌùKØ*~ÔÍpà+éwoîã¸ÇXf‹ø†ğG±}OòÇªİ#!¨ş¤\\÷F@{Šı†î=«jî™\n5›lf¬ù\ZÍ¼­Œ5„_C\Zä ¯ôìÂ=t‘iæÊ=¤ş…ÅŸõ2n\rŞr?æ+òÃòîÒ>ù¿ÙûQïv0u¸XÒeê;8]¸	³JÅ?P¢WÒ6Xù·;hµ%0ıÜÀû«E×Ïqøm¯Q€§ÕÚİóFŞÓEÚš±~èêèPŸ	:®å¯qTRTÎ¼¯¨~oWnş£ÿ\0,•é#›ªlEÕÇÿ\0æ…ëõë¦3gÑ:I{tøú”Ò8éÿ\0ºŞ»pñv£vZØ–ò@1õFI¼!Ë$@ğüJúŸ¨ó½O5~XB1ï%x;¨ïcü£ù·¯îŞ›.¿İıK¸A‡möãÜÈ¢·ÊÍÑÛµ§\"§wø zGHôy¶øcü\\´á‹•ó©›cİs#İ\ZD}«ô·ñë_BtLhcãŞmXÖ5®vÔHÀ€Ô.µxN±Xñà€ó~üI\'â½.Ë±t\\Qûåä{åUäÈ»ÈúüßÜ±9»¾µÜ³lä`‘šåç¤t ßò‰>ËãUÔW¢aÔ½O·Úâ®)fÇü±r÷Ôz£&	uìÙp§PŞäï+~ë}\'ÿ\0ùû°¶[Bæ¿¶¦îÍÇ^a‘_ÿ\0bfß>`\nhl5¯`Î»n¥&_To7gÉ?§íÜWié¸	ìöØ£æ9ößEÔÿ\0ë—Z;7õ®å\'_ÿ\0ìNàİ¶G†µ›€6’»fÍÆ¦¸6‚ÆÉc¥¤Øá\\OUaŒº–ÏjOÈv¸ß€”É?¼ş)}~¹	’ÑÉ¾•xJmğ+¿?Õ\rÄG şIêÛ‰än¡×àÿ\0(=Úµî_Ò÷sîwÎÅÒ:T77^&ºOTÈœø4<Äø÷’¾•ê	‰õÓhFÿ\0+ı«Î?—tí¿!6PæÏ´èÛ–êÍ/Ğ\"‘¹Z›¢¥‚\"úbÇS©‰åãı«ºèXãı‡uû_PşìŠ.ù¯¼è=Wü½±ÿ\0‡½{Nƒ¼*A×°ê1N^J©xk€ºØ×/Ñx1oöÑÇ“Ï³ŞŒ±îœø¯€Î\\˜ã!c‡z]W­ö·Hİíİ.Ñ»Wî÷ƒ,aÌÛí7CSå€Ç#b2¢ZtÙVç—Ô²»½ÖB e*Q±‡àà/´úo6~ƒI€Na±±3?N?\0¾Ï|OÔz\'ZîNÄ—tßqù@ÙÆQ¿c{¿Ù7¢õ‘CCrnöñ¹ÀpArk­éò~™ƒ1®lo·”µ?MåŒø™º/Ë}ìpuı?/ú™q¼I5æÆHï#æ~|¾Ìê0ìû»¢ì\\à$ê‡w¶ƒæ!›Y$sˆZÀCBæOaÖ6Ù2ôì™ ?§„ÆR=å€âjO‚î¿3:×NÅÓ¤_w“,ddC‡=ä°\Z±ìAù^iúOän¾ÚÉöpöd];u $kŠ÷ø“4i—HÖ5*‚ã_Nã†÷Ó9¶ù¾ôLŞ‹û¿†«ç~˜†ß/¨vwlFD6†@K•øÅµooYïşä½^H¨ÿ\0‰Ñ£Û@\nY›ÜÛ€\0Á$îCÊŒn‹áÿ\0xŞÁúJõ¾¬ËõzîfûŒ}ÀüI]¥ùJQÒ{ƒ«¹ğ26mºg@m³]®;ö×Iÿ\0kkã“ìÆHfï¸Æ´­ÁÍØá;¯¥‚æ\0ú½¦Æ kB[Eërõ_íŠò4Î0ˆÃ÷äyc¡¨½˜²ôW`ô&öŸã~¨exnå½»Ö·İGwŒîêÓt\r÷RŞî›ÿ\0 xÜÎØšrÒ8WM·İ~?«fİŠaaÌp-âñ%|×ÒŒº¬rÈÛ,\"ı¥ù¤|Oµy£ğìmŸòŸ^Ş4İŸjnÇAşT{¤‚d.$æIã]¿©æaé=¶#yîÉöJgô.›­æúİs˜Ÿù¹Gÿ\0ˆb=ÁsæÚïáüµÙ¢}Rt>ìë=¦må‘ŸQØÌÁ»Ù‰%16ú\r.‹U‹‚^º®ˆpæèù/şsle)eUŒ‡î­—qè½ı§u“o_ö[ g$còâ/ˆì\\ófùİOò~JÒK§ï-ÎÂ’C6›¯ñ\"\0¼äØF6—HÓÇ/»ˆÈûíYf,2Hë%ò&ê¥m¿ÛËö]¶c7[mÇÛû¿hÆ[$r>7¸Ğ	T×{´Å’y1ágË\"ş+í{İøé\n[ì¡å‡n;<¹@ÆL´zOtşcüÛ‹»ë½íÔdBíş“±éı¡Ôú§SŸ²z\\}wg´èû§lúRÜõcÑ·İggfßnX&wİ|†xs<ÏDÙt‘Ö·1`Ç˜cÍ>\\òŒf9e#hF\0ã‰œ„b\0< 9‘ùö_úŸÔ}PLçßc†8ç¼rf;xÌF~Iä‘ùÄ^\\¤\0I\",Ñ]SøOünÖ;Ç¤õ}Ô[~§¸ŠÏg;ÎI·; éú—NŞlŸ¸ÜÕ¢wHc£‹ïO·ÜÇ­û]Æå±HæzŞ¥±v™£Œóà˜c«DVZˆ Xãš1py×:Ô÷9tÌĞÛ«¸< –1‹ÈdÅ74y„kIDÒQ‰_¿ßéÏÿ\0 =¹¿íÎµøÃı‡îtşïüoøó¸;×·ûã©KªOÈİøû¦îw}ÑÓ:„Ï#ü¿È}¥Ó:Şsœ~÷YØ;ï[ˆ7RIø£Ö•Xzw7Zè˜„º^]Ìq!Ÿã<„paˆÓã$„0µ1OúE£,!~ üŠüí>©é_Ø½E6õÓ¤fm—1óe:	@W(ÿ\0í¹š¯öCó‡Sÿ\0`?<÷ßæ§°—¤³òuîú¯Oè³î#Ü¿¢l{^x{!½*i£?aûˆú_Lé³»íú\\w!@$şªô_¢£è_Cl=9õ#›sƒo3›$AmÄ¥¹‘‹×Jy!«@;Ëòæ¬·¬õ¯TË½hŒöÁÿ\0.Úx¡ôƒš’Ğ™–‚E«Dê0n¿Õ_Ê1nNƒŞ]\'zÀç€ÿ\0¢õBbûeLÒMºÛÇXÔÔíJ+´èx²dëØñb,¸ˆàë[73Ó±îòØ÷pÃÒ:–ß46ãe—kyä‰Œ@ì©ÓGY{kw\'Nÿ\0S·\ršq¸~û¶úÏB\0Ù­Ûõ¯/omvƒÿ\0ámehı²¬3˜î}_¸ãÊ!,YCrJ^2¯šm÷ó—MBr2ÊvBd“^cƒ˜×´\Z÷¯±ş¡náwVî\"\\ßMİÓ5…¤·qN3ké7í³¶ä‘¦Dis\ZÖ’ı\"½XÇÈ1ÀĞ¾#ßÍ“™‡sÁ{ÿ\0Ëúz6ĞŞÃöªmŞÁÏ8®Qù‡¤³·{Â¦4³m×?ÊÙoKûmê]-‚]¾àzÄLÿ\0/¥=d7qÿ\0 )±é:$åŸi›dï=®Wy¯–lİœòv×ÑıF]\'ÔQÁ2Ø3LàŸc’øåŞ%ò/EÆ»š\0şÂí‰şÈ!İÉİ1“«S´ËÓ:+D\04zct›bJúµ5p\"áV\rp>Õë=j_©âp?Òø’ºûcÖ÷7µ ›o\'Ú|=;}Óòlı¡ÿ\0.-Äm7Ôáµtšum\0k°Ã·†ó}3–¸¼H÷š¶„¬rOo›ò÷<wÎD{c>qÈ}²b×‰=«¼úöÏá‰¸”Ç·íWõ)ôO.ê[©dsƒTk.kÇy¾©SÖŒ8ÛŸ&ë’/o”\0Ïà¾]‹<6›¾\\ñã0‘Ä	ñ]eá}¹Øö½€¶x¥a7µ©#^†„\n¼+¼ù àƒÌ\rµ{3v½~™Ki>œz9	m>‘›ğgöèÚ\Z.êèİ?uß‹ßİÿ\0ÖbtıW»:Öû¼b+&½«v®s:tLÒeƒmĞb–=.²k@ZÇ8€ë?‚€&×n1 ”ÔÈGaÊı5_ôN©êc¼ÉÄÇîœ…À@ˆ‹öÚ¼ÁÕz¾ëµ»¯¥wÍ©&ÛaÔvÑ­ƒ¾æÖxWÿ\0b«Ä€¯OÓ¶xº—FÜtÌ‡å9¡.ç1#ß¸¾À6~¥É–\"™qÆ~&&ıÕİsìÒÿ\0öOÎıŒ;ıÅ¿ı6ö97ªïş¢7Xâo^/&hîıK»Ë(œ¢;¡Ë±vŸ—P®HÇj}æÙ_ëDm‡·vNõ—ÉµêR¹®Áºº·Ùi`%-Á9İMu§»(F6úÄû‰]×[„cÔw v¿µ»WLt.®ş‘ßœ»sü‰ûªu)5É\'PguÇ,n%ÃÕøgp©ôé7\r®WPÔéx§ú¦2ï‰ß!ì+ƒ×¤2ú\'æÇ¸1ïÉÇ¼{üC¾nßò¯æŒâæºIöıOi\00Ï=û‰œHÿ\0ñ¶¯Az>^n‡Óó]öíà$GÚº.]®ó±–){¥Wù;ºz^ãı«Ú\rƒÏÿ\0‰v_Ní^³\'Ü×sş´ná‰¿ø\"a<W_\r”ÿ\0ò.lSÔÚî¾¨ıÃ\"	îbWOÖ¹OV”c÷ñ{Ù×¢ÿ\0Â6[.úÛ4±‡uİ];ªèh8ÿ\0•·ê\rs¤\'ş\"JFĞ¨Ş¼¦úb]/oYŒ¹¹©îeèúVLÓûhcÿ\0Z9òs{G/ùH]KşÇô?ûnŸ×7ĞÆ¿è©ú¾ÁÀjq=9Àï¶å­„®i‡\nô,qn¶˜²Óm»Ûıø“É.øÉˆ]7©qÊDešP~ô?ØŸş™wC·ÿ\0 vV [¶ß³¸ºle	=?®ì]å²‘ò;Œ–¸§ÛdÚçÁ¹Ÿú¸çÉ.øÊ‡Ä.Ó¥gŒH7¯ó\nû×îİ‘ÚşGè{¶1Tíá÷)»Ş!cŠ¾MPôÆ=Äàâæ‹4ÙusÍ°¢CØå½Ìş+¿ë¹~¯¢$~l{ˆbG»à¼ÿ\0ùnFÁùW¥¹çK\'ìı€‘Ì]ZX7R52Rè€ğ®ãÓÏÿ\0”3Ê5œ7’#Å‡Ú¼G§7Gi×6¹ãqMÙä˜©ÿ\0^Šÿ\0VºKÛ\'tæ¤İ»z†şyøº{™-E.Hô;5Áë3}YÇLMö/CÓ¢ñ‰yÈ®Áÿ\0hÚÆö÷no^ŸñõíÖİÒcfã§ºhÛe:d;Wù¶ºOJ‘Ë¸€ÀûAÿ\0Ù^ÏÒY#ºœËB1Œ‰à9œû—‡ÿ\0táİ”wİcy—aÚ›-îüŒÏ­‡Ke½%ÎÜ?]±!kÛz£?öÏJÃeŒ‘¹İÎ ö±ùçì•|w©oçÕz–ç©å¨\"DÀià—5üÑØuŞÌîZ5õhÛû²ÿ\0­.ßwøÁØÈ6ıEúIÿ\0Á/]7¥²ı~™¼ÙËşL£–<‡,›Æ!û×kèíèÙuİcåœwOÊ™—è—áæ·oÚìí²VCÓ»Slø´–2]¹è›O¿ÛaÕgdÏiB\\ç8¼\\ ó^¦™şá·™°?ËÈ>{>¯1.¥Ÿ\'ÿ\0Èå\0}‹òsº6-wqô€Á!ÓÜ»M˜22Ç.ığ6Å	’/ñNµÃ[m_Né3ú87{ºrÇo2;E>İ;Šáşeç97{»¼L%&ìyD{ôî+ôëñ´0·ÜûÙ4¶-‡MsFâIxİºÉ,ò<¶8ãl0’\\H\rM|Y¤vĞÇLæb\n“vír¼—B¼İf Œq—û•ÿ\0(÷\'OîïÈ¬îN×ê¯‡¶:c6.édjzçYÚî\'|ÿ\0ûV9ƒFûi§,~íív†\rp+Ü`ÀzwIMŞÀO}ôäNòÄ“\'Ë!å½ G¶!z)õ½ßTéô÷JÂ\'ŒC$òd6å‰çxş¨ïrÂ#UÓ}ñÒ_ÛıéºéÌ–iv]Sapôçîe3I¸ÜêŠ>§÷& 9Ó—{¿òû™%ù›|±ßz|n˜Ø¦qd`À\nËÎW±µ]_¦7c×{Ó$~MÎÜLúøÍ}±øj½¥ş¿mÄúœºNó®u­ĞsP\'ØB×$84ÂE€ó¯5¹›õ½¤~ôaöÉv;Gä-¬OØ¼É¹Ø¹Ûù³¨«:sÏJEP\'êûÿ\0ó÷€ç¸ÀèØ@(¸âkÑu9íö;a|¹ùÿ\0†\r÷×˜ê²ÜîãÔ=[µ€cM¾(ÿ\0>ÉÅqWìßºüqßqÆæé‘ôş·ZH+±’GK¤·ÔÓ$ÍQp0§_OÔhÊ‘Ë	c?ÄÂÅv¿™–«¶Ï™>#¾æõïŸÄ‰{q	-»ÌÙ¶=~ìSôî£ö1×.í#šWA×‰Ç¼Ú™^9‹÷ƒU¿İG{“&ïre1•8…ù‘7ùPÅÃdßï:Œ}bÖ¯İ;Æå›toÿ\0³û:u-×J[\Zõ}\"ç¹Í“pß†„NIörÃ˜øóPx¿ÕËvv]{êî¥à1™şZpw]ÍÜı~•ÔzOIéßW¶öÛ}ÇşŞÇ&åÛHô;|{~Gºîf×·2£Ü™ÿ\0¦ñò×QÒ÷ø·çx#ŠY²«÷I¼FA^ZÒCUÅôÇRßúwN©#/KÉb‘˜‡ˆO1gùej^èëÃÛ]õøÏwÜ¯¿ªt¿òvE$n-ÜtíÃw×Nê»iãeÔ6wD‘HÆ8¡Z†¼ãe»é»ùí·p0œ„ˆÔHÌ%XÂK6=ïFËŸ	x‘<CÈ¸#B~vşh„mÿ\0&ômáQQí=›¤-\nãş÷,phúˆ1µF%ªÒ¾‰éi}_Jî0ıì{²İƒ›—ôŸµuşŸÏøPôüâ’ù‰…|$½óøOkÓğ@­xnçoÜB}J›©ºœ›ºÒpoø»X4«U¤âMx¾­.oQíâ/Â?æ™øI}+Ô’ë98`øŸø—‰;÷cÿ\0yùÖ>Û“L›]ßrmzñ† Á<[8¡êSÈæ‚Q­~Ø‚Jkûª@6¯{-ÇázNë©õqíÄb{%’\"iöq]?­z„rtŞ›ÓÅù>¬»¡P<KŸ·ı‚è­ê}§sA\Zo{w®FÉäcQã¦uPË„!›}ãZG®‡Ğ[Ó¶ëéùô78Höá_|I_/ÔÁ9ıøäÀ°­ŸëfàuŸÈ]¯º~’èvgs.\0E¹oFßGœµ¶Y§‘Æ¹¤Çø]¦ëİ„$Xˆ_rØõoîˆ–Y—Ï})V®xAñ^ÛüŸÒáê;8à™¿r.«ÑzßI™…\0!ğÉ¥gH\rÊZ¼Ï¦rsG.a(Ÿm>ÅåÌy°Àµ*äS[´íİƒ‰t‘wDYC¿ûMëaaQ!s_Héa²näE#¶›xŠûÜ®ƒ¬nº6Ëhm\rÆ_%üI^Éïí¡ê][ ô\'ÿ\0Ä»› cÒÏ>ÏhM‰-Üâ\Zù·¦Ûëƒ//Ñûb»ËÉuíÎBÀGo2{„à½³Ğ{\'òou~+ï)?~:ï>ûë›í¯^Út·ivÏWë;a¾İÄŞŸ´Š~¥·Ú»¦lQÏ¬‘4HÖÚ¼ÿ\0¨=KéŞ›×q¹¾ÛmñÆ1”¹²+™<nÑ^ËcèŸYú‹	Üt®ŸºËKŸ“–j|±>~®£{Ûğ?úyÙ?Œ:Ïcì»¸z|}åÕ?&ôîí-öŞN³Ü]ÃÔeßmº®ßg>ë§õ&î;}›8dû’½…­ÍV?~fş`ú—Ô¶ê}_ÒüGEhÇY‘Œ¡‹0ĞŸË1*ÈGær.\nşşQú¤z[òß¦tïWFX7Ùvï“LR™æœÇ4Có8rEÎ‹áöoá¯õÎûü¥ù¿ò¿dş<ƒ¦ì¶]¦tı¯wl:6ïñhì¶êG¨OÛ#­Å?Ofï­î·_yÑIîŒ4E·ho¢¼>OÏÍ}şÓ¦zc¥ËzvÒÜeŒ¿sŒù³L\\yå	†8±ÄÆ˜C”“‘Ø¯Zü“ü¨ô·Vÿ\0ÏP†9ÖÇ<qòmÀå–\0ˆ9˜sÈ´XJOùùÿ\0È¿şõÿ\0jö¿‹öë7úıŞİÃø_ñ¯WÜu¥İ=¡øÃ©vßOïÏ¸é“õMçBéô#u¾é{\r¿I‹mµtp?q;Û+¾Û#leß­%=yèßCï·üÃë½3eêŒÛ_£k-Î,“ÂI‘ş¼±K$1ä™“‘9AÊòæ”„%~ztŸT~daÛì/ú&û7¦ö™ş¬³}3ŒfŸ(€ú0ÉÉ<‘„Gš ƒ\"Dix÷ı§ëqÃØõ¹ˆOµ­§Fè;(åcã/¿²Ü³ÜÅ+[,R6M³[& ×´‚„WéFãÇ¸†ÒX¥˜rOœJ$J2›‚$	b¯ÌıSoŸc³ßáÜBx³áÀqÊ2J2-$^„\Z®µw]@ü\'¿ØÂï²î¯Û½²sIk67;×Ft¯ŞyÚÅdS‘áí„rzƒu˜ÔÇ&b8“6øs.\'åøÔ2´væ^ ğ%z£´ d_‚»	^òÇô>‚ã!./=×İV54¼˜b‘§\Zë6ò#Ôó Ú$”}«‘}S’nüÒÛ\"W„;$¿gß/áÃş^¡È\\Ï¶÷ëi-ô‘\nZ»¯\0:d`41oaí^‹Ö°„}¾ì°·òñªé>ï›y_“±$ÛN…ß½kªmƒqs:±Ûn´5„fHK“^÷¤ŒG§Ë¯F™støD÷ãæÅ—ÅÌ%“p6ƒïdæaö¯Gş6í-¿qônôÜï6áâNzTr$c¿‡rş¤Àï´÷ˆC\rõÁ[\rxş¥)m6˜ób¤ñdŒ¢uş™ÚÙ½`è{}–0ÿ\0LÄñ„D\rx‰]QÔºïVî(úk:Ñ2uİé{ÍÜîUóÓÛ³£Âél?ævÒ\'ÒZUMv¹ãŠ9Ğ\0a˜#Æ9~wñ‘ïvŞÃsĞc·¶m¼Ì%ÇXËÄh+³?u(]?Yéìx{úf÷¥Ë:|£üÆ¼–((\\\0w1¯\'êM¦HGâcäÍ	ñä$?sšv·bùÇ¯z×yê\r©y`„a#§0‘p;])³–~Öû»µ¿û=võ½Ì;pš/ùÆHiF2	#Ò®§œ®=î8óí6}ZCú“Øãè$a`<{ŸË¨í±îº†iD~\'éÌO‰\"¥¬ ü>Éwı÷Ów\"6Í¸Üõ.æß©xínÓ·Î‹uäôG.ßvö¹…Ä±®»½ ×KœÅãæ°äøÔÿ\0Šø®«c.n¡‡$ªNàHÿ\00ªÁ³Ùàî‡Ûms¾ßUŞ–oŞÂàcé{h¹ên.kí÷6Ìû(æD¤‚Ev“Ìv›lİKM¾7’<°óPŞ!Üë1ú¯ÒÚâé8Ísyşä,;¥.?uª	^ üÀcéŸŒºVÑ¢8Dıw¢±›v4>úÎ¯ ‰éÿ\0n×ü˜ZOÂÅ:N•	~^rÏi”‰%yş€eµôöûpí?ÁN_Ìÿ\0\0ºËı…°ş=ŞÎå}ÜİBG¾ä–íö0A«™iqñ§ëü†~ òöÑÙ¾s#Ë¶¶r?\0§â§ïû¯ş\\ÚõbáÕ;Oñßso Ü¶?ó¶İXíâé›æ·ÿ\0PÂí®à‚XBHØoªŒ9ºVßu³ö›‰À7êN$:ĞÄ‘À`¾ƒÓ:÷×ô¼ú6âDîpÊ·¨şR¸Åyûl‡¬ôö9KbØH\\˜Êà#B\nj¿ˆjÛjÑ=²Ê=€Vşš‰=wkw\'ü²\\¥³õGîàí®“4°KŞgÿ\0mnŒvsú_R’&uH>à!Ñ‰6mqqÆ×½vûiÇm»Ì­ô6øBú‘å3n.ËÕ~bu¡ÒaÓaş¦ë#Í#âX?ìçèQMø«¸v0Çööû=§MëÛã@¬íŞ¥HÛÆÖ4z¡‡¦õÑsJ zúPùÏOHäÃ–S/—)”¥ûÂBOì2ö®ƒòæ_K<æh7Àîu]›Òâ®‡·•‚M¾ïşß¸·Q¾ú[Õ:”¿¹ikÿ\0†nÑ!@1$œéú€¶×)iãiG÷ŒÙ«üÇ—ÔÉ?ı8‰şb_ÜËÈ[‡õ(7›®ÒêsI3».I:N2z¾ÏEfïw»é1çÔö6Ñ-\\Z@ƒĞgÈ7x°oñ·ÒÜbî—ßÎç¼®ßòç¨}^—¦Lm¾GOæÉ8Ä·-ÓÖ÷±‚tÍÓÚ*ºâk>â*Ø(L¯jê÷ Œ5¼r{ˆ¢óŞ¨‰]ÜDŠ‘áËö®üüŸ\'Pë³~Ûô]Õû»ñç@‹ï‰Í#yÔv½O¨9„	×gHs‰YRÁ] aÅ°Üî7ŸüÚs$¾eX@kóJAø,Ë¾ëß…ô¸èø$Û¬ò—ìâg‘ş+5lµşy„KøÉ’4—\r‡pti˜ôB’mw[Rş#]qıÇÔ€ù›|ƒß7‚ùæ3Í¶‘ı¨Ÿˆ]‰øUĞuÇ}[gdŸãu9c|46&ø&ÁïdeÀE£u/N•®\r$´4kX»u¬o¶”¥ÈxÂQcâ]—ÑºÑ–óÓ; üÃd<N\"÷,ú/3uŸşŞî³Û¬ÿ\0Ñéû†ÉÓÉwJŞ°îºz¹îW˜¢s¶í\r\Z[Ø-ÍvxóKy²ÃÔµÍ›†H|³î“­ÌËP.óòÛ©óáÍÒ2#eÆêÊ“„dÆ÷™£\'~\\Û.æ’fÄ6ïƒiÙ{ÆúµëšÓ›&æG²Ï–MÄ\'Yo¥Î\n,Ep0wÓÄÏıŸãEæz¬ˆê{™Qœ‘üÆ«uIw[í÷nvÉqN­İ]ÆÜÙßxïC#.kK˜ö>èr8©kr]×NŒ1bÜõ@?«e‘Œcíwf¥‰]¯æ/á³œû¬±$‘¬\Z\'Å‰§`%wßå¾§·Û»¥t÷¸4õN¥¾n¨NÊö°’P9Íj4bâR¼O¦v³Êrn\0xáÄ»~r÷\r{l¼ÿ\0¡ú×eêAø³Ëõ£(DöJR‹?Ìı¤.ªé½ÉÕ;UıCqÑK™Ôº·Hê±±‘§×İÕ±Ÿ ºX¬}qÃ¾{‡!züñåÌ1æ\0àÏ\'Ò8şwğ1\rÅ—Ô=w½×ÓÙ1šåÍ(Â<¹—ğ€ıì»Sò/fí{µ»û}¹g±wEÜMªM3mà‚)º|r0µÄƒtıV|åWEu7,·x²îfÜùsJr:üôÀFƒOÒ~]Æé[´‡ú’æ}LHäö|´ìsÚ¼İÛ“ïeë»ÇŒ&ßº»×·7[ B#6;©wºK¤jlş¡–”¯eÔ!‡ûv.¹:äÛl2ß(ˆ_¼S½|{&#ƒy=›0†b?˜ı‹»ÿ\0 —n{¼Ã\ZúFÉ‘9¡N—é,k*ûdµà:4¦Ê&äÉÿ\0”öOBÆ2ô¶à›O&Wş@4^õë›VOøGòÊ9%dníşæˆJÕû¦(6¥u8>H™¥.o]NğŸüÍŠ¬ñˆöƒö¯;•¡È}Œ¼§ÑúÛúßáO™î˜ôİ|ÀÈÔ:1Óßµ{´i±6şquô5·Ès÷ß\'ZÛg¹§‹Ú&kì#Ø³üÀiu¬#iíÄ›E»™sõ_¸6ñş;ìİöòr!èîêİ7¨Í#´2\r¦Ûaµhhu’(´Juq®çÕ{IäÉ¹Ûã1“ñ iíU°\"]+e’^S†P¯ìÈrè_À‘}¾Àê·Vÿ\0ºú„ÏÜ»ü]¤lRåÄšâúòO×aˆ[Ò»“ö/Lòí†Ÿ4°.ùC·‡kwÇºz{=»İ±-oe×àî3€C\"ê1ºáÜ«²ôîóû¯H—LÌ_©lâø‰¼±>^øš{8®ûÓ]z~ŞCNÚPäË¯a\Z=qqªõú«Û†^?S‘…³u­_ë3–°&¦NéP¿V»HšB)õW™õ>ï“©P?ÓÚG1ŞäöÈŸb:Lå¹êã>G2<ó‘í3íöûWFşsè.gqõXıïL‡xÀ\ZğÙ·©&Âw°¹Ît’ÍÔvns•Ä\"W­ØçúYqn^˜ğ²%}#«Ãû‡ òş¦ßæğÇ/ı‚{¯Ø™øol\'üVøÃo¿ë=ÀiÒLša‚\"A`Æº/ZÌÇÔf¾L¾Óï_Çš[xáÍ4\'Íü²ì]…ş¼[ëS=R	z‹RQ¾Ò…q›\"ƒ\\½÷õv¥­(KÇå¢û×ª\'Øö™ãå“Ÿ\"Gø²ìÏö§¦¾^òüY½Œ9g“«ô·>Ş€Î©Ó·ŒXè”’nB¯/Ğ3rô­Ãè}òƒ{\\w/r6x·¹	gÚfˆ­É`½yËò^Åıoò\'â¾‡·qnê^Ÿİ[Í¾€I´ê2ltÜ2]Öİä\rzßGc\'¥õ‡Èg> ?Ú’ôæHãë<Ê‘üG¸ÓØ¸\'æ¾ä‡¿»òXöÓ6^Ò»j!RÆu©¶gUßÂ	~ß}8…ÖˆØa\\Í¶älrâÍ\rÇùyˆø.ÇÔ˜AÜn°&)É¼$~Åè?õÇ¹Æë£vP™äÏÓŸ¸í]ùÔcöîtf¿=.‚XìqÓ^cÕ{3³ëû¬0¦,ßÔF@çüÁyîŸ¸–-ŞÑ,%òKºÌ}Åzoòn—q°Ú´+Ñ7¡T)-V<‚>ÚØÌW¤@Ï¦î‡iøí:–?©Ò\'Œ_é“ì.¿9ÿ\0%¸öŸåîÚî²Ä7í¾ã{›éÿ\0îºfõ»\rüŠ>§C.ñ¯[Ñãı.qJ³Ûæ>èdÑÎJñ{,Ü›œrzN!ûâYuÏbmãwäÿ\0É+»Ò;±‘9í7üÈ=³¼”»8“oµpQˆ)]Îã›ûdâ5„¸ıªımıiÖbDàÌş)Â»Yá§1Pwÿ\0–˜áÁßkµ¶/.VçsZôªúš–Ë!ã\\òğ¯3ÒOÿ\0MÏ-\'¿Ï/ÿ\0b½Ì¾§GØnz¯qufl¦~©Ô¶©Òe\ZÜÈœÇÇ±ÜïP49ƒmÕ7r™H¶–¥µrö=¬>­6IwV@xÀã5Øo‰ëkiÒ¯\0#)ø9{1D72ôï}÷†ÿ\0òg[è­øú¹Û½«Ò\"è½‰°x?áHşÑ]Sï> Ö©~ÃcÓv’³jI_ğ˜~ÚI½\r®¦ì°ô\\9ºR?÷™²ÊS7?4éñæ!ÿ\0lÖ˜İvİgyıÿ\0­¶Ÿ/OÅ rÌV°a9Ñù#¤²—4ŒJê/À×ä]×SkŸ¹ÛvÎÇªõ3»Ü#çİo§{ö›}æê@_»Şnw™å¼”\0Xr}iºLâÚÊ™·9 \Z<€à\0î\\HO³dÏŠ\"a!h,@îä‡5^­ê»húŸCî–N§o:T‰í%H|½>y\"\\ÕÒD\r|Çcš[mş\rÀ¼3ã—²AıË\r¸?Xƒiö‚¾—ús¸í>ŞHÿ\0¸zÆÒFzÌ¯ÛmöÎ|š‚,{(Ğd*•íıq‰¿9‡q ¯ tÙİt­®)8#<~Hıp÷KoşsCºÔ{c¦ÆÒÂPÏUêÛYÀ„/t{Ræ \rÒqZ@>C¶\Z3ÊOm9›ºàRã¼­=C¹oH`À\Z»¹wÒ2#ºíÄx®CĞÛÖ¶ƒÚöçUwAëMí‹Ë¬Ç–nšwp5Û­ÎÚ75ÁÛ¡·™â+Yä\Zó[Ö~ Ün÷ú¸ë#ÃI1 ÁïÁ|ÿ\0&Y`Í˜¤a8ˆ±«qì_»í{GğßTİCñoİ¿é›íĞGKÔ&s¸ÿ\0ï:—YİHLÛÎ©»2}ÉÜòt³Ò»>¡—¨uƒ“xD¦!F,*chÄ;S[ö¯{è½¾ŸTÃ¼ßÄ2Dû¦TŒíH–sg§#Ú·ø{»zcÈ’m¶Ã¨î6àûrtïñú×¢@cuø\\í¾_Àz¯mÑ9 0c/\n®®p}RîCG.8Èwòş˜üWhÿ\0¥ú·Ûîïë6\'ş›¡B÷..›q<jbƒìŞ¸^¯Áø\\“Ú›Gp@îgt¼òŞ@n2y¤C÷Š,ıvvu?Î[ÀKÎÖì¨ci·ºîN°ıÄî(]¥ão»N°ø=5†\"ùó¿xÇòº>»îV´ \0ï.WJvÛ¤=åÒ¤qG®~à°Òé#_a`[¨øRßÆ?Ùˆb1E¼½«ëş¢„G Œchíp7ğœmğ^Šü!;6–{û¡‚Æ·qÕ»sº Œ‘©z§LÜlwzZ\\¡R€¢Ş§|ùı!‡posÄ‚n=Å|»ÓÓ#q“ûÑŒ½Ä‚é¿öê	6ß’·ìŒ»×z?nÁj+ÎïVÑÁÀ_PÓâ•ÈôN1’x2Ïı<0Éÿ\0$\'Õ³Ë?§å¯¡ù%°ôŞ›Û½¦=œ\r€0\0\0‡§í6»H°ùZ÷ë)ƒˆ\\Eug6ï6÷)¬DñœŒ‰ğzoËœq=Wu»“x°¹Ñåö{\nî.¯ø·s/bvGutŞ÷¤wWFè};©mºîÀ–u~İêRÄ$¦9ªgéÒ·»wG#nŠµ–>ªvS>8F3ÙJ@dÅ!òä‹\r,$/\\/9ê1C\'TéÀÃlrPÆ¤Ç`7\"Õ²ê_ÌŒÜo?u¹·¯dÛè§èİäÑ\r1Ë»;ÖGº&€,²—\0JçzC(ªÁ(8Ç1”Ğ’^[Œöù%\"ò â÷]½ş˜m¾çKëW¸‡·¶åIÖÉ£gSšv¶Áˆé°m‡\ZâúãåÃGüFo`$AûGzúÿ\0[Ó=.\' ?Ã2º¤ö®§ÿ\0hÛÿ\0eÕ¿tŸKWï=ìŒ\0»î5’o6ĞÎ\rƒr6&UV5ì½<³Í¸ÓĞËÇ‘‚èºşèşl»¡3İÃãî]•4ìƒ«FïVÍísZ´,˜ÆÕäYWÊD~¦Y}èüW‰”ÈÜœƒBãÛÿ\0‚ñÔ½vïçmß@Œ}½·UëÍÿ\0\0àX{wû„·ü‡iµ}ƒàõ/Gm÷æ¹°Dsv¼ñbë½è{ñÒ}A‹wÿ\0(šşîH}şõ¯ºƒ¶úØ)hv»Qb58îİ 8’O¤ó5ò>ú®ûr—¸š¯a‰ùrK‡Äİ~^°°÷îõÍkXé{e$ÚK•òBù\ZAúô\'+\nú—O“n¶¤Öâ¼ß[Ÿ&9·Ş€Ú¹ça·ü¿Ã=¹OÍÓº¦Ü.\ZÛÕ¥!HT`s†®Uå=EOWn§>3í¨é¹7û)Ÿ(Ëÿ\0ÍÖİz;Oñ§|uU,=¿øãcdzC$ƒ¡í¶±é\ntµ³%ó¬z¼Nç´ÂuÎO„~ÅôN«››qºÍrrq+Ãë§I;™û­ÊİS´t®ŞÛ¸Ü¶]üßõ\r.BCŸ¥ ãw^¬™Ç´Ùtèÿ\0Í2Í.6„=Ä¯™f™Ë,’zb»ÿ\0ú?ÙRˆvfI-ş\'Ui\0\0‡jí@#ZÕ.Â¼·_ÆNë¸›ŞÑf#‹e›AŸÂ?ì^ÿ\0azáÜt}¯L‰Îÿ\0#¼»µÛ—´¸¹îéİ:O¼\\üËLÓGşŠô~‹ÅÍÔ÷S-qívò.ZA‡(+æÙóO0ÉšeòeÉî¿èá~î±“¿»	»ûŠ\rˆè\rp$?{Õ·ûÛİ66£”·§u?ºl}1“ŠW?ÆàbÏ’ò%ûê~?ô_HãŒ:¦<3¦8@ÏùbOÅ}¯ÃÆ{K¾º<.sFÓ½»‡e‘D‚-ÆÚX6ïxÕ¥€u×úÚ&_k˜yNÎ—ÏÎR\'õ£xî$Gqğ^®ÿ\0U¶à~/îëšæ—ÜfF‚BèØt˜ $¡%¿óÈãgaç=A?«¿Ûc@>Ùğé›ìÑÜuŒ»ˆ—„¦àö\0²ËÍ¿”6nŞ~GØÀÇ7N‰öB©iÓ§pJÛÕ»B2hÇ^£<Ä6fjÑöĞ}+½Á¹ü£7›¼!”xÊ\"#â<Wÿ\0`6¿åm;	Œa.—©õm„c“Á·-bœÃ›[z0Á=ôä~XáÇ?å&¾Åğ©ÿ\0òÑ=’ûíoõÓ¢—×·Q±ƒRtŞµ±Ílg}º;ÍÀ‰à·K†Ç§˜ô¸è¤v\nÇ¨f–-”òÉÄùI<H|yˆ+ï=KéŞŸØtËs\\ÿ\0˜¿bWû?ÒÒ;©ÂÚu­ÖÏw!`WtÎâ€n¶Ï¶-‹Sÿ\0Îã\\Je–|yº}ç“2ÃOŸi{`H_*Úoÿ\0³uÿ\0ÇcYÌ‹\\Âw¼]iøƒ·¹}ù¬F²ï¤Kíhåv½2=Ë¿Ìê-½Ãİöcv%¡Ü«Ÿë\rôpC§ö§åÇË“9{!–=Ñ#¹ug¨çê»œOr«šc”~¬\0`£ªÍùÖ=_ñô 2n:—Ks“.ûjC\rùÌcZz2O°ê˜êBc¼_r}?7á÷{MÀ¤¡¸Ù(ŸñÁupcÿ\0÷ùŒêgıC\'çMË`Ş5¤İ~ïù*8’RİÓ?XÎGô{™{N¿.nµº•ÏÕø0à<j»ŸòÂ.¹ùç§tÃ§k¼ê]#­oa]Ağìú.Ç¨ï4ÿ\0û8ä’7‚Ò„	P!ØòÙô=×P2Cn!#F>,iÜV¾­ßô¾›Ó?÷g4‡\0â\0ûı…z{®–íÿ\0\ZõÔ˜nzqnf;ô¬é{M-³Hûû–\\Y‚W˜ôü#ËË§?Â$üBCâÏ·‘ÿ\0™–r>\0·ÁyğCLåßû’1t¾Ü•o¯©¶2Í§ícwş°xô—ŒĞ™9ïäµxLóú™÷9	s)Ô÷È“N+¶û£¦ÇŞ=¸ú6Ñæ.­Ó7§}ÑçcˆŸeÜ=£Ó·9·c§\r1¨ÄøW’éÙô~§ƒ{/ô%òÌi,S<²ºş\nÛ6å ÍxöÄ…ä:”İgş¯s;Üıæï.ë¨=÷n ~­ÜÒª\rmxsŠØç{ÎËûvïq†øÄ~N1Ÿ•»İ—Óòî<Q¾Id#‹ïuÈº¼g¨¿¥t¶§ÿ\0Œõ›Ót0i!›ÜZ‘@#t-x(8%v=6CònÏÿ\0§Á’Ë.Cw/£~cnş‡JÁÓa|ùCşìŸyŠı\"í­˜‹´{»uüciÔ:6×lZ×´±½9…Ğáèšš€z‡|Ï¥Ìş3ù²Fd÷ÿ\0óïO(îòêL@ğö.ÔôÎçë=íÁ›>›×7Ÿ•ºÆŞ ÒíÄ{ zgMê.è=V8Ÿ³ôÇuMä®{ZöM»vÍãÜEŒú&ë¨déØ1Í‚Q3”CWå…bjÇæ \Z‚) bH_FõF(u\r®ËÉIC3\'	4ZQ>5!ÁW‘¿-uMîßm³éÏÇ®vÏ{M³fë}¢}Ü{­æİğu‰Õ¦dqG.ø±Ñnv{¶¶6uNŸ#ghl•­¾ÓpÎmÏO ì7[RLE„ Dá(‚äšÂc”Ñ—È6»íÇLê,gÉ¿Á˜N\\8;JQı™–q4CPt—tD6Ç¬¾2Òî•Ôz_xA¤’KêÑ7¢wUí@ıƒwnù4-v›`7[(ÀÜÆXÿ\0Š?<<O7/şÓúëv«ÚuXSkÔ6ÂéÏ\ZÄ÷hç]ƒÛı&^õŞõ.,Ó;·:CÜw/\\Ú0Ÿ±¼êlw~‡ÍmŸ#7Sêh8šóÑÍ.‰Óú,7›œã>Ñ\0AÉ!áOç7›mß(ÿ\0OH‡‚â=­}ïõe´S«mß;>“\'«ê›­;¬¤	N5”vü¥2ÿ\0øÄÿ\0,y>ÅáN)í½+Ìô;yDvü“–&?ÊİËÿ\0¨S9½@±É«w/_c‹;·î}ìo‘>VíšKŠs•wş¥€L38{b?À_UôK¡oqHí6ÇÆ\"Oú¦¿Ø~Œİÿ\0jõ½Ëª~Ÿ²èÑµqÚ_µû{}ğõ©’íËÚá‚Z¼OAÏô=Q/ı,æx¥ü`·²@ºN¨%‡¨eút›G$Od€ãZ.œê·uøkµ7QÂ\0İ÷ŸQÜÍ+WOŞ—·ºL€°9K\"–Û4ƒua®Ç©ƒ‹7Ó\"±§sàñ^ÿ\0Ô»¡¿-ükÛxHpwqŞåtOP×cn÷ZÏûMÇM\n®”HÉÌmO•!ÜÜÙA\"½Cˆ—XÆşVæñÿ\0`]&ÿ\0sÉèÜ¸§¾ˆnßËşì^ØØtı‰íİèİCnÍÆÁı·Ñzvëhñéšº{>üw¶¢Ù	naÉ_-Üî3qÍºÃ#ßŠœã.Â&X÷8^s!ÑàúYy/«t~¥Úg«ö¯~áòI¶Úö¾è…nï¦u¹Œ;i”\0L‘C9åÂ2¯©âÏ¶êØ0uøÖYâşYâÇÂF>ğu^“iêûN‹¸ôùæ–<æ\'ìƒ8÷?™ûWé_hvÖÛeø¶}«ÅKmÓÄOiIÓ¶ûÑ7%X[+™3ev¤!VÆ¾k±ŞäŸWúÙõ3	Ì÷“Ì/Ó’8qäÜÇÌ3Dà¢üÑü™ÒåÙŸ·•®ûİ©n¶·KØ#Ü;c1sT¢ÎèÁSér&&¾Ÿéü¼›ùbû¹´ÁÈ÷?ø½üÏÛ‰OgÔ#äÉáóÇÜeßà¤ûÛh©ÒËZ[ÿ\0]²èª˜6ÓöÛrBÿ\0úG°®IÁkæ½;+uYL×Ÿ&O|‰ûKè­ßáıW‹òå„à|b÷Ä/Jÿ\0®.ÓĞzSIõÏÒú±%IPÎ£#¢²¨(ÂøV¾¦´}XûÁ×uèÿ\0õMÈÓ”tOş£ú÷KvÓóÇä°„oßàRyê›n<O$`á÷âg¹Ì%Ò6ÕùŒb}‘å>õåºîë—ÓøöCÌw’›jßL|¤º÷±7›MåÏÊİÛ»Ü:wGî\r—Lêï³ËyĞû£mşC‹TQ†\0TëÄmB–ØF~ d<I?UéNI©WxÈwÁÏè^nßuıæã¬MùG;üö÷›:ñ7Ôİ»·šœÕ²5‘†·Â¹}7“sŸ?GŸúyö²‹qj|W˜ê\'toÎ}š}«õ7ñQ‚iú®Ö°õHºg[ÚïC —K‹ÚĞªtÎĞ¹WÈ³G$1s~lR #å?\0»…”Ç>M¡?Ó$H.ÇÚ|ò›­÷UûŒköÇ®M¶Ü4´bßDí´ŒpÒKšö4æ–Â»½äg“¶É<\"<YÇ¼.ªÍ‹8°ÈGËênâN×üû¿íI„{Í‡tvéb¦³Ò§ÿ\0?b,\nA#…zOYDo:<:Œú¸±eñ!¥ï\\ƒ““ppş¬©İp»¯¿öduşØİ…»îÍ›‰Uûoÿ\0®’0ã¡³î¥qMNã]_Q™—M‰ãíí^‹­fôÎlGÿ\0ŞA½’ÿ\0ÕäOÌÉ/å›10v~Ì\0®îQ`I=wşxz3<¿[tŞˆ^Cu‚CÌ =î¯ÖÓß´?\Z–†1²;|ep\'Õ.ç½Ï[T]o_6Ç<EÆ }…×¾éÔ0,_Şëï¶\'ü_Æ¨’Ÿõ~ĞuşNçi¼Øíu_I,~è¸-ílë£ô~?ÄuOÂ×— ƒ÷D¹GŠÏsÔOMé»¸ıLøÆ1üÁÿ\0Êáy{ı|éávOXëR5&î.´İ¤NÁÏÙtˆ‘å¤ı.İî¥wß˜¿¯Ö±lÁù6ø\\şöCÿ\0²ÏÇËµã’Oà?Úµ~r’öJêÌwşººVí·³â‘³E#Aùd|-±ôD¿úÆM¯ım¬ÇŒHOk’X!Ñ¦LY!1Úñ?¤ïÄR0öùÔD‘…Úó vı:°c5€æ·h$*Ş¼ÿ\0«Çy„²ãOĞ¾—¼Î7\'.àZröƒeù¡Ü{ç^“ĞŸ¤»eù}Ìeÿ\0aÍÛuÉ l›f¼kl/ÿ\0É©\\QM}N_Ou=À\0Gè°k7#³êÜÔ]G®3ıQb9cƒ7eâÄĞ¯Mu~ßëç¾ÚöÆÛ¨îÙÛıSpùûƒ lätû™ûy&ÃiÔ·1é’>‰³qt»†(¥E|ó¦õí¸ç<P{(„ô¿ZQï‘@tºñx%›&Im°¹ú€<Ş.Hæà.}ëş{í(;KyÙ0lC?ÇoE•šãc!Û7}¶Ş8}¨vì\rlPCŸ¶Ğ\0\0\"‚OkéùÃs‡,¦ç$ç\'&¦TI7/\'=á}§Ğû}¦¦ã§Íó$^E¼Ñf p‰6ì!uŸæ†´ôÇ½ËõC¿›¦Í(Äíº·O†vKòıöÊ¹•(ê=6WÜLÚÇ#ö/Ã&Mq!IbË(éö¯bşÛ\r§à_¡ŒŞ¿¨nœN%ë.asÜlÓ¦«€¯=/›Ô8†¢àW´Ú0ÄfQıëÉ[-×ù}ßİÊ2w\'zun¢\\	:¶ìî>ÒöíÅÊØàŒ‘|Ö½Y§¨¶»?»ƒ#ãÉ<‡ÚYt~˜ş¿©öFUæÜÊGÀL€Sñ¼,êP÷WO˜ÿ\0¤ˆæd[¸wÈ5ÂëY%ƒs¶ÜDüĞ›÷r˜•ì¿3¢ãc.Ñ”ò/W«»óÕ¿\Zt¸Üö>}¯Fÿ\0¡Ü}G_HŞïºW¬jqi,`%RÅp¥ë|K}b‘–Nqüb2^s¤HÏ¥DÄòû	xgµºù™:wL{A‹ õ>åë2ÆŠÁ\'N~í›w:õ´§w‰Ûz_{¹´óNGq ËÜº>£¹‘Î6ÿ\0s4üHo°.Ëwõ¯Ìc©#—­ô=”¥¡tEÚ»|ç\\1û…Øc]^Æ‡H2ÈŒ¹èÎìíNè¿uWÒı;\r®ÛĞ“;ØÆPÏ<ŒóL\"?ÊüÂî^ïü¿ì®í=k·:†ã¦tÎà”lû‡oúouôæ8¹uM¸i{¦LÖ:-Èïˆ!&º|ZY:d¶;ˆŒ˜ÛúDÖXdà‘_’BñÒãUòş\rÇO2ÇÌFŒ9´œ_Ë.#CuæoÏ\rd=ÕøëxõûRìw›9œÕ7ª27–	l[‚B)ázõş<İªb‰Œ‡ò?Ø²Ã—èåÛf†GşY½ıøÏlíà”Ğ×îzæv’àı‡Ux‰[‡}‰ZJ3^;v~¯ª£\Z|¦<mûj¾±×eÏÖw$5\"?v!x·í\r÷û-İ{ƒ¤ƒÛs´½š´ºi¢Š8ààÔ”G»\r$:kÙõÉœ^‘€Ï¹„†\0ÓÜ¼¨7Šê-xíö°Æ>\'ß%Ø]_¦EÜ}¹Üİ\nÒ±ÒzŒ-Çù›`éöÚGO·AëÂl·GaÔ6ûøÓéfŒq-/q^kæ8åi‚>ÑşÅÕ_é½Ç~nöÏ:dé;¨îŞÄr5“íİ·˜¹­!K700µù\núæ1oøˆù3Â1ñŒ„ƒ÷ƒî^§ÓHâÙnº\\ÿ\0æHwÀ‘/ho`^ûï§€îÛˆ€å~ög0¨ô:FDK®HkÀ5â=4>mÄÏlÚ½q‚I_q‘ÁÖ^æ\0Ø¶ÿ\07¬cA³cgQd€Èe_Pé/,»Ìc]·şÒğİ[!¡î‰“ïİV=çşèè½C§GPé›¾«Ô¶Ümöû¸\"İÅÒß¹ÚNı®î9ö›‡Á¹…`‘`sC+å]m‡y/Âîyÿ\0,m.Y“88æ‰¤ Hv+Õzªeé=ow»À!ø³Ì\"e.Re\0%iÏÄè@+õGğ÷ÿ\0(¿—º7f~Ù÷Ïfì1ïÿ\0(wfÏñßHØöü+°zü}IİEİ¿³wI¤lbígìÎı±h‚]”DFûî\Z„”~c~PtÉæê¹:^èì¶{\'7.@r@DCêd>wpÿ\0=l4_©/ÿ\0?úÿ\0ãv=«lñîónòC&„ù¦D\\Ä¼H<¦«öCºzWYÛtŞ¯±ÛõÖl›Ö7®û9;m½ÙÏ¼šÒÁ›÷Ù……Îw©¡€ºWóK¬ú»×}\'k>ƒ„7IÜfycÄğÌÏÍe/*ê(.Cûûa¸é›Ì›|›İœw2ÇŒ\0e9@ò\0ã˜Gå&:QÍŠèÈåÙ?ƒûg¡uoË¬ØtßÇÏîM¬]KºYÑÏVíşİëo‰ç¦uñ|Ë?Hév¶3zÈ¤d½¸¾—²õoæÏ\'¢}°É´”1œóÅõ‡â·b§nG/Õ›iã2ú™`â\"LAé½sêÿ\0Mú:Ç©9ñôşxâŒåÃ€J‘æ`F8ó4DˆæpW:û)şµÉ±=F_öğk6íÎáÛ‡~Yìs§oM•Ò²6õÇnœÖÄC€c„\n‚½¤¿(½I²ä¥u	Ï³ÜŠ“fú7z7k®„zïÒ0ÂwºÆ[sglF$3»‰rAv­×óÿ\0ÈïæßÁ¿ìNç»zÏàİ†ììûa½t÷·w}ömz}õ¾ƒ¾í—ÑúçJíÆtã6Ïe¸=qäo¥İÇ.ş(äÚÆät¿Ôı<zGÕ“éØöŞ Ê#³Èa,YDœ˜9‰”¹¦Hæw8d! OÔrb?	êÕŞŠõf-şûÓXŸ}XğåÜD§¥WŸ‘©“åxü­ #%äÎéÓÔ?öşê5sĞ{{tZÓóµ½2]™a»Z?ä—3jöAÁê\rÎ)Pı|Ñîy>óg¦7ck×WåŒöÙ\"ıø‰æˆ^ñÿ\0>—ø»²ºtáÆ8:Wjí÷,\0¹‘ôÆM¹hz4CÊFu×låõ=A¸œXró¶­Q»¼#—š’£¹‚üÿ\0ìİ¬ò÷wXİnN©vOß2b\ZæµÛ™w2E#®I^«Mù\Zï:ìÛ<aÀ3ñ ÿ\0jî?1·CØìãA’`ñhAƒÿ\00ªëıÚù‹¹d!;xç\"é~ç¦A\0vêq}¸å^Ÿ¥gåônÚ\ZÎr‡€ÉÍğá×ôæÓñ¾§Úag<f{ 9Ïû£à½ßø·îËÜÆXc“ªtµ¾sšÂ$–N©#¶[i{‹Ûd48\0}n\nò~£ÏËxœüÙ\"<“í+è±Ÿâw9ğHà	­=ËÃŸ”„±İ=tm¢ypíö][¦Á59İOqÿ\0á›øÀCê˜#r%ÉJôŞ‡÷MØä-¹,„Ÿ¹ã ¼Dõ&~‡µÜãÀÖÜâõf	G)-Å—wöiGÙ}e°Ü;¯õ­Ü;«ËÔ·l‡hbbéÑ<F\Zõ\Zñİ{«¯ÔåŸ68ÇÓÃ8ÑûäkÜËÌæùrˆ^\\¥ÍŞNçÙnõĞÇ¶s?/~BÙ±…âw7©}–¨.lñôò÷4ı!ßå½íÂ½®ÖG/¤6ûàNİÌßŠöşÜœ=[w–969<Z1÷ı«‘~,uôé%‹ü˜§èØíÀc„záÜô½Ûf-}„N•-kŠ9à’\05Õåürh`\n†ö-zH\'¨mãŒWêE¸|ÁŠú†v\rê=×İİeÑ…é;}¯om¿ú{¾§¹swND¼¿ãmËNhä§ê¬¿C¤ívq-õòK,¸ˆ\0\";œ¿zàúÏ{øî½ºœKÃ£‚<9|ÍüN»ı—m;ki·kš\0ê]Sì«œ¥½3£la•ªïV íóQ¸ÕôLbrÛÄi“ğ2ü¢0=1¿:G(xÁÇ‹2á†Ëv_‰v[—µZ7½Ç¼Èf-qN˜«¬õ£åõ>húx€şWûWÍ#›,0ni¸ä²ø?–â“ş£÷÷G™ñ:´=¯Gùı¯Ö\\É6±î€³ãÚo£\r à£…iéyÓÜz{9¦hœ˜ßîæÇvıèüßÕÙÌ‰‚2á—,‡ì»àBéN˜Dİww+KL0lâ‰®@æ—?CšÖê°%­.z‚&×c†\'p•%Í\"Gc8ø–kU}+Ñğºì\'\ZÂŒ½Íÿ\0.Çümê“vó¸GÛıªu8ÑHîİ„+a+%’P29Õõ¹ıLÍ¨w˜cïùÏ…—Sù¾;¿,òm°ÿ\0şcî1÷¯}u.›;7¤ígcL;ïÇ=äİÙsŸ\"İ¬oÿ\0É—RÙ¹Œ›1‚+¢ôÔ‰Í<`ÿ\0Ìù cñ4â»_H>Às\"?™ÿ\0HIí¾—»2}”-ím¿vÁÛº2ùb•óô‡TÜn\"ºn7sÊûXIÎ«Ô²1Édÿ\0ÌùqµÖ¾¯|ù7ñ7ùDWƒÿ\0(D:äh·m±÷lôİäÅÊ5ÏÓİ7NêûH‡â•ÜtœŞ›å5–Ûu(ÿ\0@\'ìpÃ®‡Ğ;Ó¶õ,dÿ\0Os†P<L~hÿ\0ºx×½uŸRvµ°Ü9sÃ,.(\0i\0¨r\"’×¦él\0£03Å’ÎHï±©ñ]÷¬ñŒ]sêJ‘Ÿcs.çüA’ôŞ³ß}ZwË[}ÇmvØœ’ŞŸĞ:kß»ê‡h\r£nëvıÅÆºÿ\0SÌí¡¶ôşÂ#.V×,ü€şè¯ˆì_2”ònæñs“,¹`;\"ìÃ¼®Uùiíßş!êÛ–5ãÛÛØÖèÇïX\ZODÕÆô{áõFŞ&í’\'ùOèXœÛÃ.ß#sÀ1ïŒ˜®Qş±ÊÙûyğ8·LC§Ë)R53}Véè×—7ş¾àİõÌ|™3Ü™½œÒ!}+o­éNMA9ááõ&ÃÁuOæî›şqvY¨ıô›ŞÔŞ7–M®ïVÆÉi&Òà\\_Jåúı7y±?ò¥ÑáÌ9eàõ+ÌúG{ı¿¯m2H´C†]Ó ~D?rùCYÖØbŒC=Ùÿ\0ã¹KÃ¶û~™¶ûj ë,ˆµ¤İ\\Òs§O¿y~´Ÿ‹’ë¶ë §¹ŒÅ~¤ŸÌj¸—AÛ¿\'ş3Ù¹šZíæ×©¶\')\"Ù,Ğ:C}NeÉr—ã]´äqzW©d>£?}Çà°õväæßtürû›(ç\'ıĞıÁz3¾»N÷èC¤³C:Ä-=O îÊmú®ŞGIZ±l[ğNÉKNUázUŸFêPİJ»B92ÇIc•	ïÇŠğ¸¾|¦„Æ‡°»jè/Æ‚nåî®…ö	ºıWêûy¥Ìßt¶¿g²„´\0~÷p¨ŠR½Ç¨!—±ÜåÀ_xÃ\"¼riÄãÅz~±ê\\ıkc¶Ûî9¾¾Öç?­*Ë½‡ÍÅÊ÷çÛwşÁÙmËKäé½¹Óz‹u0™bÜtyw\rcšÖ±ßÈ]©\0[\'éÜî2âı\\„xøî½?Âî6Ø„°˜ÿ\00^ìÍ£ü°ö„šu6mÆãu¨g.Óc? †0æªr8“^Ç¨çGï1ş ğœÁ÷ÕxOTíÓÕ[¬vŒ¤f	o‰?Ú}û·’.ãé[ÈN—nÆÚ&êÀî Üë±×²Ö6<kÊt&3¤ğ#ı—â½¿å®ëêtİöÊV„¹‡t Çßzıé{hú—ãîíé‘}½ÆÏ¸v°´¸ºéR}†—Ø)Í-]/Q‘Ç×6¹\rIü~f?Õå6\0\rdäw¸à®ÅaøÏ­îçôµ¸%\0‘èŠ>!¸–ŸùµgïÏİƒ›­àÃ\ZŸ­†><Àı«¦õ>ëñ=b˜CkŒÄcsï+‡vç_weÿ\0¯{˜™¸û{¾îèı=ı!lÜu>¿İ=/¯67&’6û-œRbN‡´§Í§ßõ˜DõbG›˜¿°Ÿ°{Wk·”?ònÏ,ÕrÀÿ\0Œ¾Ê?1¬üWÓÎ\"^¥Ür‘€ 9¬!n.xÿ\0[O›Ôù¿g!î%xcÇ¥eñ\\g¸:ô{ÿ\0Åo£îÙï©7qÒºvÉ’üÿ\0w½û]3y\rÃ¾şÕÅìQpÒÕù«™ÒvÛúŸh³É&ıXÅçÀĞ±û«õ§F=3¨}\\1m–î Ç°JœÃ¼\Z‚öGàév½¹™Ú¬ıı§hl#†’‡a>Æ§{ƒU²øóãz‰;½®~£7çáÇñO²‹…[Œ¦_÷00=°rçÀ€ºƒı‹éN†NŸ¿šdÙuN½Ñ0pÖY!Ûu\r“\Zl\ZØ_.à·›‰¯gÓçõ6qœ›Æù¢ø/£l2?§úŞL`1Ì·ï@°.¿ü\"Gÿ\0“.Ñms®Œ0åD|o\\/\\şÉ”ŸúX¿İ_Èíàü~+±4ôŞòï½lLÕ[í¼aC›µ‡ªE¸…¬h\ZcÛïX¤ß5¶Ú_a€˜¾®)ğ7_[–óñ~™é¹IyBíæÆD}à?±z/ó¯J‹©ôŞËëd+ºO\\|íF‚]C¤¸ŸQõ‚&¤\0HÎ¼OOÉ,X÷^ÙGü¤…åzöYaÛÎ1ûóÀüßbñŒs›şÏvfÉ’9ƒ·ûq¥Ïc\'Ûš^Ÿ½İ< Ó¨î\Z	6_Môî3‡ÑÙóšK6æDwˆø.‹§Gªm€?4Cø±?¡tƒz6êNûëİàÿ\0™½ï½ÏG\r$ºn°øšæ¶Á¾™-]~ş\\¢0ÄbOy5ŞåçÍ—!ÉódÉ”¹í$×â»—²zNãñÇäïÊ?Šç™îÿ\0«êuîƒ;Él›ˆvæ7‰ã\0t»-ËP|Ì4ıQ(õ.‹Óúşòı)Ã£ñæx¯+—°dË·›œw†^Íê=n.§»éTÊÈÙeï÷»™T†Å.ß£õ-Îé¥#şHKJq®» íÉÛÊ2Lør“ö¾•Òˆê˜6øÿ\0Sïå“üØ(5ôÎÈêìN·ÒÜB\">8wp…ıL$Wgè©˜º†Ïö!wÄ‘úÌŸéˆL}Ì„x.œì~£ÿ\0_ùƒ¸æv‚Í×Jü¨`ÂÙ¶³uxš$Á÷\0ÕÂ»ıÌÛ§JQğÅÆæieÇèû±±õ§Sœk›Y\Z~ĞÆ_Û&\\¤õ/ñ?tÃ$»È}cuhâwˆûo¶6»XK[êwİÜî\ZÀ™5Îèx„ºæl’-ìØÀsæ$û®D”OCÅ’e±Kq¸‘4òŒÙI>Êúı+¬Ÿ¿¿µ×6ñ½\Zgîú|‘ºõifØï%Šfÿ\0Şu˜$ßÄàP²ë¥ick°Œ`0Ë1h’@ˆì¯ùZ\rÆ,\\:âìú§àğï:¼ˆPÜ><_û±/›$ÇgÓ€„ [B/n~=è,ì/õÿ\0¿?2n£l}o¸ûw{Ñ;[î1Ìÿ\0¯è{ÉáéğM·b4C/pnŸşU€]¤[am&¼Fÿ\0q>£ê·Cô0Î3˜í“8÷oß3à½—Né‡¡útî2\07»ˆoÙ„;ãe-yå _”.»ÿ\0\\úHÚv§ru—4‰:¯XÚô¨\\B—múnÜO08‡n\'¿1Y~aîş§UÛì£äÅ„Ì÷Ì°÷ÕÃåÚšVs÷Gı«·;cvwİÃÜ±:Ñ7w·Ø±·6Šö²œì÷8×Şcú[,YåKÙ%è7Û8ízoMÜ\\Ã$†NQàÌBWú½ÿ\0§õı“œS£~Cˆ¡}˜İÇÜÁ±KAÑw-ğ¯ ú¿ÎÅ²ìAñÖş›‘&=Qïp¾wûÕÕº$ık t]ö)úïLÙ:æÎ­İ?m¹Ÿ?LfèLsîè¼1u\\€¡x¿–»mÄcøœ°1Á.nB~÷—™¸Ôz‹}µKwË§!à†ï.ıË³»J!Ûöÿ\0İ,õİ»Òw0	KºÚtİ³àf—s‹•^Gm;®­d¬N\\§ÇšMúW[²Ç7UÇ D»v˜ÅÂô\'ä¾–îçüŞ=:ª^«Ú»ÎÙÚD‹¸‹lİü$F…¯q–$Bàq®³¢Ìmº¶(ä¤~¤±ËºOüè^Ût$2ÈÂ„Ô|}½œW„?î¢ë=­môiÿ\0;o+\'ˆ¢G6ç¦îö“Â@h¼sFZ¤`Ñ]çZ3Ã¹Å’Gú˜ÌGòMÁñÖú«wıÃ6Ã¨Hyíşœÿ\0z—·˜Ùèî×ív×}Îæ;îíúÖÓ¥‰H\Z~ŞÖ\rÌ¯G¨;Sƒ¸WeùŒ\"z†)ş¬c?hp}4§,fñÉñ\\[·$fûò¿æ.¦×}¾·Û=&\"@ÔØöûc#š\0Ö|M_«ˆÇÓzvŞ>_£–G¾tİV\\ÛÌ«ş£{\"WTö»twwEc€ÿ\0¹„£M¿õœHğ(ê/G“ëŠ?bû_¨ä¡&C±Úâï¯\"ïÄ•›öO¦\\×;d÷4\'®}RtmW8?ãqÂô¶ß×ô6ê&ø·3Æ ¯‘t7QÇ›	Â¾GûKÓºüãø§n@ê­éNÜ»ƒÓú¨.p²£#n›Ö’È0úk¨îÇ›	ÄŞô§Öˆ;Üô¹öÿ\0±p¯Ê…İKº:G®~ó«îvjÀÖ¼êêVFK kšâáÙò8Œ£5×úzérÈÿ\0MÁ—îÀ9·mq+¾ôöò[.ƒº0?Öİn#Œvòˆ“3â$Ş+ôw¨–tnßê`hoOé1tØÌv˜âÙ5¥®9¯\0¨8­y¹;î¯	šıLæG¹Éö2æàˆ—?8xòG}xó&×oãŞşÚíœ×íöÛm»àsH-1ÁÔö¯„X	^› F8}[¶„<ƒ<Àî1’ùäá3Ï‡’<Àw	.Àÿ\0JúßCÿ\0Ø}ÁÒ£ŞÃÿ\0¸ºfàõ>¡Óœtî[ÒÒxöè˜ïı]¹•ÎcœÕĞûQZzûg¹şé¼‡ğ¹2˜‰iÎL\\ÂŞÕëºú­œKdÛ™8á\"dıÕbº“óŸö™?tÂIlO›©½úš²u	%ÕöÀô;LÅEëÑâ|>œê™‡ı!ìoµuj|İCM„ŞWÙŸ|÷Ã¶¤¬{ˆAP“G¸—pO5kÀŒ-ÓÆnÌ­ş_ö ìD½0:ƒ|Ãxaá,`üG½tOçèæè½İÙç³Vn²Û8Ì=#üîÜß‡ÄK‚)0¹¾UôËü±ÜôÍçKÉåGörF¾ğº,ÄˆbÌ<À7ŒK…ú_Ü}j.«Øİ©ÂZYÜŒéIk™6Â-ëÆJÖÉ1Ø×€é;Yaë™qš}1í“ôm¶Q“b3~¿/ÁÏ½~rş}•»ŸÉ]CiAØvÏo6—,¿rélP2VÛ\Z÷›I“k+¸Ä®«CëG$jÑÆşÊºåŸ†gŸÅ=)©¨ìº¯\\Û‘‰?oqí¬xàC¿Jóş²CÕYgÛSöû›Å“éıúBoü²z+òvüí¿şVÜ7Lnßì»kdÖ:Ä\rîólÇÅ¸23’‘?XÙØä#ÄÒ½çQÏ³Ï¸Ğ—5^{übèİ²êó½°³}Ş[Íü²»ÒOCÉ±HÄD5ÎõA_UaÚÚ±b‡s¼Ø¼FÀ7[ı¦Øÿ\0ÍÏöĞ½yÔ:¹è½\'¿öÍ‘7Sõgtı±¾©>îïw·ÜJË’ö\Z]ÆõÒõìdeÅ“õyâO§é^·Ôÿ\0Ó²âÉ,¼£À}Áx§Û;Ê¿—ºïBÙÊæôÿ\0Æ…Õz„’Åêiê»]§ùMÛ›«uÔ§ldØéaá]şÆQéçMÇPÜ\0;y]‡ùCø¯´ÛûÈ`ÓL}ş4\\CğæÖm×åşÇ¡¼Şn]§V˜¶Wî\r®-#c ä@5;y>Úqv1.é¨^£g“&=Ö<˜,¹dqq\\Ûñ$ÃkŞ?˜zÜâ`îûhµ±Ì/c:ïm3şÛ€s™+I	këœF[n¼¸å|‡Ú¼„âß^\ZŒ¯ï!{Ãñ¯K¶ÿ\0¾6\0?Êo^ß¸£ZLK©:8€-ù€ˆ\0ã\nğ\\çwÖ6ĞıQìyízfigÚÃ4¼ßHû|«Ê]É\0Şş_ŞÈ4t~‹°ná£QÒøºÛo˜H\Zd}Ìnr[P<kÒõL¼›C÷²0î~rıõÌ»>½½ú‹[K6äŠvD	ÉüXx…Ö_üÇla\"OıË¾,\"Ä=»h´¹¦ÈC¸×7ÑáÔ‰Á‰_7Û1ú ‡Ö‹ñ³¯Oÿ\0­½,ÁÒúNàÆĞî¡ÔúÏU{Û„‘tØ#éûV<û‰Y9n_òÎ¸¢É(té‚ÍÈ\0ş)1ÿ\0t/¶ú«/6û?»	?ÌHÿ\0„.şÃ»¿”º^Ñæ]×Ié»\rÁcœâèº‡LÛA½1iÅ¡Í‰úS+ç\\OOJ;ªtíÅ±da/ãxŸc…ò~¹‹wœ˜¤óÜğ•iì\0ø®¯ÿ\0ÜÛ=ÖÃñçMé¬‹oµÜlúê]¬\"†Ø·Ù„ùUúävgP&¯6Ç.-Æû.ä™d„òcs\'//\0Ãÿ\0Úôw¨u½Ä¥‹m(cıæ©º)ß#¨_óãSeøîpovî	²9Ç§ÈÒ	À«|«¶ô7Ï“¨áım øÉyA\"!	j3~…Àúİ‘~JëÛU?n¿Û»N§¹ ÚtÍ©@Û¹Íûh\0½N|‚{|9.àŸ±zıÖÄï2î\ryæ\níM¦å½wı’ïŞ¨ÃĞzWW‹lC˜æiÜNÍÍtDÇéÛu	ˆ, á\\ïP‘·ô¬1|û¸~>õÄõ^©ÖrcåÛí±ãÊ$}ó+¿(ÌŞ›øÂ]˜.ßtN±¹Ÿh¶M×Vƒ­Èù©¤1£¦¦¼J´¥Ôt}\n-ú“—€‰ÛìuêıˆÇ&ÚQ¼0J~Ñ\'ø…æ/ÀM^¹ù\"LGL€C¨î.\0kw^·§Oép«#şH¯–ÇæYvÌ|I]¥Ûî?ï»ç«²VÇ³ÚunŸ¶¸‚ùú¦çwºÿ\08Š Ñ·ØîšŠá¥M¯ä÷xbzNß$¿ÔyG¾\'š§¸üËÚu¾3èş—¿ÿ\0õ1”áß9|$~ñ^nî.İgCü§Ü=>&ˆ¶}Şäé­j€İ¿W‰®°´{‰ÃJö¸ó¥éÍîuÏ8ı2H\'¼DÅô†!›ÔxpŸôç!‘¿t7»Ü·væÉ»¯Ê=ƒ´wÉÿ\0dz“Á$´ÇÓ£İHÂZlªã¾´ÜOèúk©fúqÆ;æÏí\rş\nï1·G/]ÛíŸäÁ„ŸÔû£ğJı,í=ºş2ë2–·Vïu»İ.§8C<1M?.’Â™‘_7Ø^©·G´ºŸLÁ¶Y$o\"}Ì¾Ş×e²‡¯öYÚ	·=7gÔ7ÆHô}íéé›(åÜ¡¿ä9Çmÿ\0¨Is¸×«ëÙŒºSTm£xáEësæúñÚÄ¿ôöÍìÿ\0Áyı¢í˜İ÷xw.óffÙmö}1İÏ³Û™ÛşÜ|Ğ¿şÃløÿ\0å‹­ö¾òoóö’³şVË=R4ŒıÔ÷wØztOË˜OÙÉÊZ÷@9$\rÅèü¯¬mç—yš8ˆˆ|f— <N1F4v”ÉüQ!IÓ¶}BhwÒm/FÜo™¡ĞuÎÔîf}“Ö¤é\"}ößmÍ˜¥2\"1Ì.÷ñÃ–b\0Æ>p?Vp¬£á#ĞÏP@õ}k{‡Õ¿—ßà§TésÉcËò’5å”œOìk½şºt&íûKzw›ˆ‡Të=ÒşŞİîf ˜öİñô½“÷ÂÍŞ?rİÆœÄ€W†õ¶èeêØ6¸G.ÓÊ<%óHŞVo¼^ş\'<‘5ÜHIû³ŸØ¼³Ğ„»OÁ}S¥L\ZÙºwæÇtÏüBcœÂA!Á›¨ŠI•w™ ¨¥1Pv“ ÿ\0öóÁâº>·bè{¬QsgÜF>ü£Áã§ÕvúÏ¼oNê½±¼x$íúÃ£kWşMNh¶ói»CšÑ¡yÍ{oUB\\˜£½{(½¥&ñ_Kü¿Ç3‹}¶¥°‹ÿ\0	§ûÇŞ¿@¿#tÖoú0Ú½\\î¥Ús¦ËèFvŸåˆKdOù\\}\'ÿ\0¤ ¯–çÊv½j;˜ŞñOßûWYÖ`?¸cûøXøsĞ¼mÛ}Gü¿À›}ŒË÷ºGä\r¬,qÒC¾Øu&J/`fß¥Ä¿˜‚E±÷~§Å{éJ>YHŸæ_¥w|ÿ\0ˆôÖÌÊ²Ã—&3íé.¼êÑƒø¸¹n?&nvîå\'IÙHÂ‡âÃúW; Huˆı]©—¶‹§ê»ƒı¨m4;®oò½gŞ’Ë²íİ¬»ysíGoı™,|[Xœ\néDá_1é°†ãza?,å‘ı²\\ŸLmpoıE–à>‘Éÿ\0İKáqÄÃ:”Û.îüƒø¨Ã·ˆÉ³ÚuàŞN„Í×§:F3a&f(º %‹ÿ\0\"ÄW{³n™Ğzœ§\"å\ZsM‰â`ºmöÇqÓz„ö;ŸõpW¼8npGzö§ãü=kñ—_ƒo#¤“c¿ënq\"-ŞØì÷/2l°É­¥3o…y¡ŒmºÎLAœ¿í8ö1^«¤bÀ:v„ó˜äeÂoQàËóóı†Ø¿gÖ:û›`ƒ¨KÑú»XÇ(sº”;Üº³?ıì¯%3_Tèwøe&æúsÿ\0p‚»ßZåı\'²Ë ù>¤Cö4dÁw×VÚ;¨t)¶ì\rt“öôbáé3•°¸Œl¾U‹ Å»6R|Ë¯œl÷‚ëxwŸôóFG¸O¹×k®[¶‰ÛQ«?âÜõŞšôsœuÈ÷o\Z¨„ÿ\0’ˆ•ŞõèJ{Ïæ‰‰ö7é_SëÄO¬æfb\ZŸ¸ÅWäN‹Çò—SêÄ ë=;··3-\0×Á4[’ämZI7&¼××–NŸ¼!!âd[â¾sÕò›¼[º\0>$²+Æ}‚İÇ\\üyşÆõm¼ûJi7ŸmÎlĞÅ&÷s0û„‚6ò¢bp¯°õ\\?GÇbì!€;Z\"‹N‹“$a¼2G<yO]ê¸ïã¯Ç“şDgYíí«Év]×»†=\0»¼ØmNëg¶r‚Cw;‚\ZHÂ¼Æ>£SÇ½™ùxyJÓu¶;´±‹Ç7ˆ¯½z+ılïMÑ;3{¹“Dıw/iõóvmã609·m+Móo*ê}_°ü^Ïèî\"2G³çöH.ŸaŸèî°nM¹„eÜì}Ë¹û§zÈúO[•Òµ§wİ» Œ¸ƒ;—©Ê^Ë£ŒMbİP:¹Ì<½¿ü¸â\rÄ–÷/o×pıs¹6Å<dÌ~Õå>Ğ?ô?íçoÈ×28z‡stıÆ©5hÑÖú<»yT\r*÷[5Úfm× qN^lpÉŒÿ\0‰Éô©ˆuh¿–qé¾ş_ó›‚±õ¾·8‘H]´Z…€q€+ÎïòÓğãıhÀû\"uêÀ†ÃğÆóÏÍü ş•áÊÿ\0•ù{¯0z†Ã·öÛR³ttˆ‹³V©«×ô¨ı?C@š}MÁ?ş!ıÍí±}]ş<«\0}‘%zÏğ>ù¿şLÿ\0oÆÇÿ\0_¸Şíe~°_,›>µ,q\0«R)š/–ÂêF\\5ù±í{MŒÀÇZƒö¬ŸïOq;gÛ©Úğ¼4u¾³¼ë»˜ÚQÏÛt˜Cv¶tÆéEÎå–ÓŸu›y!ä€€=„İt¨Êa(íÅ^F_£â¸ïlìGkş9íÍ™j?§öÏıá—î÷ÑIÔdQc¨ºFŠó}[rz\\İnn\'¸1»È>¥úg&l[XŠ´cã#şÕÂûÚ7ou¸uKÓa¼\'ƒ£êíõ\\­™%w^ÿ\0¶õ\nyÇÛ»/Pm¡µêÛÍ¬)I‡po°¯g¯½DoûK¶fsÂïû§=Ï–Pà»2Ñ#å‘ÚCÂJ¦†âk®õv	DJ 9†êC´üÎŞÚ/AÓIÉÓ`ÿ\0ôöĞ¼%×z—EîöŠ£Û»Èú‡D›º÷ûö0î]½Guº’¸,‘÷5¯¸q‹!¯e<Ÿ¡wx÷Q0Üœqæ‰¸$@W‹h¼çTêê=XeÇXÂÛÉ~îÅíïÆOƒoÖ¡ŸSÈßM¸énIm¤ÚXZMØÉ7\'<+ç\'o\'>f|°”|\0 ŸñÁsı/‹²eË ùyyAì=;×ÿ\0k¶E£ÚıÇ ˜ºrŸ½!ªcÙuÈ>Á™ÇKŒmƒs¡	\nÜ]‡¥ò¸Ï·ó\\‘­I–ïc¢ô»=ôún÷ìy#0%Æ&’Ï{v/6~Hˆo?²v‹ô©ºê2ªXİ¾â}‰-K†¢p»ÏLÈbõ‡Ów†hå0æÆuìq‡TßBıs {D¤d²Azóµ¤£ÿ\0¬s¥ÑöS÷ï(İN›sûr&\0‚×6S¤€o]6Q—¬ÆF99}Œ¡Úä~•,¡ßè9ö2òOAÛô†çºé»>¡)¿ªMßwm&q\'\0JÎ»«?©ëL½‘Îb;†ÕúHˆú“§_Íñ†E¿ñz:§VÍ¯‹¦0Œ´»w0+â\rpıJ\Zû[\'Â+Ú~hHŒ»Z}O5Şÿ\0ê,­ƒ¥÷ïH_úøëğ4#HnŞN¡­km¨¯Üp¾ËõÃdÙôıÉóO	şAú•èMø<øëL¿çÎé­‡ó·åâcgGwSÙA€XÏë€Ã¦Ê#ÃsºôÆ?Iôüq§ÖÎf|\"[ì^su\'Şn&”{Gè\\ÓğÎßşóóÖ¶4º.ƒp÷6ñÎ\rxd²kØì\"/kU®s÷r9WÔIã]vægmĞ\'\"åGoæı‘ ìªú]Ô‡MØô¨†´g&ıiÕ¿„y^Æü†è$è›M†áÌk7/ßo‰~•ìväí‹á©¯~à‚1T¯5ÒvğÍ\rÌæ>Xb\rÀ»ƒî÷®»ªaÅ“£äF¦@öØı‹ó«ı‰işOw,\nöîºÄm]MÜlæÄ‘^ûĞ?6>¥ˆØâÿ\0,‚ğ’—.K²gì+ôµz×Bêß…{OqÛ»èwı>}DéFH‰.‹°`gSÙîcw®ÆßvÇ±ÀàA¯%¦ç©òGu	Æ2}b@:ƒÛà¾‘\rìzŸPÄ^9Z÷·xeânÉ—şÃóæ¾ªçö÷pôö8É÷Q­ê‹H\0tííÊ½7ªAÅĞz^Ö”æ}‡ô¯¸‘ãq3¨Şÿ\0ö.cÙ]EÒó}[àİŒ	X$˜HĞ‡#ê	^?¨àä‹yğÄûC|BízöĞl7;iÄ0É´Á“ÄÄ	{âº«ğÆéßÿ\0ÚIº&¯³²ë]W­t‡zXí·W†]÷O !™´&Uô¦½zè×,pÂ^0ùeğ]~Ë\'áº°o$¤Şô½&î>™·,k†Ãc¤‰Ä\0ââıÔ­*tµÎcPò¯éØòl\'”»O)öße\"\"5\"+ñÿ\0¹÷#qVêq´±’wÇRİGuûm|ÒJÆ®a­h_JèM.§—ëm¿âoµx¯ÉÅÔûW¹:çW=;¥ÍÖch|ÓöÜğloÿ\0®t!²Øh?Kß½Ü± ãzù¯§ X	G<£/İŒ‰—°EoÒwØõ¹²yÜÂgİÉû;òÇe¯İÇş›~LïŞ…×ûÃ·o»Ëò_Mí.Øb:Ïq÷ã©õÏã®–fßîc‹g³]Şì¥’hâÜÎ\"…Â8%{ƒ+‘ê¾õië§Ï=ÆçéâÉ<’1Œ1Â¤ñŒ‰xÆQ yVQg_Eô_¨z7£úÆÃ¯ú‡êı=ŞY1ÄJSÍÈÁÌ¥Â ™LÈŸ—•ª¿G:Oÿ\0*¿”¿(w·Dë›_Æ}¹ØÑjNÌ›ªÅÜıÍßÚ³u7Xƒsİîéñm:^É›\r¼¬ØÉÓöÍÕ;NáîgàCÿ\0MšÉ-×÷\ráİuÜ1çÅ(BX¶ødI”²e‘2}IZ0Œâd¿@ô_ıVuŞ«Ö\'¸Úl#µôîŞ\0Î<ùòâ‘\0IÚ1Ç*sˆ1 4g\'$GÙ?íû!ş½÷çúMù_¸ö=Å´ê§¼{W}Ú=²7Óm6]ëÒûÿ\0y³“ªthúßGŞ»¦m»eı<õI÷Íû»Iv{W¼’É$lw„è_•;¾ë–-´c‡«m·x²Ä¶!8Œ“‰¿R„(³<òÌGæo³şa~iz;­~Uo÷ÓË»mÎÚX£\ns}iÆCL\rDã02rÉˆÌœÄ	ä¿³;mÚß…ä)÷¯fÖ^øµ:d2…›¨í£ÚM¹}®Ö6¾iæ;×5Œ†ò€\n-~ìõFâ{®£‹¤m¢L±`ç“X=FÂRËù“ÓqáÁ·öDCm ¤ÀF VR,,šR´ö^ÿ\0»7İ•ùkeÛ=	›®¼ÚGYê“NÍ]2î]±ll›oRİ\rœI­Æâ´:m³A¹´6ûœsäpX¡-CúÒÒ0:d+‘.£¸İôíÆ„º|ˆ‘É0aÖ8â©‘ô CÈWqş!í·u¿Æ½\"]ßWê½SyÖ5t\'m÷[é¥ØtÈv^ÁµØlKÛ³…Â>Q+ÜJ5¨Ñä=Uœàõ&\\1Çá8äxÄ	LÌ<¤MÍ\\\0ä\0.MW[‡4ğeÁœE0\Zò=9Œˆ³›¯ÒN÷’>Ÿ°è;flæ34?ĞÏµÒ¶P†™ÒÏøıZE®•æzúÛÎrìAÿ\04‰ø/}ôëå”Ï°àoÇ›`:Sß\04núˆnâ¥ÿ\0ko²H×’ÅçpÃâŞf»»Yw0ŒÛ˜DÖy§±p0·ÇqÔ6Ûbk‹oìæ˜æ§€¨;ë[ÿ\0/÷@>“Ñ#xÀ9¿áB-ÁŞ°+ÖôÁÿ\0öÎ•üNVÿ\02=ßù§0¨ÛÉ¸|¿¡~™~<ÚEÛıµÕXXcÛôN“²é©-¥t§I»’!ˆt³‰% _SÎuâıAıMîßìrîæà»î¡!ºê¥–‚{‚	ıy_À\0¼)ŞNÙnzïâ^ğtPï¶_û“wÒ‹¥:á{:‹ß?Iİ¸›8Çº`{uYEw=(å>¯ÒàL\'ô¾¤t-Ò05ï_/Ü}8e™ÛlXóÈDöÅÈŒ½•t³ÿ\0sŞeì”É´ÛtóÏ‹s·Âœî\'sœ\n.’2ÓîvŸ†éøLƒdœ‰=ÍAà=î½GYèßÚ}3³Ëš-¼ÜeœåÛËÉòGÙSÄ•ÕİrŸÎİÖ\\PìYú?*ÿ\0‹Ñv;°¥	ÒdÛÒ½—NÉÿ\0öVÖzGy!í”‡Úº®‘¹;n§õ9¶ÒóE–Á›ˆö[­ŞâBZaü}İ-‹ÔÖ5’îö\'¦FçK!lqI¾iqR\0TŠâˆ‰u>S@÷îñeê:$zÏËÊGº Ÿ±v7úÑ´ş…ÿ\0e({]ÜışıÔ©‘ÿ\0b!Å¿kêÓ&åàŒ1®®\'ÿ\0Ôğí°ìâ<fI?bñ1™Şg†Lù·&G¶²í_Sıœê-”t‘!v»>èê°æú£¿ëÜÖù›Gkˆ\"À*ğî:$[{ŠÊgˆái~…ô>¢=%¿™3aòÌĞ¾wãpØ?\nôÇ=t;¦w4®C¤é—s¼mÂæ2¯?ê©z«rEÄ±û¢Î¶Ïõ¶Í~hÿ\0¾Úé}¶î§øòÔ¤F÷GAêçk	½®ÚMöò“4ª\\\\ïû\r“ÇYK_‹¼Îz_[†û›á÷»HxÆ§÷—¨õ®ÛÛÔù£ı<ñ<%!_xï+ÊŸµ˜l7†q§tÍãö²ê%é­ÈÉ$!1¯uÕñGû™–øeˆdvBM?•zË\\Ãq~|M5$Ÿ€ö.àü!µ.ë¿‘w½´}/£ÇràÙ&Şnw[–1ÄY÷‰NØ]\'«ò7Ké¸E²så=ÌKw2ùßZİïSŞï	s“=4ùAhÿ\0”Eÿ\0Jıë{GşÂÚn§nÙ6İ?rÈÇÜX^Í«\'…­ ıÖÈÇ8iB[pkÏzn|»¼Æ¿.LraÂZ/yÓ?¡‡k!NL·R¯·v;q»ï]®Ùº¶Â7tİ¼r·¦Ç$1DZ\0û-cX\0h‰Uê\\†Yñ\ZüÙ§/{-:‘üHÜÌ×Ÿ$¯Å×ç\'çM™ÿ\0°üy¹oş¤›¯ĞÜA,ÿ\0“ü®ëhÒğC¹`8-w¾È?Ôğ›FËü¼Â^<®¾wÒ·gc¾ÚoE>àÚ8æöÄÉtçx@ñÓ`0İ·k·`[É¿ašnsãhã]çIÁR?PH@ÊG†2õö•ôßÌèraÛç‹sÏ›b>ßjõD½±/Küo\'ntÙ#^Üí]†çu^íŒŞlï$Œ+OÜo‹œëúAj^¼FÇ÷n¿“{”×&YÎ>HøD8î^?ÑÛl[Smñeÿ\0OÈq”CóW¼/•ŞàKøO«•è„º¶÷fÂN\0Z¥3­ı:L}W¶\'\\ù¶3]Qñ»Àêdÿ\0ó\nŸë&üBÍÎÍ¶~ã§tóÊ ÿ\0ğÍàcZog?o¾aÁ|O§ëĞ‘ßdò}Iü@Ÿc™/{ÒD²z?k3l{¬£ù¤eúQ³{ñ{s©ï /íîøÚoà&\"Ç·?äıv´½¬\0fyÿ\0DLy–Ö^\\ûL‘=ñb>ÕóİÁ;|ù?6,âCÂD±u—æÔ]F.ŞİÄ«7ã^‚Çİş¹Ót†–¾%Š@öôå%¤J\rÁ®Æ@G©şĞ÷ÒëÜuùÃ/PhyrãŒÇñDI/¡Àßÿ\0,ÿ\0t•±úVü}Heè»©\\÷\Zæï¦ŞßÏõ·>ÉD//ÕwGsÔ±Ì—äÚÆ?ËúWmõÎ¶z7utIòİ¬ûE¼\0•ûRî¦k&í¼ÌkøÒ3¯´Ùş/c˜@>XGsTx±v½¢ÿ\0xôöôâ‹ï0dÇ8v°Œ¹£â /ƒÚŸà³»?.÷p–ËoÕ6=òÄtÃ«hÖnúÖø­I=nÓbMvİHåş×Òz^Be9Dä=¢2—,„]»—“Äa)	g<¸ç–\"G² i{*½ÙŞ{h{‡µ{ti2ízÏO=1$¾¨:ßF8İ\"İßnG‡ÿ\0ùÍÓô/èõ=ÆyF@ÏÙÎcğ‘_QÙJ;]ö#„¼qî\"í‰£ø…ù“ÙñÉ·ü»ÙQÊ ²>¯›wø³‡È—bµíú„y})ÔŞú˜ŸÚQëò?ó;ÄTíƒñ¤—q~FÙ‰zVË{dÙu6‰pñæ¤4âÒ$‡.>ã:Sy(‹Ê%»Uaùw½ü?XÍ·ÿ\0­‚`wÄsp+Ş_w1ïv½Z2Y¼~Ï}èWÆbê;wëûaÀjgü–ÕˆE®¨bqåÛg\0a.ÀéRÂcŞƒ¿ í™Ú‹»ÛbÕk¶Ğîº4FÁÆN£×å¶¯ñÚTÛt÷ªv¿«õŒü!~,¼&ç4³gÏZ=â#ÜXwÇK¿†¿zÜí²îâ\'DYö¦Ü7qº…	h.-Äˆp!Õìz¦Fßîr»ò–í±z\r¤²iÛ`\'ú<æLÚÿ\0à¹ßâgâŒ\n_r¼Œ\nÄƒ<ŠW”õ‡ÍêŒÿ\0»‹ıÕæbaqJ¿ó.¦ºî.ÎØíú‡tôq(ÉßâLwÁZ,c\r€Ÿ¯NÑÁ³İîCóÃg‘ï´{××ÿ\01g±Ùag‘ÊOpŒ+ï!zÛ°ÍÙ°­ÖLàt»Ú½×Û. ¶>§gªAÅt³ü¨Ô±ØWÁ=¾_Hï¶2÷x²bÊ8ÅÄKwX÷…ò®Œ%¡õ*Ò&š³jûì®ÄÍÒz¤í,l{¥õ´;:ŸKßÀ\ZÉÒÆÅ$\nUW_\"¼ş….~™¿ÍÉşá–#Ø¾§ÓäNß}ƒ\\»9ßHÛÅy×ğ¶åñş0êEš½7®w­cÁG:=¤;ÆÄX­?ò–iÍr=oŒKÔpwäÉƒ{˜¿€©_\"Ûá†s‡BF)åå$h€zö;®eø÷¹£ê’¶rFÑİg uM†é¦G:\'î¶»x·1:´\rAìÚ5\ZõÒFv¬ğí²lOáå!(91î$\\inåô½çJİtXú^\\‘Ë„Ï$±<§|ÀĞ\Z\nõä~©şoEì~˜É\Zãºƒü¹ıCP0;üÃ€6qç^CqğûÁ·õ±Ÿâ¼—¨¥)dÃ€\nJ\"_ğ¯şŒ÷7æïÊ}Ü»nƒ°İm •¥ÀiŸ¨ízDk…¨¶®±±_PÍÓ½5Óºu²eÄwÄÌüW£â9:¦L€\\p?dW_÷îÏüOÈİØÆ†±?QF9t¿rÍ»â‘®)ëû®k¸©²×E3,Û˜¼ñËSîzŞ“·9úîßSê‰áù¾ü·¢tÿ\0ê}ÉĞ&ô¾•Ö{“cÛıCcÛİÍ¸†Wõ\rô#}µ’-³Ùï~ò}–Óe…#´Üå–Û\'Eİt­ŞHc–qÍ…èù`9ˆ\Z~[İÊÓ×ıxº¶>¥¶ƒâÍYˆŠ¸¡“W´/MõMä;.ËïHwwŞÙtMŞÆ‚Xö·©uŸ³…ÇR9¢7n\\@}I^oÓ¹ùÇÒ\'“š@v	G•Ïq>Ö\\ËéJ]SğsœFsğåå>Â}¥yçóSŸŒ{Wué.Øõ~†×u\r3ts·s‰ÇÖc\ns7®o¢uÌø4ÉµÈ<Dx-Ş3êÁ«§ã ¼ßÜïƒ´¿#õ‰Ü&nŞNÉêGS‘|½Ïø‰Â3éiˆïú DEz-§ıÆÊ1è?û¼ñt\né²Ÿ¡êéÎ?(ËÓâ_º8É>ØÂ6ìÎÃÛHÛìºx÷Nä¢‡÷›>Óå?äô÷JÌUÛZçô‰rCs1çÉX¼>|’÷HÂK¥ÚæúÙa´óFcøNYÊG‹€\"xM—4üKÛğ÷Ç~ôÜßHí»;“uºİuá#zGKÙ™¥Ùµí|nÛÑövMp!Ì;—< ÖÛ½Ôv¸gœ×–Ã¶Eù|6«•é>˜:¯VËÙàiÉÅ	ÿ\0—\",c5^Üÿ\0d»š>—øK§öÛD#ªw¦×L\0ÈÙÓ:^ÁÛ§DÈ˜ZÖÄÉÜÀ”+ ôöÆY½Jz„ªÜŠß˜ÉŸØ¾›ê<Çğğ929IâÀ~’°ş4Ø·¡~5í(%hc§ÙnúöìX;VşwÌÒëØÿ\0E¯ê]Çã}E»Í\ZÆ98÷@7Åy™ÂBñDyÄÿ\0€°~3Şz×Vsät²A¼q¶’NïAp*T,£Ê¯®àö˜aA=Á}×[!±éı/Ë‡ı¥u÷ãÏÈ{Åçó6òv>nªzû™Û{Qoz´}NvÅ Èu}Ç8bÖéÄ×Ğw3ÕNÄ<’ÙÄÌè\"Áßà‹Ùo#±Ç¹&¹Ì‡ âæ¾‚şGíŞ©Ó»w¦÷tî·C¾»ç­îºçrnwÉ¹´Ø–à&c ú,À\0miĞ:®ÿ\0XÍ¶Ø‘³ÁÉˆ¼DšRî£Õu3“Ÿ#Ëq\'2<N\Z¯stM»bj´\r—BÚÈn,#Ùí£$)ºj¯—ô—=@Èş´Ï¶Ew6]^šF_î¯HvŞò=ïoô™${_öâ—§nZ\\.ØX7ª+ªê˜¥µê™\\|ã$|kñ^Ó?1„2VÍâ;£KÚ_’ÿ\0(v¤À6.Ü1î6`YÙo·{‰ |jŠÇÃ0Jô>¡Üíğîã|˜Éñ`~+ÆõQ“ã2ü¢DŞGûaÿ\0¦ûÆìÏæ®\\æ»cÜÇ{ˆ`Íê;wÒ4ê?lá]Ÿ®¡õ¡Ò÷ïàˆ?å\\ÏMû¬°6Šà=‘<Cò\'æ¸cpûMî¾»`RU†Fı$9HÔ:×Ö}¯NœE‘÷‚ºmè”³îÎø‚¸Gnm~ßyìšº†Û©J®Q°ùC‘H]8#M²¬wõèÜÀŸ<ø¿Šû7¨2Æ^‰\0üû}¸Üf¾Î+´;ksÙ~Õ9«³ì¡N\'›zÙ	P	-^>·JÇÿ\0öNñşşæ^è\0¾QÑS\0j}3ï+èş}Ü³şÎş3Ø‡‘Ğº\\ÖI!ßnA`(Ğ€©‰®7EÒôPÊ/“ ¾!OWû ~\\gí_´ú+ûŸı“íæÈÖÉ°í>†;‡r\\¥™‘ÈÍ°$XHù¤ho…p¶¹¿Ğsç2H˜i\\ˆ2N~HHçüx/f÷Öù°ô(àûûG¨5În¦Ÿøvƒî¸Û™1®ŸÓ¸·Ç#\\Xıò ÷/W!·&ÜÒ\0x]yCòÖÔEÙö£I,è’È\0 İ²íg².+·é\'«6ÇOÅx+çûˆï7cyü]y«³cë§Ú½¿ùw³d™s¶·K§w?OcÜbë]«¸—Få’E}L9%4µáV½æó{·Í×÷œêLv›Iâ‘û™DEö™Áí¦«³É“m/ÄmÜgşh‘Qá¯\nè¹ÇPî‘ßÿ\0uî†ù_Ó]ÛÎ>øGA¹‹¦n_¹Ûé¾ƒ¶™XxµÀßáÉ´ô¯QÃš™¾¼bxüÑ·*»\rşãïyØ\\£QØX¸_o­o·ü‹±Ü(GO‚AÅ›½³\\æ®¦îAñµy¾“¢d=’$°¯oÓ6?Šü¼İ|¯8æ3ÿ\0gÈçØ$ÎüûÓGPü¶ß€şƒÜ0ê!	nÓªÀı»Ôc£ïÄÕñ®ËĞ{ŸÃõùmÏ—q·ş(âWÍÌ¶²^3ÀĞ®ıüSÜîî¿ÄŠöÎ“^ã¥tİïDİ9]÷ö;ó¶„Q*6¥¹\0‚¹›İàºæû+|¹g;™Ï½{N‘”äé8aú†@ø\Z{—{Û©·®şVï­ş³&ÚI÷.F×g{8^Š@FÔà·u…rq9†2>äù‡ğÑ—+Øïsîàòìò‘Ç–ñ+ÿ\0¯Û]“×6O:]Óû¥ÅÍÌ7w²hw2‚ºÿ\0Ì`u¬9ãl›QşYÒ¾~Ò;PZÓ>ğ½ùñùï×½GPí)c\r|r‡$¯%³<*µ\n„¾«Wg“®tøêb~Ç^Ã¨HËÓæu$ˆ7ˆªèŞˆm¿tHHjîö\'pğIiÿ\0î{³‡!ÿ\0ñ8àT)u™}oZg–‘Ïìƒ}´âËƒéhz‡§F@Ş?ãˆÑ½ËÔ™¸–=ÎÂÆíéğ÷Ùíá~çs;äéPnö›fC]$²Ë®À¥õÀës;àÙCå!¾ŸRTs`#ıË•ê£,½v{	rãË9zÈ™3w0^:ƒ¶{ó³bŞï»¯iÕ{o©şD;¹»Ù;vèw;®–z†ê-¬=B-´Î\rt[¨¤pŠB\\ÏKˆ+Üo3m7Åƒa8äÙmñ}(‘nhÒmî­Wµü½è’†ßsÔ·p.cÉn\0~nç$Ö—~Ù†şBšwFÆÖôN¯+\Zº]wâÆÀÆ‹0İ*€-y­±1Ä*àà[ÆËÌcÃ,;™â®)ì$SØ¾†çlîÕÿ\0g»¥½ÚvıßÑNê7H•ıK¥AÔ !Î\r/\'q³p\\ÉJí:Áşáè˜î…g¶ÜàŒ¸¯+¾ÂquLøjÒ`’ö§kua¸ük.ÀÈÑ.Û®CÓ\0ÔİFŸşcIc|+ÂtÌ<İOFqr>\"ƒâ»Ş3>Ÿ’ğ¸Õx×¨÷iÛ÷¿zî\"Ú·wºêqı/g&·ÿ\0×g?ø$«•ò=ÏÛ€\Z­\rKØŠï·;Iïc)Êb81¹=¯ËnÆö.ú]?^é“Ë“,qtı¡Í)P™™rDĞ\04n|\\có¼š:‡ãm«Rdê½Vbí?t	6°\r.:ƒu©Bl»FD—SĞ„Gµ|ïk,»xEù¥,8¼@ıÛÿ\0€öeÒ;o!æÜ;¶Ì=ã¸7óu8˜ÿ\0ÿ\0y[Í©Õ¥m…t¬˜ü1ŒK¼â=‘sï+ë~ Éõ:®r<±Œ`=ıä÷/=m`Üõ>øüËÖ·s	:tw\\Øt¶½š.Ï¤í&èïÜ†ê BùN†€« šß¯æÁ‚;g¶ÕÚí1JD~´ˆ›wµOzù6äKûœ²<Ó-Ü/7vrô\"ÿ\0ö»è6CQ»Y³ß°\ZUcğ£y_õ> ÇwSˆ¤àeÁå/·ì_ZèÓOË¼ğf0Çš\'‰ŸÄ|?üø5tNÈB¤w¢>qm†«`TWUè¸o‡iÿ\0_˜?‡ãõ>ÅÀ72»mù/¸·2‘\'øí·ï\0£ÿ\0ÅÜA& MÏş¹Ö3&×MãŒüW®Úc&q„¿^#à¹Çâÿ\0•İß”z¤¯.qa¶t²¹\\á&æG¹Ï{¢Œ„-ìœ«“ê×‡Fé˜;NIûñ]WÉõz†ó%Xç«»	K^àqşuî¹ØÁÛMã7İFúÙwmÛ«¡Ø·§ôÉvŒÛnœ·r:ı6ck}d8ét¼ñí±ÎoÊ{È•\\ö[í_dôÏIÏ·Øş?qòƒµ#V1Ïe©ªéïõôƒ?äYÍƒº‡Hmós¼v®O¯)¦Ài†…ğ¸ôfX¿8ûW&îN¥\'mtNÛPfó®şEêıÍ¼Òæ¹û‡ÑöÛn“ÑäìPşNûzCiÔN ×I›rlğâQµºRgÿ\0/½{¾®ÙúNØCîl£6\ZJUöÓŞ¸ŸæM·Øî.Ãî>MìC¶÷/a½«şfÅª1$J@â+³ô¦S—¤õ\rŒ¯ŒÃ<Gu%îÌô=ÑÙuM¦ò cÎî$}„®=øéßåşXèRÿ\0ò¯HTAl3†àˆA“÷®Ë¬	bô–àäÜâ/è]ß®\')z«s¨†òÒ¿L{2ÉøÚX¢ş]ÆÏªÈX×5îÌ•Ò}À-¥‰—_”4’@¯›íŞ=SoÊóÇ‰/Ø#Óxävq„c#9s0\0¹:7zoDîÎ×îŞ¿ÚĞö×XØõi{K´¶İ\'¸FĞÉÿ\0Úu¦ÙñÍ<N([¿é¦SöÆïneÛ ×ëf¯aêXt aP!É´<Âÿ\0¦Äê½~ó¦îö˜qåÏÆ11\"¬ZÒkp6z:èïÏûxæ¾`kn{2w”pİ–=‰~°Ñ€Õo^o¡Ìâê[,¶mÄ?Şoµ|·«@¥6¥‹şùY½ƒ{ÿ\0¶dé<º=öÓ¤KºímÓóí¥Ùl¥ê¾dz\0v›™\"›l§Ldíœ@êû´§„õ«¹ƒëüà~ñix‡SıA÷×W–¾‹ƒ[‰\'£õ©ƒqnhLšÚ\0LjHÍG:íĞï½Ì=qÙï†nägIëpÇ=ƒiÕú,‘§`Ü>f¶\r‰g^Ô}6Ëâ£”IíŒŸâÿ\0ÌÓøyw9zt7á²Dş´$ì}­/ã­YÕó³;ÒxãÑ¶ê_›âêÛHÂ«\"wFîIŸ¡€Cg… …`k•0OQŒåæ;Iƒÿ\0ŞÀı¥u=+ômäš{üñ>9á0=ä®mø}Îé±m&{>áØM°İ=Ÿ&·F\"œ±KHŒ9Ñ¥Âğ\nw>¢ˆÍ%È\0¾ÁùoˆKªî¶çÊv¦>À/Ò=×ptæé·¿é›ø·{y·Z#	\ry´~é»WOµßíÔ˜7Q€àøÜtns~M×päÃ™Èùy(t<ºs=ëƒêŞ™¸é›½¾<áâòå\"Ò*=µ\Zx¯öşåÛ^Üî‡©ÚŞ}±)Ñ÷v{†Åš,Ñ#bšVêEG·¯yêSÏ“_ú›lgƒ±rât‡—IÏˆ¿É¹‰Ÿ4dÊÈê,‘İƒ¹Ã@ü£°oÚ¾¢é:<Çî%†Ö§®W§£ÿ\0Ô\'•ÿ\0ı	õÕuh#!o¨GÁz³ò;Ë;uÅ¾¢\'éA\0£vˆBqAìµó~ˆ	ßÇøşÕè}õ^2C\02¸Ã.¸üN_?|uÍÜö+´ ‚\0~–õ.¨Ù\\ŠQ®pÊ8\'—¥õäèX±Æù·„ŸàÆÃÂ¡?^ÌOÔƒåÇ\'‰`O¹‡‚õÏúÍóaÓ¿.ö×R²ÊŞñ›¬ìÎ,›¦÷\'Fí÷¼•s]#\\ÂÜ\Zæšè½E›}¯Hê`Äbús\Z‰b˜¡øp½41eÛ™Å4^Vÿ\0h6ÏüMÙ\rM÷nôÂÈÚÀzWSßtiuŸÿ\0Jwõ¿uB\'ÜBºI?@ôôê@69{óî#À/Cê\"rú;\rù±nÈ=ÄL°Ø=G¯»£öïlõfAî=ÎÇ¡Ã¸…ÏĞïµ¸è¢WJÙpak¶úT‚âÕóŒ;Åu,ûS.IFyXèâlŞÿ\0rò½¡½Õ%±úŸO/Ñ”ã\"~R(XƒqPÎÆËšÿ\0¯b$êÆ~Ü=3¼6;¨òá+v½Sk}Mÿ\0Óş[8%vûœSË.ŞuŸ$j‡>×çüD7Çèƒ¸Æa	ä!’	jSô¯·ù»¸›´Şş@êÿ\0u¡¢ïv;gÌÛÿ\0‡b]¹ÜŸ:óİ\'hw[İ¦ÉŸêeÆ·š_à÷³”ú–i›cæÊâº{ğgn:ÀSq0İÙ/wH#{œÆÈÍ–ÆƒàˆF¶9Â¾—ê\rÙŸZ8TaŒµÊíz:|¦Aş¤Ï¸.†í‰÷}6Xú†Çu¹Øï6åÚï6s¿o¸ˆDİÑ,Nl\nÑLk¡ÙbrÈÌ<H>\'ı…{ïDmcŸq¹Í’ âbbÿ\0û×l~3ìîôí.«Ö]¿è=F>ÓïN—µî¾Şë‘´nöŞmÜçKşDĞÿ\0…ºÜ1Ò”˜0¿@!TUú¯.×y°ÛdH¥µ?O$~÷$ÃÂ\\E\"igªù·\\èÙú^ÿ\0s´å?‡ŒÌ¡!PÆ p<¤Pö.Şïn¥±~7•›wÜs}¹R>Ùûµ¼*9ÑO,}«…“7âºòYr‚xÁ©ßW=ází¹;ÏCï7oéD÷ã”M=¯âMïb?öoñœÏtf÷ÿ\0kJ÷Ç¥Ò¶ŞÈÃ§PBğØÒùW3aıOAn£+cÜOØ@·µx-•:†Ø—å$yÔ}öC·ï`pÕ\']êˆ >’±SMñ65æú…6›aÿ\0ºàmê^c›;ÖgŞËóß¹\'ÿ\0;ò‡ä}èõ6=Ö÷eKŸl…Œn^¨öNı+è8ñrzC§íìLDÏsHüdzshw]k,ZÛe—òãaï x¯E®@î;­twÈ¸º‰¥mº¤-{J¨hÜÀ,ˆ¦º¼óş»Öß\Z®×dIÛ°¸‘\\ıë/ïŸËıÛ0¹Ò3§öçkô‰ İçUÜ•¾(®h?dµp°Â»L` ïw¹|³À|¾õçzüç«ŒaÚ1€ûJínşÜÇµèıR(œÂí·LÛB68ŸZEÅßláûå_3èØ]Ş1<Ò÷ËâË›é}¯ã½O·›œ÷cCŞàıA7?…»¦0C´ôN ¢§ÿ\0µİÇ-‡,G\Zï¶ÑõÚ_ÿ\0&?æŠÓÖåRoC^¾ØD®7Óÿ\0\"uy¿v\'â¾ÅÜn`îÎçéÛÎ‘×wÍq`é»4«º-¥b{·sõ›BÓp¯a›o³Ûowg©Ùm³DæÈ<¢=µfâx.¶[â:vÔ‘’P#!ì\\p¥øw¯…Û§vßçnÚíş“©İ?¢ìl–B¯ÜKEÜÉ¸İ»\0Ïò&qph³Z‚¸İöã¨úu¿İó³9À}HÜ\0ªê0ş ò1&ö\\÷¯jvôŸà·gÕXæƒUjBÿ\0öÂ9\n\n×xW’éxFm|&óqîeé½61Ï!ıHücşhíÖ÷‡ã>øè°hš]×D—©tàHv­ÖÌGÔvá€}Nûdfº^[N©Œš	>9xÓâ{»Å#)ã¦ß¼êŸëÇUú¦ Ï¨›îl:³H$b©¯SÓÿ\0íıg·#ËõÀşh\Z/¹3ã7;“Ëğô/Pv÷T‡¨¨ıIKOdov2ıÇ’~öÇoÕ\"cZ¥§KK\Z€Tã†8¿02ÄŠ¤ûyW¥Ø¼ºI¤GÅyÏ·dÿ\0\'ğ?B ‚èû~pGlzû^ğBˆˆ¸ÄäPŒº¼N?Ygÿ\0ú›ûOş6<LN¿ÓòIÛêCş(üMEïÄmqŞu	“¥ÆÖ’„$òÈI£†Äõ+òÀˆLû[ô/iùœy·{,aÜFgÛ(~…Ûÿ\0êæw?“¥Ô5î{ë­Èò¨Nİ‡næ–¹c]¯­ñòôŸ¬pcÿ\0uy‚	ÁºíúŸÓ_7Mê?ÿ\08õ­D·wİŸn9UÎC¨Iw’*¿VCét®‘µ	lb>Õå²9úÓ\\Ÿ¥vÇú•Ñ¤xü‘Şû–´?«õçt=ƒÊµÎÚôÙe’rÂlc87™mt¢Ëôö;mŒuiŸOy^Ã`2#,Ü™î½ûòFïúË:c^ÒİJs¨\'Ş|2o%$›(\0Tô|<½#6Rê™\0{×?ªBGe<MQ„ûHuáöúÆºI­u6ÿ\0º£Ğæ„\nô¿—Õİo`]¥·‡ÆA|ò`´oç?\0¾×lué¿\nwnÏk4û—~)ü‰6Ó¨¾Ffö÷s3lÃ4[1Î2é$¦¸	RÅ®^ÏqQtÙœ |ØÄÄrbrÄ{+Ù!Åv/yø,¿à²Ì?V@_ü\\w/øQÍÜõÊÛöÙ»¾ä€Ddr¼±ÛììÔãg(¥k¯õ™mÓ1‡åy÷Gµprc—$k•ÁáR¾¿`o„G­B_¨nš7±ƒb\\ÉÜô[«gk§ëX9pà›TC”ûûWÑ={±äéı7vÌ6ã›„c!ÿ\0ø®/M\'k~_ìôÛ+>ó;o¬:Fÿ\0Ÿ¤ï›²ŞúšAû1…Í\rzÿ\0FHo}3ºé’ócÉ’#ºqæ½×Î2™Fx·İñ‰eî/È]É6İïİpÈ;~‹Ô7›7	Õ¸Øv-o©¹7\0$×Ø`;=-¼üñïrWÑ²ä—Õ¸å*ü·ÜA#û7xêswÌÜ©’\\…x«‰>5ì:åëÈM%w7Øº§µ”½47•Ærûq“ö{W¤:×[›­ôOÇ]¦ÍùİC t-Ü¯|±í÷³ÿ\0ø\'A;…FéÚõ?¨¸’#é¥Î±¯?Ñz|vıg{»ÍLX÷ 8¹æ›wÇäâf¼Ìñœû¬Zƒ¹”\"H¿ÓˆËíˆäãÌ¸gæNñÛwZüÑºˆz7@é];²úì±ñÿ\0ÒæİËQëY‰#ê]{c¹nÛj~}®Ã\\ÃD›†ú>“°Î[İæbâ|ùf.ä\0cıXH	Kõ¦k•Êë{Øõmôqc‹ôüä‘Ó.XLGşïgÒsaX…Ù=ãß[î›ù#µ;\'ñ¾ß¥oûº=§pô¨Û¸Úè=£´êış™W®º˜›KÛ$ğíqwÛ\rOùÉ<o¥ö“–Ûíà—ÑÉ\0îï3ó—\Zš’{I³)G½ôöóuî;NŸˆçê°‡%Æ<P™9rËıÌcçË&hÆs‡S•;>çì_Ä½?¯şJïîó’\r§w÷Ößc.êMùtßos¹Šif‡iNq×ŞIwtí´Dÿ\0Í3Ácû\\qÉ›©cêıc&<=?jL±Âr\02a{HÂ13-ˆÀ18nw[Œù¶Û«¼ŞHy“ò	3seœG,HåÅ$Æ?(\\^oÆS¡úwî÷»Í÷o¿¨tÑ¿Ï“sÓºtÎİ¼oöÿ\0L&}³ç|‘ÀÍ¶ÊWF¸Ëªõ¦3Í…£#!#&k~¨rÅ˜	)°a0/©cô-—§¿¸uL’İu8F9#LK‚~– LyØ·Õ™BÔ^´üÛñu.Äî>“c…½Å¿ê}9­ˆ˜Á\rè_â²2ÈÀq ªW©àÆ3Éßæ}k º¸a9¶³ƒVp#ÄÖÿ\0ëæşX»[¸:+İ§sÛ]ÌÙãŒú\\¹Ñ8¦ \rÖÂş5^¾ÃËÕ6ûèysíïÆôIxx‰µæ„ş#ô…î/Ê}ÆÁÚNë,–?ø;{Ôîò\ZÙ÷»WÆÑª3¨?Q·ë èx¾<ùÍ•‡pí^ÿ\0YKe‹6§7¶Ÿbñÿ\0cuÁ0éı¿×í²\r®óu½İJ}rn£¢&4†±„¼5Iqr-…Cg8áì“ÌÄDÎ[“Ü,=«Tô,ÑØPîòÄäÍ<c\"-§C\"Z DPº.¸İí_×>uş•Û÷»îÒâÜ‘÷#ÛÉ$3f%’5q¬;›€Aµ{~œ=/Óùü¦y${œ¥è_“Ô’Ë\'åÇµ™=ÀGô¯Ñ^µÕGMü?ù#®DÖIºGuî¶ñ´	^Ùw7í¶°DßF·§\0„¨W‰†1ºõ^ÇjÀK“Úær\'‡jäo§1±”äüäLøŸÒ¼%İyÑ\nô}†õúú§mËÚ{ÉLhçÃ¹fíºâmÕÒíÆì0œÜ+¸é[¼[ïWgÍˆ6Ûr7¬LKWÀíÇĞ‰\0òOe$wU•~3{ßÕ7~$én ©IÜmœ¡öVú¨9WÔ?Cş¹øv/¯şd“¤ìòÅØÌ‘ãÍ?Çjãİà×ùdî—ÆğÃÿ\0ä»¨È^UĞXÒÀ˜—‚»¾™“Ğğ‰ÓzşQ×Êvñ‘ŞãŸÓÂ;[~îĞz»˜çÆıßhnvs	c´º}¾ì°¸Cí£Tf@®>8ıN¨!úù@ö«ÛÈãÛgÊã´›7i¿jô÷úéözohv>âYàÚ°n:ÿ\0U|Ó:8b±¿}#ä‘ò$ld{}±sœïKZÒI\0W[ê¾mÇ«3Â ’%!¸Dÿ\0åyÎ•‡.n£´ÅŠ$ä3pk“ö.©üåÜ[áßï7]2C¹Ùì:SºS7¨öÅ»s¿]ÆÕc%fÕòî´°È\Zç´j!¥ÁƒÔô}¹Ç¾ÆesFãA±}CÔı?\'Mô^L9Kæ–|r-g2âÀ_ì\\Ó³Û#	ô¡õO/EÜ˜X¡ºß\'Y{şÙ&ÀHÆ–•±3¯#×>Xg&ßŠÆ€ŠùJ€—TØBCäúØŸ»ê··­…ù1ı¹^ƒÚ¹Û,®j.­ĞznÛwÕÄdzé:Öãtç8Yï%ÂÆ¸[ÕçÊj~¤‡|GÈ² ø®ßÕó;¾§›{O.cx”ºtW\\Ù‡ß½ıÓšL{WnYÜ›Fµ}R4®D!#E{]®A¾è½?u/õF9a‘ãòûw_—›¿£Ö7Rü¹°sø×í+²ÿ\01²m»ãu¥F÷½6Ğ…:LdR;N£k™?zé}hã7NÛş®Ì{È_<ydÆdEg—Ú¿E{›¨ô®ƒkuî­ºÛôî‡Ğz÷Nİõ=ŞáåÑm6‘}‰Ì F×M¹İÍÙíŠ˜ùfsHcMÓÏú\\õ‚¢”ÀîOÃSaUõ~™´Ïº8ğíâe(Î$ö\0\0©:‰ UÚ]O¥u÷wOpt}ÜC¡õŞ·¸ÜtíäÍs¶‘ÓJ`s&dsíwpÇ+D°ÊÆKp.j“~«;Üq¯!æ Õˆ2?Fªº–Ó>ÒsÇ¸‰”ËvH1¨:üA¸__Ÿck:_kî4 Ø÷ócÒv†J×‚Âì\n}°8\Zï=ç}½ÛÛŸe1ì+ä“æÅ†\\´”2?u\nê>·wqw—ãî™*¿mºêë»¶»mºdä¶Gqr­wsÈv¨o-’8F(÷ä,G°ôÌÉË¿Ùí˜ãÛóùş#Ú½\nş¸7”º_@šF\rŸ_èÅÚÛâ°ïwô½æÓ¦>O¥§iÕµ‘¤¦‡0;*ñ#ÒÍPÙ\"°yIöH¯?éI¯RÅ½4\'0‹ğ4?ïU`î¥gá~áÚOmÆÛ¶äŠ`\\×»^ß«³ÔßK‰‡I¶b\rs:gÉêí¿-†í½±+Ö ZßÂO«‘¿™×^şî=noznëªÈø6¾Ÿ/N›tÈß+vgpÍ±u¸…€Ë6Ú)aOµªFÆKš×¹¢7{.·ˆäßd5q¥¸~•ôIì\'Ô½0c-”ng ö$pw¿Ø»§ı…0u>Ñï¹âÜA¼cö}¿Õ>ŞX§†V‡tçÇ,rÄ±ËH×5C˜àU\ryMsí½[·ŒêÎ%ÇëF_ã°Ü:ùŸXÃ—SİaÍ ‡CòŸğloeå^»¾vÿ\0¶ú\\çÈí—h·dÉylfS½4•?m“îd `\Zí·0ú}Zpı\\Ä˜à½brlöÙKó¤Eeãì¥/í»ÿ\0Ê×ã‡Èğóÿ\0äÇ§È×ôÒ÷Ì¸@½rzˆ0ôNæ=»ÏŒÂò»ˆÈo¤ı#şêæŸ‘¯«tä8tÆ…\ZBºÜ%î·–9×Géèÿ\0K,‹°ø/©şZa¼É!A8“Ü#%›²zNë®~!î-ÖV³©÷_QîÙ\"|„ÿ\0É¹‘ìÛDÒIÔLÇnæ´äH­úæçÇÕiä¶ÚâÛ‚€>Çr¾K»X´G(œäE,ò ÷2÷/iõC¾ü!øÛ¬ÌûŸÑû^}Ô/9ç¥†íw[išu¡l°8W2®«s;oWïqàÿ\0Jff$[æ`±{Ÿ)ŸœF\'ÄQ~{n6g ~|íÎšù§§÷O\\éRnKwfçu´û­i¼m~t’MëÚï\"2zg©òùH„‡pÿ\0ÁO®ÏÔëØsGË“k;šCâb÷ß^v×üŞ….Ìn Ştı¶ëo¸„Ÿ½í²È\ZÇFU³4;op4¸„\\+Ãtí”òb;ÜRP‘ÎWp{‰Qé>ƒ›6ÜõıXÇ6ß,„á XÃéÔÆCR$CÅ®­ÿ\0wÚ?«Ë,i/bC¼y%¿{¤Ç¡ÀºB¥ÿ\0ğ\\)õ¼?_o†MåÊ¸ö.AÊFÓ&cq‹›Ø¼UşÂuIftşÓ«uÜıÌÙ_:œøöl|¤§=Öì]ç °}N·—w!òàÛšö–øà%ÍøbH<Ó˜ı\'ŞWc~jè\rè¿»_¥#\\şÙŸ¶öçSª\';¢2µp,’åÊMÑÜÂyôË\"}“+Ûı‡gV¼µÿÙ','#587d1e',NULL,NULL,NULL);
/*!40000 ALTER TABLE `gambarlatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indikator`
--

DROP TABLE IF EXISTS `indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indikator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `indikator` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_indikator_pegawai` (`pemilik`),
  KEY `FK_indikator_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_indikator_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_indikator_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indikator`
--

LOCK TABLES `indikator` WRITE;
/*!40000 ALTER TABLE `indikator` DISABLE KEYS */;
/*!40000 ALTER TABLE `indikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwalujian`
--

DROP TABLE IF EXISTS `jadwalujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwalujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jamawal` varchar(5) NOT NULL,
  `jamakhir` varchar(5) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jadwalujian_ujian` (`idujian`),
  CONSTRAINT `FK_jadwalujian_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwalujian`
--

LOCK TABLES `jadwalujian` WRITE;
/*!40000 ALTER TABLE `jadwalujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwalujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabanesai`
--

DROP TABLE IF EXISTS `jawabanesai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawabanesai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `jawaban` mediumtext,
  `jawabanim` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jawabanesai_soal` (`idsoal`),
  CONSTRAINT `FK_jawabanesai_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabanesai`
--

LOCK TABLES `jawabanesai` WRITE;
/*!40000 ALTER TABLE `jawabanesai` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabanesai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `kode` varchar(10) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kategori_pegawai` (`nip`),
  KEY `FK_kategori_departemen` (`departemen`),
  KEY `FK_kategori_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_kategori_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_kategori_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_kategori_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokpeserta`
--

DROP TABLE IF EXISTS `kelompokpeserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokpeserta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_kelompokpeserta_departemen` (`departemen`),
  CONSTRAINT `FK_kelompokpeserta_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokpeserta`
--

LOCK TABLES `kelompokpeserta` WRITE;
/*!40000 ALTER TABLE `kelompokpeserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokpeserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporakad`
--

DROP TABLE IF EXISTS `laporakad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporakad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujiancbe` int(10) unsigned NOT NULL,
  `idujianakad` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `ndata` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_laporakad_ujian` (`idujiancbe`),
  KEY `FK_laporakad_ujianakad` (`idujianakad`),
  KEY `FK_laporakad_semester` (`idsemester`),
  KEY `FK_laporakad_kelas` (`idkelas`),
  KEY `FK_laporakad_aturannhb` (`idaturan`),
  CONSTRAINT `FK_laporakad_aturannhb` FOREIGN KEY (`idaturan`) REFERENCES `jbsakad`.`aturannhb` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_semester` FOREIGN KEY (`idsemester`) REFERENCES `jbsakad`.`semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_ujian` FOREIGN KEY (`idujiancbe`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_laporakad_ujianakad` FOREIGN KEY (`idujianakad`) REFERENCES `jbsakad`.`ujian` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporakad`
--

LOCK TABLES `laporakad` WRITE;
/*!40000 ALTER TABLE `laporakad` DISABLE KEYS */;
/*!40000 ALTER TABLE `laporakad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loghistory`
--

DROP TABLE IF EXISTS `loghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loghistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logtime` datetime NOT NULL,
  `userid` varchar(45) NOT NULL,
  `username` varchar(255) NOT NULL,
  `sessionid` varchar(45) NOT NULL,
  `application` varchar(10) NOT NULL,
  `localip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_loghistory` (`logtime`,`userid`,`application`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loghistory`
--

LOCK TABLES `loghistory` WRITE;
/*!40000 ALTER TABLE `loghistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `loghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msghistory`
--

DROP TABLE IF EXISTS `msghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msghistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(45) DEFAULT NULL,
  `msgtime` datetime NOT NULL,
  `fromid` varchar(45) NOT NULL,
  `fromname` varchar(255) NOT NULL,
  `toid` varchar(45) NOT NULL,
  `toname` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `msgtype` varchar(2) NOT NULL COMMENT 'BC CH',
  PRIMARY KEY (`id`),
  KEY `IX_msghistory` (`sessionid`,`msgtime`,`msgtype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msghistory`
--

LOCK TABLES `msghistory` WRITE;
/*!40000 ALTER TABLE `msghistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `msghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other`
--

DROP TABLE IF EXISTS `other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other` (
  `nouser` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nouser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other`
--

LOCK TABLES `other` WRITE;
/*!40000 ALTER TABLE `other` DISABLE KEYS */;
/*!40000 ALTER TABLE `other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujian`
--

DROP TABLE IF EXISTS `pengujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggalbuat` datetime NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL COMMENT '0 Departemen, 1 Tingkat, 2 Kelas, 3 Kelompok, 4 KelompokCs',
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal1` date DEFAULT NULL,
  `tanggal2` date DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Umum 1 Tertutup',
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujian_departemen` (`departemen`),
  KEY `FK_pengujian_pelajaran` (`idpelajaran`),
  KEY `FK_pengujian_tingkat` (`idtingkat`),
  KEY `FK_pengujian_pegawai` (`pemilik`),
  KEY `FK_pengujian_tahunajaran` (`idtahunajaran`),
  KEY `FK_pengujian_semester` (`idsemester`),
  KEY `IX_pengujian_tanggalbuat` (`tanggalbuat`),
  CONSTRAINT `FK_pengujian_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_semester` FOREIGN KEY (`idsemester`) REFERENCES `jbsakad`.`semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `jbsakad`.`tahunajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujian_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujian`
--

LOCK TABLES `pengujian` WRITE;
/*!40000 ALTER TABLE `pengujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujiankelas`
--

DROP TABLE IF EXISTS `pengujiankelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujiankelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujiankelas_pengujian` (`idpengujian`),
  KEY `FK_pengujiankelas_kelas` (`idkelas`),
  CONSTRAINT `FK_pengujiankelas_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujiankelas_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujiankelas`
--

LOCK TABLES `pengujiankelas` WRITE;
/*!40000 ALTER TABLE `pengujiankelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujiankelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujiankelompok`
--

DROP TABLE IF EXISTS `pengujiankelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujiankelompok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujiankelompok_pengujian` (`idpengujian`),
  KEY `FK_pengujiankelompok_kelompokpeserta` (`idkelompok`),
  CONSTRAINT `FK_pengujiankelompok_kelompokpeserta` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokpeserta` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujiankelompok_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujiankelompok`
--

LOCK TABLES `pengujiankelompok` WRITE;
/*!40000 ALTER TABLE `pengujiankelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujiankelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengujiankelompokcs`
--

DROP TABLE IF EXISTS `pengujiankelompokcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengujiankelompokcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `idkelompokcs` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujiankelompokcs_pengujian` (`idpengujian`),
  KEY `FK_pengujiankelompokcs_kelompokcs` (`idkelompokcs`),
  CONSTRAINT `FK_pengujiankelompokcs_kelompokcs` FOREIGN KEY (`idkelompokcs`) REFERENCES `jbsakad`.`kelompokcalonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujiankelompokcs_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengujiankelompokcs`
--

LOCK TABLES `pengujiankelompokcs` WRITE;
/*!40000 ALTER TABLE `pengujiankelompokcs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengujiankelompokcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesertaremed`
--

DROP TABLE IF EXISTS `pesertaremed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesertaremed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianremed` int(10) unsigned NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL COMMENT '1 Pegawai 2 Siswa 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pesertaremed_siswa` (`nis`),
  KEY `FK_pesertaremed_pegawai` (`nip`),
  KEY `FK_pesertaremed_ujian` (`idujianremed`),
  KEY `FK_pesertaremed_calonsiswa` (`nic`),
  CONSTRAINT `FK_pesertaremed_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pesertaremed_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pesertaremed_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pesertaremed_ujian` FOREIGN KEY (`idujianremed`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesertaremed`
--

LOCK TABLES `pesertaremed` WRITE;
/*!40000 ALTER TABLE `pesertaremed` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesertaremed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayatsms`
--

DROP TABLE IF EXISTS `riwayatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayatsms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `sms` varchar(1000) NOT NULL,
  `nomor` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_riwayatsms_ujianserta` (`idujianserta`),
  KEY `IX_riwayatsms_tanggal` (`tanggal`),
  CONSTRAINT `FK_riwayatsms_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayatsms`
--

LOCK TABLES `riwayatsms` WRITE;
/*!40000 ALTER TABLE `riwayatsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruangan`
--

DROP TABLE IF EXISTS `ruangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruangan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruangan` varchar(45) NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruangan`
--

LOCK TABLES `ruangan` WRITE;
/*!40000 ALTER TABLE `ruangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nilais` varchar(255) DEFAULT NULL,
  `nilaib` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soal`
--

DROP TABLE IF EXISTS `soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `penyusun` varchar(30) CHARACTER SET utf8 NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned DEFAULT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `idkategori` int(10) unsigned DEFAULT NULL,
  `idtema` int(10) unsigned DEFAULT NULL,
  `idindikator` int(10) unsigned DEFAULT NULL,
  `katakunci` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Ganda, 1 Kompleks, 2 Sebab Akibat, 3 Essay',
  `sifat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Public 1 Private 2 Draft',
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `bobot` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '0 Sangat Mudah 1 Mudah 2 Normal 3 Sulit 4 Sangat Sulit',
  `infojawaban` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Terpisaj 1 Menyatu',
  `approved` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 approved',
  `filemedia` varchar(255) DEFAULT NULL,
  `namefilemedia` varchar(255) DEFAULT NULL,
  `waktu` int(10) unsigned NOT NULL DEFAULT '1',
  `persis` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soal_pegawai` (`pemilik`),
  KEY `FK_soal_pegawai_penyusun` (`penyusun`),
  KEY `FK_soal_kategori` (`idkategori`),
  KEY `FK_soal_tema` (`idtema`),
  KEY `FK_soal_departemen` (`departemen`),
  KEY `FK_soal_tingkat` (`idtingkat`),
  KEY `FK_soal_semester` (`idsemester`),
  KEY `FK_soal_pelajaran` (`idpelajaran`),
  CONSTRAINT `FK_soal_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_pegawai_penyusun` FOREIGN KEY (`penyusun`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_semester` FOREIGN KEY (`idsemester`) REFERENCES `jbsakad`.`semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_tema` FOREIGN KEY (`idtema`) REFERENCES `tema` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soal_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soal`
--

LOCK TABLES `soal` WRITE;
/*!40000 ALTER TABLE `soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalakses`
--

DROP TABLE IF EXISTS `soalakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalakses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `pengakses` varchar(30) CHARACTER SET utf8 NOT NULL,
  `pemberi` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `pengontrol` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soalakses_soal` (`idsoal`),
  KEY `FK_soalakses_pegawai` (`pengakses`),
  KEY `FK_soalakses_pemberi_pegawai` (`pemberi`),
  KEY `IX_soalakses` (`idsoal`,`pengakses`,`pemberi`),
  CONSTRAINT `FK_soalakses_pegawai` FOREIGN KEY (`pengakses`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalakses_pemberi_pegawai` FOREIGN KEY (`pemberi`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalakses_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalakses`
--

LOCK TABLES `soalakses` WRITE;
/*!40000 ALTER TABLE `soalakses` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalesai`
--

DROP TABLE IF EXISTS `soalesai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalesai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `jenisjawaban` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Text 1 Image',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalesai` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalesai`
--

LOCK TABLES `soalesai` WRITE;
/*!40000 ALTER TABLE `soalesai` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalesai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalganda`
--

DROP TABLE IF EXISTS `soalganda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalganda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `adata` mediumblob,
  `a` mediumblob,
  `bdata` mediumblob,
  `b` mediumblob,
  `cdata` mediumblob,
  `c` mediumblob,
  `ddata` mediumblob,
  `d` mediumblob,
  `edata` mediumblob,
  `e` mediumblob,
  `npilihan` tinyint(3) unsigned NOT NULL,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalganda` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalganda`
--

LOCK TABLES `soalganda` WRITE;
/*!40000 ALTER TABLE `soalganda` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalganda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalkompleks`
--

DROP TABLE IF EXISTS `soalkompleks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalkompleks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `adata` mediumblob,
  `a` mediumblob,
  `bdata` mediumblob,
  `b` mediumblob,
  `cdata` mediumblob,
  `c` mediumblob,
  `ddata` mediumblob,
  `d` mediumblob,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalkompleks` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalkompleks`
--

LOCK TABLES `soalkompleks` WRITE;
/*!40000 ALTER TABLE `soalkompleks` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalkompleks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalsebab`
--

DROP TABLE IF EXISTS `soalsebab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalsebab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsoal` int(10) unsigned NOT NULL,
  `soaldata` mediumblob NOT NULL,
  `soal` mediumblob NOT NULL,
  `jawaban` varchar(1000) NOT NULL,
  `penjelasandata` mediumblob,
  `penjelasan` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_soalsebab` (`idsoal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalsebab`
--

LOCK TABLES `soalsebab` WRITE;
/*!40000 ALTER TABLE `soalsebab` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalsebab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soalujian`
--

DROP TABLE IF EXISTS `soalujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soalujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `bobot` decimal(5,2) NOT NULL,
  `bobots` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nplay` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Berkali, 1 Sekali',
  `keterangan` varchar(255) DEFAULT NULL,
  `owner` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_soalujian_ujian` (`idujian`),
  KEY `FK_soalujian_soal` (`idsoal`),
  KEY `FK_soalujian_pegawai` (`owner`),
  KEY `IX_soal` (`idujian`,`idsoal`),
  CONSTRAINT `FK_soalujian_pegawai` FOREIGN KEY (`owner`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalujian_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_soalujian_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soalujian`
--

LOCK TABLES `soalujian` WRITE;
/*!40000 ALTER TABLE `soalujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `soalujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splang00`
--

DROP TABLE IF EXISTS `splang00`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splang00` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splang00`
--

LOCK TABLES `splang00` WRITE;
/*!40000 ALTER TABLE `splang00` DISABLE KEYS */;
INSERT INTO `splang00` VALUES ('DBID1','4AUG54B13SDUJ6DCX35FW6C1H13QE7X2UC5G4MREMKX61SYCMCU6XYQ6738EAVV5','Please Don\'t Change OR Delete This Value'),('DBID2','3LAGB5GLMZ3MJE8YB1DCN1E4V7JBNMDZX2DQSSAQ4JU65DX33JDJRSRBFEUCWF7A','Please Don\'t Change OR Delete This Value'),('DBID3','WCXQBTGTZXHDGH8SKQHDH3HFKBJM672YLUK2PG1JCUS3KM47FC2G63123SF8J4V2','Please Don\'t Change OR Delete This Value'),('DBID4','4S2W6FCCX7BXLP56GLF4EU1R2R76B2AH7Z81UGA88ZT72CRPWH27X1XK1K3QHFA4','Please Don\'t Change OR Delete This Value'),('DBID5','73ZUQDM8KG4PA2YZATK38BTFBX8JNU13YXA8L58S53WQ6HJ7VCPX5G55JTS1ECUZ','Please Don\'t Change OR Delete This Value'),('DBID6','PAYM2ZNDT17FPCJ3PBWKEC7S2DY2MHN2H5B5S6E5YKEDHYRFJYLCQKULCGTYAV1L','Please Don\'t Change OR Delete This Value'),('DBID7','NF6SBNKS51V374JCVTSX6KL7LY3LMQ4DT2YC18D5P2FYXZNG7QCRCDPC38GMT8FQ','Please Don\'t Change OR Delete This Value'),('DBID8','5SKEEFKWPVHDEWJULVM5MNAQNWJ121MPWZ2FQHC1FQCQ4K7FZVB7VJDRR31S6S4W','Please Don\'t Change OR Delete This Value');
/*!40000 ALTER TABLE `splang00` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `tema` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tema_pelajaran` (`idpelajaran`),
  KEY `FK_tema_pegawai` (`pemilik`),
  CONSTRAINT `FK_tema_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tema_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timpengujian`
--

DROP TABLE IF EXISTS `timpengujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timpengujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Penguji, 1 Penilai, 2 Pengontrol',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pengujianpemilik_pengujian` (`idpengujian`),
  KEY `FK_pengujianpemilik_pegawai` (`nip`),
  CONSTRAINT `FK_pengujianpemilik_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengujianpemilik_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timpengujian`
--

LOCK TABLES `timpengujian` WRITE;
/*!40000 ALTER TABLE `timpengujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `timpengujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengujian` int(10) unsigned NOT NULL,
  `judul` varchar(255) NOT NULL,
  `clienttype` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '1 PC Android, 2 PC Only',
  `keterangan` varchar(1000) DEFAULT NULL,
  `randomsoal` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `randomjwb` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `jadwal` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 tidak ditentukan 1 ditentukan',
  `pemilik` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `nsoal` int(10) unsigned NOT NULL,
  `nfollow` int(10) unsigned NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `durasi` int(10) unsigned NOT NULL DEFAULT '1',
  `viewkey` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewexp` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewresult` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewsoal` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `viewafter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowprint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `skalanilai` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `kkm` decimal(5,2) NOT NULL DEFAULT '0.00',
  `isremed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idremedujian` int(10) unsigned DEFAULT NULL,
  `idruangan` int(10) unsigned NOT NULL,
  `sendsms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `formatsms` varchar(1000) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujian_pengujian` (`idpengujian`),
  KEY `FK_ujian_pegawai` (`pemilik`),
  KEY `FK_ujian_ruangan` (`idruangan`),
  KEY `FK_ujian_remedujian` (`idremedujian`),
  CONSTRAINT `FK_ujian_pegawai` FOREIGN KEY (`pemilik`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_pengujian` FOREIGN KEY (`idpengujian`) REFERENCES `pengujian` (`id`),
  CONSTRAINT `FK_ujian_remedujian` FOREIGN KEY (`idremedujian`) REFERENCES `ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ujian_ruangan` FOREIGN KEY (`idruangan`) REFERENCES `ruangan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujiandata`
--

DROP TABLE IF EXISTS `ujiandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujiandata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '''0 string 1 datatable''',
  `jawaban` mediumtext,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujiandata_soal` (`idsoal`),
  KEY `FK_ujiandata_ujianserta` (`idserta`),
  KEY `IX_ujiandata` (`idserta`,`idsoal`),
  CONSTRAINT `FK_ujiandata_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujiandata_ujianserta` FOREIGN KEY (`idserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujiandata`
--

LOCK TABLES `ujiandata` WRITE;
/*!40000 ALTER TABLE `ujiandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujiandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujiandataesai`
--

DROP TABLE IF EXISTS `ujiandataesai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujiandataesai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '''0 string 1 gambar''',
  `jawaban` mediumtext,
  `jawabanim` mediumblob,
  `hasil` tinyint(3) NOT NULL DEFAULT '0' COMMENT '-1, 0 Not Veri, 1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujiandataesai_soal` (`idsoal`),
  KEY `FK_ujiandataesai_ujianserta` (`idserta`),
  KEY `IX_ujiandataesai` (`idserta`,`idsoal`),
  CONSTRAINT `FK_ujiandataesai_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujiandataesai_ujianserta` FOREIGN KEY (`idserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujiandataesai`
--

LOCK TABLES `ujiandataesai` WRITE;
/*!40000 ALTER TABLE `ujiandataesai` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujiandataesai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianserta`
--

DROP TABLE IF EXISTS `ujianserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianserta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `jenispeserta` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa 3 Calon Siswa',
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '-1 Pending 0 Progress 1 Finish Wait 2 Finish All',
  `elapsed` int(10) unsigned NOT NULL DEFAULT '0',
  `jbenar` int(10) unsigned NOT NULL DEFAULT '0',
  `jsalah` int(10) unsigned NOT NULL DEFAULT '0',
  `tbobot` decimal(5,2) NOT NULL DEFAULT '0.00',
  `tnilai` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nilai` decimal(5,2) NOT NULL DEFAULT '0.00',
  `lastdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idujianremed` int(10) unsigned DEFAULT NULL,
  `smssent` tinyint(1) NOT NULL DEFAULT '0',
  `smssentdate` datetime DEFAULT NULL,
  `smsmsg` varchar(1500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianserta_ujian` (`idujian`),
  KEY `FK_ujianserta_siswa` (`nis`),
  KEY `FK_ujianserta_pegawai` (`nip`),
  KEY `FK_ujianserta_ujianremed` (`idujianremed`),
  KEY `FK_ujianserta_calonsiswa` (`nic`),
  KEY `IX_ujianserta` (`idujian`,`nis`,`nip`,`nic`),
  CONSTRAINT `FK_ujianserta_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianserta_ujianremed` FOREIGN KEY (`idujianremed`) REFERENCES `ujian` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianserta`
--

LOCK TABLES `ujianserta` WRITE;
/*!40000 ALTER TABLE `ujianserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujiansertasel`
--

DROP TABLE IF EXISTS `ujiansertasel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujiansertasel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `urutan` varchar(10) NOT NULL,
  `hasil` tinyint(3) NOT NULL DEFAULT '0' COMMENT '-1,0 Belum Veri,1',
  `bobot` decimal(5,2) NOT NULL DEFAULT '0.00',
  `nplay` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujiansertasel_soal` (`idsoal`),
  KEY `FK_ujiansertasel_ujianserta` (`idujianserta`),
  KEY `IX_ujiansertasel` (`idujianserta`,`idsoal`),
  CONSTRAINT `FK_ujiansertasel_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujiansertasel_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujiansertasel`
--

LOCK TABLES `ujiansertasel` WRITE;
/*!40000 ALTER TABLE `ujiansertasel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujiansertasel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianstatindikator`
--

DROP TABLE IF EXISTS `ujianstatindikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianstatindikator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idindikator` int(10) unsigned DEFAULT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `hasil` tinyint(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianstatindikator_ujianserta` (`idujianserta`),
  KEY `FK_ujianstatindikator_indikator` (`idindikator`),
  KEY `FK_ujianstatindikator_siswa` (`nis`),
  KEY `FK_ujianstatindikator_pegawai` (`nip`),
  KEY `FK_ujianstatindikator_idsoal` (`idsoal`),
  KEY `FK_ujianstatindikator_calonsiswa` (`nic`),
  KEY `IX_ujianstatindikator` (`idujianserta`,`nip`,`nis`,`nic`,`idindikator`,`idsoal`),
  CONSTRAINT `FK_ujianstatindikator_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_idsoal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_indikator` FOREIGN KEY (`idindikator`) REFERENCES `indikator` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatindikator_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianstatindikator`
--

LOCK TABLES `ujianstatindikator` WRITE;
/*!40000 ALTER TABLE `ujianstatindikator` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianstatindikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianstatkategori`
--

DROP TABLE IF EXISTS `ujianstatkategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianstatkategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idkategori` int(10) unsigned DEFAULT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `hasil` tinyint(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianstatkategori_siswa` (`nis`),
  KEY `FK_ujianstatkategori_pegawai` (`nip`),
  KEY `FK_ujianstatkategori_ujianserta` (`idujianserta`),
  KEY `FK_ujianstatkategori_kategori` (`idkategori`),
  KEY `FK_ujianstatkategori_idsoal` (`idsoal`),
  KEY `FK_ujianstatkategori_calonsiswa` (`nic`),
  KEY `IX_ujianstatkategori` (`idujianserta`,`nip`,`nis`,`nic`,`idkategori`,`idsoal`),
  CONSTRAINT `FK_ujianstatkategori_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_idsoal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstatkategori_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianstatkategori`
--

LOCK TABLES `ujianstatkategori` WRITE;
/*!40000 ALTER TABLE `ujianstatkategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianstatkategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujianstattema`
--

DROP TABLE IF EXISTS `ujianstattema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujianstattema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujianserta` int(10) unsigned NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `idtema` int(10) unsigned DEFAULT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `hasil` tinyint(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1 Pegawai 2 Siswa',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ujianstattema_ujianserta` (`idujianserta`),
  KEY `FK_ujianstattema_tema` (`idtema`),
  KEY `FK_ujianstattema_siswa` (`nis`),
  KEY `FK_ujianstattema_pegawai` (`nip`),
  KEY `FK_ujianstattema_soal` (`idsoal`),
  KEY `FK_ujianstattema_calonsiswa` (`nic`),
  KEY `IX_ujianstattema` (`idujianserta`,`nis`,`nip`,`nic`,`idtema`,`idsoal`),
  CONSTRAINT `FK_ujianstattema_calonsiswa` FOREIGN KEY (`nic`) REFERENCES `jbsakad`.`calonsiswa` (`nopendaftaran`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_tema` FOREIGN KEY (`idtema`) REFERENCES `tema` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ujianstattema_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujianstattema`
--

LOCK TABLES `ujianstattema` WRITE;
/*!40000 ALTER TABLE `ujianstattema` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujianstattema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdepartemen`
--

DROP TABLE IF EXISTS `userdepartemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdepartemen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `grantee` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_userdepartemen_pegawai` (`userid`),
  KEY `FK_userdepartemen_departemen` (`departemen`),
  KEY `FK_userdepartemen_pegawai_2` (`grantee`),
  CONSTRAINT `FK_userdepartemen_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userdepartemen_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userdepartemen_pegawai_2` FOREIGN KEY (`grantee`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdepartemen`
--

LOCK TABLES `userdepartemen` WRITE;
/*!40000 ALTER TABLE `userdepartemen` DISABLE KEYS */;
/*!40000 ALTER TABLE `userdepartemen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpelajaran`
--

DROP TABLE IF EXISTS `userpelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpelajaran` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `grantee` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Guru 2 Staf',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_userpelajaran_pegawai` (`userid`),
  KEY `FK_userpelajaran_pelajaran` (`idpelajaran`),
  KEY `FK_userpelajaran_pegawai_2` (`grantee`),
  CONSTRAINT `FK_userpelajaran_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userpelajaran_pegawai_2` FOREIGN KEY (`grantee`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_userpelajaran_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `jbsakad`.`pelajaran` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpelajaran`
--

LOCK TABLES `userpelajaran` WRITE;
/*!40000 ALTER TABLE `userpelajaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpelajaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuserinfo`
--

DROP TABLE IF EXISTS `webuserinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuserinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `sessionid` varchar(128) NOT NULL,
  `userpict` mediumtext NOT NULL,
  `welcome` mediumtext NOT NULL,
  `logintime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_webuserinfo` (`userid`,`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuserinfo`
--

LOCK TABLES `webuserinfo` WRITE;
/*!40000 ALTER TABLE `webuserinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `webuserinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuserintent`
--

DROP TABLE IF EXISTS `webuserintent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuserintent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `sessionid` varchar(128) NOT NULL,
  `intent` mediumtext NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webuserintent` (`userid`,`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuserintent`
--

LOCK TABLES `webuserintent` WRITE;
/*!40000 ALTER TABLE `webuserintent` DISABLE KEYS */;
/*!40000 ALTER TABLE `webuserintent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webusersoal`
--

DROP TABLE IF EXISTS `webusersoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webusersoal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `idujianserta` int(10) unsigned NOT NULL,
  `idsoal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `soal` varchar(10) NOT NULL,
  `soalthumb` varchar(10) NOT NULL,
  `penjelasan` varchar(10) NOT NULL,
  `jenis` tinyint(3) unsigned NOT NULL,
  `jenisessay` tinyint(3) unsigned NOT NULL,
  `njawaban` int(10) unsigned NOT NULL,
  `soalgabungjawaban` tinyint(3) unsigned NOT NULL,
  `bobot` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(100) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `pelajaran` varchar(100) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL DEFAULT '0',
  `tingkat` varchar(100) NOT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `semester` varchar(100) NOT NULL,
  `idkategori` int(10) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `idindikator` int(10) unsigned NOT NULL DEFAULT '0',
  `indikator` varchar(100) NOT NULL,
  `idtema` int(10) unsigned NOT NULL DEFAULT '0',
  `tema` varchar(100) NOT NULL,
  `resdir` varchar(45) NOT NULL DEFAULT '-',
  PRIMARY KEY (`id`),
  KEY `FK_webusersoal_ujianserta` (`idujianserta`),
  KEY `FK_webusersoal_soal` (`idsoal`),
  KEY `ix_webusersoal` (`userid`,`idujianserta`,`idsoal`),
  CONSTRAINT `FK_webusersoal_soal` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_webusersoal_ujianserta` FOREIGN KEY (`idujianserta`) REFERENCES `ujianserta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webusersoal`
--

LOCK TABLES `webusersoal` WRITE;
/*!40000 ALTER TABLE `webusersoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `webusersoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcome`
--

DROP TABLE IF EXISTS `welcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welcome` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'null untuk pegawai',
  `pesan` mediumtext NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_welcome_departemen` (`departemen`),
  CONSTRAINT `FK_welcome_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcome`
--

LOCK TABLES `welcome` WRITE;
/*!40000 ALTER TABLE `welcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `welcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsclient`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsclient` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsclient`;

--
-- Table structure for table `deleteddata`
--

DROP TABLE IF EXISTS `deleteddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleteddata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `dataid` varchar(50) NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_DELETEDDATA_SYNC` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleteddata`
--

LOCK TABLES `deleteddata` WRITE;
/*!40000 ALTER TABLE `deleteddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exporthistory`
--

DROP TABLE IF EXISTS `exporthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exporthistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` varchar(15) NOT NULL,
  `synctype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `synctime` datetime NOT NULL,
  `syncfile` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exporthistory`
--

LOCK TABLES `exporthistory` WRITE;
/*!40000 ALTER TABLE `exporthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `exporthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdate`
--

DROP TABLE IF EXISTS `liveupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `info` varchar(255) NOT NULL,
  `tipe` varchar(3) NOT NULL,
  `versi` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `repl_targetfile` varchar(255) DEFAULT NULL,
  `repl_varname` varchar(255) DEFAULT NULL,
  `repl_searchstr` varchar(255) DEFAULT NULL,
  `repl_replacestr` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Disable, 1 Enable',
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdate`
--

LOCK TABLES `liveupdate` WRITE;
/*!40000 ALTER TABLE `liveupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdateconfig`
--

DROP TABLE IF EXISTS `liveupdateconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdateconfig` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdateconfig`
--

LOCK TABLES `liveupdateconfig` WRITE;
/*!40000 ALTER TABLE `liveupdateconfig` DISABLE KEYS */;
INSERT INTO `liveupdateconfig` VALUES ('MIN_UPDATE_ID','781','-');
/*!40000 ALTER TABLE `liveupdateconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdatefile`
--

DROP TABLE IF EXISTS `liveupdatefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdatefile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `berkas` varchar(255) NOT NULL,
  `targetdir` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 Disable 1 Enable',
  `tipe` varchar(4) NOT NULL DEFAULT 'DOWN' COMMENT 'DOWN | EXEC',
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdatefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdatefile`
--

LOCK TABLES `liveupdatefile` WRITE;
/*!40000 ALTER TABLE `liveupdatefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdatefile2`
--

DROP TABLE IF EXISTS `liveupdatefile2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdatefile2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `berkas` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_LIVEUPDATEID` (`liveupdateid`)
) ENGINE=MyISAM AUTO_INCREMENT=781 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdatefile2`
--

LOCK TABLES `liveupdatefile2` WRITE;
/*!40000 ALTER TABLE `liveupdatefile2` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefile2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveupdatefiledown`
--

DROP TABLE IF EXISTS `liveupdatefiledown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveupdatefiledown` (
  `liveupdateid` int(10) unsigned NOT NULL,
  `filename` varchar(150) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `rectime` datetime NOT NULL,
  PRIMARY KEY (`liveupdateid`,`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveupdatefiledown`
--

LOCK TABLES `liveupdatefiledown` WRITE;
/*!40000 ALTER TABLE `liveupdatefiledown` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefiledown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkchanges`
--

DROP TABLE IF EXISTS `pkchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkchanges` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tablename` varchar(50) CHARACTER SET latin1 NOT NULL,
  `dataid` int(10) unsigned NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  `newpk` varchar(100) CHARACTER SET latin1 NOT NULL,
  `oldpk` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_PKCHANGES_SYNC` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkchanges`
--

LOCK TABLES `pkchanges` WRITE;
/*!40000 ALTER TABLE `pkchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syncconfig`
--

DROP TABLE IF EXISTS `syncconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncconfig` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syncconfig`
--

LOCK TABLES `syncconfig` WRITE;
/*!40000 ALTER TABLE `syncconfig` DISABLE KEYS */;
INSERT INTO `syncconfig` VALUES ('DATABASE_ID','TVQvIxw7my9elIfRnUYYY6Z1Gw9cpcdau4Kc8jUikXpUn','Please Don\'t Change OR Delete This Value');
/*!40000 ALTER TABLE `syncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synchistory`
--

DROP TABLE IF EXISTS `synchistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synchistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(15) NOT NULL,
  `transferid` varchar(15) NOT NULL,
  `synctype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `synctime` datetime NOT NULL,
  `syncfile` varchar(255) NOT NULL,
  `repopath` varchar(700) NOT NULL,
  `appid` varchar(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_SYNCHISTORY` (`method`,`synctype`,`starttime`,`appid`,`synctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synchistory`
--

LOCK TABLES `synchistory` WRITE;
/*!40000 ALTER TABLE `synchistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `synchistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcontrol`
--

DROP TABLE IF EXISTS `vcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcontrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c` varchar(5) NOT NULL,
  `v` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcontrol`
--

LOCK TABLES `vcontrol` WRITE;
/*!40000 ALTER TABLE `vcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `version` varchar(10) NOT NULL,
  `builddate` datetime NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('18.0','2019-08-01 00:00:00');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsfina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsfina` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsfina`;

--
-- Table structure for table `auditbesarjtt`
--

DROP TABLE IF EXISTS `auditbesarjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditbesarjtt` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditbesarjtt_auditinfo` (`idaudit`),
  KEY `IX_auditbesarjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditbesarjtt_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditbesarjtt`
--

LOCK TABLES `auditbesarjtt` WRITE;
/*!40000 ALTER TABLE `auditbesarjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditbesarjtt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditbesarjttcalon`
--

DROP TABLE IF EXISTS `auditbesarjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditbesarjttcalon` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditbesarjttcalon_auditinfo` (`idaudit`),
  KEY `IX_auditbesarjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditbesarjttcalon_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditbesarjttcalon`
--

LOCK TABLES `auditbesarjttcalon` WRITE;
/*!40000 ALTER TABLE `auditbesarjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditbesarjttcalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditinfo`
--

DROP TABLE IF EXISTS `auditinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditinfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumber` varchar(100) NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_auditinfo_departemen` (`departemen`),
  KEY `IX_auditinfo_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditinfo_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditinfo`
--

LOCK TABLES `auditinfo` WRITE;
/*!40000 ALTER TABLE `auditinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditjurnal`
--

DROP TABLE IF EXISTS `auditjurnal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditjurnal` (
  `status` tinyint(1) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `sumber` varchar(40) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditjurnal_auditinfo` (`idaudit`),
  KEY `IX_auditjurnal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditjurnal_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditjurnal`
--

LOCK TABLES `auditjurnal` WRITE;
/*!40000 ALTER TABLE `auditjurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditjurnal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditjurnaldetail`
--

DROP TABLE IF EXISTS `auditjurnaldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditjurnaldetail` (
  `status` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `koderek` varchar(15) NOT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_auditjurnaldetail_auditinfo` (`idaudit`),
  KEY `IX_auditjurnaldetail_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditjurnaldetail_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditjurnaldetail`
--

LOCK TABLES `auditjurnaldetail` WRITE;
/*!40000 ALTER TABLE `auditjurnaldetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditjurnaldetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaaniuran`
--

DROP TABLE IF EXISTS `auditpenerimaaniuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaaniuran` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaaniuran_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaaniuran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaaniuran_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaaniuran`
--

LOCK TABLES `auditpenerimaaniuran` WRITE;
/*!40000 ALTER TABLE `auditpenerimaaniuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaaniuran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaaniurancalon`
--

DROP TABLE IF EXISTS `auditpenerimaaniurancalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaaniurancalon` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaaniurancalon_audit` (`idaudit`),
  KEY `IX_auditpenerimaaniurancalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaaniurancalon_audit` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaaniurancalon`
--

LOCK TABLES `auditpenerimaaniurancalon` WRITE;
/*!40000 ALTER TABLE `auditpenerimaaniurancalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaaniurancalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaanjtt`
--

DROP TABLE IF EXISTS `auditpenerimaanjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaanjtt` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idbesarjtt` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanjtt_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaanjtt_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaanjtt`
--

LOCK TABLES `auditpenerimaanjtt` WRITE;
/*!40000 ALTER TABLE `auditpenerimaanjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanjtt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaanjttcalon`
--

DROP TABLE IF EXISTS `auditpenerimaanjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaanjttcalon` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idbesarjttcalon` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanjttcalon_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaanjttcalon_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaanjttcalon`
--

LOCK TABLES `auditpenerimaanjttcalon` WRITE;
/*!40000 ALTER TABLE `auditpenerimaanjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanjttcalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpenerimaanlain`
--

DROP TABLE IF EXISTS `auditpenerimaanlain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpenerimaanlain` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanlain_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanlain_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpenerimaanlain_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpenerimaanlain`
--

LOCK TABLES `auditpenerimaanlain` WRITE;
/*!40000 ALTER TABLE `auditpenerimaanlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanlain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditpengeluaran`
--

DROP TABLE IF EXISTS `auditpengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditpengeluaran` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idpengeluaran` int(10) unsigned NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jenispemohon` tinyint(1) unsigned NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `pemohonlain` int(10) unsigned DEFAULT NULL,
  `penerima` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tanggalkeluar` datetime NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `petugas` varchar(45) DEFAULT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `keterangan` text,
  `namapemohon` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpengeluaran_auditinfo` (`idaudit`),
  KEY `IX_auditpengeluaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_auditpengeluaran_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditpengeluaran`
--

LOCK TABLES `auditpengeluaran` WRITE;
/*!40000 ALTER TABLE `auditpengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpengeluaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audittabungan`
--

DROP TABLE IF EXISTS `audittabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audittabungan` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `idtabungan` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `debet` decimal(15,0) NOT NULL,
  `kredit` decimal(15,0) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_audittabungan_auditinfo` (`idaudit`),
  CONSTRAINT `FK_audittabungan_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audittabungan`
--

LOCK TABLES `audittabungan` WRITE;
/*!40000 ALTER TABLE `audittabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `audittabungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autotrans`
--

DROP TABLE IF EXISTS `autotrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autotrans` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `kelompok` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 Siswa, 2 Calon Siswa',
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `urutan` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smsinfo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_autotrans_departemen` (`departemen`),
  CONSTRAINT `FK_autotrans_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autotrans`
--

LOCK TABLES `autotrans` WRITE;
/*!40000 ALTER TABLE `autotrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `autotrans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autotransdata`
--

DROP TABLE IF EXISTS `autotransdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autotransdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idautotrans` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,2) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_autotransdata_autotrans` (`idautotrans`),
  KEY `FK_autotransdata_datapenerimaan` (`idpenerimaan`),
  CONSTRAINT `FK_autotransdata_autotrans` FOREIGN KEY (`idautotrans`) REFERENCES `autotrans` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_autotransdata_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autotransdata`
--

LOCK TABLES `autotransdata` WRITE;
/*!40000 ALTER TABLE `autotransdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `autotransdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kondisi` varchar(255) DEFAULT NULL,
  `jumlah` int(10) NOT NULL DEFAULT '0',
  `tglperolehan` date NOT NULL DEFAULT '0000-00-00',
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT 'unit',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_barang_kelompok` (`idkelompok`),
  KEY `IX_barang_ts` (`ts`,`issync`),
  CONSTRAINT `FK_barang_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokbarang` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_barang BEFORE INSERT ON jbsfina.barang
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_barang BEFORE UPDATE ON jbsfina.barang
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_barang AFTER DELETE ON jbsfina.barang
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'barang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `besarjtt`
--

DROP TABLE IF EXISTS `besarjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `besarjtt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `cicilan` decimal(15,0) NOT NULL DEFAULT '0',
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranjtt_siswa` (`nis`),
  KEY `FK_pembayaranjtt_penerimaan` (`idpenerimaan`),
  KEY `IX_besarjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_besarjtt_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaranjtt_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besarjtt`
--

LOCK TABLES `besarjtt` WRITE;
/*!40000 ALTER TABLE `besarjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `besarjtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_besarjtt BEFORE INSERT ON jbsfina.besarjtt
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_besarjtt BEFORE UPDATE ON jbsfina.besarjtt
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_besarjtt_101` AFTER UPDATE ON `besarjtt` FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF (@DISABLE_TRIGGERS IS NULL) AND (@DISABLE_TRIGER IS NULL) THEN
		SELECT p.departemen INTO xdepartemen
		  FROM besarjtt b, datapenerimaan p
		 WHERE b.idpenerimaan = p.replid AND b.replid = NEW.replid;
		 
		INSERT INTO auditinfo SET departemen=xdepartemen, sumber='besarjtt', idsumber=new.replid, tanggal=now(), petugas=new.pengguna, alasan=new.info3;
		
		SELECT last_insert_id() INTO xidaudit;
		
		INSERT INTO auditbesarjtt SET statusdata=0, idaudit=xidaudit, replid=OLD.replid, nis=OLD.nis, 
			idpenerimaan=OLD.idpenerimaan, besar=OLD.besar, lunas=OLD.lunas, keterangan=OLD.keterangan, pengguna=OLD.pengguna, info1=OLD.info1, info2=OLD.info2;
		
		INSERT INTO auditbesarjtt SET statusdata=1, idaudit=xidaudit, replid=NEW.replid, nis=NEW.nis, 
			idpenerimaan=NEW.idpenerimaan, besar=NEW.besar, lunas=NEW.lunas, keterangan=NEW.keterangan, pengguna=NEW.pengguna, info1=NEW.info1, info2=NEW.info2;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_besarjtt AFTER DELETE ON jbsfina.besarjtt
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'besarjtt', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `besarjttcalon`
--

DROP TABLE IF EXISTS `besarjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `besarjttcalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcalon` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `cicilan` decimal(15,0) NOT NULL DEFAULT '0',
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_besarjttcalon_penerimaan` (`idpenerimaan`),
  KEY `FK_besarjttcalon_calonsiswa` (`idcalon`),
  KEY `IX_besarjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_besarjttcalon_calonsiswa` FOREIGN KEY (`idcalon`) REFERENCES `jbsakad`.`calonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_besarjttcalon_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besarjttcalon`
--

LOCK TABLES `besarjttcalon` WRITE;
/*!40000 ALTER TABLE `besarjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `besarjttcalon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_besarjttcalon BEFORE INSERT ON jbsfina.besarjttcalon
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_besarjttcalon BEFORE UPDATE ON jbsfina.besarjttcalon
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_besarjttcalon_101` AFTER UPDATE ON `besarjttcalon` FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF (@DISABLE_TRIGGERS IS NULL) AND (@DISABLE_TRIGER IS NULL) THEN
		SELECT p.departemen INTO xdepartemen
		FROM besarjttcalon b, datapenerimaan p
		WHERE b.idpenerimaan = p.replid AND b.replid = NEW.replid;
		 
		INSERT INTO auditinfo SET departemen=xdepartemen, sumber='besarjttcalon', idsumber=new.replid, tanggal=now(), petugas=new.pengguna, alasan=new.info3;
		
		SELECT last_insert_id() INTO xidaudit;
		
		INSERT INTO auditbesarjttcalon SET statusdata=0, idaudit=xidaudit, replid=OLD.replid, idcalon=OLD.idcalon, 
			idpenerimaan=OLD.idpenerimaan, besar=OLD.besar, lunas=OLD.lunas, keterangan=OLD.keterangan, pengguna=OLD.pengguna, info1=OLD.info1, info2=OLD.info2;
		
		INSERT INTO auditbesarjttcalon SET statusdata=1, idaudit=xidaudit, replid=NEW.replid, idcalon=NEW.idcalon, 
			idpenerimaan=NEW.idpenerimaan, besar=NEW.besar, lunas=NEW.lunas, keterangan=NEW.keterangan, pengguna=NEW.pengguna, info1=NEW.info1, info2=NEW.info2;
	END IF;		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_besarjttcalon AFTER DELETE ON jbsfina.besarjttcalon
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'besarjttcalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `datadsp`
--

DROP TABLE IF EXISTS `datadsp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datadsp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `dsp` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `operator` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_datadsp_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datadsp`
--

LOCK TABLES `datadsp` WRITE;
/*!40000 ALTER TABLE `datadsp` DISABLE KEYS */;
/*!40000 ALTER TABLE `datadsp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapenerimaan`
--

DROP TABLE IF EXISTS `datapenerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapenerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `besar` decimal(15,0) DEFAULT NULL,
  `idkategori` varchar(15) NOT NULL,
  `rekkas` varchar(15) NOT NULL,
  `rekpendapatan` varchar(15) NOT NULL,
  `rekpiutang` varchar(15) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datapenerimaan_rekakun_kas` (`rekkas`),
  KEY `FK_datapenerimaan_rekakun_pendapatan` (`rekpendapatan`),
  KEY `FK_datapenerimaan_rekakun_piutang` (`rekpiutang`),
  KEY `FK_datapenerimaan_kategoripenerimaan` (`idkategori`),
  KEY `FK_datapenerimaan_departemen` (`departemen`),
  KEY `IX_datapenerimaan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datapenerimaan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_kategoripenerimaan` FOREIGN KEY (`idkategori`) REFERENCES `kategoripenerimaan` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_rekakun_kas` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_rekakun_pendapatan` FOREIGN KEY (`rekpendapatan`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapenerimaan_rekakun_piutang` FOREIGN KEY (`rekpiutang`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapenerimaan`
--

LOCK TABLES `datapenerimaan` WRITE;
/*!40000 ALTER TABLE `datapenerimaan` DISABLE KEYS */;
INSERT INTO `datapenerimaan` VALUES (9,'SPP Bulanan',NULL,'JTT','111','411','150',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','421',NULL,NULL,'2012-01-02 00:14:49',41237,0),(11,'Dana Sumbangan Pendidikan',NULL,'CSWJB','111','412','153',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','422',NULL,NULL,'2012-01-02 00:59:59',12756,0),(12,'Sumbangan BOS',NULL,'LNN','113','414','154',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','424',NULL,NULL,'2012-01-02 01:01:04',5601,0),(13,'Tabungan Siswa',NULL,'SKR','112','413','150',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','423',NULL,NULL,'2012-01-02 00:57:14',55264,0),(14,'Sumbangan Pendidikan',NULL,'CSSKR','112','415','153',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA','425',NULL,NULL,'2012-01-02 00:59:39',62929,0);
/*!40000 ALTER TABLE `datapenerimaan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_datapenerimaan BEFORE INSERT ON jbsfina.datapenerimaan
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_datapenerimaan BEFORE UPDATE ON jbsfina.datapenerimaan
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_datapenerimaan AFTER DELETE ON jbsfina.datapenerimaan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'datapenerimaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `datapengeluaran`
--

DROP TABLE IF EXISTS `datapengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rekdebet` varchar(15) NOT NULL,
  `rekkredit` varchar(15) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `besar` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datapengeluaran_departemen` (`departemen`),
  KEY `FK_datapengeluaran_rekakun` (`rekdebet`),
  KEY `FK_datapengeluaran_rekakun2` (`rekkredit`),
  KEY `IX_datapengeluaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datapengeluaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapengeluaran_rekakun` FOREIGN KEY (`rekdebet`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datapengeluaran_rekakun2` FOREIGN KEY (`rekkredit`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapengeluaran`
--

LOCK TABLES `datapengeluaran` WRITE;
/*!40000 ALTER TABLE `datapengeluaran` DISABLE KEYS */;
INSERT INTO `datapengeluaran` VALUES (4,'SMA','Bayar Listrik','501','111',1,'Sekedar contoh. Menu ini mengatur setiap jenis pengeluaran yang mungkin dikeluarkan sekolah. Anda harus menentukan rekening Kas dan Beban untuk setiap transaksi pengeluaran.',0,NULL,NULL,NULL,'2010-03-02 03:06:52',17792,0);
/*!40000 ALTER TABLE `datapengeluaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datatabungan`
--

DROP TABLE IF EXISTS `datatabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datatabungan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `rekkas` varchar(15) NOT NULL,
  `rekutang` varchar(15) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datatabungan_rekakun_kas` (`rekkas`),
  KEY `FK_datatabungan_rekakun_utang` (`rekutang`),
  KEY `FK_datatabungan_departemen` (`departemen`),
  KEY `IX_datatabungan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_datatabungan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datatabungan_rekakun_kas` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_datatabungan_rekakun_utang` FOREIGN KEY (`rekutang`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datatabungan`
--

LOCK TABLES `datatabungan` WRITE;
/*!40000 ALTER TABLE `datatabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `datatabungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatsms`
--

DROP TABLE IF EXISTS `formatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatsms` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(10) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `format` varchar(255) NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatsms`
--

LOCK TABLES `formatsms` WRITE;
/*!40000 ALTER TABLE `formatsms` DISABLE KEYS */;
INSERT INTO `formatsms` VALUES (1,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(2,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(3,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(4,'SISPAY','SMP','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(5,'SISPAY','SD','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(6,'SISPAY','SMK','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(7,'SISPAY','Bimbel','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(8,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(9,'CSISPAY','SMP','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(10,'CSISPAY','SD','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(11,'CSISPAY','SMK','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(12,'CSISPAY','Bimbel','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(13,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(14,'SISPAY','SMP','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(15,'SISPAY','SD','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(16,'SISPAY','SMK','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(17,'SISPAY','Bimbel','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(18,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(19,'CSISPAY','SMP','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(20,'CSISPAY','SD','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(21,'CSISPAY','SMK','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(22,'CSISPAY','Bimbel','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(23,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(24,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(25,'SISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL),(26,'CSISPAY','SMA','Terima kasih, kami telah menerima pembayaran dari {NAMA} tanggal {TANGGAL} sebesar {BESAR} untuk {PEMBAYARAN} - Bag. Keuangan',NULL,NULL,NULL);
/*!40000 ALTER TABLE `formatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupbarang`
--

DROP TABLE IF EXISTS `groupbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupbarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(45) DEFAULT NULL,
  `namagroup` varchar(45) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_groupbarang_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupbarang`
--

LOCK TABLES `groupbarang` WRITE;
/*!40000 ALTER TABLE `groupbarang` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupbarang` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_groupbarang BEFORE INSERT ON jbsfina.groupbarang
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_groupbarang BEFORE UPDATE ON jbsfina.groupbarang
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_groupbarang AFTER DELETE ON jbsfina.groupbarang
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'groupbarang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jurnal`
--

DROP TABLE IF EXISTS `jurnal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `idpetugas` varchar(30) DEFAULT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `sumber` varchar(40) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jurnal_tahunbuku` (`idtahunbuku`),
  KEY `IX_jurnal_tanggal` (`tanggal`),
  KEY `IX_jurnal_idtahunbuku` (`idtahunbuku`),
  KEY `IX_jurnal_ts` (`ts`,`issync`),
  KEY `FK_jurnal_pegawai` (`idpetugas`),
  KEY `IX_jurnal` (`nokas`,`sumber`),
  CONSTRAINT `FK_jurnal_pegawai` FOREIGN KEY (`idpetugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_jurnal_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnal`
--

LOCK TABLES `jurnal` WRITE;
/*!40000 ALTER TABLE `jurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurnaldetail`
--

DROP TABLE IF EXISTS `jurnaldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurnaldetail` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `koderek` varchar(15) NOT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jurnaldetail_jurnal` (`idjurnal`),
  KEY `IX_jurnaldetail_koderek` (`koderek`),
  KEY `IX_jurnaldetail_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jurnaldetail_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_jurnaldetail_rekakun` FOREIGN KEY (`koderek`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnaldetail`
--

LOCK TABLES `jurnaldetail` WRITE;
/*!40000 ALTER TABLE `jurnaldetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnaldetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoripenerimaan`
--

DROP TABLE IF EXISTS `kategoripenerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategoripenerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siswa` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`),
  UNIQUE KEY `Index_1` (`replid`),
  KEY `IX_kategoripenerimaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoripenerimaan`
--

LOCK TABLES `kategoripenerimaan` WRITE;
/*!40000 ALTER TABLE `kategoripenerimaan` DISABLE KEYS */;
INSERT INTO `kategoripenerimaan` VALUES (4,'CSSKR','Iuran Sukarela Calon Siswa',4,1,NULL,NULL,NULL,'2010-03-02 03:06:52',31230,0),(3,'CSWJB','Iuran Wajib Calon Siswa',3,1,NULL,NULL,NULL,'2010-03-02 03:06:52',37247,0),(1,'JTT','Iuran Wajib Siswa',1,1,NULL,NULL,NULL,'2010-03-02 03:06:52',27011,0),(5,'LNN','Penerimaan Lainnya',5,1,NULL,NULL,NULL,'2010-03-02 03:06:52',23315,0),(2,'SKR','Iuran Sukarela Siswa',2,1,NULL,NULL,NULL,'2010-03-02 03:06:52',35541,0);
/*!40000 ALTER TABLE `kategoripenerimaan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kategoripenerimaan BEFORE INSERT ON jbsfina.kategoripenerimaan
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kategoripenerimaan BEFORE UPDATE ON jbsfina.kategoripenerimaan
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kategoripenerimaan AFTER DELETE ON jbsfina.kategoripenerimaan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kategoripenerimaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `katerekakun`
--

DROP TABLE IF EXISTS `katerekakun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `katerekakun` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kategori`),
  UNIQUE KEY `Index_1` (`replid`),
  KEY `IX_katerekakun_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `katerekakun`
--

LOCK TABLES `katerekakun` WRITE;
/*!40000 ALTER TABLE `katerekakun` DISABLE KEYS */;
INSERT INTO `katerekakun` VALUES (7,'BIAYA',7,NULL,NULL,NULL,'2010-03-02 03:06:52',42231,0),(1,'HARTA',1,NULL,NULL,NULL,'2010-03-02 03:06:52',38999,0),(3,'INVENTARIS',3,NULL,NULL,NULL,'2010-03-02 03:06:52',2775,0),(5,'MODAL',5,NULL,NULL,NULL,'2010-03-02 03:06:52',27935,0),(6,'PENDAPATAN',6,NULL,NULL,NULL,'2010-03-02 03:06:52',289,0),(2,'PIUTANG',2,NULL,NULL,NULL,'2010-03-02 03:06:52',48701,0),(4,'UTANG',4,NULL,NULL,NULL,'2010-03-02 03:06:52',46047,0);
/*!40000 ALTER TABLE `katerekakun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompokbarang`
--

DROP TABLE IF EXISTS `kelompokbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompokbarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(255) NOT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `idgroup` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokbarang_group` (`idgroup`),
  KEY `IX_kelompokbarang_ts` (`ts`,`issync`),
  CONSTRAINT `FK_kelompokbarang_group` FOREIGN KEY (`idgroup`) REFERENCES `groupbarang` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompokbarang`
--

LOCK TABLES `kelompokbarang` WRITE;
/*!40000 ALTER TABLE `kelompokbarang` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokbarang` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_kelompokbarang BEFORE INSERT ON jbsfina.kelompokbarang
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_kelompokbarang BEFORE UPDATE ON jbsfina.kelompokbarang
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_kelompokbarang AFTER DELETE ON jbsfina.kelompokbarang
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kelompokbarang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pemohonlain`
--

DROP TABLE IF EXISTS `pemohonlain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemohonlain` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_pemohonlain_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemohonlain`
--

LOCK TABLES `pemohonlain` WRITE;
/*!40000 ALTER TABLE `pemohonlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemohonlain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerimaaniuran`
--

DROP TABLE IF EXISTS `penerimaaniuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaaniuran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaraniuran_jurnal` (`idjurnal`),
  KEY `FK_pembayaraniuran_datapenerimaan` (`idpenerimaan`),
  KEY `FK_pembayaraniuran_siswa` (`nis`),
  KEY `IX_penerimaaniuran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pembayaraniuran_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaraniuran_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaraniuran_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaaniuran`
--

LOCK TABLES `penerimaaniuran` WRITE;
/*!40000 ALTER TABLE `penerimaaniuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaaniuran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_penerimaaniuran BEFORE INSERT ON jbsfina.penerimaaniuran
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaaniuran_100` AFTER INSERT ON `penerimaaniuran` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaaniuran', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_penerimaaniuran BEFORE UPDATE ON jbsfina.penerimaaniuran
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_penerimaaniuran_101` AFTER UPDATE ON `penerimaaniuran` FOR EACH ROW BEGIN
	declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
		
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaaniuran' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaaniuran', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaaniuran set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			nis=old.nis;
		
		insert into auditpenerimaaniuran set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			nis=new.nis;
		
	END IF;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_penerimaaniuran AFTER DELETE ON jbsfina.penerimaaniuran
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaaniuran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaaniurancalon`
--

DROP TABLE IF EXISTS `penerimaaniurancalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaaniurancalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_penerimaaniurancalon_datapenerimaan` (`idpenerimaan`),
  KEY `FK_penerimaaniurancalon_calon` (`idcalon`),
  KEY `FK_penerimaaniurancalon_jurnal` (`idjurnal`),
  KEY `IX_penerimaaniurancalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_penerimaaniurancalon_calon` FOREIGN KEY (`idcalon`) REFERENCES `jbsakad`.`calonsiswa` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penerimaaniurancalon_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penerimaaniurancalon_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaaniurancalon`
--

LOCK TABLES `penerimaaniurancalon` WRITE;
/*!40000 ALTER TABLE `penerimaaniurancalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaaniurancalon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_penerimaaniurancalon BEFORE INSERT ON jbsfina.penerimaaniurancalon
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaaniurancalon_100` AFTER INSERT ON `penerimaaniurancalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaaniurancalon', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_penerimaaniurancalon BEFORE UPDATE ON jbsfina.penerimaaniurancalon
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_penerimaaniurancalon_101` AFTER UPDATE ON `penerimaaniurancalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
		
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaaniurancalon' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaaniurancalon', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaaniurancalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			idcalon=old.idcalon;
		
		insert into auditpenerimaaniurancalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			idcalon=new.idcalon;
	
	END IF;	
    		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_penerimaaniurancalon AFTER DELETE ON jbsfina.penerimaaniurancalon
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaaniurancalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaanjtt`
--

DROP TABLE IF EXISTS `penerimaanjtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaanjtt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbesarjtt` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT ' ',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranjtt_besatjtt` (`idbesarjtt`),
  KEY `FK_pembayaranjtt_jurnal` (`idjurnal`),
  KEY `IX_penerimaanjtt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pembayaranjtt_besatjtt` FOREIGN KEY (`idbesarjtt`) REFERENCES `besarjtt` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaranjtt_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaanjtt`
--

LOCK TABLES `penerimaanjtt` WRITE;
/*!40000 ALTER TABLE `penerimaanjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanjtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_penerimaanjtt BEFORE INSERT ON jbsfina.penerimaanjtt
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaanjtt_100` AFTER INSERT ON `penerimaanjtt` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from besarjtt b, datapenerimaan p
    	where b.idpenerimaan = p.replid and b.replid = new.idbesarjtt;
    
    insert into transaksilog set sumber='penerimaanjtt', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_penerimaanjtt BEFORE UPDATE ON jbsfina.penerimaanjtt
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_penerimaanjtt_102 AFTER UPDATE ON jbsfina.penerimaanjtt
FOR EACH ROW BEGIN 
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from besarjtt b, datapenerimaan p
			where b.idpenerimaan = p.replid and b.replid = new.idbesarjtt;
			
		update transaksilog set tanggal = new.tanggal, transaksi = xinfo, petugas = new.petugas, nokas = xnokas, 
			idtahunbuku = xidtahunbuku, keterangan = xketerangan, debet = new.jumlah, kredit = 0 
			where sumber='penerimaanjtt' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanjtt', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanjtt set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjtt=old.idbesarjtt, 
			idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, info1=old.info1, info2=old.info2, info3=old.info3;
			
		insert into auditpenerimaanjtt set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjtt=new.idbesarjtt, 
			idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, info1=new.info1, info2=new.info2, info3=new.info3;
		
	END IF;		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_penerimaanjtt AFTER DELETE ON jbsfina.penerimaanjtt
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaanjtt', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaanjttcalon`
--

DROP TABLE IF EXISTS `penerimaanjttcalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaanjttcalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbesarjttcalon` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_penerimaanjttcalon_jurnal` (`idjurnal`),
  KEY `FK_penerimaanjttcalon_besarjtt` (`idbesarjttcalon`),
  KEY `IX_penerimaanjttcalon_ts` (`ts`,`issync`),
  CONSTRAINT `FK_penerimaanjttcalon_besarjttcalon` FOREIGN KEY (`idbesarjttcalon`) REFERENCES `besarjttcalon` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penerimaanjttcalon_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaanjttcalon`
--

LOCK TABLES `penerimaanjttcalon` WRITE;
/*!40000 ALTER TABLE `penerimaanjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanjttcalon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_penerimaanjttcalon BEFORE INSERT ON jbsfina.penerimaanjttcalon
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaanjttcalon_100` AFTER INSERT ON `penerimaanjttcalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from besarjttcalon b, datapenerimaan p
    	where b.idpenerimaan = p.replid and b.replid = new.idbesarjttcalon;
    
    insert into transaksilog set sumber='penerimaanjttcalon', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_penerimaanjttcalon BEFORE UPDATE ON jbsfina.penerimaanjttcalon
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_penerimaanjttcalon_102 AFTER UPDATE ON jbsfina.penerimaanjttcalon
FOR EACH ROW BEGIN 
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from besarjttcalon b, datapenerimaan p
			where b.idpenerimaan = p.replid and b.replid = new.idbesarjttcalon;
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaanjttcalon' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanjttcalon', idsumber=new.replid, tanggal=now(), petugas=  new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanjttcalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjttcalon=old.idbesarjttcalon, idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, info1=old.info1, info2=old.info2, info3=old.info3;
		
		insert into auditpenerimaanjttcalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjttcalon=new.idbesarjttcalon, idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, info1=new.info1, info2=new.info2, info3=new.info3;

	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_penerimaanjttcalon AFTER DELETE ON jbsfina.penerimaanjttcalon
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaanjttcalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penerimaanlain`
--

DROP TABLE IF EXISTS `penerimaanlain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaanlain` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranlain_jurnal` (`idjurnal`),
  KEY `FK_pembayaranlain_datapenerimaan` (`idpenerimaan`),
  KEY `IX_penerimaanlain_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pembayaranlain_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaranlain_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaanlain`
--

LOCK TABLES `penerimaanlain` WRITE;
/*!40000 ALTER TABLE `penerimaanlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanlain` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_penerimaanlain_100` AFTER INSERT ON `penerimaanlain` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaanlain', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_penerimaanlain_101` AFTER UPDATE ON `penerimaanlain` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
			
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaanlain' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanlain', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanlain set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			sumber=old.sumber;
			
		insert into auditpenerimaanlain set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			sumber=new.sumber;
		
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pengeluaran`
--

DROP TABLE IF EXISTS `pengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengeluaran` int(10) unsigned NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jenispemohon` tinyint(1) unsigned NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `pemohonlain` int(10) unsigned DEFAULT NULL,
  `penerima` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tanggalkeluar` datetime NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `petugas` varchar(45) DEFAULT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `keterangan` text,
  `namapemohon` varchar(100) NOT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pengeluaran_nis` (`nis`),
  KEY `FK_pengeluaran_nip` (`nip`),
  KEY `FK_pengeluaran_jurnal` (`idjurnal`),
  KEY `FK_pengeluaran_pemohonlain` (`pemohonlain`),
  KEY `IX_pengeluaran_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pengeluaran_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengeluaran_nip` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengeluaran_nis` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengeluaran_pemohonlain` FOREIGN KEY (`pemohonlain`) REFERENCES `pemohonlain` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengeluaran`
--

LOCK TABLES `pengeluaran` WRITE;
/*!40000 ALTER TABLE `pengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengeluaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_pengeluaran_100` AFTER INSERT ON `pengeluaran` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapengeluaran
    	where replid = new.idpengeluaran;
		
    insert into transaksilog set sumber='pengeluaran', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=0, kredit=new.jumlah, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trupd_pengeluaran_100` AFTER UPDATE ON `pengeluaran` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    	
    select departemen into xdepartemen
    	from datapengeluaran
    	where replid = new.idpengeluaran;
		
    update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=0, kredit=new.jumlah
    	where sumber='pengeluaran' and idsumber=new.replid;
	
	IF new.tanggal <> old.tanggal THEN
        update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
    END IF;	
    
    insert into auditinfo set departemen=xdepartemen, sumber='pengeluaran', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
    
    select last_insert_id() into xidaudit;
    
    insert into auditpengeluaran set statusdata=0, idaudit=xidaudit, replid=old.replid, idpengeluaran=old.idpengeluaran, 
    	keperluan=old.keperluan, jenispemohon=old.jenispemohon, nip=old.nip, nis=old.nis, pemohonlain=old.pemohonlain, 
    	penerima=old.penerima, tanggal=old.tanggal, tanggalkeluar=old.tanggalkeluar, jumlah=old.jumlah, petugas=old.petugas,
    	idjurnal=old.idjurnal, keterangan=old.keterangan, namapemohon=old.namapemohon;
    
    insert into auditpengeluaran set statusdata=1, idaudit=xidaudit, replid=new.replid, idpengeluaran=new.idpengeluaran, 
    	keperluan=new.keperluan, jenispemohon=new.jenispemohon, nip=new.nip, nis=new.nis, pemohonlain=new.pemohonlain, 
    	penerima=new.penerima, tanggal=new.tanggal, tanggalkeluar=new.tanggalkeluar, jumlah=new.jumlah, petugas=new.petugas,
    	idjurnal=new.idjurnal, keterangan=new.keterangan, namapemohon=new.namapemohon;
    		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengguna` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pengguna_pegawai` (`nip`),
  KEY `IX_pengguna_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pengguna_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekakun`
--

DROP TABLE IF EXISTS `rekakun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rekakun` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`),
  UNIQUE KEY `UX_rekakun` (`replid`),
  KEY `FK_rekakun_katerekakun` (`kategori`),
  KEY `IX_rekakun_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rekakun_katerekakun` FOREIGN KEY (`kategori`) REFERENCES `katerekakun` (`kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekakun`
--

LOCK TABLES `rekakun` WRITE;
/*!40000 ALTER TABLE `rekakun` DISABLE KEYS */;
INSERT INTO `rekakun` VALUES (1,'111','HARTA','Kas','Kas yang ada disekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',18600,0),(2,'112','HARTA','Kas Bank','Kas yang ada di bank yang digunakan sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',20390,0),(3,'113','HARTA','Kas BOS','Kas yang diterima dari sumbangan Bantuan Operasional Sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',46147,0),(4,'150','PIUTANG','Piutang Siswa','Piutang siswa kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',38508,0),(5,'151','PIUTANG','Piutang Karyawan','Piutang karyawan kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',54096,0),(6,'152','PIUTANG','Piutang Usaha','Piutang yang lain kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',23895,0),(24,'153','PIUTANG','Piutang Calon Siswa','',NULL,NULL,NULL,'2012-01-02 00:58:13',0,0),(27,'154','PIUTANG','Piutang BOS','',NULL,NULL,NULL,'2012-01-02 01:00:51',0,0),(7,'411','PENDAPATAN','Pendapatan SPP','Pendapatan dari pembayaran SPP siswa',NULL,NULL,NULL,'2010-03-02 03:06:53',22719,0),(8,'412','PENDAPATAN','Pendapatan DSP','Pendapatan dari pembayaran DSP siswa',NULL,NULL,NULL,'2010-03-02 03:06:53',41907,0),(9,'413','PENDAPATAN','Pendapatan Sukarela Siswa','Pendapatan dari perolehan dana sukarela',NULL,NULL,NULL,'2010-03-02 03:06:53',10317,0),(10,'414','PENDAPATAN','Pendapatan BOS','Pendaptan dari penerimaan sumbangan Bantuan Operasional Sekolah (BOS)',NULL,NULL,NULL,'2010-03-02 03:06:53',56924,0),(25,'415','PENDAPATAN','Pendapatan Sukarela Calon Siswa','',NULL,NULL,NULL,'2012-01-02 00:58:41',0,0),(20,'421','PENDAPATAN','Diskon SPP','',NULL,NULL,NULL,'2012-01-02 00:14:27',0,0),(21,'422','PENDAPATAN','Diskon DSP','',NULL,NULL,NULL,'2012-01-02 00:56:29',0,0),(22,'423','PENDAPATAN','Diskon Sukarela Siswa','',NULL,NULL,NULL,'2012-01-02 00:56:43',0,0),(23,'424','PENDAPATAN','Diskon BOS','',NULL,NULL,NULL,'2012-01-02 00:56:53',0,0),(26,'425','PENDAPATAN','Diskon Sukarela Calon Siswa','',NULL,NULL,NULL,'2012-01-02 00:59:15',0,0),(11,'500','BIAYA','Beban Transportasi','Beban yang dikeluarkan untuk pembiayaan transportasi',NULL,NULL,NULL,'2010-03-02 03:06:53',57077,0),(12,'501','BIAYA','Beban Listrik','Beban yang dikeluarkan untuk melunasi tagihan PLN',NULL,NULL,NULL,'2010-03-02 03:06:53',49084,0),(13,'502','BIAYA','Beban Telpon','Beban yang dikeluarkan untuk pembiayaan tagihan telpon',NULL,NULL,NULL,'2010-03-02 03:06:53',8658,0),(14,'503','BIAYA','Beban Internet','Beban yang dikeluarkan untuk pembiayaan taghan Internet',NULL,NULL,NULL,'2010-03-02 03:06:53',27097,0),(15,'504','BIAYA','Beban ATK','Beban yang dikeluarkan untuk pembelian rutin ATK',NULL,NULL,NULL,'2010-03-02 03:06:53',43981,0),(16,'611','INVENTARIS','Peralatan Mengajar','Inventaris alat-alat kegiatan belajar mengajar',NULL,NULL,NULL,'2010-03-02 03:06:53',7554,0),(17,'612','INVENTARIS','Kendaraan','Inventaris kendaraan sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',36888,0),(18,'700','MODAL','Modal Usaha','Modal yang ditanamkan oleh pemodal kepada sekolah',NULL,NULL,NULL,'2010-03-02 03:06:53',30715,0),(19,'900','UTANG','Utang Usaha','Utang sekolah kepada kreditur',NULL,NULL,NULL,'2010-03-02 03:06:53',42913,0);
/*!40000 ALTER TABLE `rekakun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabungan`
--

DROP TABLE IF EXISTS `tabungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabungan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtabungan` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 NOT NULL,
  `debet` decimal(15,0) NOT NULL,
  `kredit` decimal(15,0) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tabungan_datatabungan` (`idtabungan`),
  KEY `FK_tabungan_jurnal` (`idjurnal`),
  KEY `FK_tabungan_siswa` (`nis`),
  CONSTRAINT `FK_tabungan_datatabungan` FOREIGN KEY (`idtabungan`) REFERENCES `datatabungan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tabungan_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tabungan_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabungan`
--

LOCK TABLES `tabungan` WRITE;
/*!40000 ALTER TABLE `tabungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabungan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trins_tabungan_100` AFTER INSERT ON `tabungan` 
FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from datatabungan p
    	where p.replid = new.idtabungan;
    
    insert into transaksilog set sumber='tabungan', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.debet, kredit=new.kredit, departemen=xdepartemen;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER trupd_tabungan_102 AFTER UPDATE ON jbsfina.tabungan
FOR EACH ROW BEGIN 
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from datatabungan p
			where p.replid = new.idtabungan;
			
		update transaksilog set tanggal = new.tanggal, transaksi = xinfo, petugas = new.petugas, nokas = xnokas, 
			idtahunbuku = xidtahunbuku, keterangan = xketerangan, debet = new.debet, kredit = new.kredit
			where sumber='tabungan' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='tabungan', 
			idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into audittabungan set statusdata=0, idaudit=xidaudit, idtabungan=old.idtabungan, 
			idjurnal=old.idjurnal, tanggal=old.tanggal, nis=old.nis, debet=old.debet, 
			kredit=old.kredit, petugas=old.petugas, keterangan=old.keterangan,
			info1=old.info1, info2=old.info2, info3=old.info3;
		
		insert into audittabungan set statusdata=1, idaudit=xidaudit, idtabungan=new.idtabungan, 
			idjurnal=new.idjurnal, tanggal=new.tanggal, nis=new.nis, debet=new.debet, 
			kredit=new.kredit, petugas=new.petugas, keterangan=new.keterangan,
			info1=new.info1, info2=new.info2, info3=new.info3;
					
	END IF;		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tahunbuku`
--

DROP TABLE IF EXISTS `tahunbuku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` varchar(100) NOT NULL,
  `awalan` varchar(5) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `cacah` bigint(20) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL,
  `tanggalmulai` date NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tahunbuku_departemen` (`departemen`),
  KEY `IX_tahunbuku_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tahunbuku_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahunbuku`
--

LOCK TABLES `tahunbuku` WRITE;
/*!40000 ALTER TABLE `tahunbuku` DISABLE KEYS */;
/*!40000 ALTER TABLE `tahunbuku` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_tahunbuku BEFORE INSERT ON jbsfina.tahunbuku
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_tahunbuku BEFORE UPDATE ON jbsfina.tahunbuku
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_tahunbuku AFTER DELETE ON jbsfina.tahunbuku
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'tahunbuku', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transaksilog`
--

DROP TABLE IF EXISTS `transaksilog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksilog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumber` varchar(45) NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_transaksilog_departemen` (`departemen`),
  KEY `IX_transaksilog_ts` (`ts`,`issync`),
  CONSTRAINT `FK_transaksilog_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksilog`
--

LOCK TABLES `transaksilog` WRITE;
/*!40000 ALTER TABLE `transaksilog` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksilog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsletter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsletter` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsletter`;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other',
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_anggota_kelompok` (`idkelompok`),
  KEY `FK_anggota_siswa` (`nis`),
  KEY `FK_anggota_pegawai` (`nip`),
  CONSTRAINT `FK_anggota_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_anggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berkassurat`
--

DROP TABLE IF EXISTS `berkassurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `berkassurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Gambar, 1 File',
  `berkas` longblob NOT NULL,
  `w` int(10) unsigned DEFAULT '0',
  `h` int(10) unsigned DEFAULT '0',
  `size` int(10) unsigned DEFAULT '0',
  `sumber` varchar(5) NOT NULL COMMENT 'SCAN, FILE',
  `deskripsi` varchar(255) NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_gambarsurat_surat` (`idsurat`),
  CONSTRAINT `FK_gambarsurat_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berkassurat`
--

LOCK TABLES `berkassurat` WRITE;
/*!40000 ALTER TABLE `berkassurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `berkassurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cclist`
--

DROP TABLE IF EXISTS `cclist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cclist` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `jenis` varchar(3) NOT NULL COMMENT 'IN, OUT',
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_cclist_pegawai` (`iduser`),
  KEY `FK_cclist_departemen` (`departemen`),
  CONSTRAINT `FK_cclist_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_cclist_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cclist`
--

LOCK TABLES `cclist` WRITE;
/*!40000 ALTER TABLE `cclist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cclist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(500) NOT NULL,
  `fkomen` varchar(1500) NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_comment_surat` (`idsurat`),
  KEY `FK_comment_pegawai` (`nip`),
  CONSTRAINT `FK_comment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `jenis` varchar(3) NOT NULL COMMENT 'IN OUT',
  `kategori` varchar(100) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_kategori_departemen` (`departemen`),
  CONSTRAINT `FK_kategori_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelompok`
--

DROP TABLE IF EXISTS `kelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_kelompok_departemen` (`departemen`),
  CONSTRAINT `FK_kelompok_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelompok`
--

LOCK TABLES `kelompok` WRITE;
/*!40000 ALTER TABLE `kelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sumberin`
--

DROP TABLE IF EXISTS `sumberin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sumberin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_sumberin_departemen` (`departemen`),
  CONSTRAINT `FK_sumberin_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sumberin`
--

LOCK TABLES `sumberin` WRITE;
/*!40000 ALTER TABLE `sumberin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sumberin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surat`
--

DROP TABLE IF EXISTS `surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `nomor` varchar(100) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `idkategori` int(10) unsigned NOT NULL,
  `jenis` varchar(3) NOT NULL COMMENT 'IN, OUT',
  `sifat` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '1 Sangat Penting, 2 Penting, 3 Biasa',
  `deskripsi` varchar(2500) NOT NULL,
  `keterangan` varchar(2500) DEFAULT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastactive` datetime DEFAULT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_surat_departemen` (`departemen`),
  KEY `FK_surat_pegawai` (`petugas`),
  KEY `FK_surat_kategori` (`idkategori`),
  KEY `IX_surat` (`nomor`,`perihal`,`tanggal`,`deskripsi`(767),`keterangan`(767)) USING BTREE,
  KEY `IX_surat_lastactive` (`lastactive`),
  CONSTRAINT `FK_surat_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_surat_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_surat_pegawai` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surat`
--

LOCK TABLES `surat` WRITE;
/*!40000 ALTER TABLE `surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratindstcc`
--

DROP TABLE IF EXISTS `suratindstcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratindstcc` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratindstcc_surat` (`idsurat`),
  KEY `FK_suratindstcc_pegawai` (`iduser`),
  CONSTRAINT `FK_suratindstcc_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstcc_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratindstcc`
--

LOCK TABLES `suratindstcc` WRITE;
/*!40000 ALTER TABLE `suratindstcc` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratindstcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratindstgroup`
--

DROP TABLE IF EXISTS `suratindstgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratindstgroup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratindstgroup_kelompok` (`idkelompok`),
  KEY `FK_suratindstgroup_surat` (`idsurat`),
  CONSTRAINT `FK_suratindstgroup_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstgroup_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratindstgroup`
--

LOCK TABLES `suratindstgroup` WRITE;
/*!40000 ALTER TABLE `suratindstgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratindstgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratindstuser`
--

DROP TABLE IF EXISTS `suratindstuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratindstuser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idsiswa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `jenis` varchar(1) DEFAULT NULL COMMENT 'P,S,A',
  PRIMARY KEY (`replid`),
  KEY `FK_suratindstuser_pegawai` (`iduser`),
  KEY `FK_suratindstuser_surat` (`idsurat`),
  KEY `FK_suratindstuser_siswa` (`idsiswa`),
  CONSTRAINT `FK_suratindstuser_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstuser_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratindstuser_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratindstuser`
--

LOCK TABLES `suratindstuser` WRITE;
/*!40000 ALTER TABLE `suratindstuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratindstuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratinsrc`
--

DROP TABLE IF EXISTS `suratinsrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratinsrc` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratinsrc_sumber` (`idsumber`),
  KEY `FK_suratinsrc_surat` (`idsurat`),
  CONSTRAINT `FK_suratinsrc_sumber` FOREIGN KEY (`idsumber`) REFERENCES `sumberin` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratinsrc_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratinsrc`
--

LOCK TABLES `suratinsrc` WRITE;
/*!40000 ALTER TABLE `suratinsrc` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratinsrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutdst`
--

DROP TABLE IF EXISTS `suratoutdst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutdst` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idtujuan` int(10) unsigned DEFAULT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idsiswa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idkelompok` int(10) unsigned DEFAULT NULL,
  `jenis` varchar(1) NOT NULL COMMENT 'T,P,S,A,G',
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutdst_tujuanout` (`idtujuan`),
  KEY `FK_suratoutdst_surat` (`idsurat`),
  KEY `FK_suratoutdst_pegawai` (`iduser`),
  KEY `FK_suratoutdst_siswa` (`idsiswa`),
  KEY `FK_suratoutdst_kelompok` (`idkelompok`),
  CONSTRAINT `FK_suratoutdst_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutdst_tujuanout` FOREIGN KEY (`idtujuan`) REFERENCES `tujuanout` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutdst`
--

LOCK TABLES `suratoutdst` WRITE;
/*!40000 ALTER TABLE `suratoutdst` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutdst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutsrccc`
--

DROP TABLE IF EXISTS `suratoutsrccc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutsrccc` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutccuser_surat` (`idsurat`),
  KEY `FK_suratoutccuser_pegawai` (`iduser`),
  CONSTRAINT `FK_suratoutccuser_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutccuser_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutsrccc`
--

LOCK TABLES `suratoutsrccc` WRITE;
/*!40000 ALTER TABLE `suratoutsrccc` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutsrccc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutsrcgroup`
--

DROP TABLE IF EXISTS `suratoutsrcgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutsrcgroup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutsrcgroup_surat` (`idsurat`),
  KEY `FK_suratoutsrcgroup_kelompok` (`idkelompok`),
  CONSTRAINT `FK_suratoutsrcgroup_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutsrcgroup_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutsrcgroup`
--

LOCK TABLES `suratoutsrcgroup` WRITE;
/*!40000 ALTER TABLE `suratoutsrcgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutsrcgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratoutsrcuser`
--

DROP TABLE IF EXISTS `suratoutsrcuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suratoutsrcuser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsurat` int(10) unsigned NOT NULL,
  `iduser` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idsiswa` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `jenis` varchar(1) DEFAULT NULL COMMENT 'P,S,A',
  PRIMARY KEY (`replid`),
  KEY `FK_suratoutsrcuser_pegawai` (`iduser`),
  KEY `FK_suratoutsrcuser_surat` (`idsurat`),
  KEY `FK_suratoutsrcuser_siswa` (`idsiswa`),
  CONSTRAINT `FK_suratoutsrcuser_pegawai` FOREIGN KEY (`iduser`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutsrcuser_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_suratoutsrcuser_surat` FOREIGN KEY (`idsurat`) REFERENCES `surat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratoutsrcuser`
--

LOCK TABLES `suratoutsrcuser` WRITE;
/*!40000 ALTER TABLE `suratoutsrcuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratoutsrcuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tujuanout`
--

DROP TABLE IF EXISTS `tujuanout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tujuanout` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tujuanout_departemen` (`departemen`),
  CONSTRAINT `FK_tujuanout_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tujuanout`
--

LOCK TABLES `tujuanout` WRITE;
/*!40000 ALTER TABLE `tujuanout` DISABLE KEYS */;
/*!40000 ALTER TABLE `tujuanout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `userlevel` tinyint(1) unsigned NOT NULL COMMENT '1 -> Manager, 2 -> Client',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_user_pegawai` (`userid`),
  CONSTRAINT `FK_user_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccess` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(10) unsigned NOT NULL,
  `departemen` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_useraccess_fruser` (`iduser`),
  KEY `FK_useraccess_departemen` (`departemen`),
  CONSTRAINT `FK_useraccess_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_useraccess_fruser` FOREIGN KEY (`iduser`) REFERENCES `user` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccess`
--

LOCK TABLES `useraccess` WRITE;
/*!40000 ALTER TABLE `useraccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsperpus`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsperpus` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsperpus`;

--
-- Table structure for table `aktivitas`
--

DROP TABLE IF EXISTS `aktivitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `aktivitas` text,
  `perpustakaan` int(10) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`,`issync`),
  CONSTRAINT `FK_aktivitas_perpustakaan` FOREIGN KEY (`replid`) REFERENCES `perpustakaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktivitas`
--

LOCK TABLES `aktivitas` WRITE;
/*!40000 ALTER TABLE `aktivitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aktivitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `noregistrasi` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `HP` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `institusi` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tgldaftar` date NOT NULL DEFAULT '0000-00-00',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `foto` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Index_nopen` (`noregistrasi`),
  UNIQUE KEY `UX_anggota` (`noregistrasi`),
  KEY `IX_anggota_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 2020352 kB; InnoDB free: 2020352 kB; (`NoRegist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daftarpustaka`
--

DROP TABLE IF EXISTS `daftarpustaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daftarpustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pustaka` int(10) unsigned NOT NULL,
  `perpustakaan` int(10) unsigned NOT NULL,
  `kodepustaka` varchar(45) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 dipinjam, 1 tersedia',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_daftarpustaka` (`kodepustaka`),
  KEY `FK_daftarpustaka_perpus` (`perpustakaan`),
  KEY `FK_daftarpustaka_pustaka` (`pustaka`),
  KEY `IX_daftarpustaka_ts` (`ts`,`issync`),
  KEY `IX_daftarpustaka_kode` (`kodepustaka`,`info1`),
  CONSTRAINT `FK_daftarpustaka_perpus` FOREIGN KEY (`perpustakaan`) REFERENCES `perpustakaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_daftarpustaka_pustaka` FOREIGN KEY (`pustaka`) REFERENCES `pustaka` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daftarpustaka`
--

LOCK TABLES `daftarpustaka` WRITE;
/*!40000 ALTER TABLE `daftarpustaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `daftarpustaka` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_daftarpustaka BEFORE INSERT ON jbsperpus.daftarpustaka
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_daftarpustaka BEFORE UPDATE ON jbsperpus.daftarpustaka
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_daftarpustaka AFTER DELETE ON jbsperpus.daftarpustaka
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'daftarpustaka', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `denda`
--

DROP TABLE IF EXISTS `denda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpinjam` int(10) unsigned NOT NULL,
  `denda` int(10) DEFAULT '0',
  `telat` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_denda_idpeminjaman` (`idpinjam`),
  KEY `IX_denda_ts` (`ts`,`issync`),
  CONSTRAINT `FK_denda_idpeminjaman` FOREIGN KEY (`idpinjam`) REFERENCES `pinjam` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denda`
--

LOCK TABLES `denda` WRITE;
/*!40000 ALTER TABLE `denda` DISABLE KEYS */;
/*!40000 ALTER TABLE `denda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Kode_U` (`kode`),
  KEY `IX_format_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'BU','Buku','',NULL,NULL,NULL,'2010-03-08 01:40:53',0,0);
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `katalog`
--

DROP TABLE IF EXISTS `katalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `rak` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `counter` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_IN` (`kode`),
  KEY `FK_katalog_rak` (`rak`),
  KEY `IX_katalog_ts` (`ts`,`issync`),
  CONSTRAINT `FK_katalog_rak` FOREIGN KEY (`rak`) REFERENCES `rak` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `katalog`
--

LOCK TABLES `katalog` WRITE;
/*!40000 ALTER TABLE `katalog` DISABLE KEYS */;
INSERT INTO `katalog` VALUES (1,'000','KARYA UMUM',1,'Klasifikasi pustaka dalam kelompok karya umum ',0,NULL,NULL,NULL,'2010-03-07 10:28:08',48886,0),(2,'010','Bibliografi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',34247,0),(3,'020','Perpustakaan dan Informasi Sains',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',24576,0),(4,'030','Ensiklopedia dan Buku Pintar',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',20137,0),(5,'040','(   ...   )',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',26959,0),(6,'050','Majalah, Jurnal dan Terbitan Berkala',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',8852,0),(7,'060','Asosiasi, Organisasi dan Museum',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',28911,0),(8,'070','Media Berita, Jurnalisme dan Publikasi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',52469,0),(9,'080','Kutipan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',44550,0),(10,'090','manuskrip dan buku-buku langka',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',65344,0),(11,'100','FILSAFAT',1,'Klasifikasi pustaka yang tergolong dalam ilmu filsafat',0,NULL,NULL,NULL,'2010-03-07 10:28:08',62009,0),(12,'110','Metafisika',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',48483,0),(13,'120','Epistemologi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',56389,0),(14,'130','Parapsikologi dan Perdukunan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5433,0),(15,'140','Filsafat Aliran Pemikiran',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',54588,0),(16,'150','Psikologi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',60049,0),(17,'160','Logika',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5421,0),(18,'170','Etika',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',43547,0),(19,'180','Filsafat kuno, pertengahan dan lanjutan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',4883,0),(20,'190','Filsafat Barat Modern',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',24833,0),(21,'200','AGAMA',1,'Klasifikasi pustaka yang berkaitan dengan keagamaan',0,NULL,NULL,NULL,'2010-03-07 10:28:08',43986,0),(22,'210','Filsafat dan Teori Agama',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',14372,0),(23,'220','Injil',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5431,0),(24,'300','ILMU SOSIAL, SOSIOLOGI dan ANTROPOLOGI',1,'Pengelompokan Pustaka dalam kategori ilmu sosial',0,NULL,NULL,NULL,'2010-03-07 10:28:08',49567,0),(25,'310','Statistika Umum',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',34952,0),(26,'320','Ilmu Politik',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',26057,0),(27,'330','Ekonomi',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',25429,0),(28,'340','Hukum',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',48975,0),(29,'350','Administrasi Umum dan Ilmu Militer',1,'',2,NULL,NULL,NULL,'2010-03-08 01:44:43',37528,0),(30,'360','Permasalahan Sosial dan Pelayanan Sosial',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',40716,0),(31,'370','Pendidikan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',25463,0),(32,'380','Perdagangan, Komunikasi dan Perhubungan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',5165,0),(33,'390','Kewarganegaraan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',14967,0),(34,'400','BAHASA',1,'Klasifikasi pustaka dalam kelompok bahasa',0,NULL,NULL,NULL,'2010-03-07 10:28:08',59340,0),(35,'410','Linguistik',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',55207,0),(36,'420','BAHASA INGGRIS',1,'pengelompokan pustaka (bahasa) dalam kelompok bahasa inggris',0,NULL,NULL,NULL,'2010-03-07 10:28:08',32485,0),(37,'430','Bahasa Arab',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',62332,0),(38,'500','ILMU MURNI',1,'klasifikasi pustaka dalam kelompok ilmu murni',0,NULL,NULL,NULL,'2010-03-07 10:28:08',17616,0),(39,'510','Matematika',1,'pengelompokan pustaka (ilmu murni) dalam kelompok matematika',0,NULL,NULL,NULL,'2010-03-07 10:28:08',32144,0),(40,'530','Fisika',1,'pengelompokan pustaka ilmu murni berdasarkan klas fisika ',0,NULL,NULL,NULL,'2010-03-07 10:28:08',42340,0),(41,'540','Kimia',1,'klasifikasi pustaka ilmu murni dalam kelompok ilmu kimia',0,NULL,NULL,NULL,'2010-03-07 10:28:08',49740,0),(42,'570','Biologi',1,'pengelompokan pustaka ilmu murni kedalam klas biologi',0,NULL,NULL,NULL,'2010-03-07 10:28:08',56148,0),(43,'600','ILMU TERAPAN',1,'pengelompokan pustaka kedalam kategori ilmu terapan',0,NULL,NULL,NULL,'2010-03-07 10:28:08',458,0),(44,'700','KESENIAN',1,'Pengelompokan pustaka kedalam kategori kesenian',0,NULL,NULL,NULL,'2010-03-07 10:28:08',30437,0),(45,'710','Kreasi dan Ketrampilan',1,'',0,NULL,NULL,NULL,'2010-03-07 10:28:08',19752,0),(46,'800','KESUSASTERAAN',1,'klasifikasi pustaka berdasarkan kelompok sastra',0,NULL,NULL,NULL,'2010-03-07 10:28:08',7445,0),(47,'900','GEOGRAFI dan SEJARAH ',1,'klasifikasi pustaka kedalam kelompok ilmu geografi dan sejarah',0,NULL,NULL,NULL,'2010-03-07 10:28:08',43502,0);
/*!40000 ALTER TABLE `katalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_katalog BEFORE INSERT ON jbsperpus.katalog
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_katalog BEFORE UPDATE ON jbsperpus.katalog
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_katalog AFTER DELETE ON jbsperpus.katalog
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'katalog', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `konfigurasi`
--

DROP TABLE IF EXISTS `konfigurasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konfigurasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned DEFAULT NULL,
  `pegawai` int(10) unsigned DEFAULT NULL,
  `other` int(10) unsigned DEFAULT NULL,
  `denda` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_konfigurasi_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konfigurasi`
--

LOCK TABLES `konfigurasi` WRITE;
/*!40000 ALTER TABLE `konfigurasi` DISABLE KEYS */;
INSERT INTO `konfigurasi` VALUES (1,3,4,0,0,NULL,NULL,NULL,'2010-03-25 06:24:56',0,0);
/*!40000 ALTER TABLE `konfigurasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerbit` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penerbit_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_penerbit BEFORE INSERT ON jbsperpus.penerbit
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_penerbit BEFORE UPDATE ON jbsperpus.penerbit
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_penerbit AFTER DELETE ON jbsperpus.penerbit
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'penerbit', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penulis`
--

DROP TABLE IF EXISTS `penulis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penulis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kontak` varchar(255) DEFAULT NULL,
  `biografi` text,
  `keterangan` varchar(255) DEFAULT NULL,
  `gelardepan` varchar(45) DEFAULT NULL,
  `gelarbelakang` varchar(45) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penulis_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penulis`
--

LOCK TABLES `penulis` WRITE;
/*!40000 ALTER TABLE `penulis` DISABLE KEYS */;
/*!40000 ALTER TABLE `penulis` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_penulis BEFORE INSERT ON jbsperpus.penulis
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_penulis BEFORE UPDATE ON jbsperpus.penulis
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_penulis AFTER DELETE ON jbsperpus.penulis
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'penulis', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `perpustakaan`
--

DROP TABLE IF EXISTS `perpustakaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perpustakaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Nama` (`nama`),
  KEY `IX_perpustakaan_ts` (`ts`,`issync`),
  KEY `FK_perpustakaan_departemen` (`departemen`),
  CONSTRAINT `FK_perpustakaan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perpustakaan`
--

LOCK TABLES `perpustakaan` WRITE;
/*!40000 ALTER TABLE `perpustakaan` DISABLE KEYS */;
INSERT INTO `perpustakaan` VALUES (1,'sma','',NULL,NULL,NULL,NULL,'2010-03-08 01:40:44',0,0);
/*!40000 ALTER TABLE `perpustakaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pinjam`
--

DROP TABLE IF EXISTS `pinjam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinjam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodepustaka` varchar(45) NOT NULL,
  `tglpinjam` date NOT NULL DEFAULT '0000-00-00',
  `tglkembali` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `idanggota` varchar(45) NOT NULL,
  `nis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idmember` varchar(20) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum di acc, 1 udah di acc, 2 udah dikembalikan',
  `tglditerima` date NOT NULL DEFAULT '0000-00-00',
  `petugaspinjam` varchar(50) DEFAULT NULL,
  `petugaskembali` varchar(50) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`) USING BTREE,
  KEY `IX_pinjam_ts` (`ts`,`issync`),
  KEY `FK_pinjam_daftarpustaka` (`kodepustaka`),
  KEY `FK_pinjam_siswa` (`nis`),
  KEY `FK_pinjam_pegawai` (`nip`),
  KEY `FK_pinjam_member` (`idmember`),
  CONSTRAINT `FK_pinjam_daftarpustaka` FOREIGN KEY (`kodepustaka`) REFERENCES `daftarpustaka` (`kodepustaka`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pinjam_member` FOREIGN KEY (`idmember`) REFERENCES `anggota` (`noregistrasi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pinjam_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pinjam_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pinjam`
--

LOCK TABLES `pinjam` WRITE;
/*!40000 ALTER TABLE `pinjam` DISABLE KEYS */;
/*!40000 ALTER TABLE `pinjam` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pinjam BEFORE INSERT ON jbsperpus.pinjam
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pinjam BEFORE UPDATE ON jbsperpus.pinjam
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pinjam AFTER DELETE ON jbsperpus.pinjam
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'pinjam', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pustaka`
--

DROP TABLE IF EXISTS `pustaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `abstraksi` text NOT NULL,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `keteranganfisik` varchar(255) NOT NULL DEFAULT '',
  `penulis` int(10) unsigned NOT NULL,
  `penerbit` int(10) unsigned NOT NULL,
  `format` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  `cover` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `harga` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pustaka_penulis` (`penulis`),
  KEY `FK_pustaka_format` (`format`),
  KEY `FK_pustaka_katalog` (`katalog`),
  KEY `FK_pustaka_penerbit` (`penerbit`),
  KEY `IX_pustaka_ts` (`ts`,`issync`),
  KEY `IX_pustaka_judul` (`judul`,`keyword`),
  CONSTRAINT `FK_pustaka_format` FOREIGN KEY (`format`) REFERENCES `format` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_katalog` FOREIGN KEY (`katalog`) REFERENCES `katalog` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_penerbit` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_penulis` FOREIGN KEY (`penulis`) REFERENCES `penulis` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pustaka`
--

LOCK TABLES `pustaka` WRITE;
/*!40000 ALTER TABLE `pustaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `pustaka` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pustaka BEFORE INSERT ON jbsperpus.pustaka
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pustaka BEFORE UPDATE ON jbsperpus.pustaka
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pustaka AFTER DELETE ON jbsperpus.pustaka
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'pustaka', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rak`
--

DROP TABLE IF EXISTS `rak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rak` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rak` varchar(25) NOT NULL,
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Kode_U` (`rak`),
  KEY `IX_rak_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rak`
--

LOCK TABLES `rak` WRITE;
/*!40000 ALTER TABLE `rak` DISABLE KEYS */;
INSERT INTO `rak` VALUES (1,'Rak','contoh data',NULL,NULL,NULL,'2010-03-07 10:25:32',0,0);
/*!40000 ALTER TABLE `rak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbssat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbssat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbssat`;

--
-- Table structure for table `frabsence`
--

DROP TABLE IF EXISTS `frabsence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frabsence` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `datenop` date NOT NULL,
  `status` varchar(7) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `idreportsisfo` int(10) unsigned DEFAULT NULL,
  `idreportsisfoemp` int(10) unsigned DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frabsence_siswa` (`nis`),
  KEY `FK_frabsence_pegawai` (`nip`),
  KEY `FK_frabsence_frsisforeport` (`idreportsisfo`),
  KEY `FK_frabsence_departemen` (`departemen`),
  KEY `FK_frabsence_frsisforeportemp` (`idreportsisfoemp`),
  KEY `FK_frabsence_tingkat` (`idtingkat`),
  KEY `FK_frabsence_kelas` (`idkelas`),
  KEY `IX_freabsence` (`datenop`,`nip`,`nis`) USING BTREE,
  CONSTRAINT `FK_frabsence_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_frsisforeport` FOREIGN KEY (`idreportsisfo`) REFERENCES `frsisforeport` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_frsisforeportemp` FOREIGN KEY (`idreportsisfoemp`) REFERENCES `frsisforeportemp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frabsence_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frabsence`
--

LOCK TABLES `frabsence` WRITE;
/*!40000 ALTER TABLE `frabsence` DISABLE KEYS */;
/*!40000 ALTER TABLE `frabsence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franggota`
--

DROP TABLE IF EXISTS `franggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL COMMENT '0 Siswa, 1 Pegawai, 2 Other',
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_franggota_frkelompok` (`idkelompok`),
  KEY `FK_franggota_siswa` (`nis`),
  KEY `FK_franggota_pegawai` (`nip`),
  CONSTRAINT `FK_franggota_frkelompok` FOREIGN KEY (`idkelompok`) REFERENCES `frkelompok` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_franggota_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_franggota_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franggota`
--

LOCK TABLES `franggota` WRITE;
/*!40000 ALTER TABLE `franggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `franggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frconfigassms`
--

DROP TABLE IF EXISTS `frconfigassms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frconfigassms` (
  `departemen` varchar(45) NOT NULL,
  `asin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `asout` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pengirim` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  KEY `FK_frconfigassms_departemen` (`departemen`),
  CONSTRAINT `FK_frconfigassms_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frconfigassms`
--

LOCK TABLES `frconfigassms` WRITE;
/*!40000 ALTER TABLE `frconfigassms` DISABLE KEYS */;
INSERT INTO `frconfigassms` VALUES ('SMA',0,0,'JIBAS SPT FGR','0','00:00',NULL);
/*!40000 ALTER TABLE `frconfigassms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frconfigassmsact`
--

DROP TABLE IF EXISTS `frconfigassmsact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frconfigassmsact` (
  `idkegiatan` int(10) unsigned NOT NULL,
  `asin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aslate` tinyint(1) unsigned NOT NULL,
  `asout` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pengirim` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  KEY `FK_frconfigassmsact_kegiatan` (`idkegiatan`),
  CONSTRAINT `FK_frconfigassmsact_kegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frconfigassmsact`
--

LOCK TABLES `frconfigassmsact` WRITE;
/*!40000 ALTER TABLE `frconfigassmsact` DISABLE KEYS */;
/*!40000 ALTER TABLE `frconfigassmsact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frdata`
--

DROP TABLE IF EXISTS `frdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownertype` tinyint(1) unsigned NOT NULL COMMENT '0 = Siswa, 1 = Pegawai',
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `template` blob NOT NULL,
  `image` mediumblob NOT NULL,
  `fingerpos` varchar(4) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `lastpresence` datetime DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `verify` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frdata_siswa` (`nis`),
  KEY `FK_frdata_pegawai` (`nip`),
  KEY `FK_frdata_departemen` (`departemen`),
  KEY `IX_frdata` (`ownertype`,`nis`,`nip`,`departemen`),
  CONSTRAINT `FK_frdata_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frdata_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frdata_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frdata`
--

LOCK TABLES `frdata` WRITE;
/*!40000 ALTER TABLE `frdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `frdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frformatsms`
--

DROP TABLE IF EXISTS `frformatsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frformatsms` (
  `smstype` varchar(10) NOT NULL,
  `smsformat` varchar(500) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smstype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frformatsms`
--

LOCK TABLES `frformatsms` WRITE;
/*!40000 ALTER TABLE `frformatsms` DISABLE KEYS */;
INSERT INTO `frformatsms` VALUES ('MASUK','Kami informasikan presensi {NAMA} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}',NULL,NULL,NULL),('PULANG','Kami informasikan presensi {NAMA} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK} pulang jam {JAM_PULANG}',NULL,NULL,NULL),('TAKHADIR','Kami informasikan bahwa siswa {NAMA} tidak hadir di sekolah pada tanggal {TANGGAL}/{BULAN}/{TAHUN}',NULL,NULL,NULL),('TELAT','Kami informasikan presensi {NAMA} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}, terlambat {MENIT_TELAT} menit',NULL,NULL,NULL);
/*!40000 ALTER TABLE `frformatsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frformatsmsact`
--

DROP TABLE IF EXISTS `frformatsmsact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frformatsmsact` (
  `smstype` varchar(10) NOT NULL,
  `smsformat` varchar(500) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smstype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frformatsmsact`
--

LOCK TABLES `frformatsmsact` WRITE;
/*!40000 ALTER TABLE `frformatsmsact` DISABLE KEYS */;
INSERT INTO `frformatsmsact` VALUES ('MASUK','Kami informasikan presensi {NAMA} di kegiatan {KEGIATAN} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}',NULL,NULL,NULL),('PULANG','Kami informasikan presensi {NAMA} di kegiatan {KEGIATAN} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK} pulang jam {JAM_PULANG}',NULL,NULL,NULL),('TAKHADIR','Kami informasikan bahwa siswa {NAMA} di kegiatan {KEGIATAN} tidak hadir di sekolah pada tanggal {TANGGAL}/{BULAN}/{TAHUN}',NULL,NULL,NULL),('TELAT','Kami informasikan presensi {NAMA} di kegiatan {KEGIATAN} tanggal {TANGGAL}/{BULAN}/{TAHUN}, masuk jam {JAM_MASUK}, terlambat {MENIT_TELAT} menit',NULL,NULL,NULL);
/*!40000 ALTER TABLE `frformatsmsact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frfreetime`
--

DROP TABLE IF EXISTS `frfreetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frfreetime` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mintime` int(10) unsigned NOT NULL DEFAULT '1',
  `senin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selasa` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rabu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kamis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `jumat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sabtu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minggu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frfreetime_pegawai` (`nip`),
  CONSTRAINT `FK_frfreetime_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frfreetime`
--

LOCK TABLES `frfreetime` WRITE;
/*!40000 ALTER TABLE `frfreetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `frfreetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frjadwalkegiatan`
--

DROP TABLE IF EXISTS `frjadwalkegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frjadwalkegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkegiatan` int(10) unsigned NOT NULL,
  `hari` tinyint(1) unsigned NOT NULL COMMENT '1 Minggu 2 Senin 7 Sabtu',
  `masukaw` varchar(7) NOT NULL,
  `masukak` varchar(7) NOT NULL,
  `telat` varchar(7) NOT NULL,
  `pulangaw` varchar(7) NOT NULL,
  `pulangak` varchar(7) NOT NULL,
  `pulangstd` varchar(7) NOT NULL,
  `mmasukaw` int(10) unsigned NOT NULL,
  `mmasukak` int(10) unsigned NOT NULL,
  `mtelat` int(10) unsigned NOT NULL,
  `mpulangaw` int(10) unsigned NOT NULL,
  `mpulangak` int(10) unsigned NOT NULL,
  `mpulangstd` int(10) unsigned NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frjadwalkegiatan_kegiatan` (`idkegiatan`),
  CONSTRAINT `FK_frjadwalkegiatan_kegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frjadwalkegiatan`
--

LOCK TABLES `frjadwalkegiatan` WRITE;
/*!40000 ALTER TABLE `frjadwalkegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `frjadwalkegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frjadwalsekolah`
--

DROP TABLE IF EXISTS `frjadwalsekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frjadwalsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Siswa 1 Pegawai',
  `pos` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hari` tinyint(1) unsigned NOT NULL COMMENT '1 Minggu 2 Senin 7 Sabtu',
  `masukaw` varchar(7) NOT NULL,
  `masukak` varchar(7) NOT NULL,
  `telat` varchar(7) NOT NULL,
  `pulangaw` varchar(7) NOT NULL,
  `pulangak` varchar(7) NOT NULL,
  `pulangstd` varchar(7) NOT NULL,
  `mmasukaw` int(10) unsigned NOT NULL,
  `mmasukak` int(10) unsigned NOT NULL,
  `mtelat` int(10) unsigned NOT NULL,
  `mpulangaw` int(10) unsigned NOT NULL,
  `mpulangak` int(10) unsigned NOT NULL,
  `mpulangstd` int(10) unsigned NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frjadwalsekolah`
--

LOCK TABLES `frjadwalsekolah` WRITE;
/*!40000 ALTER TABLE `frjadwalsekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `frjadwalsekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frkegiatan`
--

DROP TABLE IF EXISTS `frkegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frkegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kegiatan` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `jeniswaktu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Berbatas Waktu, 1 Tidak Berbatas Waktu',
  `tglawal` date DEFAULT NULL,
  `tglakhir` date DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `jenispeserta` tinyint(1) unsigned NOT NULL,
  `idkelompok` int(10) unsigned DEFAULT NULL,
  `iddepartemen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `kelompokpegawai` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Akademik, 1 Non Akademik',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frkegiatan_kelompok` (`idkelompok`),
  KEY `FK_frkegiatan_departemen` (`iddepartemen`),
  KEY `FK_frkegiatan_tingkat` (`idtingkat`),
  KEY `FK_frkegiatan_kelas` (`idkelas`),
  KEY `FK_frkegiatan_departemenowner` (`departemen`),
  CONSTRAINT `FK_frkegiatan_departemen` FOREIGN KEY (`iddepartemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_departemenowner` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `frkelompok` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frkegiatan_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frkegiatan`
--

LOCK TABLES `frkegiatan` WRITE;
/*!40000 ALTER TABLE `frkegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `frkegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frkelompok`
--

DROP TABLE IF EXISTS `frkelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frkelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(2555) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frkelompok_departemen` (`departemen`),
  CONSTRAINT `FK_frkelompok_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frkelompok`
--

LOCK TABLES `frkelompok` WRITE;
/*!40000 ALTER TABLE `frkelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `frkelompok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frother`
--

DROP TABLE IF EXISTS `frother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frother` (
  `nouser` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nouser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frother`
--

LOCK TABLES `frother` WRITE;
/*!40000 ALTER TABLE `frother` DISABLE KEYS */;
/*!40000 ALTER TABLE `frother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frpeserta`
--

DROP TABLE IF EXISTS `frpeserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frpeserta` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkegiatan` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nouser` varchar(10) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_frpeserta_siswa` (`nis`),
  KEY `FK_frpeserta_pegawai` (`nip`),
  KEY `FK_frpeserta_frother` (`nouser`),
  KEY `FK_frpeserta_frkegiatan` (`idkegiatan`),
  CONSTRAINT `FK_frpeserta_frkegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_frpeserta_frother` FOREIGN KEY (`nouser`) REFERENCES `frother` (`nouser`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpeserta_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpeserta_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frpeserta`
--

LOCK TABLES `frpeserta` WRITE;
/*!40000 ALTER TABLE `frpeserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `frpeserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frpresence`
--

DROP TABLE IF EXISTS `frpresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frpresence` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `idtingkat` int(10) unsigned DEFAULT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `date_in` date NOT NULL,
  `time_in` varchar(10) NOT NULL,
  `frid_in` int(10) unsigned DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `time_out` varchar(10) DEFAULT NULL,
  `frid_out` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smssent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smssenthome` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `source` varchar(2) NOT NULL DEFAULT 'F' COMMENT 'F -> Fingerprint, M -< Manual',
  `reportsisfo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `idreportsisfo` int(10) unsigned DEFAULT NULL,
  `idreportsisfoemp` int(10) unsigned DEFAULT NULL,
  `idpetugas` varchar(30) DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frpresence_frsisforeport` (`idreportsisfo`),
  KEY `FK_frpresence_pegawai` (`nip`),
  KEY `IX_frpresence_date` (`nis`,`nip`,`date_in`,`smssent`,`smssenthome`,`reportsisfo`) USING BTREE,
  KEY `FK_frpresence_departemen` (`departemen`),
  KEY `FK_frpresence_frsisforeportemp` (`idreportsisfoemp`),
  KEY `FK_frpresence_tingkat` (`idtingkat`),
  KEY `FK_frpresence_kelas` (`idkelas`),
  KEY `FK_frpresence_petugas` (`idpetugas`),
  KEY `FK_frpresence_frdata_in` (`frid_in`),
  KEY `FK_frpresence_frdata_out` (`frid_out`),
  CONSTRAINT `FK_frpresence_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frdata_in` FOREIGN KEY (`frid_in`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frdata_out` FOREIGN KEY (`frid_out`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frsisforeport` FOREIGN KEY (`idreportsisfo`) REFERENCES `frsisforeport` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_frsisforeportemp` FOREIGN KEY (`idreportsisfoemp`) REFERENCES `frsisforeportemp` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_kelas` FOREIGN KEY (`idkelas`) REFERENCES `jbsakad`.`kelas` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_petugas` FOREIGN KEY (`idpetugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresence_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frpresence`
--

LOCK TABLES `frpresence` WRITE;
/*!40000 ALTER TABLE `frpresence` DISABLE KEYS */;
/*!40000 ALTER TABLE `frpresence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frpresensikegiatan`
--

DROP TABLE IF EXISTS `frpresensikegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frpresensikegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkegiatan` int(10) unsigned NOT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nouser` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `date_in` date NOT NULL,
  `time_in` varchar(10) NOT NULL,
  `frid_in` int(10) unsigned DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `time_out` varchar(10) DEFAULT NULL,
  `frid_out` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `smssent` tinyint(1) unsigned DEFAULT '0',
  `smssenthome` tinyint(1) unsigned DEFAULT '0',
  `source` varchar(1) NOT NULL DEFAULT 'F',
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frpresensikegiatan_kegiatan` (`idkegiatan`),
  KEY `FK_frpresensikegiatan_siswa` (`nis`),
  KEY `FK_frpresensikegiatan_pegawai` (`nip`),
  KEY `FK_frpresensikegiatan_other` (`nouser`),
  KEY `FK_frpresensikegiatan_frdata_in` (`frid_in`),
  KEY `FK_frpresensikegiatan_frdata_out` (`frid_out`),
  CONSTRAINT `FK_frpresensikegiatan_frdata_in` FOREIGN KEY (`frid_in`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_frdata_out` FOREIGN KEY (`frid_out`) REFERENCES `frdata` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_kegiatan` FOREIGN KEY (`idkegiatan`) REFERENCES `frkegiatan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_other` FOREIGN KEY (`nouser`) REFERENCES `frother` (`nouser`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_frpresensikegiatan_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frpresensikegiatan_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frpresensikegiatan`
--

LOCK TABLES `frpresensikegiatan` WRITE;
/*!40000 ALTER TABLE `frpresensikegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `frpresensikegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frruntext`
--

DROP TABLE IF EXISTS `frruntext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frruntext` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frruntext`
--

LOCK TABLES `frruntext` WRITE;
/*!40000 ALTER TABLE `frruntext` DISABLE KEYS */;
INSERT INTO `frruntext` VALUES (1,'JIBAS Sistem Presensi Terpadu Fingerprint');
/*!40000 ALTER TABLE `frruntext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frsisforeport`
--

DROP TABLE IF EXISTS `frsisforeport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frsisforeport` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `startdate` tinyint(3) unsigned NOT NULL,
  `enddate` tinyint(3) unsigned NOT NULL,
  `h` int(10) unsigned NOT NULL,
  `i` int(10) unsigned NOT NULL,
  `s` int(10) unsigned NOT NULL,
  `c` int(10) unsigned NOT NULL,
  `a` int(10) unsigned NOT NULL,
  `departemen` varchar(45) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_frsisforeport_departemen` (`departemen`),
  KEY `FK_frsisforeport_tingkat` (`idtingkat`),
  CONSTRAINT `FK_frsisforeport_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_frsisforeport_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `jbsakad`.`tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frsisforeport`
--

LOCK TABLES `frsisforeport` WRITE;
/*!40000 ALTER TABLE `frsisforeport` DISABLE KEYS */;
/*!40000 ALTER TABLE `frsisforeport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frsisforeportemp`
--

DROP TABLE IF EXISTS `frsisforeportemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frsisforeportemp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `startdate` tinyint(3) unsigned NOT NULL,
  `enddate` tinyint(3) unsigned NOT NULL,
  `h` int(10) unsigned NOT NULL,
  `i` int(10) unsigned NOT NULL,
  `s` int(10) unsigned NOT NULL,
  `c` int(10) unsigned NOT NULL,
  `a` int(10) unsigned NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frsisforeportemp`
--

LOCK TABLES `frsisforeportemp` WRITE;
/*!40000 ALTER TABLE `frsisforeportemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `frsisforeportemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fruser`
--

DROP TABLE IF EXISTS `fruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fruser` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `userlevel` tinyint(1) unsigned NOT NULL COMMENT '1 -> Manager, 2 -> Client',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fruser_pegawai` (`userid`),
  CONSTRAINT `FK_fruser_pegawai` FOREIGN KEY (`userid`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fruser`
--

LOCK TABLES `fruser` WRITE;
/*!40000 ALTER TABLE `fruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `fruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fruseraccess`
--

DROP TABLE IF EXISTS `fruseraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fruseraccess` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(10) unsigned NOT NULL,
  `departemen` varchar(45) NOT NULL,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fruseraccess_fruser` (`iduser`),
  KEY `FK_fruseraccess_departemen` (`departemen`),
  CONSTRAINT `FK_fruseraccess_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_fruseraccess_fruser` FOREIGN KEY (`iduser`) REFERENCES `fruser` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fruseraccess`
--

LOCK TABLES `fruseraccess` WRITE;
/*!40000 ALTER TABLE `fruseraccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `fruseraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbssdm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbssdm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbssdm`;

--
-- Table structure for table `bagianpegawai`
--

DROP TABLE IF EXISTS `bagianpegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bagianpegawai` (
  `bagian` varchar(50) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bagian`),
  KEY `UXBagianPegawai` (`replid`),
  KEY `IX_bagianpegawai_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bagianpegawai`
--

LOCK TABLES `bagianpegawai` WRITE;
/*!40000 ALTER TABLE `bagianpegawai` DISABLE KEYS */;
INSERT INTO `bagianpegawai` VALUES ('Akademik',1,1,NULL,NULL,NULL,'2010-03-02 03:08:32',53202,0),('Non Akademik',2,2,NULL,NULL,NULL,'2010-03-02 03:08:32',19723,0);
/*!40000 ALTER TABLE `bagianpegawai` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_bagianpegawai BEFORE INSERT ON jbssdm.bagianpegawai
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_bagianpegawai BEFORE UPDATE ON jbssdm.bagianpegawai
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_bagianpegawai AFTER DELETE ON jbssdm.bagianpegawai
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'bagianpegawai', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `diklat`
--

DROP TABLE IF EXISTS `diklat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diklat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `allowselect` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `diklat` varchar(45) NOT NULL,
  `tingkat` tinyint(3) unsigned NOT NULL,
  `jenis` varchar(1) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_diklat_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diklat`
--

LOCK TABLES `diklat` WRITE;
/*!40000 ALTER TABLE `diklat` DISABLE KEYS */;
INSERT INTO `diklat` VALUES (11,0,1,'DIKLAT STRUKTURAL',0,'S',NULL,NULL,NULL,'2012-06-19 00:00:00',23097,0),(12,0,0,'DIKLAT FUNGSIONAL',0,'F',NULL,NULL,NULL,'2012-06-19 00:00:00',29220,0),(26,11,1,'Diklat Kepemimpinan',2,'',NULL,NULL,NULL,'2012-06-19 00:00:00',11276,0),(28,12,1,'Diklat Pengajaran',2,'',NULL,NULL,NULL,'2012-06-19 00:00:00',34253,0);
/*!40000 ALTER TABLE `diklat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_diklat BEFORE INSERT ON diklatFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_diklat BEFORE UPDATE ON diklatFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_diklat AFTER DELETE ON diklatFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'diklat', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `eselon`
--

DROP TABLE IF EXISTS `eselon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eselon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eselon` varchar(15) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eselon`),
  UNIQUE KEY `UX_eselon` (`replid`),
  KEY `IX_eselon_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eselon`
--

LOCK TABLES `eselon` WRITE;
/*!40000 ALTER TABLE `eselon` DISABLE KEYS */;
INSERT INTO `eselon` VALUES (5,'(Tidak Ada)',1,1,NULL,NULL,NULL,'2012-06-19 00:00:00',6374,0),(1,'Eselon I',2,0,NULL,NULL,NULL,'2012-06-19 00:00:00',60172,0),(2,'Eselon II',3,0,NULL,NULL,NULL,'2012-06-19 00:00:00',19617,0),(3,'Eselon III',4,0,NULL,NULL,NULL,'2012-06-19 00:00:00',48627,0),(4,'Eselon IV',5,0,NULL,NULL,NULL,'2012-06-19 00:00:00',53226,0);
/*!40000 ALTER TABLE `eselon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_eselon BEFORE INSERT ON eselonFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_eselon BEFORE UPDATE ON eselon  FOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_eselon AFTER DELETE ON eselonFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'eselon', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `golongan`
--

DROP TABLE IF EXISTS `golongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golongan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(14) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`golongan`),
  UNIQUE KEY `UX_golongan` (`replid`),
  KEY `IX_golongan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golongan`
--

LOCK TABLES `golongan` WRITE;
/*!40000 ALTER TABLE `golongan` DISABLE KEYS */;
INSERT INTO `golongan` VALUES (18,'(Tidak Ada)',1,1,'Tidak Ada Golongan',NULL,NULL,NULL,'2012-06-19 00:00:00',54715,0),(1,'IA',1,2,'Juru Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',48370,0),(2,'IB',1,3,'Juru Muda Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',12175,0),(3,'IC',1,4,'Juru',NULL,NULL,NULL,'2012-06-19 00:00:00',46822,0),(4,'ID',1,5,'Juru Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',997,0),(5,'IIA',2,6,'Pengatur Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',61109,0),(6,'IIB',2,7,'Pengatur Muda Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',40431,0),(7,'IIC',2,8,'Pengatur',NULL,NULL,NULL,'2012-06-19 00:00:00',18827,0),(8,'IID',2,9,'Pengatur Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',38373,0),(9,'IIIA',3,10,'Penata Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',4324,0),(10,'IIIB',3,11,'Penata muda Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',37558,0),(11,'IIIC',3,12,'Penata',NULL,NULL,NULL,'2012-06-19 00:00:00',43759,0),(12,'IIID',3,13,'Penata Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',40589,0),(13,'IVA',4,14,'Pembina',NULL,NULL,NULL,'2012-06-19 00:00:00',6140,0),(14,'IVB',4,15,'Pembina Tingkat 1',NULL,NULL,NULL,'2012-06-19 00:00:00',39991,0),(15,'IVC',4,16,'Pembina Utama Muda',NULL,NULL,NULL,'2012-06-19 00:00:00',50477,0),(16,'IVD',4,17,'Pembina Utama Madya',NULL,NULL,NULL,'2012-06-19 00:00:00',1348,0),(17,'IVE',4,18,'Pembuna Utama',NULL,NULL,NULL,'2012-06-19 00:00:00',51900,0);
/*!40000 ALTER TABLE `golongan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_golongan BEFORE INSERT ON golonganFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_golongan BEFORE UPDATE ON golonganFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_golongan AFTER DELETE ON golonganFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'golongan', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jabatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `singkatan` varchar(255) NOT NULL,
  `satker` varchar(255) DEFAULT NULL,
  `eselon` varchar(15) DEFAULT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jabatan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jabatan`
--

LOCK TABLES `jabatan` WRITE;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` VALUES (8,0,'NA','STRUKTUR ORGANISASI SEKOLAH',NULL,'(Tidak Ada)',1,NULL,NULL,NULL,'2012-06-19 00:00:00',58865,0),(27,8,'PENGURUS SEKOLAH','SEKOLAH','(Tidak Ada)','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',7566,0),(28,27,'Kepala Sekolah','KEPSEK','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',57825,0),(29,28,'Kepala TU','KEPTU','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',4305,0),(30,27,'Ketua Komite Sekolah','K.KOMITE','(Tidak Ada)','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',44641,0),(31,28,'Wakil Kepala Sekolah Bidang Kurikulum','WK.KURIKULUM','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',13697,0),(32,28,'Wakil Kepala Sekolah Bidang Kesiswaan','WK.KESISWAAN','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',95,0),(33,28,'Wakil Kepala Sekolah Bidang Humas','WK.HUMAS','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',24911,0),(34,32,'Pembina OSIS','PB.OSIS','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',58740,0),(35,32,'Pembina Ekstrakulikuler','PB.EKSTRA','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',22378,0),(36,28,'Wakil Kepala Sekolah Bidang Sarana Prasaran','WK.SARANA','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',1198,0),(37,33,'Kordinator Rumah Tangga','KO.RT','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',4384,0),(38,28,'Koordinator BP','KO.BP','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',18328,0),(39,28,'Koordinator IT','KO.IT','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',12955,0),(40,28,'Koordinator Guru','KO.GURU','GURU','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',9791,0),(41,40,'Guru','GURU','GURU','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:00:00',10089,0),(42,8,'Komite Sekolah','KOMSEK','MANAJEMEN','(Tidak Ada)',0,NULL,NULL,NULL,'2012-06-19 00:09:52',45480,0);
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jabatan BEFORE INSERT ON jabatanFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jabatan BEFORE UPDATE ON jabatanFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jabatan AFTER DELETE ON jabatanFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'jabatan', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `jenis` varchar(45) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jadwal_pegawai` (`nip`),
  KEY `FK_jadwal_jenisagenda` (`jenis`),
  KEY `IX_jadwal_ts` (`ts`,`issync`),
  CONSTRAINT `FK_jadwal_jenisagenda` FOREIGN KEY (`jenis`) REFERENCES `jenisagenda` (`agenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_jadwal_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jadwal BEFORE INSERT ON jadwalFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jadwal BEFORE UPDATE ON jadwalFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jadwal AFTER DELETE ON jadwalFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'jadwal', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jenisagenda`
--

DROP TABLE IF EXISTS `jenisagenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenisagenda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agenda` varchar(45) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `urutan` tinyint(1) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agenda`),
  UNIQUE KEY `UX_agenda` (`replid`),
  KEY `IX_jenisagenda_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisagenda`
--

LOCK TABLES `jenisagenda` WRITE;
/*!40000 ALTER TABLE `jenisagenda` DISABLE KEYS */;
INSERT INTO `jenisagenda` VALUES (5,'cpns','Pengangkatan CPNS',6,NULL,NULL,NULL,'2012-06-19 00:00:00',17386,0),(8,'gaji','Penyesuaian Gaji',4,NULL,NULL,NULL,'2012-06-19 00:00:00',6748,0),(2,'golongan','Kenaikan Golongan',2,NULL,NULL,NULL,'2012-06-19 00:00:00',47111,0),(3,'jabatan','Kenaikan Jabatan',1,NULL,NULL,NULL,'2012-06-19 00:00:00',18723,0),(7,'lainnya','Lainnya',9,NULL,NULL,NULL,'2012-06-19 00:00:00',17810,0),(1,'pangkat','Kenaikan Pangkat',3,NULL,NULL,NULL,'2012-06-19 00:00:00',32879,0),(4,'pensiun','Pensiun',8,NULL,NULL,NULL,'2012-06-19 00:00:00',45437,0),(6,'pns','Pengangkatan PNS',7,NULL,NULL,NULL,'2012-06-19 00:00:00',63018,0);
/*!40000 ALTER TABLE `jenisagenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jenisagenda BEFORE INSERT ON jenisagendaFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jenisagenda BEFORE UPDATE ON jenisagendaFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jenisagenda AFTER DELETE ON jenisagendaFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'jenisagenda', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jenisjabatan`
--

DROP TABLE IF EXISTS `jenisjabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenisjabatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `jabatan` varchar(2) NOT NULL DEFAULT 'F',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`jenis`),
  UNIQUE KEY `Index_replid` (`replid`),
  KEY `IX_jenisjabatan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisjabatan`
--

LOCK TABLES `jenisjabatan` WRITE;
/*!40000 ALTER TABLE `jenisjabatan` DISABLE KEYS */;
INSERT INTO `jenisjabatan` VALUES (8,'KEPALA','',2,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',47718,0),(16,'KOORDINATOR','',4,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',49537,0),(17,'STAF','',5,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',38997,0),(11,'WAKIL KEPALA','',3,'F',0,NULL,NULL,NULL,'2012-06-19 00:00:00',46376,0);
/*!40000 ALTER TABLE `jenisjabatan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jenisjabatan BEFORE INSERT ON jenisjabatanFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jenisjabatan BEFORE UPDATE ON jenisjabatanFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jenisjabatan AFTER DELETE ON jenisjabatan FOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'jenisjabatan', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `nrp` varchar(30) DEFAULT NULL,
  `nuptk` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(50) DEFAULT NULL,
  `gelarawal` varchar(45) DEFAULT NULL,
  `gelarakhir` varchar(45) DEFAULT NULL,
  `gelar` varchar(50) DEFAULT NULL,
  `tmplahir` varchar(50) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `suku` varchar(50) DEFAULT NULL,
  `noid` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `handphone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `foto` blob,
  `bagian` varchar(50) NOT NULL,
  `nikah` varchar(10) NOT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `kelamin` varchar(1) NOT NULL,
  `pinpegawai` varchar(25) DEFAULT NULL,
  `mulaikerja` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `ketnonaktif` varchar(45) DEFAULT NULL,
  `pensiun` date DEFAULT NULL,
  `doaudit` tinyint(1) DEFAULT '0',
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nip`),
  UNIQUE KEY `UX_pegawai_replid` (`replid`),
  KEY `FK_pegawai_agama` (`agama`),
  KEY `FK_pegawai_suku` (`suku`),
  KEY `FK_pegawai_bagian` (`bagian`),
  KEY `IX_pegawai_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pegawai_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pegawai_bagian` FOREIGN KEY (`bagian`) REFERENCES `bagianpegawai` (`bagian`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pegawai_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (23,'101',NULL,NULL,'Pegawai','','',NULL,'','Bandung','1987-11-01','Islam','Jawa','','                                ','','','',NULL,NULL,NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 70\nÿÛ\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;ÿÛ\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ÿÀ\0\0P\0:\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ŞÕµ]J=bò8ïîQw\n«#\0MT:Î«ÿ\0A¯ûúßãNÖş\'WÇş›¿ş„k+SºûŸ-ÆİÌ£å¤ğ(kï]Ø\0&ÕîƒŠ%bOëXrüK¿V!no°	iÈ?Î´ô¯\0É­éëu\"É?Î;Ù©æøecåmYI¼ü*\0¯aãK½Lm«İî%\ZV~µeµİc¶©wÿ\0Ûük\'Sø~úno¬åt¸€n*ŞŞôºUÌ—v!æ½CµÏ©õ \r×µ 8Õo?ïûzîœìúe«»f…	$ä“^0éšöm7şAvŸõÁ?ô@{«€u›Î?å»ÿ\03\\÷‰ã-¤ez	Ÿ¦qık¤Õ×ş\'‡òİÿ\0™¨\"¶KµxdŒI®ÖR~3í¼zPôzŒ\Z>™rE4İ.jEÔm%±7è²ÀÉùpEOs£éÚ’­ÔHà`å†qjy4«3¥<E‹b»p=(!îcÕôÉÃ,k\"‘—Çô&¼÷Ã–ÏÀ“?ëÈ@z}¦‘e¥éæ+hÖ$\0ô{×7i\rµ¼QÅŒG•Àş>‡wş„(Ğt¯_Ó¸Ó-ëŠè\"¼•”u¯ZÓÿ\0äkÿ\0\\Sù\n\0à5_ùŞsÿ\0-ßùš†	d‚MÑ¹VÆ2=*Æ©ÿ\0!{Ïúìÿ\0ÌÕ7‘\"]Ò:¢ú±Å\0tÉt‹§G)F”e’MPŠñÃHºuâ)“ÌÃFøİœç­VÒï<Ûv6î	W£84û[«ÅÔX+\0Ÿ¼­\0l\\İ+iÏ6ÃÂ°Á¹Y¥–l\\¹Q“[zÄ²Å¦;ÊT<’\"*œ°ÏãŒ×?Ä7+˜¤SíÜP.9æ½ZÃşAÖßõÅ?¯-uö¯R°ÿ\0}·ır_ä(Ëõûé›TÔ– Ñ\"O\"y¸ÏÍ“Ò³/D–Ö‘‰Æù\'»Œàc°í[š·nuåˆòrz­â­¾Éoä…ãv€3ÛQ{‹;ØQšŞXÄ2ªxà7Ç­û}jŞ	Hšù=¹(çŸÂ¸_ŞIkf4hQšáåÎáü GãÅeéĞË!ò°Vâ\"cqù[ê;}(¹—Y“V¿{©Çeh¤Â‡®ãÀcïíØf³-Ì/Ì\\BÑ0Ä¨ ñÈªZN Ú¨Òš7î9	”íÀqĞóëVmai×¯ÑãrŒşâ€#\Z½Ì!¦˜	l+„}?ıUíúc‰4«GÅütW…ê¶’.™l©·’ a\r{\0Ñ¬@9gş(ÍõÉ#ó5„3ºê3yGN˜şµ¨³MölÃ \0t*}«µ×¬õC}.ÂH—h¢ Kµ°[w-ÎÏN§¯jŒ<Q0•“k	!E\"6*Y?vbU†$gw|P\r®Ååëë;BAÀËÿ\0f¹ı7şC‘nù’–~¸ıkÚRÛS–Æ.4ûAv·%_-X4cpR§<òyÁæ³VÃYM?Jé6æóÍcw¶AÚmÏo¹„sùPi\0	î¦ o%Ao^M&İv_â•¼5zÛx‘\"Œÿ\0cØ‡-‰‚$g†e9º¥”øÎO_³k‹a4qé(ò8_%¥†\0AKo\0ãŸœÃ>´æºÉÿ\0‰Eºö*ı[#ú×¹i`\r&Ì/AcşùÍÃe¬5ô+w¤Z´)2®c-…Gç9aê sÉÉ8\0õÊ¡T*€\0\0v ÿÙ','Akademik','tak_ada','',1,'l','12637',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2012-06-23 04:04:49',4536,0);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegawai BEFORE INSERT ON jbssdm.pegawai
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegawai BEFORE UPDATE ON jbssdm.pegawai
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegawai AFTER DELETE ON jbssdm.pegawai
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegawai', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegdiklat`
--

DROP TABLE IF EXISTS `pegdiklat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegdiklat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `iddiklat` int(10) unsigned NOT NULL,
  `tahun` int(10) unsigned NOT NULL,
  `sk` varchar(45) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pegdiklat_pegawai` (`nip`),
  KEY `FK_pegdiklat_diklat` (`iddiklat`),
  KEY `IX_pegdiklat_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pegdiklat_diklat` FOREIGN KEY (`iddiklat`) REFERENCES `diklat` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pegdiklat_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegdiklat`
--

LOCK TABLES `pegdiklat` WRITE;
/*!40000 ALTER TABLE `pegdiklat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegdiklat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegdiklat BEFORE INSERT ON pegdiklatFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegdiklat BEFORE UPDATE ON pegdiklatFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegdiklat AFTER DELETE ON pegdiklatFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegdiklat', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `peggaji`
--

DROP TABLE IF EXISTS `peggaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peggaji` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `gaji` varchar(15) NOT NULL,
  `sk` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `judulsk` varchar(255) DEFAULT NULL,
  `tanggalsk` varchar(255) DEFAULT NULL,
  `dok` text,
  `doaudit` tinyint(1) DEFAULT '1',
  `terakhir` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peggaji_pegawai` (`nip`),
  KEY `IX_peggaji_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peggaji_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peggaji`
--

LOCK TABLES `peggaji` WRITE;
/*!40000 ALTER TABLE `peggaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `peggaji` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_peggaji BEFORE INSERT ON peggajiFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_peggaji BEFORE UPDATE ON peggajiFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_peggaji AFTER DELETE ON peggajiFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'peggaji', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `peggol`
--

DROP TABLE IF EXISTS `peggol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peggol` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `golongan` varchar(14) NOT NULL,
  `tmt` date NOT NULL,
  `sk` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `judulsk` varchar(255) DEFAULT NULL,
  `tanggalsk` varchar(45) DEFAULT NULL,
  `dok` text,
  `petugas` varchar(45) DEFAULT NULL,
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peggol_pegawai` (`nip`),
  KEY `FK_peggol_golongan` (`golongan`),
  KEY `IX_peggol_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peggol_golongan` FOREIGN KEY (`golongan`) REFERENCES `golongan` (`golongan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_peggol_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peggol`
--

LOCK TABLES `peggol` WRITE;
/*!40000 ALTER TABLE `peggol` DISABLE KEYS */;
/*!40000 ALTER TABLE `peggol` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_peggol BEFORE INSERT ON peggolFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_peggol BEFORE UPDATE ON peggolFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_peggol AFTER DELETE ON peggolFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'peggol', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegjab`
--

DROP TABLE IF EXISTS `pegjab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegjab` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `idjabatan` int(10) unsigned DEFAULT NULL,
  `tmt` date NOT NULL,
  `sk` varchar(45) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jenis` varchar(50) NOT NULL,
  `namajab` varchar(255) DEFAULT NULL,
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `fk_pegjab_jabatan` (`idjabatan`),
  KEY `fk_pegjab_pegawai` (`nip`),
  KEY `IX_pegjab_ts` (`ts`,`issync`),
  CONSTRAINT `fk_pegjab_jabatan` FOREIGN KEY (`idjabatan`) REFERENCES `jabatan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pegjab_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegjab`
--

LOCK TABLES `pegjab` WRITE;
/*!40000 ALTER TABLE `pegjab` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegjab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegjab BEFORE INSERT ON pegjabFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegjab BEFORE UPDATE ON pegjabFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegjab AFTER DELETE ON pegjabFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegjab', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegkeluarga`
--

DROP TABLE IF EXISTS `pegkeluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegkeluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hubungan` varchar(50) DEFAULT NULL,
  `tgllahir` varchar(50) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pegkeluarga_pegawai` (`nip`),
  KEY `IX_pegkeluarga_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegkeluarga`
--

LOCK TABLES `pegkeluarga` WRITE;
/*!40000 ALTER TABLE `pegkeluarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegkeluarga` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegkeluarga BEFORE INSERT ON pegkeluarga
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegkeluarga BEFORE UPDATE ON pegkeluarga
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegkeluarga AFTER DELETE ON pegkeluarga
FOR EACH ROW BEGIN
   IF @DISABLE_TRIGER IS NULL THEN
      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegkeluarga', dataid = OLD.replid, datatoken = OLD.token;
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegkerja`
--

DROP TABLE IF EXISTS `pegkerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegkerja` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `thnawal` varchar(4) NOT NULL,
  `thnakhir` varchar(4) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `fk_pegkerja_pegawai` (`nip`),
  KEY `IX_pegkerja_ts` (`ts`,`issync`),
  CONSTRAINT `fk_pegkerja_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegkerja`
--

LOCK TABLES `pegkerja` WRITE;
/*!40000 ALTER TABLE `pegkerja` DISABLE KEYS */;
INSERT INTO `pegkerja` VALUES (1,'132 456 001','Pikiran Rakyan','1996','1999','Wartawan','',1,NULL,NULL,NULL,'2012-06-19 00:00:01',52383,0),(2,'131 924 825','SMA Negeri 3 Durian','1992','1995','Guru','',1,NULL,NULL,NULL,'2012-06-19 00:00:01',43673,0);
/*!40000 ALTER TABLE `pegkerja` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegkerja BEFORE INSERT ON pegkerjaFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegkerja BEFORE UPDATE ON pegkerjaFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegkerja AFTER DELETE ON pegkerjaFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegkerja', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `peglastdata`
--

DROP TABLE IF EXISTS `peglastdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peglastdata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `idpeggol` int(10) unsigned DEFAULT NULL,
  `idpegjab` int(10) unsigned DEFAULT NULL,
  `idpegdiklat` int(10) unsigned DEFAULT NULL,
  `idpegsekolah` int(10) unsigned DEFAULT NULL,
  `idpeggaji` int(10) unsigned DEFAULT NULL,
  `idpegserti` int(10) unsigned DEFAULT NULL,
  `idpegkerja` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peglastdata_pegawai` (`nip`),
  KEY `IX_peglastdata_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peglastdata_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peglastdata`
--

LOCK TABLES `peglastdata` WRITE;
/*!40000 ALTER TABLE `peglastdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `peglastdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_peglastdata BEFORE INSERT ON peglastdataFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_peglastdata BEFORE UPDATE ON peglastdataFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_peglastdata AFTER DELETE ON peglastdataFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'peglastdata', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegsekolah`
--

DROP TABLE IF EXISTS `pegsekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `sekolah` varchar(255) NOT NULL,
  `lulus` int(10) unsigned NOT NULL,
  `sk` varchar(45) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `doaudit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pegsekolah_pegawai` (`nip`),
  KEY `IX_pegsekolah_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pegsekolah_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegsekolah`
--

LOCK TABLES `pegsekolah` WRITE;
/*!40000 ALTER TABLE `pegsekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegsekolah` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegsekolah BEFORE INSERT ON pegsekolahFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegsekolah BEFORE UPDATE ON pegsekolahFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegsekolah AFTER DELETE ON pegsekolahFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegsekolah', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pegserti`
--

DROP TABLE IF EXISTS `pegserti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegserti` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `sertifikat` varchar(255) NOT NULL,
  `lembaga` varchar(255) NOT NULL,
  `tahun` smallint(6) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terakhir` tinyint(1) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `fk_pegserti_pegawai` (`nip`),
  KEY `IX_pegserti_ts` (`ts`,`issync`),
  CONSTRAINT `fk_pegserti_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegserti`
--

LOCK TABLES `pegserti` WRITE;
/*!40000 ALTER TABLE `pegserti` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegserti` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_pegserti BEFORE INSERT ON pegsertiFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_pegserti BEFORE UPDATE ON pegsertiFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_pegserti AFTER DELETE ON pegsertiFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegserti', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pilihandata`
--

DROP TABLE IF EXISTS `pilihandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtambahan` int(10) unsigned NOT NULL,
  `pilihan` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihandata_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_pilihandata_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihandata`
--

LOCK TABLES `pilihandata` WRITE;
/*!40000 ALTER TABLE `pilihandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `jammasuk` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `jampulang` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `jamwaktukerja` int(10) unsigned DEFAULT '0',
  `menitwaktukerja` int(10) unsigned DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1 -> Hadir, 2 -> Izin, 3 -> Cuti, 4 ->Sakit, 5 ->Alpa',
  `keterangan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `source` varchar(45) DEFAULT 'MANUAL',
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_presensi` (`nip`,`tanggal`,`status`),
  CONSTRAINT `FK_presensi_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensi`
--

LOCK TABLES `presensi` WRITE;
/*!40000 ALTER TABLE `presensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satker`
--

DROP TABLE IF EXISTS `satker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `satker` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `satker` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`satker`),
  UNIQUE KEY `UX_satker` (`replid`),
  KEY `IX_satker_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satker`
--

LOCK TABLES `satker` WRITE;
/*!40000 ALTER TABLE `satker` DISABLE KEYS */;
INSERT INTO `satker` VALUES (19,'(Tidak Ada)','Tidak Ada Satuan Kerja',1,NULL,NULL,NULL,'2012-06-19 00:00:01',17795,0),(21,'GURU','Pengajar',0,NULL,NULL,NULL,'2012-06-19 00:00:01',51312,0),(23,'KOPERASI','Koperasi',0,NULL,NULL,NULL,'2012-06-19 00:00:01',6583,0),(24,'MANAJEMEN','Manajemen Sekolah',0,NULL,NULL,NULL,'2012-06-19 00:00:01',10040,0),(22,'TATA USAHA','Tata Usaha Sekolah',0,NULL,NULL,NULL,'2012-06-19 00:00:01',30450,0),(20,'YAYASAN','Pengurus Yayasan',0,NULL,NULL,NULL,'2012-06-19 00:00:01',56600,0);
/*!40000 ALTER TABLE `satker` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_satker BEFORE INSERT ON satkerFOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_satker BEFORE UPDATE ON satkerFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      IF OLD.issync = 1 THEN           SET NEW.issync = 0;           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;       IF OLD.issync = 0 AND NEW.issync = 0 THEN           SET NEW.ts = CURRENT_TIMESTAMP;       END IF;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_satker AFTER DELETE ON satkerFOR EACH ROW BEGIN   IF @DISABLE_TRIGER IS NULL THEN      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'satker', dataid = OLD.replid, datatoken = OLD.token;   END IF;END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tambahandata`
--

DROP TABLE IF EXISTS `tambahandata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kolom` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Text 2 File 3 Pilihan',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urutan` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandata`
--

LOCK TABLES `tambahandata` WRITE;
/*!40000 ALTER TABLE `tambahandata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahandatapegawai`
--

DROP TABLE IF EXISTS `tambahandatapegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahandatapegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idtambahan` int(10) unsigned NOT NULL,
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 Teks 2 File 3 Pilihan',
  `teks` varchar(1000) DEFAULT NULL,
  `filedata` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tambahandatapegawai_pegawai` (`nip`),
  KEY `FK_tambahandatapegawai_tambahandata` (`idtambahan`),
  CONSTRAINT `FK_tambahandatapegawai_pegawai` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tambahandatapegawai_tambahandata` FOREIGN KEY (`idtambahan`) REFERENCES `tambahandata` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahandatapegawai`
--

LOCK TABLES `tambahandatapegawai` WRITE;
/*!40000 ALTER TABLE `tambahandatapegawai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tambahandatapegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbssms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbssms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbssms`;

--
-- Table structure for table `daemons`
--

DROP TABLE IF EXISTS `daemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemons`
--

LOCK TABLES `daemons` WRITE;
/*!40000 ALTER TABLE `daemons` DISABLE KEYS */;
/*!40000 ALTER TABLE `daemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 presensi, 1 penilaian, 2 pengumuman',
  `format` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,0,'Kami informasikan presensi [SISWA] tanggal [TANGGAL1]/[BULAN1] s/d [TANGGAL2]/[BULAN2] hadir [HADIR] absen [ABSEN]. [PENGIRIM]'),(2,2,'Kami informasikan nilai #SISWA tanggal #TANGGAL1/#BULAN1 s/d #TANGGAL2/#BULAN2 . #PENGIRIM'),(4,1,'Kami informasikan nilai [SISWA] tanggal [TANGGAL1]/[BULAN1] s/d [TANGGAL2]/[BULAN2] . [PENGIRIM]');
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gammu`
--

DROP TABLE IF EXISTS `gammu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gammu` (
  `Version` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gammu`
--

LOCK TABLES `gammu` WRITE;
/*!40000 ALTER TABLE `gammu` DISABLE KEYS */;
INSERT INTO `gammu` VALUES (7);
/*!40000 ALTER TABLE `gammu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT '8bit',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` varchar(160) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  `Status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dibaca, 1 sudah dibaca',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kritiksaran`
--

DROP TABLE IF EXISTS `kritiksaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kritiksaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` text NOT NULL,
  `senddate` datetime DEFAULT NULL,
  `message` text,
  `from` text,
  `Status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kritiksaran`
--

LOCK TABLES `kritiksaran` WRITE;
/*!40000 ALTER TABLE `kritiksaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `kritiksaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') DEFAULT '8bit',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` varchar(160) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` text,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  `idsmsgeninfo` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dikirim, 1 sudah dikirim',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=619178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox`
--

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox_multipart`
--

DROP TABLE IF EXISTS `outbox_multipart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') DEFAULT '8bit',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` varchar(160) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox_multipart`
--

LOCK TABLES `outbox_multipart` WRITE;
/*!40000 ALTER TABLE `outbox_multipart` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox_multipart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outboxhistory`
--

DROP TABLE IF EXISTS `outboxhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outboxhistory` (
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idsmsgeninfo` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dikirim, 1 sudah dikirim',
  `SenderID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_outboxhistory` (`SendingDateTime`,`DestinationNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outboxhistory`
--

LOCK TABLES `outboxhistory` WRITE;
/*!40000 ALTER TABLE `outboxhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `outboxhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbk`
--

DROP TABLE IF EXISTS `pbk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbk` (
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbk`
--

LOCK TABLES `pbk` WRITE;
/*!40000 ALTER TABLE `pbk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbk_groups`
--

DROP TABLE IF EXISTS `pbk_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbk_groups`
--

LOCK TABLES `pbk_groups` WRITE;
/*!40000 ALTER TABLE `pbk_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbk_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `pesan` varchar(160) NOT NULL,
  `pengirim` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesan`
--

LOCK TABLES `pesan` WRITE;
/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanpenerima`
--

DROP TABLE IF EXISTS `pesanpenerima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanpenerima` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpesan` int(10) unsigned NOT NULL,
  `jadwal` datetime NOT NULL,
  `penerima` varchar(20) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pesanpenerima_idpesan` (`idpesan`),
  CONSTRAINT `FK_pesanpenerima_idpesan` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanpenerima`
--

LOCK TABLES `pesanpenerima` WRITE;
/*!40000 ALTER TABLE `pesanpenerima` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanpenerima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonebook`
--

DROP TABLE IF EXISTS `phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonebook` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nohp` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 siswa, 1 ortu, 2 pegawai, 3 lainnya, 4 alumni',
  `keterangan` varchar(100) DEFAULT NULL COMMENT 'Jika status 1 isinya Ortu NamaSiswa',
  `idreplid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX` (`nohp`,`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonebook`
--

LOCK TABLES `phonebook` WRITE;
/*!40000 ALTER TABLE `phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` text NOT NULL,
  `Client` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES ('MyPhone1','2010-02-03 03:48:05','2010-02-03 03:48:05','2010-02-03 03:48:15','yes','yes','354056001179799','Gammu 1.10.6, Windows XP SP2');
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentitems`
--

DROP TABLE IF EXISTS `sentitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT '8bit',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` varchar(160) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `SenderID` text NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentitems`
--

LOCK TABLES `sentitems` WRITE;
/*!40000 ALTER TABLE `sentitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `sentitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsgeninfo`
--

DROP TABLE IF EXISTS `smsgeninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsgeninfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `tipe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 presensi, 1 penilaian, 2 pengumuman',
  `info` varchar(1000) DEFAULT NULL,
  `pengirim` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_smsgeninfo` (`tipe`,`info`(50),`pengirim`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsgeninfo`
--

LOCK TABLES `smsgeninfo` WRITE;
/*!40000 ALTER TABLE `smsgeninfo` DISABLE KEYS */;
INSERT INTO `smsgeninfo` VALUES (2,'2010-04-16',2,'Pengumuman','akademik ');
/*!40000 ALTER TABLE `smsgeninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsumum`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsumum` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsumum`;

--
-- Table structure for table `agama`
--

DROP TABLE IF EXISTS `agama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`),
  KEY `IX_agama_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agama`
--

LOCK TABLES `agama` WRITE;
/*!40000 ALTER TABLE `agama` DISABLE KEYS */;
INSERT INTO `agama` VALUES (29,'Budha',5,NULL,NULL,NULL,'2010-03-02 03:07:22',48581,0),(28,'Hindu',4,NULL,NULL,NULL,'2010-03-02 03:07:22',61565,0),(25,'Islam',1,NULL,NULL,NULL,'2010-03-02 03:07:22',31019,0),(26,'Katolik',2,NULL,NULL,NULL,'2010-03-02 03:07:22',35929,0),(27,'Protestan',3,NULL,NULL,NULL,'2010-03-02 03:07:22',21057,0);
/*!40000 ALTER TABLE `agama` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_agama BEFORE INSERT ON jbsumum.agama
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_agama BEFORE UPDATE ON jbsumum.agama
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_agama AFTER DELETE ON jbsumum.agama
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'agama', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `judul` varchar(255) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1',
  `latar` mediumblob NOT NULL,
  `latardata` mediumblob,
  `tanggal` datetime NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `vres` decimal(5,2) NOT NULL DEFAULT '96.00',
  `hres` decimal(5,2) NOT NULL DEFAULT '96.00',
  PRIMARY KEY (`replid`),
  KEY `FK_card_departemen` (`departemen`),
  CONSTRAINT `FK_card_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carddata`
--

DROP TABLE IF EXISTS `carddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carddata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcard` int(10) unsigned NOT NULL,
  `carddatatype` tinyint(1) unsigned NOT NULL COMMENT 'Info 1, IdSiswa 2, NamaSiswa 3, IdPegawai 4, NamaPegawai 5, IdCalon 6, NamaCalon 7, GambarSiswa 8, GambarPegawai 9, GambarCalon 10',
  `text` varchar(2000) DEFAULT NULL,
  `fontname` varchar(255) DEFAULT NULL,
  `fontsize` varchar(255) DEFAULT NULL,
  `fontstyle` varchar(255) DEFAULT NULL,
  `color` varchar(12) DEFAULT NULL,
  `posX` int(10) unsigned NOT NULL DEFAULT '0',
  `posY` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `alignment` varchar(3) NOT NULL DEFAULT 'L',
  PRIMARY KEY (`replid`),
  KEY `FK_carddata_card` (`idcard`),
  CONSTRAINT `FK_carddata_card` FOREIGN KEY (`idcard`) REFERENCES `card` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carddata`
--

LOCK TABLES `carddata` WRITE;
/*!40000 ALTER TABLE `carddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `carddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambar`
--

DROP TABLE IF EXISTS `gambar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambar` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `modul` varchar(45) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama` varchar(255) NOT NULL,
  `berkas` varchar(255) NOT NULL,
  `lebar` int(10) unsigned NOT NULL,
  `tinggi` int(10) unsigned NOT NULL,
  `ukuran` int(10) unsigned NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambar` (`modul`,`tanggal`),
  KEY `FK_gambar_departemen` (`departemen`),
  CONSTRAINT `FK_gambar_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambar`
--

LOCK TABLES `gambar` WRITE;
/*!40000 ALTER TABLE `gambar` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitas`
--

DROP TABLE IF EXISTS `identitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) DEFAULT NULL,
  `situs` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat1` varchar(255) DEFAULT NULL,
  `alamat2` varchar(255) DEFAULT NULL,
  `alamat3` varchar(255) DEFAULT NULL,
  `alamat4` varchar(255) DEFAULT NULL,
  `telp1` varchar(20) DEFAULT NULL,
  `telp2` varchar(20) DEFAULT NULL,
  `telp3` varchar(20) DEFAULT NULL,
  `telp4` varchar(20) DEFAULT NULL,
  `fax1` varchar(20) DEFAULT NULL,
  `fax2` varchar(20) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `foto` blob,
  `departemen` varchar(50) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `perpustakaan` varchar(45) DEFAULT NULL,
  `info1` varchar(20) DEFAULT NULL,
  `info2` varchar(20) DEFAULT NULL,
  `info3` varchar(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_identitas_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitas`
--

LOCK TABLES `identitas` WRITE;
/*!40000 ALTER TABLE `identitas` DISABLE KEYS */;
INSERT INTO `identitas` VALUES (4,'SMA Indonesia Membaca','www.indonesiamembaca.net','info@indonesiamembaca.net','Jl. Pendidikan No.1','',NULL,NULL,'(022)1234567','(022)1234567','','','(022)1234567','',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿÛ\0C\0ÿÛ\0CÿÀ\0\0K\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0şş(¢Š\0+Ä!Ğ<%¡êş\'ñV¹£øgÃZŸu«k¾!ñ§e£hz.•cÜ_jz¶­¨Ïma§iövèóİ^^\\Cmo\n4’Èˆ¥‡Á¿ğPø)OÀø\'¯‚ôK¿ˆm­|BøÏñŞØ|ı›¾Go«|\\øÁ®Ú!óF•¦I\"ÛøkÁzC•›Åÿ\0<O%‡„¼+b®o.õitİQş<¿moÚKãgíK¦Ëñ¯ş\nUãHìşhú­¶¡à_Ø“áEõúşÎ¿GóÃÃâ¦­{6kñÏâ\Z›Xm[ÅŸu-ánâ)å°ğ·‡ôÈ5[?ôğÛ‰xú®*¦WF&Ë\"êg<IšT–$ÊhÆ*sxœW$İ\\G#R§ƒÂÂ¶*iÆ^Ê4¹ªÇñO<|à0ùu!Äâón+â\n‘Ãp§píf\\]ÄØº“t©C—*”ã†ÁûTá[5Ìjá2ê.3‡Ö*b90õ?|?hoø8/á“êz¯€¿àŸ5¯ÛKÅ77:Uÿ\0ÆËİjO…²†5%{K™bø¹¨é:®½ñv].çd³éß<#â]R·ÊÁã[&-,‘ş:ÿ\0ÁCjy.¤ı¥?mø7Âwë\'›ğ?ö0†ûöhøokoq¹nôSâ™ªk?üm§Oo‹i†«ñ3G±¹‹ÌFfš9~Óş+xëã&„Ú/ÂmYğ·Ãxuô/‡0ğÇ†uŸê¾–Ó^ñoÃ¯é¾2ƒU¶Óõ‡z†|7sáO‹_.!Ò¼?%ìúMÇ…­¥Ôd[Q­éü\røñCá×ˆâøŸñ‡âN›?ü Ş.ÓüY§¾½âm_L²>)‡á_ˆ%ÛYñf£*hú_€¼Cá­½Ò;Ùëö1Ÿ]:w…g7:Uağ‚åUòÚÕ8s4ñÖöuq\\CšT§–ğÎ”åM¬N*ŒçG…\ZqÇScŠÅÊ¾Q«N1•JT¥şYøÓô½ñÃ‰pœA…¥Ç|;àDpo‡Ë¸‡hÕÏü@Íq©ÔRËó#(brÜÆ†aJ¦OˆE—å±Áæ”êakÕ«\nšô½{á·Â+‚z”ş ı‘ÿ\0h¯Ú/ödñ\\¢[PÔ>ütñ½áß^^µÙjş?øoñ\'UøƒğçÇÍ}\"5Ü×¾(ğ½åş°­<ÒjRJÂá?N~\nÁh?à _³Ä¶ÚgíYğÁŸ·ÂëW;ÏŠ³Æ›¦üı¥ô=\0k­O\\ø)¯j¯ğ“âuâ©Ÿ€|YğÊîb­ô	¤òíßğÃß±Ç†uo…¾)øMá>*²ÔµƒŸ\n<-i.¡áûı\'QÔ/şxGWğ÷Ã/Š6ºo‹®õKÍSá>¹ªêvş2ğóøRü3«M¤èWşñªÛXù×>‰âï\n~Ó¿¼]âßøsÅ·Úÿ\0†~ Ëá6ÖÅ…¦µãFøg«Ïâİi|]âß\røÛjZ–³¤hôxOÃ¾ğÖy>µãíJë:KXÁ®_Çéñ†œÆ9U<ËázÈ¡V2â3œ›‡ áS3§Q¬6Ù>*V-UjâğÔ—6;Ï‰ÂÃ:Õ¾{üñ—Â¾$ÄdgÒ&\\cS\r‹9ğO)Å™~?ªQáê´³éOŠrú¸¯íıá°¹n>»tò|¨à3:ÙÅ,.ûÅı¿à ÿ\0²Gíãá­K]ı›>.i>+Ö¼4\"‹Ç¿5ËMCÁ>_¹XßNø‹ğ§ÅVÚW|-\"]³ƒR¼Ò@Õ¦†WĞµVÕVå¾Ğ¯óMğÿ\0Ä‡?|Sà?kÚ¿‹ÿ\0g?ÚÓÂ^ñï¼=ñÃá¥7Âß‰?	¼3àß\ZéşÓ.üGâô½wÑãñ>“â]kÿ\0|gÿ\0	\'…-5-[Ä	×­ßXÑ¯ ÑçìKÿ\0ºñ‡ÃOxOöwÿ\0‚¢ÜøoF“Ä7ö>øWûxøgJ‡Â¿>!kN¶š_†h?\rC$šwÀO‰\Z¬¾Y´ñ-µÀøAâ›™§K[Mf4û¯äî;ğk9á\\^ É1”¸³„¡ìe[6ÀR•,vNñ¡Z–ˆ²®zµ²ÊÑEN¥XÎ¾5£*5kÑÄ³¯ô·Á¿¥g	ø›aø#‹²¼G†&UxªxN\ZÎ±1ÄeR°8Š¸\\F7¸“Øá°œA„J2­C\r:8<Î®QÅa°x¼\núì¿§j)‘ÉÑ¤±:Kˆ²G$l¯ˆà2::’®Œ¤2²’A Óëñ£ú¬(¢Š\0+ò§ş\nƒÿ\06ğ×ìà¿\rø+À^²øÅûbünƒS±ıŸ>çµ³”X¯ñkâ¾¡hÂëÂ_¼$©sâc0ê>%¿H¼%ábÚ¥ÕŞ¡£~«Wğeªk¿?kïø(_Æ¿Š\Z¾¥ã/‹±~Û_´§ìÿ\0‰uç[ŸüøñS_ğ7Â†^´Š8ìü;á-Ãz}¡&¦ÃöŞ¹{â=j}GU¼7cõü<^&ñ¾†«c~¡\nù–g^\Zâ^_‚•%Z	J§õºò­N•9ÕNÊuå\Z¾ÉQ©üïô¤ñÆGÏs?Âå+:Î%ŒÁä=ƒ¬ÜpÎóXâ›J§[û7K\rˆÅW¥‡j¾.¥*8UÃ}eâğüò^øWñÿ\0íKûLxÿ\0]øÓûI|Lky~(ü_½ĞõmoT’×Ì{Ëü2ğVgª_ø7à÷-#º½Ó¼àı1àÒ|3¢ßx[òM:êökà·âoİøï]“Ç^ø¥ğ§Ä÷·\"GÚgˆcÑüS&á“w¡ø_ğşŸoá\Z| Ô¼?~d5]3Bño†µ»MOHñ\nø–ÿ\0PÔ®4NÏö†ğ§5j~<ñªøÖ)¾è¾!ñ_‡µ‡)ñ†¼ga©C§ù®¾şÂÔ´øõ/êËjš•¥êQ_Ùë\r©Máû«K?ZÔ-.ıƒÃ§ËáÍ\n}*õõ=6çIÓîìu9c·ŠmRÚîÒ+˜µ;ˆí-,m–çQY~ÛsäYZDÓÏ#%´¼µÿ\0N²nÃdùÆ‡2˜eù/\rğÎ[G–äÙmjï†:8Œl^o	T§NªÄV¥‹§)W¡˜ËãSWKV‡üôq_ˆ9‡ğ¾sÇ|OS<âŞ>ñ=ÅåÙÿ\0çølövWS&_šarÎ«N…zØW„Âârºñ†‘GC-ÃåøŒ£\rUcu|	ám#XøÁğá¿ˆõÛÿ\0†ß¼añÁÿ\0\n¼]â‡vşƒÇŸÆú•‡‚>Çá_xsÄ¾Óü8|q©x[Ãş+—Rğö£.—á]ZûUÒ£°“Dİ?éŞ¹û~Ïÿ\0ş~Ø÷Ş!ğİ×Å/‰_²gí‰û+üHğ‡ÄŸ‹ÙxÅKğ+FÖÿ\0ema¥Yéš_‚´{gø¹ğ¿^¹ğ÷„t‹YøkZ¸ñSê÷w2Îß“ş<ÒumsÁ~)Òü?t,<Gw ê‰áHíİ¥xš;9fğæ¯r\'Òµ¸ì5y	UÅ´R‚¥Ñ·Å=ã_ÀÚöªÖµ›şÎ_¶§ü³ÀÚwŠüS¡é­âøÄÖšÅOx7Yğ×€ ¸´Ô¼aâ­WÃ´…å¾§ÚÜGw©ë_</á¹.mg¼ÓÉşFú^Ã?Ê3şx|ó9‡\rçÙMXbG0ÄÃ\'¥˜eÕ:ò¥€¥8a#Ï…Ç`®¥JSçU%ÎÔ­ôïö_Tà®&à¾6;ƒøN·poáê®.G—ÖâœFGÄø9WÁÓÄçxŠ5³)*yQ›[ÙâiÑön„=’.yû\'ímğGá/íû`şÆŸ\n~.|=ğ¿Ä\ré_?kßŒ\ZgˆôÈ.ĞÅàæış\ZCw8öİ#Õ~7iš´1ÚİDTÑô½QíºMÕŸóûñßöuğgÂ_ÙOà¯ÇÏ†¾%^|Aı¦¾8üG¼ø#ğÃÆ:×†|Kğ›Mı™®üuñÆ¾Öu½NïÂo`ğÿ\0ìïeğóLÓüQ?Ä½TÖ~%øËÃ2øê:­;éŸ¶w> ı¥|yñsÇšŸ~\Zèÿ\0?kû\nşÒÏûü?Ó|ckâ¯øCñŸ‰>j:¤>/øŠ‘ØYxGâçÂßˆÚ_ÀŸ	|^Ğl4íkÀ2[ø³Âş-øwñÆzwü$ü½ÿ\0‚Xè¾\nø÷û;~Ìœ¿‚¿c_ØÓÀŞğêCµ\"ŠïâV¯k¡^i—ÑÆv®¡¥ø3ösøi©CÖ^*G„…»“âŞÿ\0¬8ÿ\0ø_\"ÉóÜï(Âc³‰Ía•f8¬1~WF¶gŠ£‰…\ZŠZu¨ágBÕéÔ5T”\\š?¬şšê6KàˆœcÅ<Â<O™åÀğİ^$ÈrìÚ¶<âf ËqX\n¸ªÅaëa1Y,g6µ\ZŠiIÉB2?*~/ü\0ğ¯Åãm¨j3İhúôQh–×ÖS_5¯ˆ<9¡kƒÅV~\rñvÚ6­/…ßÅPéŞ ½‡ÃºÏ†5}F÷FÓlïµyt&ÔtkïøGñóÄ–²|	ı¦t‰5Íâ”ß®,¼\'®ørÊ	è?ü5yáÛøwÅ:Æ­tïâ=CÅ:Î§«bâ_Oe¨ø’?j~!»×ü=4×|WÈ>øÇß´Ç‡-&ñ<7ãí7á4šî©uàïìÍóSğmŒdÓ´m_ˆGM¸ñ·†ìîµ=[Ä³]èßuß\nÏ¬Å’øŠşîŞÚÂÙ¿Òn*É_ÀçÙ,0”±øün&Í0š£‚ÏğÙ†&7KFs…\Zõ©RúìiÒtçM,Ãú¶#FşøoÅÏ9É³~âº™|—$Ês.)áÌç/ÃÔÄæÜ˜d˜EhbrÜM*5qX&\'¢¦\'N­\ZòG“e_Àå8œs?L¿àßğQoÿ\0Á5üIá_Ù·ö™ñ~·ãø\'çŠu};Âß¾5ø·S»Ö¼MûkÚµÜZ‡ş|Rñ¡4÷úÏì×©İÍm¤øÇº¤÷¿n¤³ğ×Š.äğTšn«¡ÿ\0c°Í\rÌ1\\[ËöóÆ“A<.²Ã42¨xåŠD,’G\"2º:1VRI\ZşµíEñN‰«xoÄz]†¹ kÚuæ‘­hú¥¬Wºv©¦jòZßXßZN¯\rÅ­Õ¼²C42+#Æì¤`×î‡ü±ã\ZøŸöñ/ƒ|WâíÆ:À?ÚÃö”ı>]øşMgZÑ>\r|(ñ¤Z/€<#6»r¿ÚZÍ—…tù\'ÑtK­Râòò×B´Ó4ˆîÇM²µ¶şúKøA”ø{šåüEÃ’§…Èø—Š¤ò]Wö^aB¯U`´kû:¼&çN„¥Íƒ«R§|<èÂûô\0úQq/ü9ğ7F¾cÅüË±â·Èßäxº•0˜ifú©o`ëQöuñ‘ƒi‡<M~\\u,Ul_îõQ_Ë‡ú(üx—@“á÷íáÿ\0LøcyÛj\ZgíÕã/Š1Û…Ø±?h/†ÿ\0\r>0éLœdßMâ]NèKŒJ$ã,Íıä×ñ¯ÿ\0Oğüÿ\0‚Ãø“ÄH·ğçí«û$ü=ñõô«åÇ}ñOöcñ&©ğ¿Æ\ZM«mÛ=Ò|4ñÂıJRÊm­H‘;X\ZOŞ~9Í<ŸÆU¦¡G5†e“NMÙ{Ln»ÂCÍÕÇQÂÒŠë)£øËéıÂµø§è·âÂR•lW\rÕÈ8ª•8¦ß°Ês¼sJ®ÛG“b³LÊ4]ì›kÉ´ÿ\0„Z—ÄŸ„_µçÅùÒsàÿ\0Ùsá—>œ C*/Æ_‹—7¾\Zğ÷ÄKphbĞ?eO5ÿ\0ÇÛáwÙWÅ‹ğóÅ{>Õìïx9u\rxfÇ@°V¶°êcÑ|%£ié%ş¥®Üe]3Bğ–‡§%Ö­âMRâİ#‹LÑ´-GS¾ıÜvv³»ª·Ó_²oíãïÙ“ö†Ğ.|7ñá/>üvKO‡_,~>.£gğ‡\\ñVm­^ü#]OÆÚ]Ô7_õßjš¦¹ğú×â$º_Œ´MVûÄ¾ğ—ˆ|âké|¨øWútı›gŸ‡\rín|}ì¥û)~ÏŸ<A%üZİïìßc¡x†×UÑîgK›k‹‰CàÀÏk©gíWÖ7~[X&cÔ5-ŞrşåÆ¾3ñ\'ƒş(ø‘K1È0ÜAâ\ZyNÇb3N—d8<>+û3,p•\'\n¸¼\\±pÃâ0|ù”1’uç*œğş=ğŸè£ÀJO£¿€˜Œ‡±ü“p=^/ÃñÎM‚É0Y–cqkËÖÆyŒóJ0ËñÕpÙ^[²¾?šû,‚¦UN8J4èû*¿ÈßÄO\nüpøG¤øOÅ?fOŞøãyüK‡<uâ?	hv–³Âà/|Qñ<šÇcñTß|#ı‹ğûÁ0ñ}ä1øm ^&ƒá?jilöz&£5¿è…k/ø{şûQ|\nÖc×<gñOÂŸ\nÿ\0nşøyà6?ø’ãÂÖ\r5¯‹~ñQµšîÎÃÃ_ş\rü\ZøÉğ²?xïÄ:¦™ èSZèÚõç¼Oàïk¿¬_µÇ„¼KûGüm·øáµfø/û/|pøÙw5ä±[Åoñ‹ö…ø}ñGöWıœmf’L«èÚ‡„uÚÂã^ŞV;K#ÃRºÈ³î‡ùLÕ>/KûşÄ¿¾3şÑ5o…z§íOãOüĞ~ø—I]ãÿ\0í3¢~Ï¶ğü=›áâÔldo„_²7„üQi­øƒã%ôö—ÿ\0ş>\\xòÇá–Ÿƒ¾Aá¿xóòlë8Óé€Êø>¦O†Î8î·\ZdxÈøc-ÄifÏˆ0ÙÆ1Ëéá§ŠÄÊ¥:Xœ.KÉ_™JœªGë29:Ô?°|ú1p¿Ñ§Äº8ÿ\0kñ-^â\0â,7×â\\ÓÃás®Î8J·\nc(TÃeØgÇá³N*l4¡õyÑ¡V®ê¯*¯èOÁº¥§ìƒû|èwß?h/‹ü)âÙ£ZøeáïŒ^0Óü9}àÏÙÛÃöŸü+áÿ\0ø#âV©á«‘w¤ë(ÕltİâgÇ¯i|qñOĞáik^²±ğ‰cø·ûC|XÖ>0~Ö´§üàßüTñÄŸÚ>xGÂß´Ë-RçûÂ~+ğìğ¾ò-OZÕ4\riZ/Ä\rkÀúWˆôYµmO†ú?xÄ)Ñ4jz? şÅŞ%Ñ¼cû9üı«ş\r^ØøoÁ^;ğÖ©ğ[ö–ğçÅ\ZïÆşÿ\0…‘ñ/ü?ø·âo\Z=ó›ï\Z|\rı¥¼Aájÿ\0|Mgt,ğOˆgğ‡í#ÒZÚÂ?}öı”¿hO†>ÿ\0‚‚ê—³ÿ\0Œş_şÊ\0î~øWYº\Z¼_|Aû|sø­ûBx?áÏÃßˆecÄÄ¿	ÀŸµ¯Š0XéQø¾#_6«§øoÆ¾-ğÏ…Ÿş;à(Vñ?<Ë²ú¼;â‡†yßxMÅ<Æ8Zk;àO¸c‹°Y\Zpî{ƒÁã%Mæ™v\Z†#—ÏŠ«‚Çå˜¸æ4êÎštê_I%ã_áß‡¹ä³9øwqE>#âœÓ†ñtğø¼VO€á>!Ì8r4ñŒ&*r¼v|ğñÕİ¬QÅQÂ`é{:˜¯¬Qù‡Çºşjúo‡><ü/øƒğÄZÅÊØèö?4[]7E×µ\'ŞÉ¤xOâƒ©x‹á_5¡\n™´oxïÄz¥±Yïm-‘=ÀÙêãö˜øíã?„^6¶5¿Ù³Æ?<âËGáoŠ¿üaáÈşßx¶Hã•­¾x«OøÁñŸá?ŒatºWÄ›‹ıí¼Iáİ+TÓ?²¸ÃŸôËÛ3ÃŸ~|Oğ–‘®[XxƒG°×¼3â¿	ø›M´Ö4¹/´mbÚæÂÿ\0OÔ4û«[¡m{k$l®›ãÈãñöãø•âïØ/áŸŠ>şÍ~ı…?c][ã?tO	ü.³ø0ç\\øùñg@½ñ%›âïhÿ\0t„<ğëÄ¿¾Ëâ¿Şxë\\ñÇ	x>ûF‡F“Kñî©¥A¨ÿ\0MæI>-ñ†¨ğM~À®)Ìó|…d¼E”c1X)àó<&q‚Å`142ÉQÆOëÏF%V>•$«M¬3ŠöSşTáÿ\0 7†\nqö\'ÅÌgÃŒƒ…øÉñoqFU—fÔ³>Ì¸_6Ë³¼/ˆ)â²º+\'[,>+%Äâ?Ùi)cı£úÍ?Ä?	xŠßÅŞğÏ‹,ínìí|OáıÄ6¶WÈ±ßZ[ëZu¶¥\r­ähî±İÛÇr°ÜÆ‚L’(f\'÷£ş\rÉĞd´ÿ\0‚V|,ñåÂî~7üfı«~4¾àÛ¥³ñí+ñB\r\nósæ&¡á½#FÔ ‘N×·º„‚Ü»5´Štÿ\0€?²ßÄ­kÃ–òZGà…Wútè\Zâêàë_ØÉáO‡Ú5³HÓ]ÜOu¯İè:\\$´÷RÉ2ŸßLØíÇöıŸ‡ì©ûşÉÿ\0³Œ–ëo¨|ıŸ~øÄ\n6?‹t?é6ş1¿,˜üİOÅ_Û\ZŒŞY1ù·O°íÅ}wÓ7¬×‡\\=‹«F¦e†Ë³ß5t9VÅ}CJ­(;Jjb0Y—³RIò¤·‹?3ı–|1…OÇN9ËpØª?=Èxc‡>¸Ô±0Âeÿ\0Û9¾\'\r‰©*u1TpY¶AíÜ%%í%)]ÆQoëz(¢¿‰õÌ+ùøÿ\0ƒˆş_jß²¿Âÿ\0ÛGÂzd·ş3ı€~-Yü\\ñ\nY@÷:¦£û9xöÀü6ı¤4k(‘X°ğ«£|J»y>X¢øf%Ey’%¯è¹ÿ\0øSÃ~;ğ¯‰¼ã-Oñ\'„<eáıgÂ*ğî­İiz÷†üE§\\é\Zæ‹©Z¿És§êšeåÕäòÍo<‘·k»,ÌqyFe—æØ\n®;,Æáse«¥ŠÁ×†#Q-/ÉVœ%këkGdYgd9ß\rgXxâò~!Ês“5ÂËáÄåÙ®¶A»;*¸jõa{;s_¡ü.êÿ\0n×|?e­xYÓm¼Ac.‡ã_‡¾#šÏL×ô[ohWv~$ğ~«y¦j6z¦âM©ZXlèÚ…†¡¤xÃ×ú6£gy¦ê7òşñÁ/?i„7Â×CğÎ§û>|7Ô<U}§xOâGÁ¯ƒ_ğN_Œ_³N«¥|qGÑu%Ñ|CñsLøµñà7‹ît3^[¹µ?	éM£ëº~¿¥ëÚf³£X\\¿İ\'áŠÿ\0bßÿ\0?àß®ï¯o~Ï‰gÏjÅÍÏÅ/ÙÅ××cáŠaº Ôuo\0ùŸ¼tmbXx“ÂPƒ$ÃQŠi}ŸÃ¼uû>ë:ÿ\0Åÿ\0…<_ğ7\\ƒAi<iâ\n\\è·\Z>·áŸÁw{ÿ\0¿‚üc ø»áï‹cĞ¬¤Ô›GÕ|Eá\rS^ğÅ½æ¦¾Õ4vÔ¯ÇúâW‡ø/¤?ğ¿ˆü!‹À`x‚–YìññõÕ%\\,%Ry†SÅB•YĞÅäù‚Å}RµKaå\n˜ŸkËN½EğûÀs ×‹!øâ~[g‰âm‚¯“a%‹Ì°Ùhaèä¼O”åÕ18zXÜ³Š27—<Ë	C›\n¸|Õ”ñ,VıFx³Æz/ìÇû^ø×âgÅ™àğ×ÁÚ[á¿Á¿é?õY¿„>üYøM®|L¶‡áïÄ½~sŸàâNñG¼øSâ\rf[_\rj>:Òüqá\rSXÓ|UâŸ‡Z7‹~Gÿ\0‚ÚÁ+~\Zÿ\0ÁL¾xKÄš¿Ä$øgãÿ\0Ù¶ßÆ¾8ğWn¤2øKPğv¹§hš§ÄO	ø¦[{]Jm+L×ì| Şiş4ÓôÍv÷Â7ºZjø{ÄzmÖ©¡j_k>0ÿ\0‚¦|lø}u«|bı£5/Ùgöo×-“Gñ7ÄïÚzÛà§ì­áİOÖ¡ûÑ´\rYü.Òi½zğNËy¨|Ó<M5®‹ãd)¾yÓ¿bkßƒŸş\"|/ıŸÿ\0à¥~øàŒ~\n¾ğ‰ì?h?Øöªø=û(|Y‹[ûriÍ?Æ¯?õŸ†Ï¯5Ş¯rú?ˆ<­^ëŞ-k«}_ÿ\0„ÇÂ²Ÿ]e8ŒëÂÎ\"Ëø¯…üBÊò6áluË#Æğ;Åàñô&¹ka³œy,¿w)©FüU\nôİL6&\n•IFìfAÆø¾4†ØøoÇ8Ìã8â3>-Àäü5*4]\'8J¯\ræyÍ>,…ê¨ÓœqYpRUhªê-/³?bŸ‚ş=ø÷à?ö,Ö>øöSıŸôÙûàÅ-gÁ\Z$VZßÄ/ˆ³7í?ÄM/ÃŞğìú7¼_áíRñÍÇÃè¿~%ø“TŸâßÜÏgà\rÄ¾1Ñ> h_ºŸ´Gí#áOZ\ZU²ü@øßã[Kû‚Ÿ\0ü;yo7Ä‹^,l,4İ1·\Z?ƒì¯¥µ—ÇŸµ˜-|ğßÃ¿lñ/Œ53K³y[ù„ğÎ‘ÿ\0Añ×ï<ûTÁV¿eŸ…^\"Ñ´/¿²·‚#øû5ë_ixzÓâWƒ­¾2¿Áï…ßî|ãi~+ñGÂ?\n6ñÂvZ—<=¢ØÅªx#IøA®jºäº•Ÿ„¿²WÅÙ¿Ç\Z¥ßì-ûnxWGøëñ;[­à¯¾|Fıˆş6üOµĞíR6“Âÿ\0mïø]>ø«©<åEw}á\0Ãbò[ÉñÍ¼¹ßğŸ\n¼ğÏÃèñt¸Cû;„ó7â¼oqVaæaÄY·qNq\'S4Ïóî&Í%Ä¹®+Š­ûÊ•³t¡,E|V&n„«W­[ìxÇŒø“S/”xOˆ8·…ÀÎŒçÃõx[\r<®†ÁağØ|¯3Îr)b“‡µ”¡‚J±:TèÒÅU¨©Sşˆtt_Ø¯ö\'øğ£\\ø‘¡h^+ø_ğoáÀ}Çº‡Âoˆ¿|7©xÃÀŸ4ŸK¨Oğ×áÖ­áßëV\ZÅ¿…µK›Kx~U’kX¤ÔMÁÎïù]ø³âß|Kø¢ÖŸ\nô¿€ö¿~j’_éúÇÀÿ\0Ø§QıŠ×Ç´“ñá·Œõ_x_Çş5øƒñ—Äòü0ğæ¯®xEÕ<W«xSB»Ôü]ãqgàıR=#ÃŞ+Ÿß>1şÔÿ\0ğP=JëVøûC|`ı¢~êsèŸjñ€ï>|=ø3«ø—ÃóİO¦Ës¥|\\øUà-é‰}nözµğ;â°ĞäwşÎÔ¯&´¾ûÿ\0 k:·ƒ¾øRÖõ9´¯xÀ^ºÔofHb±Ñü=á¯iï<ŞUµº$pYØXZ•†ÚŞ.4†ÙŠ!ÿ\0D<\0ğX×âOfü?ÉòˆÕÇäpÉóL6kƒ«ÃsÇûK¥	`èĞÊœ*V§J¬ÒÇÑ§SğË	:Uÿ\0É¦¿Ó>×fşøwÃq”qOTÃd¼a[Šxs0á¼×\r”cı…Hä96Q‰©×‹âHT£„Äbkà£Äd˜ªÔpÇ¼Î–+©ğàóşØğP_ØÛöQİõøKÆP~Ùß´TH†kH>~ÎÚÎŸ©xÃºì3éŸ¾<İx@{g`ÓéÚ>¹*[VI?»*üÿ\0‚şÉ¾%ğÁˆ·Æ_]h?nÍCÃŞ5Ñ<9¬Ûù:ÏÂßÙwÂöwvÿ\0³×Ã«˜$tícXÑ5]Oâ—Œá¶6Æã\\ñÅ­†«i£áÜ\'ïİ5øÇÇ?ñüAÏx†Œå,±U[’ÆW\\¹N^5Ek®OÛf¦õ…\\]Hô?¾şŠşÿ\0Ä\rğGƒ¸Nœ8‚Xj™ÿ\0Î›Œ¹øŸ;pÅf]H{•–WKê¹%\ZñÒ¶,£Sy0¢Š+òóú (¢Š\0ühÿ\0‚ÈÁ=¼Kû^ü$ğ¯ÆßÙîÇM·ı´ÿ\0eYu¯ü’êh´ë?‹Ô­áÿ\0…“û8x»PsCÃ¿´›‡†ï¯d/|CÓ|3®E{¥Ø¾¹4ÿ\0ÉGÅ¯ÚÀ2xWQøMñ¶ÏÅ¿²Ÿüaig xá×ímàOˆŸ³åëhZİ¿|?kâ_øDÑî®5?É®i\ZGˆ|1¬êPÛ^]YêĞŠ4Wÿ\0Fêç|Uàÿ\0	xïC½ğÏü/áßxoQUMCÃş*Ñ4Ïèwè‡r-î“«ÚŞX]*·Ì«=»…<€\r~³áïŒ<Oáæ[d8*XLÏ‡¸‚ZyU–2Ÿ³–#,&\'–âğXœ5|¿_\r(Ò©^¬_²¡?eí(ÓšşiñÃèµáï9ÿ\0	ñqˆÍ8ø&¶¶EÄy,2ºÎ¼0XúYŸå¹¶_ÁçYf	â(a*,<¢ñ8ºOèbkR—ğéÅüYÕ×â\r¿ÆXu-Iíæµ¶ñ¯Âßøë^ñâé×hwØY~Ñ¾\'üdı¢|/¥ÊK}«Âß\n>0ü0øiª‹Ÿ‡B†|Í;Â\Z6ƒ©Ïâ\n¾­à¯İ¬«wãëÚ×„|w¨¬é²î=gÆZı‡ˆüAk¨ÆLZÖŸ¯êZ›¯Û¼¶ší¥g<ĞIı:|Iÿ\0‚$ÿ\0Á\'>)ê2ë\"ıƒ?gíY¹y$¸Ö~xZãàn±<²±’IåÕ~\nê\0Ô$¹’@$’åîîÿ\0;H[šü\'ı²¿à—ß±ÏÀêºWÁß\rüoğo<b=öÇı²Á¹º‹å[ÿ\0·‡ˆâ$íUq“ŸÖx[Ç¯2®YT¼ÉèĞ­MÒÅÎa…Îjã Õ¤±³¼¦¦6¬¶§_^1»åjçó?ˆßC¤gñ\r>$‡ÓŠqxÌ5uˆË©WÉs.Ãåu#.hÏƒá.%¡”aê«.jø<£:œ±ŒâÔU¾\\°ğ’Úiš&¥k…õË†½ñƒ|ğûàßÀÏx¿R–I¥¸Õ>\"xösøiğÂ?5%—Ì¶ºø££xÉôgWod«ówfÓÃÑø{D»ğÿ\0„ukïøZé¡¸Ô|e‡®ü\"Õd´s\"İx—à_ôüñUÔJeXu/ü8Ö5-;Í–ãK¾Óïº_3ø?û$ü%ñ±e§x›]ı¡õk+U-æ·—öÀı­áG„¤!6¿àaş±şe`ãw\rÀÇôeğ{ş-ÿ\0ŸÕü/¡x«ÅŸ²«üDÖo£¶º¼o‹¿i_‹šmÌÑÊÓh?~1ø³A‘3Ğ¶ša²FÊH>…O¤„Xlš®K—x•VÀUs”ğ˜º¹MN¤õö³ÅG)Çbh»{:ÜŞÖ’Œ)ÁF<¾-¡/Òs0âšYı18“œáı”)fy^‰qU©P¤¢–\\M“åÑÃMEûl\'³x\\D¥RxŠ5eV«—ó3ñ_ö©ø x÷áÎ«ñ[ö‡øK¾ğ×Œ¼máˆ¾+|añg‰n´Ÿ_xSQÓ4ßü1ñ÷ÆO÷:,úv¯á;T¶Ò~Yø+Á¶ÖúÖ£§hÓ”i±AöWì_ûøÿ\0ş\nwñïÀ§âÂ?Šşÿ\0‚zü\"ÔtŠŸ5Ï‹Ÿ\r<iğµkŸèú¹¾øsğoÁ>øƒ¢ø[×şÙë\ZT~0ø³â3¤6™­ZéÚG‚-Úm^kèÿ\0®‚_±Ÿì‹û5$+û=~Ëÿ\0³÷Á)a‰¢¿>xÀÚœªêVFºÕ¼9 iúì³)\"yï.ç|Ÿ6GÉ¯¥+òÜãÇÒ§fÂ9_Áœ%™b15±<&?6ÍsK:u1x*Y–cŠ~ÇŠœ$ñzXXsÆ­zjq£Z¥9Ep·Ñ‡hxŸ‘øÓâoç+x™`ğ8\\k™dÜ5Ãy$±9e\Z”2ÌßdYl>·œå´êE`q¸¬Æ·±	ˆ•*˜¼&M±Æ‘\"E$qÆ‹qÆ¡4@@UEPU@\n\0\0\0)ÔQ_‡Ÿ×ÁEPÿÙ','SMA',0,NULL,NULL,NULL,NULL,'2010-03-02 03:07:22',63030,0),(5,'Sekolah Indonesia Membaca','www.indonesiamembaca.net','info@indonesiamembaca.net','Jl. Pendidikan No.1','Jl. Kebersamaan No.1',NULL,NULL,'(022)1234567','(022)1234567','(022)1234567','(022)1234567','(022)1234567','(022)1234567',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿÛ\0C\0ÿÛ\0CÿÀ\0\0Z\0Q\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0şü˜…\'ŒõóĞÏ¨Æp½8â¼KâÇÇ|-„¥ôªëÒÃæZø~ÆX…Ó+gl×’±xìm³$•I?åŒRà×}ñÅ1ø/Á^#ñLª®t]2âî8d %ÅÎÑ¤\r’¹İI8»‹íf¿õı{Sñ.µ¨ëºÅÌ—z§u%İÔò1İæ9,±Ä¤‘0ÆÂ•OÉ„&\0ı;Ã~¥Å˜œF32©RQ—Ô§N¥:2•:ØÌCQ¨è*±´©Q…9BUçª{ğ„yÜ—æ>#qÅ^¡‡ÁåÑ§<×	T…J±ŒéàğéÊ\n¿³iª•jN3Ir\'	NWQåTk?¶O®g\r ø{ÃÚLî‹ß¶j³7ûî“éñçÜp}ºbÿ\0Ãa|\\ÿ\0íÿ\00‹ßÃşbşçò8÷òÏ|ø•ãÛíOøvI´Òåb¼¼¹´Ó­îJŒ“k%ä°ı¡c÷ˆ\n0‘Ší¿á•¾4qÿ\0í‡ÈÃ¢zóÿ\0/¾ß—JıšyG…9då‚ÄC…¨Ö¡\'\n”±˜ì<ñ0’²qªñX™WæOF¦î›iÙŸC5ñG0„1˜yñ5j5â§J®ŒXyÅò´éı[¨ò½\ZtÒ‹O™hÓ7OíƒñlõƒÂØé½zĞ[ÏZ?á°¾-ÿ\0Ïñÿ\0P{î;õşÖÇ`.õ„?eoÅ;aÇıL\Z\'lÿ\0Óï~ş¿BrÙ_ãGı¶>ÿ\0ñPh‡ v?é§#ŸçïR°ş7áf_åÿ\0Oõü7ô\ZÄø¯¥£Æ-şÉ™ùÓêïÎÛ‡öÀø¶AG„zÿ\0 {ĞqÓŒêŒ8úÔWKáÿ\0Û3Åö’â/èº¼\'aÓ¥ºÑæ“†GÔ¢Üİ×+ñu>xß²ÇÆ…ÿ\0Â;dO·ˆ4^øÿ\0§Ğ9ïøı+Ï¼kğ—Çÿ\0íâ»ñF-•Ä‹j÷6·ö+9äC-Íœ³GŒ£‰Lk!»®Òã’xS›Î848b¾\"»å¥KÃSÅJZ5ì^\nÒ›³´`Ûj÷M;\nyÇŠYe7ÄTâJz6•J˜ì\ryáã¢Û«^\ZpŒ,õ“J:»IKoÔß†_<ñBÁ¦Ğ®šßR¶@Ú†‡|ñÇ©YnÂ£RâİÏ<\r$yù\\£ñ^°\n“ÏlúşX9Çç€;v5øqàÿ\0jşñ›âmWŠÿ\0L¹IBâ;‹q•ÎtWO2˜³±–†Ü9Ïí‡‡õ{}DÒu«S˜5m>ÏQ‡qä	:)!\n‡ØÃ8È8ÇøŸˆÜÇaªàjÔ«”æ>×êê·½W\rZ’„§†KŞ¤Tf§F¬½ùÁMMsÁÉşÑáï\ZÏŠğXŠ8ØS§šeşÏÛºK––&KªxˆCìKš.5©Æğ„œ\\,ÒZÙƒõÿ\0\Z*LûìñTWçè§Ìÿ\0µÔößuâb«y­èv·ş(>Ò×F<gËocõ~SòBäd€ ààğI\'HÎ=ÀÈ+_ª?µÏü’ŒäøHôN£\Zäzvş¦¿+¯g è{dàŒóÏ8\'¦O_ê£Â5ZŠNyÆ1É­äãC	ß¢ÑyË¾0ÊO‹)Å»¨åEşÊ•lL¥oV“gîO„4ËM/Ã>°²…`µ³Ñ4¸-¢@R8ì¡U¡\',Äå˜’NâZºF/RFO£Ô=‡\0ãuè+\'DmºŒA\ZV›œçş|áÏ<tpxéÇ9ùö‹øË{áq„<1r-õËËe¸ÔoĞ#Ë§ZH_Ë‚Ü’|›Ë˜òşiBÑBÈñì\nÿ\0xëãGx\rÀœEâOâqË2Ê®0«™gy¾2¬ã‚Ê2ÚujÑ§Sª§7*µaGB–#ˆœ(Pœ—õÏğÖ?‰ñùnG•S¦«U£Nó©xĞÂa(S‡µÄV”c\'\Z4 £²nRötãïJ\'Ñzß<á¶ë¾&Ñ´©OH¯5xePyÏ”_Ì^¼†ÉÇK:/‹ü/â0ÇA×´½_bo\"Æö†D8ŠFÅ‚ç‚YpxÏ9¯Æ™%’âW¸¸y&šB^Yf‘å–G å¥’Fffç$ç9äAôıJÿ\0J¼·Ô4ëË‹+ëiX.í¦hgÑ\0I×(pRÇpùNT‘_ãÎöÄq#âhÔÇx/‘Gƒ¥ˆå–ÄùŒ¸’É/j³*¹|rÌN\"njƒÊp´ª8ª_X¤¤êÃú6§ÑÛ	õ&¨ñ.!æ*ÕJ¸\ZqÁJ­´±…iW…6ôrúÅI%ïrIû§íP‘[NF0‘ÏçÔñ§¼Óã6k©ü.ñÅ­Ü1Ïğî¥pğvÍi¹‚EêUãš(ÙYpAi®àÅ™~\"hòéºÔ‘Ÿèb4¼‘Q\"şÒ³Ú« ±&ÕY7‘\rÒ¢\",§*ª® zgÅ_ù&ş9ÿ\0±[Yÿ\0Ò)Èı:µ	ø£ÂŞ0ğ·ø•ÀøÚ¸¬‡ˆªà±x9Ö§\Zì&:8|n_¡\Z•V0Ë±´ká1t£R¥8Ö£\'J­j.Yÿ\00ñEÈ?·òLÖŒaŠÂáqtkA{ÔªÓ\ZR§V”Ú=*Ô§\Z”ådùd“´“KñHIùã’:Lç8àŸØÙÚîâ÷à÷‚ä¸pï…Å²±$f+[ë¨!Sœ¬(‹ì:p?¸Àÿ\0€~8şd{Ó¿ëÇìÖ3ğoÁüg÷7ı1ÿ\0A+¯_|gÚ¿³üoŠÿ\0WrÙ4œ£ÒŒd÷QÌ•ÿ\0›–7ïÊµ?˜¼mq`”¥“ÕrWÑ¸âğM7æ¹¥év{¶·æ?øº)”Wóı.|Ëû]ÿ\0\n‚qéâ=99ş;“pN~€sÜšü®úÔäàsÀ<Œ÷=}¹ã¯ÕÚëşI\rÇ`<E¡ãÕ®{cƒsü¸5ù_¾ùÈç¯~qØ½\"¿ª|ÿ\0’Bö7Æÿ\0éœ!ü·ãü•±ÿ\0±Nÿ\0Nâ¿¯éºº6?°4qÿ\0P7®æÒŸ_¯N:ñŠü§øÉsquñOÇ\\‡C¯]ÛE¿vVŞ×mµ¶ÍÄ¦Ğ®06\0¿V´5¡h«œgJÓ³Óµœ]†	éÜô<u\"¾	ı¨¾^èş$oiöïq£ë‘Àº¬‘ aªÄ±Û#M™l7°¤l“aÏIQ°J³ƒßµ‡8«‹|Ê³¾Ãb1Ùqåÿ\0‰ğ˜dç*6+,Í2…œÔ„S”¨ex¼mben\\>[VQ¡‡­8¡\0f˜ÔÂã\'N”ó\\—êx\Z•\ZJx¨ÖÂ×Xdİ’zTêr&ıùASø¥şN»ã>¾‡¿¶qÜõã9ÂûäsßÜväSçúã¨àó÷±N\08{²Œrr}È=zã°ã8ÿ\07	9;$ÛÕ÷z+·òWmôZ³ûBê×ékßÈúöa¹¸ƒâÎ—,Ş]î™®ArªX)·Í®—x.a·`[åáJÀWß?Iÿ\0…qãŒÿ\0Ğ­­{ô²“}ûãZùŸöUøw{g-ßõX\Z½´m3B†PÉ$¶²:Ku¨ì I)onY\0–#,‰#.Òÿ\0LüV\0|7ñÆ3ÿ\0\"¾µúYHæGøq_õû.8Š8èãÂïŠ0¸œ\rn.ã¼äø\\%K†È3%‘à2ê“£?z•<Éåu³|2j>Ó˜añ\n)VWşñû4ÀæœKœ¼áV9~H²ÜMjmJ1”)â«WŒf½Ù:X\Z¥›å«Fpoš\r/ÅÃßg©=¿/ÿ\0_s_¯³Yÿ\0‹7àò?çş=ÿ\0âewî?Lı\r~Cöğôäÿ\0WNşõúóû5Œüğ†sş¢ÿ\08ïÿ\0;®ÜœWû)ãwü“ywıhê8şğcşJ<ı‰«ê^\0÷**]ƒÔşŸáE1ÓÌµÀoøT\0Hñ‡Ó î:ã>Ã89êI5ù\\9\'ƒÀ=±ï×yôy\'­~ÊürğÔ¾-øYâİ\"Ö´ßÔtø@Ş÷Kš+ø’% ~òQÀ¸<¬¤ô¯Æ²Jã	R\rÃ•”ôeÆŞy¨;¨<ÅÒ«ÃXìd½¾4«:æ\\Ü˜šiRŸ.ê-Ò«iY9FË[ŸÌ¾2á*ÓâL.IûVWFçf£Ï‡¯]U‡6ÎIU§.Xİ¨É·¥İ}•´=‚t;nú\'#Î@İ‘ÇN¹Í\\¿ÓìuKY¬µH/m.bhn-®bC,l0É$n`GLŒädØ#ó÷á‡íkmáßéÚŒôMKQŸK´‚Ê×TÒä†In-­áÂ·pİÍ”PäY±**±ø¯Nÿ\0†Îø}ÿ\0Bï‹:äşëIöÿ\0¨¦;wóäş-›øeÅr¯À×áùf8:ÓÄÑŸ,pøœ7YÎ\rNI¸ÎzSå©F¬>8T…›Oö·Ä©…ÂWşÛ£ƒ®©Q”©UUéW¡Z0ƒ”[;sS‘œ$âÜT¢ï¢×ñì§à]Zê[­&óZğñ™Ë½­«Çyc’°EuM¡ËF½BŒUÿ\0~Ì>ğíÜ7úö—‰n-Ìoz‹$VI4gr»ÙZ$k1Î\n¬Ò<}š2pk™ÿ\0†Îøz3x°gş™iqÿ\01>ÔÛ;áïı¾,?X´Ÿ\\ÿ\0ĞS·•/ág¯‚>%a¾\\\'O;-ca/ìÅ<ª)N5#ZÔÇK‡¨Jåœ®œ!;J1NÖûéı!+ÔÁ<¾~#×–ÁSiâ*ûwYÅã‹•×ºÛ®ÛºÛº}sm6ğCQ,QÃ$qÆ¡$v¢\"\0B¨\nª\0\0\00pŸÙá[øÜ’|/­u øócœ¤ÀÎFrkÀöÎø{|;âÀ?ë–‘Ô§\ZŸòç¯\'5âß¿jEñÇ‡/<+áMóI³ÔÓÈÕ5\rJhÅëÚŞÚÚgtˆN¨ÑË#ÈÍå–TÀc_Õ™‡Yı©•ÓK_…¡ŒÁÎ¥zÎ…*(P«NrvM\\iÂÑ§N.WåJ)j¿7ÎüCá8åY‹£œañ˜Š˜LD)PÃÆ¬êÖ­R”¡¬\"£NKšs”b£ÌÓmXøäUHä‡#ÜĞŒc>£Ú¿^¿f°Ãàßƒ²Í½ó‚¹S©]Fz‚:NFHùom5äĞÛZÃ%ÅÅÌÉ\r¼¯™4³K/—G9g‘ø@2[…ÆE~Øü8ĞÂ¾	ğ¿‡réZor«¢ğÛ«Şs×o1Ï$¹Ï9ıGÇU(dù>µí«æsÅÆ7³öXl5JrºÆSÅA&º¦¯½¿4ğ[RYÎmŒIû\Ztpò—GS‰¥R¾ÊJiIÅëf›µã~ãqôÿ\0Ğ¿øš)p=ÿ\03ş4WóYıA Ü¸*01òõäscÈ23Á¯ƒ>8~Ìú¥âï‡PÅ4—Ò=Ö£áœÇ›©|É\'»Ò§â8q+¨i,dÂFvÛx‰>óiTmÏä`r8cWÀ%”S¼ÀAÇ ãsrÇ±wÆ:ğ+ŞáŞ$Í¸_ı¡•WŒ\'(*UèU‡´Ãb¨©)ºUéŞ-««Âp:”å¬fµOÀâË8›õÎ“”#\'Rjo“†«ËËÏB¦©]i8N)Íi(ì×áæ³àoø~_+[ğ¶¹¥ÉÊw¥İ b2p³4>[ğ	l‘ÏJÄ:V¤3:ğ`÷³œvÎ?ÕõÀÎ}	8àWëo¯ü{oñ#áş‹ ŞY\'…<N·ã_76PMs£\'†µ«‰íd–ÆàH|Kg4z­ÌÑÇd!KÛ2.÷q>ø‡â}wâ÷Œ|5}c}gà}NßTÓ|«Iáû+[TÖ|\r5¶›âYíµgOíc¬_ßŞMcßîm ğÌ¯rC¨e?[¡ã*4â«pí	ÔIsJ–eRŒ$îµ9àñõÑÕ“ó±ùE°²¨İş¼)»5\Z¹u:³Wi|pÅQƒµ“²¥¬üÈ:^¢üƒ¯yÇcŸ8ç§îòrAõèqÒizò¼<dâÎ~çŸ\0õì	Ïú3Œ>*[ü×µÍFH.>\"k~&—À^´Ğ|9i{öí7T»ñ*ésÛ[-ëÏq£xƒÇÒi÷rı–ÛJ{]-2±æµñ?Äá¯‚^\"KÅğıÖµ©C¦ø÷ÂCJÓÄúÆ½§£è\Z“£Úk\ZeÕµÜzf®ú”º‹¦ßé\"ŸI1k\ZEëÁ¤]Ø^ì¼t«}xnÛşFò]·ÿ\0„ï]~zêeÿ\0BŸıSÿ\0ÃRòÿ\0¨ëúiÓ¥´üçşËÔOM:÷“‹IÁÏ9äFNxÇ¾k£Ğ¾øãÄ’¬:„õİL’ 4:uÂÂ7œk™„6è½Ë4™ ‚9¯Ñ¸>!ø‘ş=Ïá™4»Õøk%¤´½mìóñÇJOK|uì5Á·¼Òe»Ğ’ÎU‰¨é£--î[˜øñ/â‡ˆ|kmáOÄígÿ\0¯‹üQm©Å¡Å¦ØëRø·IÓ¼6tvéjZ$kâ\"òÒÙ‘®­í¬õ{¨İ®¡ã_Ç,\\©Éaø{Nµ½ÉWÌ+b)Åé«§O‡r¶¾ë«é«zPğK\rÇëş\"t®œãCJŒİ­uÏWZ1º²OÙU¶Î6WP|ı›Â7–>1ñÈ·ŸÄì$Ó4H¶Kk¤LK*İİ\\FÍÕúÆÎbØ6å·‡’`¬¿h„UÎÑ·å<öÈõ8Àõÿ\0Dè¨¼˜ezîaÇ8ûİ×§vP1%t#¨!¹ÉôÈì~˜Áøş}Ÿæ|I˜TÌ³Zê­y%\np§gC\rF?\r=+Ë’œ{ÊS©7ïT©9{Çë™C–ğæ~YEÒ¢¥í*No¶\"³V•zõ,œêJËD£N	rÓ„#î“QQyÉïùQ^1ìŸüqÖş7Ú|C±ÒşO«Çf¶ŞÔ£¶‹H†çFÔî-Å=O^Ñoõ‹	!±‡_MÂš%ıÊÜA=¤Z‹ÄöòL†O\ZğŸÄ¿z¨²Ôà¸øÿ\0	uä½Ğü\r®ø@ÚhúV¦ş0›ÄÇ_môÛ½*Ö\r#d­¬YO\råµ¬v×?Ú.—?¦G«~úS‰¿à_ 8 i¥º¾·ßÓMÍ}OÆ¸øu®üCñM¼rø_\\ñ}¿‹<o¤µö¿gà‰ºç‹¼i$ş\ZÑÎŸi«\\è¾\Z´†GY-t_ŞéÑêÇíOg&w†üñ§Yğÿ\0ˆou¯øÃÂúÄøg}¢[j~ñ%µÆıOKğ.£âo´izoÃmb+)oî.õ­\ZûZ’êöóÃW·—3\\h&ßL‘‡éĞê}“#Ø2~¦œzã¶@Ç¶SŠuü«¥¿­Ÿİ÷Ÿ›²|WøüZÎëIğ¿Ä«Û=Äú‹üEky¡hQİ¿Ãû_‡ß	Î£áË×¿ƒÃ«¨\\êº¯ˆ|s©:øJÎë_‹_ĞM¬:DV~m´7Æ/|}ÑüñIğ4~%ŸÃ~*ğVáÏ_Xøz+»ø¾]:ÿ\0Ä:§‹á’}6uº2øv×\\%ÔšöÎßÅ\ZW†tÇ³]rh%ûğuEşMN<tã•†G\nêéÙik®úÿ\0‡¹ù•\'Œh[ïxµôx¤xîßÆ¾]G¹ÑnD\'B=ëUµ¼³ºğe¾‘i£ë“}«LÔu;=wP»‚Úöö`š{Û¤ËËø¯â·í+ı³â}.O\ZøSL×õVñƒü9?„oã¸Ñ´ğ.©qáÏ\rŞGgàí~ú}kVÔl4ûİJÃQÇ»ªÉ£İê:u¬H‹ú½Eæ_Ê·¿åuø|¿?ÎôøñºïZñ,šî‹ñÂñw‰´M[DÕàğî{¨xCÀ:.»}á]~\r!<E©Û]jĞÿ\0Ââ³â15hˆ¼]}£ÙK¦è†k_Cø{ãÿ\0‰w¿à†âÃâ§ğsRÒ%ğN¯ø—ÃÚV–.¼W¡iÖ>\">)Ô-£KY¶¶³øÃóİj\ZÒü;#èš¶7rŞêWÉöm	´öVĞËûDßóîß÷Òÿ\0ñTV¥ÿÙ','yayasan',0,NULL,NULL,NULL,NULL,'2010-03-02 03:07:22',55385,0),(6,'Perpustakaan Umum','','','',NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 70\nÿÛ\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;ÿÛ\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ÿÀ\0\0K\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0öj(¢€\nd²ÇM,®±Æƒ,ìpz“Xş%ñVŸá›d7§º›\"ŞÒ.d˜ûÃÔy¿ªŞëo|K6-Tæ=:|”=·ãovã=+jT\'Wm»œ˜œ]<:\\Ú·²[³²Ôş%ÚïkY¶« 87¼»e?ïã-ÿ\0ë\\Íæ£â-`Ÿí-nX£?òí§şá±o¾:Ç[Éï¢ÙiGo*íŠDB¥9*Àçîàa‡N˜§iú}Õ¬ÂêòåXùln$í=OLßŸjõ(áiFÚsyô>{˜â&šæPòZ¿¼µkdlÉ¤j7º|I‚áŠ±õel†üEoØxïÄ\Za«YÅ«Û³Zàz”?+~W‡ØÉi\rôšĞeH$ !_ª’r1Ç§RÖâY£˜¼smİ€[Ë99!{€ \0~j§BHİÂŞhŠXÊôgÊªßÊIù|ûÃ¡ø›Hñ-&›v²:¬…Yb>Œ‡‘ZµàÑ][^O’<–:”hî·0Ÿ-âPØ=²ùNG$Wu xşkI£Ó¼RQw°êh»böàoº}«Í«†”4u_Öç½†Ì!V\\“\\²íßÑõ;ú)ÈÈ¥®SÑ\n(¢€\nç<]âÈ¼9mñ‹­Rèmm=İıwõè+£¯W’ïÄ\ZİíÓ´·?Ú[ïoá7*Š=\0ã]j>Ú¢‰ÃÅ}Vƒ¨•ŞÈ·[É6«©Ü=Õüÿ\0ë§*Iÿ\0uTtQè;Ôzl’Ü´ÒyñÜ[H}Ca°8R8+Ä{Ôºœ05«\\Oææ.¦\'*Àã¶;ö«Pí0¡FÜ¥A×Ş½øÓQ’ŠÑ#âªVsƒ©-e-Ûı[Â¨Y[I!‚ÒIV\'x€Ş»ÕÆAÉ\0ñĞÖüÓìm5F’#q>Ÿ}‰4ÿ\03y@Äı:÷×Îkœ¹G’ÚDŒâB§aônÇó®æñc¿ÒïuWs§£¨wQ¹£l1/s‰?ñĞ+ÍÌy£%g£=ü‹ÙÎœ¯Ìıu-kZ}¦©â\r.ÒòŞ9£Xn&!ÆzyküÜ~UÅê:\\6Z¥ı­Ìækë‡6ğÈÁ£îb¤œná6ó“ÉÖu;›ùš{e¶Ô¿³¦ûA÷+S9nÌ¬ÓA<ãŸñJ¥¾©c¦Bu¦Ø,kÿ\08Çå\ZşuÉ„æuTbìzYŸ³\ZSœSkk®úåö›î‰Wà?ˆ§Û8<c¥S²ºiWì\Zšoy÷ŒŸ* ÀÁ\'®I÷ëÕ³Y—6Ö÷:Ê$±Ì°î&<WwwQÔğ¯z¤lù£ÿ\0|u\nœÑpËUäoxcÅøVhôİNf—E‘‚Apç-fOEcŞ?Cü=ê\0‚ ÷¯!’4š&ŠDeaEuÿ\0.\'›Â²C,Ï*Z^Ío	s’±«aF{ã¥xøì4i5(ìÏ§Ê1óÄÅÓ©¼z÷ÿ\0‚vQEyç¸ãÒÇöox†Õ†u—Ò*¸şf½†¼»Æß`øƒ$˜ÂjvI >¯*GıòV»02å®¼Ï+7¦çƒ•ºY•–É®´ıNğçÊ°€cóÑø}|ÿ\0\\Õ	x¢T\\€r[Ğßè*şª\\i:²®má‚ï÷r‹¬ˆÙ†ve‡Ü\'$g `ñÿ\0JÓ-­TÜdéöW/ÆĞÈÿ\0{b“ùWe\\LèVÕï·¡æaòúxÜ-7Y+ß×¯õØó[¨o¬£[­2îe-²G@:)c•Îá…Ry¡­¨u˜\"øk¨X8yn#†êâŒnm»Kƒìª®¹\'Û¹º=juMHXCôk9g9ÿ\0’+Eá7òçOz|;á»›İFÍ­ÚşC\nÀë‰®D.Æşì@ä·vİ	æ•Z˜¤¡kÊú[ÌôğØ`êŞìÓ½ü­oÔí`q¢x©\ZûP¸½íKq mÇ˜\0V#¡\'cÔã8â¹]Nõïµëùá†[‡ëb$C<\"^N\0¨={“ØÔú©>‘e«Y0)PÁv“®ôŞØW.;£»Ppßß\r?‡ômFÒßZc§ËÓÌFÙçÌ0ÈÒVş Wjîï»±ÈX,Z\\òJÒâÓèÓ³GN;õ…\Zrø[»·£·âgÜÇqc\"Çk5›±Â‰— a•\'ØOÓ´Ã«j’ÙÃ;Z´±¿÷dF3şÉŞêŞö¯QfÔ,•Š¤öó `AWR285Éø‚îoYIo¦ÛéZ[\\ÈoÌÒŒà°@ª…ÉÉ,;×|±³«Kk¦§¢–§¶R÷RwOµ»œ”2‰àP(`Q‘]ÂèÊø\ZŞsÖêyçüål~€W©Ìºn‰;Æ1äÂV0=q…+Ö<9¦ÿ\0cøoMÓq†¶¶6ÿ\0x(Ïëš×2—Ã¹ÏÓ_¼¨¶Ñ/ëî4è¢ŠòO¥\nâş\'iìú¾µæ]\"o9±ÔÂß,ƒò!¿à5ÚTsCÄA2	\"•J:0á ÓŒœZh™ÁN.2ÙDû¤ˆ<¡Æ\'À 0ät#Û¸®ÇÂ:­›b8šÎ„–ŞßKx—‚ûŠ½½kŠK)tRëÃ×$“ió[;Ë[s÷Ô}Óî*Ô7sé’=å¥ä–÷„a”yH ã£Õí×¢±TÕHn|–,¶¼¨UWÿ\0§ó=iÓI×åº»\";[è£E¸o»ˆ[åcØÃ¦AHÎo¼mâÍ.)^ãìóY’9İ*@,¦v{c½cI?Š¯íŞjM§X¸ÃÍx#·V°wçÛåÏ­R]¬l\'µÓüK¤W1˜Ü]i³Eo.z|îÛsÏQ×Üq^T\\¨ÉN´—céáUÔûŞz~šš…Æ¥jº+ÛE§Y%´R´kËÉ›€¬}²s]~§ªÅ§D:îPE½ªVö‡«t“\\Iâ‹‹£qªø®ÂİÕe´ìÖ…çq¸oØ«‚rPr9¶ÒÙh·zUË[o&å­ä…­e—‰6àßú×&J—7&»½İßvõ5©VjŞë~–;dÿ\0‰†ìíåH ”ÂÒ©eP3µH\'¡î+Ï/f‚îû‰h- 9\rm`mwÊ7)$1,v‚G8êxèjåö±âf°Ôo/-Ø®^#ÄXtáÔsõV¬É;fv+0¦O`ª{x<%Ÿµ›VGÍæ™Ÿ4^ši½î­òù±±şÛñf—¤º(äûm×§—ùAú¾Ñø\Zõúã>hÒÛi³k—±”»ÕHuFÅ\0ÿ\0V¿\\ÇıïjìëƒWÚÕrè{87Õ°ñƒßwêQEsÁEP-ãŸË­ØG}§*VÃ/oª~ôGÙ‡OCŠókİNÜÀÖ—Ë&4€+E}BqüC$c¦yîUĞCqŠx’XÛªº†ğ5ÓG:IÅlÎV–&Q›ÒK¯ùJ/&½“íô3cHdbøÿ\0®ŒÌãè¬µ5`HÜÉè¥=dŠ¹ú°äş5ß]xÂw¾MÍõhÊ?šb¹\rwÂ:6›3%œWP¨=úş.ºiâèÅ[Ùœ²ÌUIs{wù~LÏXv£FXÜå£$‰ú²ÆªşšUˆE1FzÆ0c?XØ?ˆªö:-¤ò–KÆãn›ÿ\0‹®âÇáÏ„Ş–]+ÏsÉóî%Á˜Š\\ £Ê©²¼[Ÿ<«»üÿ\0Ìà¯5‹xî {½FÜyHÑ„ó˜ƒŒ\0¬ÍGlzV¦ƒ Üx·T‡í—è–äK+OGö¶åE+‘’\nô­?BÒ4¬givv˜ï\n‡ó¯×<±O‘Ó‚²;©åÑU•z²æ’ô_€€``RÑEr˜QEÿÙ','P_alls',1,'alls',NULL,NULL,NULL,'2010-03-25 06:22:39',22308,0);
/*!40000 ALTER TABLE `identitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_identitas BEFORE INSERT ON jbsumum.identitas
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_identitas BEFORE UPDATE ON jbsumum.identitas
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_identitas AFTER DELETE ON jbsumum.identitas
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'identitas', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jenispekerjaan`
--

DROP TABLE IF EXISTS `jenispekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenispekerjaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pekerjaan` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pekerjaan`),
  UNIQUE KEY `UX_jenispekerjaan` (`replid`),
  KEY `IX_jenispekerjaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenispekerjaan`
--

LOCK TABLES `jenispekerjaan` WRITE;
/*!40000 ALTER TABLE `jenispekerjaan` DISABLE KEYS */;
INSERT INTO `jenispekerjaan` VALUES (14,'PNS',NULL,NULL,NULL,'2010-03-02 03:07:22',10914,0),(15,'Wiraswasta',NULL,NULL,NULL,'2010-03-02 03:07:22',53173,0);
/*!40000 ALTER TABLE `jenispekerjaan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_jenispekerjaan BEFORE INSERT ON jbsumum.jenispekerjaan
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_jenispekerjaan BEFORE UPDATE ON jbsumum.jenispekerjaan
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_jenispekerjaan AFTER DELETE ON jbsumum.jenispekerjaan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'jenispekerjaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lampiransurat`
--

DROP TABLE IF EXISTS `lampiransurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiransurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengantar` text NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiransurat_departemen` (`departemen`),
  KEY `FK_lampiransurat_petugas` (`petugas`),
  CONSTRAINT `FK_lampiransurat_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_lampiransurat_petugas` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiransurat`
--

LOCK TABLES `lampiransurat` WRITE;
/*!40000 ALTER TABLE `lampiransurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiransurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengantarsurat`
--

DROP TABLE IF EXISTS `pengantarsurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengantarsurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tanggal` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengantar` text NOT NULL,
  `petugas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pengantarsurat_departemen` (`departemen`),
  KEY `FK_pengantarsurat_petugas` (`petugas`),
  CONSTRAINT `FK_pengantarsurat_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pengantarsurat_petugas` FOREIGN KEY (`petugas`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengantarsurat`
--

LOCK TABLES `pengantarsurat` WRITE;
/*!40000 ALTER TABLE `pengantarsurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengantarsurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petasekolah`
--

DROP TABLE IF EXISTS `petasekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petasekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsekolah` int(10) unsigned NOT NULL,
  `idwilayah` int(10) unsigned DEFAULT NULL,
  `koordinat` varchar(100) DEFAULT NULL,
  `gambar` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_peta_wilayah` (`idwilayah`),
  KEY `FK_peta_sekolah` (`idsekolah`),
  KEY `IX_petasekolah_ts` (`ts`,`issync`),
  CONSTRAINT `FK_peta_sekolah` FOREIGN KEY (`idsekolah`) REFERENCES `identitas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_peta_wilayah` FOREIGN KEY (`idwilayah`) REFERENCES `wilayah` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petasekolah`
--

LOCK TABLES `petasekolah` WRITE;
/*!40000 ALTER TABLE `petasekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `petasekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekolah`
--

DROP TABLE IF EXISTS `sekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namasekolah` varchar(45) NOT NULL,
  `gambar` blob,
  `koordinat` text,
  `wilayah` int(10) unsigned NOT NULL,
  `titikpusat` varchar(10) NOT NULL,
  `lokasi` varchar(10) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_sekolah_wilayah` (`wilayah`),
  KEY `IX_sekolah_ts` (`ts`,`issync`),
  CONSTRAINT `FK_sekolah_wilayah` FOREIGN KEY (`wilayah`) REFERENCES `wilayah` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah`
--

LOCK TABLES `sekolah` WRITE;
/*!40000 ALTER TABLE `sekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `sekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suku`
--

DROP TABLE IF EXISTS `suku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suku` varchar(20) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`suku`),
  UNIQUE KEY `UX_suku` (`replid`),
  KEY `IX_suku_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suku`
--

LOCK TABLES `suku` WRITE;
/*!40000 ALTER TABLE `suku` DISABLE KEYS */;
INSERT INTO `suku` VALUES (32,'Jawa',0,NULL,NULL,NULL,'2010-03-02 03:07:22',36536,0),(34,'Minang',0,NULL,NULL,NULL,'2012-07-19 07:27:05',23157,0),(33,'Sunda',0,NULL,NULL,NULL,'2010-03-02 03:07:22',6177,0);
/*!40000 ALTER TABLE `suku` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_suku BEFORE INSERT ON jbsumum.suku
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_suku BEFORE UPDATE ON jbsumum.suku
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_suku AFTER DELETE ON jbsumum.suku
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'suku', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tabledep`
--

DROP TABLE IF EXISTS `tabledep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabledep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `tname` varchar(100) NOT NULL,
  `colname` varchar(100) DEFAULT NULL,
  `deldep` varchar(2) DEFAULT NULL,
  `upddep` varchar(2) DEFAULT NULL,
  `tingkat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `coltype` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_content` (`tname`,`deldep`,`upddep`),
  KEY `IX_tabledep_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabledep`
--

LOCK TABLES `tabledep` WRITE;
/*!40000 ALTER TABLE `tabledep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabledep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tingkatpendidikan`
--

DROP TABLE IF EXISTS `tingkatpendidikan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tingkatpendidikan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pendidikan` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pendidikan`),
  UNIQUE KEY `UX_tingkatpendidikan` (`replid`),
  KEY `IX_tingkatpendidikan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tingkatpendidikan`
--

LOCK TABLES `tingkatpendidikan` WRITE;
/*!40000 ALTER TABLE `tingkatpendidikan` DISABLE KEYS */;
INSERT INTO `tingkatpendidikan` VALUES (25,'D1',NULL,NULL,NULL,'2010-03-02 03:07:22',26946,0),(24,'D3',NULL,NULL,NULL,'2010-03-02 03:07:22',50668,0),(23,'S1',NULL,NULL,NULL,'2010-03-02 03:07:22',41443,0),(22,'S2',NULL,NULL,NULL,'2010-03-02 03:07:22',55209,0),(21,'S3',NULL,NULL,NULL,'2010-03-02 03:07:22',20656,0),(28,'SD',NULL,NULL,NULL,'2010-03-02 03:07:22',3183,0),(26,'SMA',NULL,NULL,NULL,'2010-03-02 03:07:22',19478,0),(27,'SMP',NULL,NULL,NULL,'2010-03-02 03:07:22',22307,0);
/*!40000 ALTER TABLE `tingkatpendidikan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trins_20_tingkatpendidikan BEFORE INSERT ON jbsumum.tingkatpendidikan
FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trupd_20_tingkatpendidikan BEFORE UPDATE ON jbsumum.tingkatpendidikan
FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER fsync_trdel_20_tingkatpendidikan AFTER DELETE ON jbsumum.tingkatpendidikan
FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'tingkatpendidikan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wilayah`
--

DROP TABLE IF EXISTS `wilayah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namawilayah` varchar(45) NOT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `koordinat` text,
  `rootid` int(10) unsigned NOT NULL,
  `titikpusat` varchar(15) DEFAULT NULL,
  `zoom` varchar(30) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_wilayah_provinsi` (`rootid`),
  KEY `IX_wilayah_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayah`
--

LOCK TABLES `wilayah` WRITE;
/*!40000 ALTER TABLE `wilayah` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilayah1`
--

DROP TABLE IF EXISTS `wilayah1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayah1` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namawilayah` varchar(45) NOT NULL,
  `gambar` blob,
  `koordinat` text,
  `rootid` int(10) unsigned NOT NULL,
  `titikpusat` varchar(15) DEFAULT NULL,
  `zoom` varchar(30) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_wilayah_provinsi` (`rootid`),
  KEY `IX_wilayah1_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayah1`
--

LOCK TABLES `wilayah1` WRITE;
/*!40000 ALTER TABLE `wilayah1` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayah1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsuser`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsuser` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsuser`;

--
-- Table structure for table `adminsiswa`
--

DROP TABLE IF EXISTS `adminsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminsiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` varchar(45) NOT NULL DEFAULT '1',
  `haschange` varchar(45) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL DEFAULT '',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminsiswa`
--

LOCK TABLES `adminsiswa` WRITE;
/*!40000 ALTER TABLE `adminsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakakses`
--

DROP TABLE IF EXISTS `hakakses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakakses` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `theme` tinyint(2) unsigned DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakakses_login` (`login`),
  KEY `FK_hakakses_departemen` (`departemen`),
  CONSTRAINT `FK_hakakses_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hakakses_login` FOREIGN KEY (`login`) REFERENCES `login` (`login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakakses`
--

LOCK TABLES `hakakses` WRITE;
/*!40000 ALTER TABLE `hakakses` DISABLE KEYS */;
INSERT INTO `hakakses` VALUES (NULL,NULL,NULL,20,'101','SIMAKA',1,NULL,'',1,'2010-03-05 14:00:05',1,NULL,NULL,NULL),(NULL,NULL,NULL,21,'101','KEUANGAN',1,NULL,'',1,'2010-03-05 14:00:29',1,NULL,NULL,NULL),(NULL,NULL,NULL,22,'101','SIMTAKA',1,NULL,NULL,1,NULL,1,NULL,NULL,NULL),(NULL,NULL,NULL,23,'101','INFOGURU',1,NULL,NULL,1,'2010-04-16 10:01:22',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hakakses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakaksesinfosiswa`
--

DROP TABLE IF EXISTS `hakaksesinfosiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakaksesinfosiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `theme` tinyint(2) unsigned DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakaksesinfosiswa_nis` (`nis`),
  CONSTRAINT `FK_hakaksesinfosiswa_nis` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakaksesinfosiswa`
--

LOCK TABLES `hakaksesinfosiswa` WRITE;
/*!40000 ALTER TABLE `hakaksesinfosiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakaksesinfosiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakakseskeuangan`
--

DROP TABLE IF EXISTS `hakakseskeuangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakakseskeuangan` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakakseskeuangan`
--

LOCK TABLES `hakakseskeuangan` WRITE;
/*!40000 ALTER TABLE `hakakseskeuangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakakseskeuangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakaksessimaka`
--

DROP TABLE IF EXISTS `hakaksessimaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakaksessimaka` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakakses_nip` (`login`),
  KEY `FK_hakakses_modul` (`modul`),
  CONSTRAINT `FK_hakakses_modul` FOREIGN KEY (`modul`) REFERENCES `modul` (`modul`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hakakses_nip` FOREIGN KEY (`login`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakaksessimaka`
--

LOCK TABLES `hakaksessimaka` WRITE;
/*!40000 ALTER TABLE `hakaksessimaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakaksessimaka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord`
--

DROP TABLE IF EXISTS `landlord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landlord` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` varchar(45) NOT NULL DEFAULT '1',
  `haschange` varchar(45) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord`
--

LOCK TABLES `landlord` WRITE;
/*!40000 ALTER TABLE `landlord` DISABLE KEYS */;
INSERT INTO `landlord` VALUES ('GMS2','BD','AT',1,'1','0','5f4dcc3b5aa765d61d8327deb882cf99','2012-09-21 19:49:25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `landlord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_login_nip` (`login`),
  CONSTRAINT `FK_login_nip` FOREIGN KEY (`login`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (NULL,NULL,NULL,7,'101','5f4dcc3b5aa765d61d8327deb882cf99','',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginsiswa`
--

DROP TABLE IF EXISTS `loginsiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginsiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `theme` tinyint(2) NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_loginsiswa_nis` (`login`),
  CONSTRAINT `FK_loginsiswa_nis` FOREIGN KEY (`login`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginsiswa`
--

LOCK TABLES `loginsiswa` WRITE;
/*!40000 ALTER TABLE `loginsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginsiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokasi` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `haschange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lokasi` varchar(45) NOT NULL DEFAULT '',
  `singkatan` varchar(3) NOT NULL DEFAULT '',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokasi`
--

LOCK TABLES `lokasi` WRITE;
/*!40000 ALTER TABLE `lokasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modul` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `haschange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modul` varchar(100) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jbsvcr`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jbsvcr` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jbsvcr`;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `komentar` text NOT NULL,
  `idguru` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_agenda_ts` (`ts`,`issync`),
  KEY `FK_agenda_pegawai` (`idguru`),
  CONSTRAINT `FK_agenda_pegawai` FOREIGN KEY (`idguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angket`
--

DROP TABLE IF EXISTS `angket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglakhir` date NOT NULL DEFAULT '0000-00-00',
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_angket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angket`
--

LOCK TABLES `angket` WRITE;
/*!40000 ALTER TABLE `angket` DISABLE KEYS */;
/*!40000 ALTER TABLE `angket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritaguru`
--

DROP TABLE IF EXISTS `beritaguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idguru` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritaguru_ts` (`ts`,`issync`),
  KEY `FK_beritaguru_pegawai` (`idguru`),
  CONSTRAINT `FK_beritaguru_pegawai` FOREIGN KEY (`idguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritaguru`
--

LOCK TABLES `beritaguru` WRITE;
/*!40000 ALTER TABLE `beritaguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritaguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritasekolah`
--

DROP TABLE IF EXISTS `beritasekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritasekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenisberita` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritasekolah_ts` (`ts`,`issync`),
  KEY `FK_beritasekolah_pegawai` (`idpengirim`),
  CONSTRAINT `FK_beritasekolah_pegawai` FOREIGN KEY (`idpengirim`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritasekolah`
--

LOCK TABLES `beritasekolah` WRITE;
/*!40000 ALTER TABLE `beritasekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritasekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritasiswa`
--

DROP TABLE IF EXISTS `beritasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beritasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `idguru` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritasiswa_ts` (`ts`,`issync`),
  KEY `FK_beritasiswa_siswa` (`idpengirim`),
  KEY `FK_beritasiswa_pegawai` (`idguru`),
  CONSTRAINT `FK_beritasiswa_pegawai` FOREIGN KEY (`idguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_beritasiswa_siswa` FOREIGN KEY (`idpengirim`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritasiswa`
--

LOCK TABLES `beritasiswa` WRITE;
/*!40000 ALTER TABLE `beritasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin`
--

DROP TABLE IF EXISTS `buletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tempatbuletin` varchar(50) NOT NULL,
  `tanggalbuletin` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `buletin` text NOT NULL,
  `idpengirim` varchar(20) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `gambar` mediumblob,
  `tanggalinput` datetime DEFAULT NULL,
  `idkategori` int(10) unsigned DEFAULT '0',
  `tampil` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '''0 Null, 1 Situs, 2 Jibas, 3 Situs&Jibas''',
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_1` (`idkategori`),
  KEY `IX_buletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin`
--

LOCK TABLES `buletin` WRITE;
/*!40000 ALTER TABLE `buletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin_cmt`
--

DROP TABLE IF EXISTS `buletin_cmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buletin_cmt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idbuletin` int(10) unsigned NOT NULL,
  `tglpost` datetime NOT NULL,
  `idpenilai` varchar(20) NOT NULL,
  `komentar` varchar(100) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_cmt_idbuletin` (`idbuletin`),
  KEY `IX_buletin_cmt_ts` (`ts`,`issync`),
  CONSTRAINT `FK_buletin_cmt_idbuletin` FOREIGN KEY (`idbuletin`) REFERENCES `buletin` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin_cmt`
--

LOCK TABLES `buletin_cmt` WRITE;
/*!40000 ALTER TABLE `buletin_cmt` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin_cmt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin_rate`
--

DROP TABLE IF EXISTS `buletin_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buletin_rate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idbuletin` int(10) unsigned NOT NULL,
  `tglpost` datetime NOT NULL,
  `idpenilai` varchar(20) NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_rate_idbuletin` (`idbuletin`),
  KEY `IX_buletin_rate_ts` (`ts`,`issync`),
  CONSTRAINT `FK_buletin_rate_idbuletin` FOREIGN KEY (`idbuletin`) REFERENCES `buletin` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin_rate`
--

LOCK TABLES `buletin_rate` WRITE;
/*!40000 ALTER TABLE `buletin_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catatankategori`
--

DROP TABLE IF EXISTS `catatankategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catatankategori` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_catatankategori_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catatankategori`
--

LOCK TABLES `catatankategori` WRITE;
/*!40000 ALTER TABLE `catatankategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatankategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catatansiswa`
--

DROP TABLE IF EXISTS `catatansiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catatansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idkategori` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 NOT NULL,
  `idkelas` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_catatansiswa_idkat` (`idkategori`),
  KEY `IX_catatansiswa_ts` (`ts`,`issync`),
  KEY `FK_catatansiswa_siswa` (`nis`),
  KEY `FK_catatansiswa_pegawai` (`nip`),
  CONSTRAINT `FK_catatansiswa_idkat` FOREIGN KEY (`idkategori`) REFERENCES `catatankategori` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_catatansiswa_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_catatansiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catatansiswa`
--

LOCK TABLES `catatansiswa` WRITE;
/*!40000 ALTER TABLE `catatansiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatansiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` varchar(50) NOT NULL,
  `waktukirim` date NOT NULL,
  `pesan` text NOT NULL,
  `chatgroup` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_chat_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dirshare`
--

DROP TABLE IF EXISTS `dirshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dirshare` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idroot` int(10) unsigned NOT NULL,
  `dirname` varchar(255) NOT NULL,
  `dirfullpath` varchar(255) NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_dirshare_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dirshare`
--

LOCK TABLES `dirshare` WRITE;
/*!40000 ALTER TABLE `dirshare` DISABLE KEYS */;
INSERT INTO `dirshare` VALUES (1,'2010-03-02 03:08:16',60772,0,0,'root','root/',NULL,NULL,NULL,NULL,NULL),(2,'2010-03-12 02:49:11',0,0,1,'101','root/101/','101',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dirshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggalpesan` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `idpemilik` varchar(20) NOT NULL,
  `idpengirim` varchar(25) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_draft_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft`
--

LOCK TABLES `draft` WRITE;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileshare`
--

DROP TABLE IF EXISTS `fileshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileshare` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `iddir` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `filetime` datetime NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fileshareguru_1` (`iddir`),
  KEY `IX_fileshare_ts` (`ts`,`issync`),
  CONSTRAINT `FK_fileshareguru_1` FOREIGN KEY (`iddir`) REFERENCES `dirshare` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileshare`
--

LOCK TABLES `fileshare` WRITE;
/*!40000 ALTER TABLE `fileshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galerifoto`
--

DROP TABLE IF EXISTS `galerifoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galerifoto` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `fotokecil` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_galerifoto_nip` (`idguru`),
  KEY `IX_galerifoto_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galerifoto`
--

LOCK TABLES `galerifoto` WRITE;
/*!40000 ALTER TABLE `galerifoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `galerifoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nis` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `fjudul` text NOT NULL,
  `keterangan` varchar(2000) NOT NULL,
  `fprevketerangan` varchar(2000) NOT NULL,
  `fketerangan` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `lastactive` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  `nread` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) NOT NULL,
  `info2` varchar(45) NOT NULL,
  `info3` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_gallery_departemen` (`departemen`),
  KEY `FK_gallery_siswa` (`nis`),
  KEY `FK_gallery_pegawai` (`nip`),
  KEY `IX_gallery` (`tanggal`,`lastactive`,`kategori`),
  CONSTRAINT `FK_gallery_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gallery_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gallery_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallerycomment`
--

DROP TABLE IF EXISTS `gallerycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallerycomment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryid` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(1000) NOT NULL,
  `fkomen` text NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_gallerycomment_siswa` (`nis`),
  KEY `FK_gallerycomment_pegawai` (`nip`),
  KEY `FK_gallerycomment_notes` (`galleryid`),
  CONSTRAINT `FK_gallerycomment_notes` FOREIGN KEY (`galleryid`) REFERENCES `gallery` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gallerycomment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_gallerycomment_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallerycomment`
--

LOCK TABLES `gallerycomment` WRITE;
/*!40000 ALTER TABLE `gallerycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallerycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleryfile`
--

DROP TABLE IF EXISTS `galleryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleryfile` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryid` int(10) unsigned NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `fileinfo` varchar(1000) DEFAULT NULL,
  `ffileinfo` text,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `iscover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_galleryfile_gallery` (`galleryid`),
  CONSTRAINT `FK_galleryfile_gallery` FOREIGN KEY (`galleryid`) REFERENCES `gallery` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleryfile`
--

LOCK TABLES `galleryfile` WRITE;
/*!40000 ALTER TABLE `galleryfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambarbuletin`
--

DROP TABLE IF EXISTS `gambarbuletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambarbuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpengirim` varchar(20) NOT NULL,
  `foto` mediumblob,
  `keterangan` varchar(255) DEFAULT NULL,
  `namafile` varchar(100) NOT NULL,
  `bulan` tinyint(2) unsigned NOT NULL,
  `tahun` int(4) unsigned NOT NULL,
  `filename` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambarbuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambarbuletin`
--

LOCK TABLES `gambarbuletin` WRITE;
/*!40000 ALTER TABLE `gambarbuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambarbuletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambarlogin`
--

DROP TABLE IF EXISTS `gambarlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambarlogin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `direktori` varchar(255) NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `aktif` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambarlogin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambarlogin`
--

LOCK TABLES `gambarlogin` WRITE;
/*!40000 ALTER TABLE `gambarlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambarlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambartiny`
--

DROP TABLE IF EXISTS `gambartiny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambartiny` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `namagambar` varchar(100) DEFAULT NULL,
  `bulan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambartiny_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambartiny`
--

LOCK TABLES `gambartiny` WRITE;
/*!40000 ALTER TABLE `gambartiny` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambartiny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambartinypesan`
--

DROP TABLE IF EXISTS `gambartinypesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambartinypesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `namafile` varchar(255) DEFAULT NULL,
  `direktori` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `namagambar` varchar(100) DEFAULT NULL,
  `bulan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambartinypesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambartinypesan`
--

LOCK TABLES `gambartinypesan` WRITE;
/*!40000 ALTER TABLE `gambartinypesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambartinypesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabanangket`
--

DROP TABLE IF EXISTS `jawabanangket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawabanangket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjawab` int(10) unsigned NOT NULL DEFAULT '0',
  `idpertanyaan` int(10) unsigned NOT NULL DEFAULT '0',
  `idpilihan` int(10) unsigned DEFAULT NULL,
  `isian` text,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jawabanangket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabanangket`
--

LOCK TABLES `jawabanangket` WRITE;
/*!40000 ALTER TABLE `jawabanangket` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabanangket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabangket`
--

DROP TABLE IF EXISTS `jawabangket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawabangket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idangket` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jawabangket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabangket`
--

LOCK TABLES `jawabangket` WRITE;
/*!40000 ALTER TABLE `jawabangket` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabangket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoribuletin`
--

DROP TABLE IF EXISTS `kategoribuletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategoribuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Index_2` (`kategori`),
  KEY `IX_kategoribuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoribuletin`
--

LOCK TABLES `kategoribuletin` WRITE;
/*!40000 ALTER TABLE `kategoribuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategoribuletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `komentar` text,
  `tanggal` datetime NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_komentar_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiranberitaguru`
--

DROP TABLE IF EXISTS `lampiranberitaguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiranberitaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idberita` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranberitaguru_1` (`idberita`),
  KEY `IX_lampiranberitaguru_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampiranberitaguru_1` FOREIGN KEY (`idberita`) REFERENCES `beritaguru` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiranberitaguru`
--

LOCK TABLES `lampiranberitaguru` WRITE;
/*!40000 ALTER TABLE `lampiranberitaguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranberitaguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiranberitasiswa`
--

DROP TABLE IF EXISTS `lampiranberitasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiranberitasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idberita` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranberitasiswa_1` (`idberita`),
  KEY `IX_lampiranberitasiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampiranberitasiswa_1` FOREIGN KEY (`idberita`) REFERENCES `beritasiswa` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiranberitasiswa`
--

LOCK TABLES `lampiranberitasiswa` WRITE;
/*!40000 ALTER TABLE `lampiranberitasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranberitasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampirandraft`
--

DROP TABLE IF EXISTS `lampirandraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampirandraft` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampirandraft_idpesan` (`idpesan`),
  KEY `IX_lampirandraft_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampirandraft_idpesan` FOREIGN KEY (`idpesan`) REFERENCES `draft` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampirandraft`
--

LOCK TABLES `lampirandraft` WRITE;
/*!40000 ALTER TABLE `lampirandraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampirandraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lampiranpesan`
--

DROP TABLE IF EXISTS `lampiranpesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lampiranpesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranpesan_1` (`idpesan`),
  KEY `IX_lampiranpesan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_lampiranpesan_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lampiranpesan`
--

LOCK TABLES `lampiranpesan` WRITE;
/*!40000 ALTER TABLE `lampiranpesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranpesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutiara`
--

DROP TABLE IF EXISTS `mutiara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutiara` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kata` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(20) NOT NULL DEFAULT '',
  `lastname` varchar(25) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_mutiara_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutiara`
--

LOCK TABLES `mutiara` WRITE;
/*!40000 ALTER TABLE `mutiara` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutiara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foto` longblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_new_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nis` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `fjudul` text NOT NULL,
  `kepada` varchar(100) NOT NULL,
  `tema` varchar(7) NOT NULL,
  `pesan` varchar(2000) NOT NULL,
  `fprevpesan` varchar(2000) NOT NULL,
  `fpesan` text NOT NULL,
  `tautan` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `lastactive` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  `nread` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) NOT NULL,
  `info2` varchar(45) NOT NULL,
  `info3` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_notes_siswa` (`nis`),
  KEY `FK_notes_pegawai` (`nip`),
  KEY `FK_notes_departemen` (`departemen`),
  KEY `IX_notes_tanggal` (`lastactive`,`tanggal`,`kategori`) USING BTREE,
  CONSTRAINT `FK_notes_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notes_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notes_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notescomment`
--

DROP TABLE IF EXISTS `notescomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notescomment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notesid` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(1000) NOT NULL,
  `fkomen` text NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_notescomment_siswa` (`nis`),
  KEY `FK_notescomment_pegawai` (`nip`),
  KEY `FK_notescomment_notes` (`notesid`),
  CONSTRAINT `FK_notescomment_notes` FOREIGN KEY (`notesid`) REFERENCES `notes` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notescomment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  CONSTRAINT `FK_notescomment_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notescomment`
--

LOCK TABLES `notescomment` WRITE;
/*!40000 ALTER TABLE `notescomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `notescomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notesfile`
--

DROP TABLE IF EXISTS `notesfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notesfile` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notesid` int(10) unsigned NOT NULL,
  `filecate` varchar(5) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `fileinfo` varchar(1000) DEFAULT NULL,
  `ffileinfo` text,
  `location` varchar(45) NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_notesfile_notes` (`notesid`),
  CONSTRAINT `FK_notesfile_notes` FOREIGN KEY (`notesid`) REFERENCES `notes` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notesfile`
--

LOCK TABLES `notesfile` WRITE;
/*!40000 ALTER TABLE `notesfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `notesfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertanyaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idangket` int(10) unsigned NOT NULL DEFAULT '0',
  `pertanyaan` varchar(1000) NOT NULL DEFAULT '',
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pertanyaan_angket` (`idangket`),
  KEY `IX_pertanyaan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pertanyaan_angket` FOREIGN KEY (`idangket`) REFERENCES `angket` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertanyaan`
--

LOCK TABLES `pertanyaan` WRITE;
/*!40000 ALTER TABLE `pertanyaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertanyaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggalpesan` datetime NOT NULL,
  `tanggaltampil` date DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `keguru` tinyint(1) unsigned DEFAULT '0',
  `kesiswa` tinyint(1) unsigned DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_pesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesan`
--

LOCK TABLES `pesan` WRITE;
/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanterkirim`
--

DROP TABLE IF EXISTS `pesanterkirim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanterkirim` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `idpesan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pesanterkirim_1` (`idpesan`),
  KEY `IX_pesanterkirim_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pesanterkirim_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanterkirim`
--

LOCK TABLES `pesanterkirim` WRITE;
/*!40000 ALTER TABLE `pesanterkirim` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanterkirim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihan`
--

DROP TABLE IF EXISTS `pilihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpertanyaan` int(10) unsigned NOT NULL DEFAULT '0',
  `pilihan` varchar(45) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihan_pertanyaan` (`idpertanyaan`),
  KEY `IX_pilihan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_pilihan_tanya` FOREIGN KEY (`idpertanyaan`) REFERENCES `pertanyaan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihan`
--

LOCK TABLES `pilihan` WRITE;
/*!40000 ALTER TABLE `pilihan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nip` varchar(20) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telpon` varchar(45) DEFAULT NULL,
  `hp` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `hobi` text,
  `buku` text,
  `riwayat` text,
  `foto` mediumblob,
  `tentang` text,
  `nis` varchar(20) DEFAULT NULL,
  `bg` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_profil_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subkategoribuletin`
--

DROP TABLE IF EXISTS `subkategoribuletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subkategoribuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `subkategori` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_subkategoribuletin_1` (`kategori`),
  KEY `IX_subkategoribuletin_ts` (`ts`,`issync`),
  CONSTRAINT `FK_subkategoribuletin_1` FOREIGN KEY (`kategori`) REFERENCES `kategoribuletin` (`kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subkategoribuletin`
--

LOCK TABLES `subkategoribuletin` WRITE;
/*!40000 ALTER TABLE `subkategoribuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `subkategoribuletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tujuanpesan`
--

DROP TABLE IF EXISTS `tujuanpesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tujuanpesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `idpenerima` varchar(20) NOT NULL,
  `baru` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tujuanpesan_1` (`idpesan`),
  KEY `IX_tujuanpesan_ts` (`ts`,`issync`),
  CONSTRAINT `FK_tujuanpesan_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tujuanpesan`
--

LOCK TABLES `tujuanpesan` WRITE;
/*!40000 ALTER TABLE `tujuanpesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tujuanpesan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nis` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `fjudul` text NOT NULL,
  `keterangan` varchar(2000) NOT NULL,
  `fprevketerangan` varchar(2000) NOT NULL,
  `fketerangan` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `filetype` varchar(45) NOT NULL,
  `fileinfo` varchar(1000) DEFAULT NULL,
  `ffileinfo` text,
  `location` varchar(45) NOT NULL,
  `lastactive` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  `nread` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(45) NOT NULL,
  `info2` varchar(45) NOT NULL,
  `info3` varchar(45) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_video_departemen` (`departemen`),
  KEY `FK_video_siswa` (`nis`),
  KEY `FK_video_pegawai` (`nip`),
  KEY `IX_video` (`kategori`,`tanggal`,`lastactive`),
  CONSTRAINT `FK_video_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_video_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_video_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocomment`
--

DROP TABLE IF EXISTS `videocomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videocomment` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `videoid` int(10) unsigned NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `nip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  `komen` varchar(1000) NOT NULL,
  `fkomen` text NOT NULL,
  `info1` varchar(45) DEFAULT NULL,
  `info2` varchar(45) DEFAULT NULL,
  `info3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_videocomment_video` (`videoid`),
  KEY `FK_videocomment_siswa` (`nis`),
  KEY `FK_videocomment_pegawai` (`nip`),
  CONSTRAINT `FK_videocomment_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_videocomment_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_videocomment_video` FOREIGN KEY (`videoid`) REFERENCES `video` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocomment`
--

LOCK TABLES `videocomment` WRITE;
/*!40000 ALTER TABLE `videocomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocomment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31  9:02:12
