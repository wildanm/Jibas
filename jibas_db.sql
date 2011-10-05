-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.33-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema jbsakad
--

CREATE DATABASE IF NOT EXISTS jbsakad;
USE jbsakad;

--
-- Definition of table `aktivitaskalender`
--

DROP TABLE IF EXISTS `aktivitaskalender`;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aktivitaskalender`
--

/*!40000 ALTER TABLE `aktivitaskalender` DISABLE KEYS */;
/*!40000 ALTER TABLE `aktivitaskalender` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_aktivitaskalender_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_aktivitaskalender_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_aktivitaskalender_100` BEFORE INSERT ON `aktivitaskalender` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_aktivitaskalender_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_aktivitaskalender_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_aktivitaskalender_100` BEFORE UPDATE ON `aktivitaskalender` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_aktivitaskalender_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_aktivitaskalender_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_aktivitaskalender_100` AFTER DELETE ON `aktivitaskalender` FOR EACH ROW BEGIN
   IF @DISABLE_TRIGER IS NULL THEN
      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aktivitaskalender', dataid = OLD.replid, datatoken = OLD.token;
   END IF;
 END $$

DELIMITER ;

--
-- Definition of table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
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

--
-- Dumping data for table `alumni`
--

/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;


--
-- Definition of table `angkatan`
--

DROP TABLE IF EXISTS `angkatan`;
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

--
-- Dumping data for table `angkatan`
--

/*!40000 ALTER TABLE `angkatan` DISABLE KEYS */;
INSERT INTO `angkatan` (`replid`,`angkatan`,`departemen`,`aktif`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (19,'2008','SMA',1,'Sekedar contoh. Nama angkatan siswa yang ada di departemen sekolah. Biasanya angkatan ini bersesuaian dengan tahun penerimaan siswa baru. Ubah atau tambahkan data ini sesuai dengan nama angkatan siswa di sekolah.',NULL,NULL,NULL,'2010-03-02 10:06:17',11596,0);
/*!40000 ALTER TABLE `angkatan` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_angkatan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_angkatan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_angkatan_100` BEFORE INSERT ON `angkatan` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_angkatan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_angkatan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_angkatan_100` BEFORE UPDATE ON `angkatan` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_angkatan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_angkatan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_angkatan_100` AFTER DELETE ON `angkatan` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'angkatan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `asalsekolah`
--

DROP TABLE IF EXISTS `asalsekolah`;
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

--
-- Dumping data for table `asalsekolah`
--

/*!40000 ALTER TABLE `asalsekolah` DISABLE KEYS */;
INSERT INTO `asalsekolah` (`replid`,`departemen`,`sekolah`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (31,'SDN','SDN Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 10:06:17',29807,0),
 (30,'SMAN','SMAN Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 10:06:17',48716,0),
 (21,'SMPN','SMP Indonesia Membaca',NULL,NULL,NULL,NULL,'2010-03-02 10:06:17',23099,0);
/*!40000 ALTER TABLE `asalsekolah` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_asalsekolah_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_asalsekolah_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_asalsekolah_100` BEFORE INSERT ON `asalsekolah` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_asalsekolah_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_asalsekolah_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_asalsekolah_100` BEFORE UPDATE ON `asalsekolah` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.sekolah <> OLD.sekolah THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'asalsekolah', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.sekolah, oldpk = OLD.sekolah;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_asalsekolah_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_asalsekolah_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_asalsekolah_100` AFTER DELETE ON `asalsekolah` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'asalsekolah', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `aturangrading`
--

DROP TABLE IF EXISTS `aturangrading`;
CREATE TABLE `aturangrading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(20) NOT NULL,
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

--
-- Dumping data for table `aturangrading`
--

/*!40000 ALTER TABLE `aturangrading` DISABLE KEYS */;
INSERT INTO `aturangrading` (`replid`,`nipguru`,`idtingkat`,`idpelajaran`,`dasarpenilaian`,`nmin`,`nmax`,`grade`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (207,'101',26,45,'Praktik','75.0','100.0','A',NULL,NULL,NULL,'2010-03-02 10:06:17',34878,0),
 (208,'101',26,45,'Praktik','60.0','74.9','B',NULL,NULL,NULL,'2010-03-02 10:06:17',39560,0),
 (209,'101',26,45,'Praktik','50.0','59.9','C',NULL,NULL,NULL,'2010-03-02 10:06:17',27637,0),
 (210,'101',26,45,'Praktik','40.0','49.9','D',NULL,NULL,NULL,'2010-03-02 10:06:17',19503,0),
 (211,'101',26,45,'Praktik','0.0','39.9','E',NULL,NULL,NULL,'2010-03-02 10:06:17',14603,0),
 (217,'101',27,45,'Pemahaman Konsep','75.0','100.0','A',NULL,NULL,NULL,'2010-03-02 10:06:17',14507,0),
 (218,'101',27,45,'Pemahaman Konsep','60.0','74.9','B',NULL,NULL,NULL,'2010-03-02 10:06:17',28724,0),
 (219,'101',27,45,'Pemahaman Konsep','50.0','59.9','C',NULL,NULL,NULL,'2010-03-02 10:06:17',34571,0),
 (220,'101',27,45,'Pemahaman Konsep','40.0','49.9','D',NULL,NULL,NULL,'2010-03-02 10:06:17',21151,0),
 (221,'101',27,45,'Pemahaman Konsep','0.0','39.9','E',NULL,NULL,NULL,'2010-03-02 10:06:17',2041,0),
 (222,'101',27,45,'Praktik','70.0','100.0','A',NULL,NULL,NULL,'2010-03-02 10:06:17',12283,0),
 (223,'101',27,45,'Praktik','50.0','69.9','B',NULL,NULL,NULL,'2010-03-02 10:06:17',55290,0),
 (224,'101',27,45,'Praktik','40.0','49.9','C',NULL,NULL,NULL,'2010-03-02 10:06:17',43011,0),
 (225,'101',27,45,'Praktik','30.0','39.9','D',NULL,NULL,NULL,'2010-03-02 10:06:17',49186,0),
 (226,'101',27,45,'Praktik','0.0','29.9','E',NULL,NULL,NULL,'2010-03-02 10:06:17',51364,0),
 (227,'101',28,45,'Pemahaman Konsep','75.0','100.0','A',NULL,NULL,NULL,'2010-03-02 10:06:17',43731,0),
 (228,'101',28,45,'Pemahaman Konsep','60.0','74.9','B',NULL,NULL,NULL,'2010-03-02 10:06:17',64565,0),
 (229,'101',28,45,'Pemahaman Konsep','50.0','59.9','C',NULL,NULL,NULL,'2010-03-02 10:06:17',60569,0),
 (230,'101',28,45,'Pemahaman Konsep','40.0','49.9','D',NULL,NULL,NULL,'2010-03-02 10:06:17',43622,0),
 (231,'101',28,45,'Pemahaman Konsep','0.0','39.9','E',NULL,NULL,NULL,'2010-03-02 10:06:17',36402,0),
 (242,'101',28,45,'Praktik','70.0','100.0','A',NULL,NULL,NULL,'2010-03-02 10:06:17',51145,0),
 (243,'101',28,45,'Praktik','50.0','69.9','B',NULL,NULL,NULL,'2010-03-02 10:06:17',15456,0),
 (244,'101',28,45,'Praktik','40.0','49.9','C',NULL,NULL,NULL,'2010-03-02 10:06:17',54904,0),
 (245,'101',28,45,'Praktik','30.0','39.9','D',NULL,NULL,NULL,'2010-03-02 10:06:17',31562,0),
 (246,'101',28,45,'Praktik','0.0','29.9','E',NULL,NULL,NULL,'2010-03-02 10:06:17',58628,0),
 (252,'101',26,45,'Pemahaman Konsep','75.0','100.0','A',NULL,NULL,NULL,'2010-03-02 10:06:17',1865,0),
 (253,'101',26,45,'Pemahaman Konsep','60.0','74.9','B',NULL,NULL,NULL,'2010-03-02 10:06:17',30031,0),
 (254,'101',26,45,'Pemahaman Konsep','50.0','59.9','C',NULL,NULL,NULL,'2010-03-02 10:06:17',13500,0),
 (255,'101',26,45,'Pemahaman Konsep','40.0','49.9','D',NULL,NULL,NULL,'2010-03-02 10:06:17',42936,0),
 (256,'101',26,45,'Pemahaman Konsep','0.0','39.9','E',NULL,NULL,NULL,'2010-03-02 10:06:17',43118,0);
/*!40000 ALTER TABLE `aturangrading` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_aturangrading_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_aturangrading_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_aturangrading_100` BEFORE INSERT ON `aturangrading` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_aturangrading_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_aturangrading_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_aturangrading_100` BEFORE UPDATE ON `aturangrading` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_aturangrading_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_aturangrading_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_aturangrading_100` AFTER DELETE ON `aturangrading` FOR EACH ROW BEGIN
   IF @DISABLE_TRIGER IS NULL THEN
      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aturangrading', dataid = OLD.replid, datatoken = OLD.token;
   END IF;
 END $$

DELIMITER ;

--
-- Definition of table `aturannhb`
--

DROP TABLE IF EXISTS `aturannhb`;
CREATE TABLE `aturannhb` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(20) NOT NULL,
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

--
-- Dumping data for table `aturannhb`
--

/*!40000 ALTER TABLE `aturannhb` DISABLE KEYS */;
INSERT INTO `aturannhb` (`replid`,`nipguru`,`idtingkat`,`idpelajaran`,`dasarpenilaian`,`idjenisujian`,`bobot`,`aktif`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (203,'101',26,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 10:06:17',42437,0),
 (214,'101',27,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 10:06:17',55114,0),
 (222,'101',28,45,'Pemahaman Konsep',108,10,1,NULL,NULL,NULL,NULL,'2010-03-02 10:06:17',5132,0);
/*!40000 ALTER TABLE `aturannhb` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_aturannhb_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_aturannhb_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_aturannhb_100` BEFORE INSERT ON `aturannhb` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_aturannhb_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_aturannhb_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_aturannhb_100` BEFORE UPDATE ON `aturannhb` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_aturannhb_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_aturannhb_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_aturannhb_100` AFTER DELETE ON `aturannhb` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aturannhb', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `auditnilai`
--

DROP TABLE IF EXISTS `auditnilai`;
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

--
-- Dumping data for table `auditnilai`
--

/*!40000 ALTER TABLE `auditnilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditnilai` ENABLE KEYS */;


--
-- Definition of table `bobotnau`
--

DROP TABLE IF EXISTS `bobotnau`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bobotnau`
--

/*!40000 ALTER TABLE `bobotnau` DISABLE KEYS */;
/*!40000 ALTER TABLE `bobotnau` ENABLE KEYS */;


--
-- Definition of table `calonsiswa`
--

DROP TABLE IF EXISTS `calonsiswa`;
CREATE TABLE `calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `suku` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `kondisi` varchar(100) NOT NULL,
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` blob,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(255) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `namaayah` varchar(100) DEFAULT NULL,
  `namaibu` varchar(100) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(100) DEFAULT NULL,
  `pekerjaanibu` varchar(100) DEFAULT NULL,
  `wali` varchar(100) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `replidsiswa` int(10) unsigned DEFAULT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `sum1` decimal(10,0) NOT NULL DEFAULT '0',
  `sum2` decimal(10,0) NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian4` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian5` decimal(5,2) NOT NULL DEFAULT '0.00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
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

DROP TABLE IF EXISTS `jbsakad`.`settingpsb`;
CREATE TABLE  `jbsakad`.`settingpsb` (
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

--
-- Dumping data for table `calonsiswa`
--

/*!40000 ALTER TABLE `calonsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `calonsiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_calonsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_calonsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_calonsiswa_100` BEFORE INSERT ON `calonsiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_calonsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_calonsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_calonsiswa_100` BEFORE UPDATE ON `calonsiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.nopendaftaran <> OLD.nopendaftaran THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'calonsiswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.nopendaftaran, oldpk = OLD.nopendaftaran;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_calonsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_calonsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_calonsiswa_100` AFTER DELETE ON `calonsiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'calonsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `dasarpenilaian`
--

DROP TABLE IF EXISTS `dasarpenilaian`;
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

--
-- Dumping data for table `dasarpenilaian`
--

/*!40000 ALTER TABLE `dasarpenilaian` DISABLE KEYS */;
INSERT INTO `dasarpenilaian` (`replid`,`dasarpenilaian`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (3,'PKON','Pemahaman Konsep',NULL,NULL,NULL,'2010-03-02 10:06:17',50529,0),
 (4,'PRAK','Praktik',NULL,NULL,NULL,'2010-03-02 10:06:17',24109,0);
/*!40000 ALTER TABLE `dasarpenilaian` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_dasarpenilaian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_dasarpenilaian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_dasarpenilaian_100` BEFORE INSERT ON `dasarpenilaian` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_dasarpenilaian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_dasarpenilaian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_dasarpenilaian_100` BEFORE UPDATE ON `dasarpenilaian` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.dasarpenilaian <> OLD.dasarpenilaian THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'dasarpenilaian', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.dasarpenilaian, oldpk = OLD.dasarpenilaian;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_dasarpenilaian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_dasarpenilaian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_dasarpenilaian_100` AFTER DELETE ON `dasarpenilaian` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'dasarpenilaian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `deleteddata`
--

DROP TABLE IF EXISTS `deleteddata`;
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

--
-- Dumping data for table `deleteddata`
--

/*!40000 ALTER TABLE `deleteddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteddata` ENABLE KEYS */;


--
-- Definition of table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nipkepsek` varchar(20) NOT NULL,
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

--
-- Dumping data for table `departemen`
--

/*!40000 ALTER TABLE `departemen` DISABLE KEYS */;
INSERT INTO `departemen` (`replid`,`departemen`,`nipkepsek`,`urutan`,`keterangan`,`aktif`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (11,'SMA','101',1,'Sekedar contoh. Menu ini mengatur departemen-departemen yang ada di sekolah. Ubah atau tambahkan data ini sesuai dengan departemen yang ada di sekolah anda.',1,NULL,NULL,NULL,'2010-03-02 10:06:17',34486,0);
/*!40000 ALTER TABLE `departemen` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_departemen_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_departemen_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_departemen_100` BEFORE INSERT ON `departemen` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_departemen_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_departemen_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_departemen_100` BEFORE UPDATE ON `departemen` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.departemen <> OLD.departemen THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'departemen', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.departemen, oldpk = OLD.departemen;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_departemen_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_departemen_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_departemen_100` AFTER DELETE ON `departemen` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'departemen', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `guru`
--

DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
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

--
-- Dumping data for table `guru`
--

/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` (`replid`,`nip`,`idpelajaran`,`statusguru`,`aktif`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (44,'101',45,'Guru Pelajaran',1,'',NULL,NULL,NULL,'2010-03-02 10:06:17',34572,0);
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_guru_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_guru_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_guru_100` BEFORE INSERT ON `guru` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_guru_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_guru_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_guru_100` BEFORE UPDATE ON `guru` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_guru_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_guru_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_guru_100` AFTER DELETE ON `guru` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'guru', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `infobobotnau`
--

DROP TABLE IF EXISTS `infobobotnau`;
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

--
-- Dumping data for table `infobobotnau`
--

/*!40000 ALTER TABLE `infobobotnau` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobobotnau` ENABLE KEYS */;


--
-- Definition of table `infobobotujian`
--

DROP TABLE IF EXISTS `infobobotujian`;
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

--
-- Dumping data for table `infobobotujian`
--

/*!40000 ALTER TABLE `infobobotujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `infobobotujian` ENABLE KEYS */;


--
-- Definition of table `infojadwal`
--

DROP TABLE IF EXISTS `infojadwal`;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `infojadwal`
--

/*!40000 ALTER TABLE `infojadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `infojadwal` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_infojadwal_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_infojadwal_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_infojadwal_100` BEFORE INSERT ON `infojadwal` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_infojadwal_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_infojadwal_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_infojadwal_100` BEFORE UPDATE ON `infojadwal` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_infojadwal_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_infojadwal_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_infojadwal_100` AFTER DELETE ON `infojadwal` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'infojadwal', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `infonap`
--

DROP TABLE IF EXISTS `infonap`;
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

--
-- Dumping data for table `infonap`
--

/*!40000 ALTER TABLE `infonap` DISABLE KEYS */;
/*!40000 ALTER TABLE `infonap` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_infonap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_infonap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_infonap_100` BEFORE INSERT ON `infonap` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_infonap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_infonap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_infonap_100` BEFORE UPDATE ON `infonap` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_infonap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_infonap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_infonap_100` AFTER DELETE ON `infonap` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'infonap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nipguru` varchar(20) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jadwal`
--

/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_jadwal_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_jadwal_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_jadwal_100` BEFORE INSERT ON `jadwal` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_jadwal_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_jadwal_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_jadwal_100` BEFORE UPDATE ON `jadwal` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_jadwal_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_jadwal_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_jadwal_100` AFTER DELETE ON `jadwal` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jadwal', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `jam`
--

DROP TABLE IF EXISTS `jam`;
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

--
-- Dumping data for table `jam`
--

/*!40000 ALTER TABLE `jam` DISABLE KEYS */;
INSERT INTO `jam` (`replid`,`jamke`,`departemen`,`jam1`,`jam2`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (34,1,'SMA','06:30:00','08:00:00',NULL,NULL,NULL,'2010-03-02 10:06:17',52283,0),
 (35,2,'SMA','08:00:00','09:30:00',NULL,NULL,NULL,'2010-03-02 10:06:17',40376,0),
 (36,3,'SMA','09:30:00','10:00:00',NULL,NULL,NULL,'2010-03-02 10:06:17',45031,0),
 (37,4,'SMA','10:30:00','12:00:00',NULL,NULL,NULL,'2010-03-02 10:06:17',38498,0),
 (38,5,'SMA','12:00:00','13:30:00',NULL,NULL,NULL,'2010-03-02 10:06:17',57397,0),
 (39,6,'SMA','13:30:00','15:00:00',NULL,NULL,NULL,'2010-03-02 10:06:17',40428,0);
/*!40000 ALTER TABLE `jam` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_jam_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_jam_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_jam_100` BEFORE INSERT ON `jam` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_jam_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_jam_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_jam_100` BEFORE UPDATE ON `jam` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_jam_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_jam_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_jam_100` AFTER DELETE ON `jam` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jam', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `jenismutasi`
--

DROP TABLE IF EXISTS `jenismutasi`;
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

--
-- Dumping data for table `jenismutasi`
--

/*!40000 ALTER TABLE `jenismutasi` DISABLE KEYS */;
INSERT INTO `jenismutasi` (`replid`,`jenismutasi`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (2,'Pindah Sekolah','',NULL,NULL,NULL,'2010-03-02 10:06:17',29948,0),
 (3,'Dikeluarkan','Sekedar contoh. Menu ini mengatur jenis-jenis mutasi siswa. Ubah atau tambahkan data ini sesuai dengan jenis-jenis mutasi siswa yang terjadi.',NULL,NULL,NULL,'2010-03-02 10:06:17',28455,0),
 (4,'Mengundurkan Diri','',NULL,NULL,NULL,'2010-03-02 10:06:17',52431,0),
 (5,'Meninggal Dunia','',NULL,NULL,NULL,'2010-03-02 10:06:17',45730,0),
 (6,'Pindah Tempat Tinggal','',NULL,NULL,NULL,'2010-03-02 10:06:17',5828,0);
/*!40000 ALTER TABLE `jenismutasi` ENABLE KEYS */;


--
-- Definition of table `jenisujian`
--

DROP TABLE IF EXISTS `jenisujian`;
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

--
-- Dumping data for table `jenisujian`
--

/*!40000 ALTER TABLE `jenisujian` DISABLE KEYS */;
INSERT INTO `jenisujian` (`replid`,`jenisujian`,`idpelajaran`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (108,'PR',45,'Sekedar contoh. Menu ini mengatur jenis-jenis ujian untuk pengambilan nilai siswa pada setiap pelajaran di sekolah. Ubah atau tambahkan data ini sesuai dengan jenis-jenis ujian yang digunakan di sekolah.','PR',NULL,NULL,'2010-04-16 08:55:23',32036,0);
/*!40000 ALTER TABLE `jenisujian` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_jenisujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_jenisujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_jenisujian_100` BEFORE INSERT ON `jenisujian` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_jenisujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_jenisujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_jenisujian_100` BEFORE UPDATE ON `jenisujian` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_jenisujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_jenisujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_jenisujian_100` AFTER DELETE ON `jenisujian` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jenisujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `kalenderakademik`
--

DROP TABLE IF EXISTS `kalenderakademik`;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kalenderakademik`
--

/*!40000 ALTER TABLE `kalenderakademik` DISABLE KEYS */;
/*!40000 ALTER TABLE `kalenderakademik` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kalenderakademik_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kalenderakademik_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kalenderakademik_100` BEFORE INSERT ON `kalenderakademik` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kalenderakademik_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kalenderakademik_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kalenderakademik_100` BEFORE UPDATE ON `kalenderakademik` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kalenderakademik_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kalenderakademik_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kalenderakademik_100` AFTER DELETE ON `kalenderakademik` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kalenderakademik', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `kejadianpenting`
--

DROP TABLE IF EXISTS `kejadianpenting`;
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

--
-- Dumping data for table `kejadianpenting`
--

/*!40000 ALTER TABLE `kejadianpenting` DISABLE KEYS */;
/*!40000 ALTER TABLE `kejadianpenting` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kejadianpenting_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kejadianpenting_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kejadianpenting_100` BEFORE INSERT ON `kejadianpenting` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kejadianpenting_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kejadianpenting_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kejadianpenting_100` BEFORE UPDATE ON `kejadianpenting` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kejadianpenting_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kejadianpenting_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kejadianpenting_100` AFTER DELETE ON `kejadianpenting` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kejadianpenting', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(50) NOT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `nipwali` varchar(20) NOT NULL,
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

--
-- Dumping data for table `kelas`
--

/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` (`replid`,`kelas`,`idtahunajaran`,`kapasitas`,`nipwali`,`aktif`,`keterangan`,`idtingkat`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (46,'1-A',20,50,'101',1,'Sekedar contoh. Menu ini mengatur setiap nama kelas yang ada di setiap tingkatan di sekolah. Ubah atau tambahkan data ini sesuai dengan nama-nama kelas di sekolah.',26,NULL,NULL,NULL,'2010-03-02 10:06:17',17056,0);
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kelas_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kelas_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kelas_100` BEFORE INSERT ON `kelas` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kelas_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kelas_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kelas_100` BEFORE UPDATE ON `kelas` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kelas_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kelas_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kelas_100` AFTER DELETE ON `kelas` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kelas', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `kelompokcalonsiswa`
--

DROP TABLE IF EXISTS `kelompokcalonsiswa`;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelompokcalonsiswa`
--

/*!40000 ALTER TABLE `kelompokcalonsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokcalonsiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kelompokcalonsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kelompokcalonsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kelompokcalonsiswa_100` BEFORE INSERT ON `kelompokcalonsiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kelompokcalonsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kelompokcalonsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kelompokcalonsiswa_100` BEFORE UPDATE ON `kelompokcalonsiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kelompokcalonsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kelompokcalonsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kelompokcalonsiswa_100` AFTER DELETE ON `kelompokcalonsiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kelompokcalonsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `komennap`
--

DROP TABLE IF EXISTS `komennap`;
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

--
-- Dumping data for table `komennap`
--

/*!40000 ALTER TABLE `komennap` DISABLE KEYS */;
/*!40000 ALTER TABLE `komennap` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_komennap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_komennap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_komennap_100` BEFORE INSERT ON `komennap` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_komennap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_komennap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_komennap_100` BEFORE UPDATE ON `komennap` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_komennap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_komennap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_komennap_100` AFTER DELETE ON `komennap` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'komennap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `kondisisiswa`
--

DROP TABLE IF EXISTS `kondisisiswa`;
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

--
-- Dumping data for table `kondisisiswa`
--

/*!40000 ALTER TABLE `kondisisiswa` DISABLE KEYS */;
INSERT INTO `kondisisiswa` (`replid`,`kondisi`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (8,'Berkecukupan',1,NULL,NULL,NULL,'2010-03-02 10:06:17',30009,0),
 (9,'Kurang Mampu',2,NULL,NULL,NULL,'2010-03-02 10:06:17',54640,0);
/*!40000 ALTER TABLE `kondisisiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kondisisiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kondisisiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kondisisiswa_100` BEFORE INSERT ON `kondisisiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kondisisiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kondisisiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kondisisiswa_100` BEFORE UPDATE ON `kondisisiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.kondisi <> OLD.kondisi THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kondisisiswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.kondisi, oldpk = OLD.kondisi;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kondisisiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kondisisiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kondisisiswa_100` AFTER DELETE ON `kondisisiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kondisisiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `kriteriakejadian`
--

DROP TABLE IF EXISTS `kriteriakejadian`;
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

--
-- Dumping data for table `kriteriakejadian`
--

/*!40000 ALTER TABLE `kriteriakejadian` DISABLE KEYS */;
/*!40000 ALTER TABLE `kriteriakejadian` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kriteriakejadian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kriteriakejadian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kriteriakejadian_100` BEFORE INSERT ON `kriteriakejadian` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kriteriakejadian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kriteriakejadian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kriteriakejadian_100` BEFORE UPDATE ON `kriteriakejadian` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kriteriakejadian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kriteriakejadian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kriteriakejadian_100` AFTER DELETE ON `kriteriakejadian` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kriteriakejadian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `mutasisiswa`
--

DROP TABLE IF EXISTS `mutasisiswa`;
CREATE TABLE `mutasisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(15) NOT NULL DEFAULT '',
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

--
-- Dumping data for table `mutasisiswa`
--

/*!40000 ALTER TABLE `mutasisiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutasisiswa` ENABLE KEYS */;


--
-- Definition of table `nap`
--

DROP TABLE IF EXISTS `nap`;
CREATE TABLE `nap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL DEFAULT '',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiangka` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nilaihuruf` varchar(2) NOT NULL DEFAULT '',
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

--
-- Dumping data for table `nap`
--

/*!40000 ALTER TABLE `nap` DISABLE KEYS */;
/*!40000 ALTER TABLE `nap` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_nap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_nap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_nap_100` BEFORE INSERT ON `nap` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_nap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_nap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_nap_100` BEFORE UPDATE ON `nap` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_nap_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_nap_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_nap_100` AFTER DELETE ON `nap` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `nau`
--

DROP TABLE IF EXISTS `nau`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nau`
--

/*!40000 ALTER TABLE `nau` DISABLE KEYS */;
/*!40000 ALTER TABLE `nau` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_nau_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_nau_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_nau_100` BEFORE INSERT ON `nau` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_nau_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_nau_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_nau_100` BEFORE UPDATE ON `nau` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_nau_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_nau_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_nau_100` AFTER DELETE ON `nau` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nau', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `nilaiujian`
--

DROP TABLE IF EXISTS `nilaiujian`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nilaiujian`
--

/*!40000 ALTER TABLE `nilaiujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `nilaiujian` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_nilaiujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_nilaiujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_nilaiujian_100` BEFORE INSERT ON `nilaiujian` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_nilaiujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_nilaiujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_nilaiujian_100` BEFORE UPDATE ON `nilaiujian` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_nilaiujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_nilaiujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_nilaiujian_100` AFTER DELETE ON `nilaiujian` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nilaiujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `pelajaran`
--

DROP TABLE IF EXISTS `pelajaran`;
CREATE TABLE `pelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
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
  CONSTRAINT `FK_pelajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelajaran`
--

/*!40000 ALTER TABLE `pelajaran` DISABLE KEYS */;
INSERT INTO `pelajaran` (`replid`,`kode`,`nama`,`departemen`,`sifat`,`aktif`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (45,'FIS','Fisika','SMA',1,1,'Sekedar contoh. Menu ini mengatur nama dan kode pelajaran yang diajarkan di sekolah. Ubah atau tambahkan data ini sesuai dengan pelajaran-pelajaran yang ada di sekolah.',NULL,NULL,NULL,'2010-03-02 10:06:17',52115,0);
/*!40000 ALTER TABLE `pelajaran` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_pelajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_pelajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_pelajaran_100` BEFORE INSERT ON `pelajaran` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_pelajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_pelajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_pelajaran_100` BEFORE UPDATE ON `pelajaran` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_pelajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_pelajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_pelajaran_100` AFTER DELETE ON `pelajaran` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'pelajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `phsiswa`
--

DROP TABLE IF EXISTS `phsiswa`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phsiswa`
--

/*!40000 ALTER TABLE `phsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `phsiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_phsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_phsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_phsiswa_100` BEFORE INSERT ON `phsiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_phsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_phsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_phsiswa_100` BEFORE UPDATE ON `phsiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_phsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_phsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_phsiswa_100` AFTER DELETE ON `phsiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'phsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `ppsiswa`
--

DROP TABLE IF EXISTS `ppsiswa`;
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

--
-- Dumping data for table `ppsiswa`
--

/*!40000 ALTER TABLE `ppsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppsiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_ppsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_ppsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_ppsiswa_100` BEFORE INSERT ON `ppsiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `trins_ppsiswa_ppsiswahadir_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_ppsiswa_ppsiswahadir_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_ppsiswa_ppsiswahadir_100` AFTER INSERT ON `ppsiswa` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_ppsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_ppsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_ppsiswa_100` BEFORE UPDATE ON `ppsiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
END $$

DELIMITER ;

--
-- Definition of trigger `trupd_ppsiswa_ppsiswahadir_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_ppsiswa_ppsiswahadir_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_ppsiswa_ppsiswahadir_100` AFTER UPDATE ON `ppsiswa` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `trdel_ppsiswa_ppsiswahadir_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trdel_ppsiswa_ppsiswahadir_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trdel_ppsiswa_ppsiswahadir_100` AFTER DELETE ON `ppsiswa` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of table `ppsiswahadir`
--

DROP TABLE IF EXISTS `ppsiswahadir`;
CREATE TABLE `ppsiswahadir` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `gurupelajaran` varchar(20) NOT NULL,
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

--
-- Dumping data for table `ppsiswahadir`
--

/*!40000 ALTER TABLE `ppsiswahadir` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppsiswahadir` ENABLE KEYS */;


--
-- Definition of table `presensiharian`
--

DROP TABLE IF EXISTS `presensiharian`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `presensiharian`
--

/*!40000 ALTER TABLE `presensiharian` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensiharian` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_presensiharian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_presensiharian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_presensiharian_100` BEFORE INSERT ON `presensiharian` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_presensiharian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_presensiharian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_presensiharian_100` BEFORE UPDATE ON `presensiharian` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_presensiharian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_presensiharian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_presensiharian_100` AFTER DELETE ON `presensiharian` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'presensiharian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `presensipelajaran`
--

DROP TABLE IF EXISTS `presensipelajaran`;
CREATE TABLE `presensipelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `gurupelajaran` varchar(15) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `materi` varchar(1000) NOT NULL DEFAULT '',
  `objektif` varchar(255) DEFAULT NULL,
  `refleksi` varchar(255) DEFAULT NULL,
  `rencana` varchar(255) DEFAULT NULL,
  `keterlambatan` tinyint(4) DEFAULT NULL,
  `jumlahjam` decimal(4,2) NOT NULL DEFAULT '0.00',
  `jenisguru` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
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

--
-- Dumping data for table `presensipelajaran`
--

/*!40000 ALTER TABLE `presensipelajaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensipelajaran` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_presensipelajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_presensipelajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_presensipelajaran_100` BEFORE INSERT ON `presensipelajaran` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_presensipelajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_presensipelajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_presensipelajaran_100` BEFORE UPDATE ON `presensipelajaran` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_presensipelajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_presensipelajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_presensipelajaran_100` AFTER DELETE ON `presensipelajaran` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'presensipelajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `prosespenerimaansiswa`
--

DROP TABLE IF EXISTS `prosespenerimaansiswa`;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prosespenerimaansiswa`
--

/*!40000 ALTER TABLE `prosespenerimaansiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosespenerimaansiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_prosespenerimaansiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_prosespenerimaansiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_prosespenerimaansiswa_100` BEFORE INSERT ON `prosespenerimaansiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_prosespenerimaansiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_prosespenerimaansiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_prosespenerimaansiswa_100` BEFORE UPDATE ON `prosespenerimaansiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_prosespenerimaansiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_prosespenerimaansiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_prosespenerimaansiswa_100` AFTER DELETE ON `prosespenerimaansiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'prosespenerimaansiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `ratauk`
--

DROP TABLE IF EXISTS `ratauk`;
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
  CONSTRAINT `FK_ratauk_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ratauk_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ratauk_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratauk`
--

/*!40000 ALTER TABLE `ratauk` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratauk` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_ratauk_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_ratauk_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_ratauk_100` BEFORE INSERT ON `ratauk` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_ratauk_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_ratauk_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_ratauk_100` BEFORE UPDATE ON `ratauk` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_ratauk_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_ratauk_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_ratauk_100` AFTER DELETE ON `ratauk` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ratauk', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `rataus`
--

DROP TABLE IF EXISTS `rataus`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rataus`
--

/*!40000 ALTER TABLE `rataus` DISABLE KEYS */;
/*!40000 ALTER TABLE `rataus` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_rataus_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_rataus_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_rataus_100` BEFORE INSERT ON `rataus` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_rataus_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_rataus_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_rataus_100` BEFORE UPDATE ON `rataus` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_rataus_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_rataus_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_rataus_100` AFTER DELETE ON `rataus` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'rataus', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `riwayatdeptsiswa`
--

DROP TABLE IF EXISTS `riwayatdeptsiswa`;
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `riwayatdeptsiswa`
--

/*!40000 ALTER TABLE `riwayatdeptsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatdeptsiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_riwayatdeptsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_riwayatdeptsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_riwayatdeptsiswa_100` BEFORE INSERT ON `riwayatdeptsiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_riwayatdeptsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_riwayatdeptsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_riwayatdeptsiswa_100` BEFORE UPDATE ON `riwayatdeptsiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_riwayatdeptsiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_riwayatdeptsiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_riwayatdeptsiswa_100` AFTER DELETE ON `riwayatdeptsiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'riwayatdeptsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `riwayatkelassiswa`
--

DROP TABLE IF EXISTS `riwayatkelassiswa`;
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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `riwayatkelassiswa`
--

/*!40000 ALTER TABLE `riwayatkelassiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayatkelassiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_riwayatkelassiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_riwayatkelassiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_riwayatkelassiswa_100` BEFORE INSERT ON `riwayatkelassiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_riwayatkelassiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_riwayatkelassiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_riwayatkelassiswa_100` BEFORE UPDATE ON `riwayatkelassiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_riwayatkelassiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_riwayatkelassiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_riwayatkelassiswa_100` AFTER DELETE ON `riwayatkelassiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'riwayatkelassiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `rpp`
--

DROP TABLE IF EXISTS `rpp`;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rpp`
--

/*!40000 ALTER TABLE `rpp` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpp` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_rpp_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_rpp_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_rpp_100` BEFORE INSERT ON `rpp` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_rpp_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_rpp_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_rpp_100` BEFORE UPDATE ON `rpp` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_rpp_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_rpp_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_rpp_100` AFTER DELETE ON `rpp` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'rpp', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `semester`
--

DROP TABLE IF EXISTS `semester`;
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

--
-- Dumping data for table `semester`
--

/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` (`replid`,`semester`,`departemen`,`aktif`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (20,'Semester I','SMA',1,'Sekedar contoh. Menu ini mengatur setiap nama  semester yang ada di departemen sekolah. Setiap pergantian semester, pengguna harus mengubah status aktif semester ini. Ubah atau tambahkan data ini sesuai dengan nama semester yang digunakan disekolah anda.',NULL,NULL,NULL,'2010-03-02 10:06:18',6418,0);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_semester_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_semester_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_semester_100` BEFORE INSERT ON `semester` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_semester_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_semester_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_semester_100` BEFORE UPDATE ON `semester` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_semester_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_semester_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_semester_100` AFTER DELETE ON `semester` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'semester', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idangkatan` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `suku` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `kondisi` varchar(100) NOT NULL,
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` mediumblob,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(255) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `namaayah` varchar(100) DEFAULT NULL,
  `namaibu` varchar(100) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(100) DEFAULT NULL,
  `pekerjaanibu` varchar(100) DEFAULT NULL,
  `wali` varchar(100) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `frompsb` tinyint(1) unsigned DEFAULT '0',
  `ketpsb` varchar(255) DEFAULT NULL,
  `statusmutasi` int(10) unsigned DEFAULT NULL,
  `alumni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 bukan alumni, 1 alumni',
  `pinsiswa` varchar(25) NOT NULL,
  `pinortu` varchar(25) NOT NULL,
  `pinortuibu` varchar(25) NOT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
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

--
-- Dumping data for table `siswa`
--

/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_siswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_siswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_siswa_100` BEFORE INSERT ON `siswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_siswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_siswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_siswa_100` BEFORE UPDATE ON `siswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.nis <> OLD.nis THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'siswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.nis, oldpk = OLD.nis;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_siswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_siswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_siswa_100` AFTER DELETE ON `siswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'siswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `statusguru`
--

DROP TABLE IF EXISTS `statusguru`;
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

--
-- Dumping data for table `statusguru`
--

/*!40000 ALTER TABLE `statusguru` DISABLE KEYS */;
INSERT INTO `statusguru` (`replid`,`status`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (8,'Asisten','Sekedar contoh. Menu ini mengatur status setiap guru yang mengajar di sekolah. Ubah atau tambahkan data ini sesuai dengan status guru yang ada di sekolah.',NULL,NULL,NULL,'2010-03-02 10:06:18',11638,0),
 (7,'Guru Honorer','',NULL,NULL,NULL,'2010-03-02 10:06:18',52760,0),
 (6,'Guru Pelajaran','',NULL,NULL,NULL,'2010-03-02 10:06:18',32293,0);
/*!40000 ALTER TABLE `statusguru` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_statusguru_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_statusguru_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_statusguru_100` BEFORE INSERT ON `statusguru` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_statusguru_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_statusguru_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_statusguru_100` BEFORE UPDATE ON `statusguru` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.status <> OLD.status THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statusguru', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.status, oldpk = OLD.status;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_statusguru_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_statusguru_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_statusguru_100` AFTER DELETE ON `statusguru` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statusguru', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `statussiswa`
--

DROP TABLE IF EXISTS `statussiswa`;
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

--
-- Dumping data for table `statussiswa`
--

/*!40000 ALTER TABLE `statussiswa` DISABLE KEYS */;
INSERT INTO `statussiswa` (`replid`,`status`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (7,'Eksklusif',2,NULL,NULL,NULL,'2010-03-02 10:06:18',3185,0),
 (6,'Reguler',1,NULL,NULL,NULL,'2010-03-02 10:06:18',50107,0);
/*!40000 ALTER TABLE `statussiswa` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_statussiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_statussiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_statussiswa_100` BEFORE INSERT ON `statussiswa` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_statussiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_statussiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_statussiswa_100` BEFORE UPDATE ON `statussiswa` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.status <> OLD.status THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statussiswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.status, oldpk = OLD.status;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_statussiswa_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_statussiswa_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_statussiswa_100` AFTER DELETE ON `statussiswa` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statussiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `tahunajaran`
--

DROP TABLE IF EXISTS `tahunajaran`;
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

--
-- Dumping data for table `tahunajaran`
--

/*!40000 ALTER TABLE `tahunajaran` DISABLE KEYS */;
INSERT INTO `tahunajaran` (`replid`,`tahunajaran`,`departemen`,`tglmulai`,`tglakhir`,`aktif`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (20,'2009/2010','SMA','2009-06-01','2010-07-30',1,'Sekedar contoh. Nama tahun ajaran yang berlangsung di departemen sekolah. Ubah atau tambahkan data ini sesuai dengan nama tahun ajaran yang ada di sekolah.',NULL,NULL,NULL,'2010-03-18 09:53:06',44390,0);
/*!40000 ALTER TABLE `tahunajaran` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_tahunajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_tahunajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_tahunajaran_100` BEFORE INSERT ON `tahunajaran` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_tahunajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_tahunajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_tahunajaran_100` BEFORE UPDATE ON `tahunajaran` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_tahunajaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_tahunajaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_tahunajaran_100` AFTER DELETE ON `tahunajaran` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'tahunajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `tingkat`
--

DROP TABLE IF EXISTS `tingkat`;
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

--
-- Dumping data for table `tingkat`
--

/*!40000 ALTER TABLE `tingkat` DISABLE KEYS */;
INSERT INTO `tingkat` (`replid`,`tingkat`,`departemen`,`aktif`,`keterangan`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (26,'10','SMA',1,'Sekedar contoh. Nama tingkatan kelas yang ada di sekolah. Ubah atau tambahkan data ini sesuai dengan nama tingkatan kelas di sekolah.',1,NULL,NULL,NULL,'2010-03-02 10:06:18',6098,0),
 (27,'11','SMA',1,'',2,NULL,NULL,NULL,'2010-03-02 10:06:18',28378,0),
 (28,'12','SMA',1,'',3,NULL,NULL,NULL,'2010-03-02 10:06:18',58064,0);
/*!40000 ALTER TABLE `tingkat` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_tingkat_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_tingkat_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_tingkat_100` BEFORE INSERT ON `tingkat` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_tingkat_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_tingkat_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_tingkat_100` BEFORE UPDATE ON `tingkat` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_tingkat_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_tingkat_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_tingkat_100` AFTER DELETE ON `tingkat` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'tingkat', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ujian`
--

/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_ujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_ujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_ujian_100` BEFORE INSERT ON `ujian` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_ujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_ujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_ujian_100` BEFORE UPDATE ON `ujian` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_ujian_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_ujian_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_ujian_100` AFTER DELETE ON `ujian` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;
--
-- Create schema jbscad
--

CREATE DATABASE IF NOT EXISTS jbscad;
USE jbscad;

--
-- Definition of table `cad01`
--

DROP TABLE IF EXISTS `cad01`;
CREATE TABLE `cad01` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad01_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad01`
--

/*!40000 ALTER TABLE `cad01` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad01` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad01`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad01`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad01` BEFORE INSERT ON `cad01` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad01`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad01`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad01` BEFORE UPDATE ON `cad01` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad01`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad01`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad01` AFTER DELETE ON `cad01` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad01', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad02`
--

DROP TABLE IF EXISTS `cad02`;
CREATE TABLE `cad02` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad02_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad02`
--

/*!40000 ALTER TABLE `cad02` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad02` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad02`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad02`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad02` BEFORE INSERT ON `cad02` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad02`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad02`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad02` BEFORE UPDATE ON `cad02` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad02`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad02`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad02` AFTER DELETE ON `cad02` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad02', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad03`
--

DROP TABLE IF EXISTS `cad03`;
CREATE TABLE `cad03` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad03_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad03`
--

/*!40000 ALTER TABLE `cad03` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad03` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad03`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad03`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad03` BEFORE INSERT ON `cad03` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad03`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad03`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad03` BEFORE UPDATE ON `cad03` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad03`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad03`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad03` AFTER DELETE ON `cad03` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad03', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad04`
--

DROP TABLE IF EXISTS `cad04`;
CREATE TABLE `cad04` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad04_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad04`
--

/*!40000 ALTER TABLE `cad04` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad04` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad04`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad04`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad04` BEFORE INSERT ON `cad04` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad04`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad04`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad04` BEFORE UPDATE ON `cad04` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad04`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad04`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad04` AFTER DELETE ON `cad04` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad04', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad05`
--

DROP TABLE IF EXISTS `cad05`;
CREATE TABLE `cad05` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad05_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad05`
--

/*!40000 ALTER TABLE `cad05` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad05` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad05`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad05`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad05` BEFORE INSERT ON `cad05` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad05`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad05`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad05` BEFORE UPDATE ON `cad05` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad05`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad05`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad05` AFTER DELETE ON `cad05` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad05', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad06`
--

DROP TABLE IF EXISTS `cad06`;
CREATE TABLE `cad06` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad06_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad06`
--

/*!40000 ALTER TABLE `cad06` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad06` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad06`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad06`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad06` BEFORE INSERT ON `cad06` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad06`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad06`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad06` BEFORE UPDATE ON `cad06` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad06`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad06`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad06` AFTER DELETE ON `cad06` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad06', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad07`
--

DROP TABLE IF EXISTS `cad07`;
CREATE TABLE `cad07` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad07_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad07`
--

/*!40000 ALTER TABLE `cad07` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad07` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad07`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad07`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad07` BEFORE INSERT ON `cad07` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad07`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad07`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad07` BEFORE UPDATE ON `cad07` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad07`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad07`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad07` AFTER DELETE ON `cad07` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad07', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad08`
--

DROP TABLE IF EXISTS `cad08`;
CREATE TABLE `cad08` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad08_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad08`
--

/*!40000 ALTER TABLE `cad08` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad08` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad08`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad08`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad08` BEFORE INSERT ON `cad08` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad08`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad08`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad08` BEFORE UPDATE ON `cad08` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad08`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad08`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad08` AFTER DELETE ON `cad08` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad08', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad09`
--

DROP TABLE IF EXISTS `cad09`;
CREATE TABLE `cad09` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad09_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad09`
--

/*!40000 ALTER TABLE `cad09` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad09` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad09`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad09`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad09` BEFORE INSERT ON `cad09` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad09`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad09`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad09` BEFORE UPDATE ON `cad09` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad09`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad09`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad09` AFTER DELETE ON `cad09` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad09', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad10`
--

DROP TABLE IF EXISTS `cad10`;
CREATE TABLE `cad10` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad10_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad10`
--

/*!40000 ALTER TABLE `cad10` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad10` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad10`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad10`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad10` BEFORE INSERT ON `cad10` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad10`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad10`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad10` BEFORE UPDATE ON `cad10` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad10`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad10`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad10` AFTER DELETE ON `cad10` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad10', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad11`
--

DROP TABLE IF EXISTS `cad11`;
CREATE TABLE `cad11` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad11_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad11`
--

/*!40000 ALTER TABLE `cad11` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad11` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad11`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad11`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad11` BEFORE INSERT ON `cad11` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad11`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad11`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad11` BEFORE UPDATE ON `cad11` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad11`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad11`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad11` AFTER DELETE ON `cad11` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad11', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad12`
--

DROP TABLE IF EXISTS `cad12`;
CREATE TABLE `cad12` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad12_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad12`
--

/*!40000 ALTER TABLE `cad12` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad12` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad12`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad12`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad12` BEFORE INSERT ON `cad12` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad12`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad12`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad12` BEFORE UPDATE ON `cad12` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad12`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad12`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad12` AFTER DELETE ON `cad12` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad12', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad13`
--

DROP TABLE IF EXISTS `cad13`;
CREATE TABLE `cad13` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad13_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad13`
--

/*!40000 ALTER TABLE `cad13` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad13` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad13`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad13`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad13` BEFORE INSERT ON `cad13` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad13`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad13`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad13` BEFORE UPDATE ON `cad13` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad13`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad13`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad13` AFTER DELETE ON `cad13` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad13', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `cad14`
--

DROP TABLE IF EXISTS `cad14`;
CREATE TABLE `cad14` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad14_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cad14`
--

/*!40000 ALTER TABLE `cad14` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad14` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_cad14`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_cad14`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_cad14` BEFORE INSERT ON `cad14` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_cad14`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_cad14`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_cad14` BEFORE UPDATE ON `cad14` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_cad14`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_cad14`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_cad14` AFTER DELETE ON `cad14` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad14', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;
--
-- Create schema jbsclient
--

CREATE DATABASE IF NOT EXISTS jbsclient;
USE jbsclient;

--
-- Definition of table `deleteddata`
--

DROP TABLE IF EXISTS `deleteddata`;
CREATE TABLE `deleteddata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `dataid` varchar(50) NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `deleteddata`
--

/*!40000 ALTER TABLE `deleteddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteddata` ENABLE KEYS */;


--
-- Definition of table `exporthistory`
--

DROP TABLE IF EXISTS `exporthistory`;
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

--
-- Dumping data for table `exporthistory`
--

/*!40000 ALTER TABLE `exporthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `exporthistory` ENABLE KEYS */;


--
-- Definition of table `liveupdate`
--

DROP TABLE IF EXISTS `liveupdate`;
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
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `liveupdate`
--

/*!40000 ALTER TABLE `liveupdate` DISABLE KEYS */;


/*!40000 ALTER TABLE `liveupdate` ENABLE KEYS */;


--
-- Definition of table `liveupdateconfig`
--

DROP TABLE IF EXISTS `liveupdateconfig`;
CREATE TABLE `liveupdateconfig` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `liveupdateconfig`
--

/*!40000 ALTER TABLE `liveupdateconfig` DISABLE KEYS */;
INSERT INTO `liveupdateconfig` (`tipe`,`nilai`,`keterangan`) VALUES 
 ('MIN_UPDATE_ID','163','Please Don\'t Change This Value');
/*!40000 ALTER TABLE `liveupdateconfig` ENABLE KEYS */;


--
-- Definition of table `liveupdatefile`
--

DROP TABLE IF EXISTS `liveupdatefile`;
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

--
-- Dumping data for table `liveupdatefile`
--

/*!40000 ALTER TABLE `liveupdatefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveupdatefile` ENABLE KEYS */;


--
-- Definition of table `pkchanges`
--

DROP TABLE IF EXISTS `pkchanges`;
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
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pkchanges`
--

/*!40000 ALTER TABLE `pkchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkchanges` ENABLE KEYS */;


--
-- Definition of table `vcontrol`
--

DROP TABLE IF EXISTS `vcontrol`;
CREATE TABLE `vcontrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c` varchar(5) NOT NULL,
  `v` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vcontrol`
--

/*!40000 ALTER TABLE `vcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcontrol` ENABLE KEYS */;


--
-- Definition of table `version`
--

DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `version` varchar(10) NOT NULL,
  `builddate` datetime NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `version`
--

/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` (`version`,`builddate`) VALUES 
 ('2.5.0','2011-06-15 00:00:00');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;

--
-- Create schema jbsfina
--

CREATE DATABASE IF NOT EXISTS jbsfina;
USE jbsfina;

--
-- Definition of table `auditbesarjtt`
--

DROP TABLE IF EXISTS `auditbesarjtt`;
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

--
-- Dumping data for table `auditbesarjtt`
--

/*!40000 ALTER TABLE `auditbesarjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditbesarjtt` ENABLE KEYS */;


--
-- Definition of table `auditbesarjttcalon`
--

DROP TABLE IF EXISTS `auditbesarjttcalon`;
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

--
-- Dumping data for table `auditbesarjttcalon`
--

/*!40000 ALTER TABLE `auditbesarjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditbesarjttcalon` ENABLE KEYS */;


--
-- Definition of table `auditinfo`
--

DROP TABLE IF EXISTS `auditinfo`;
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

--
-- Dumping data for table `auditinfo`
--

/*!40000 ALTER TABLE `auditinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditinfo` ENABLE KEYS */;


--
-- Definition of table `auditjurnal`
--

DROP TABLE IF EXISTS `auditjurnal`;
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

--
-- Dumping data for table `auditjurnal`
--

/*!40000 ALTER TABLE `auditjurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditjurnal` ENABLE KEYS */;


--
-- Definition of table `auditjurnaldetail`
--

DROP TABLE IF EXISTS `auditjurnaldetail`;
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

--
-- Dumping data for table `auditjurnaldetail`
--

/*!40000 ALTER TABLE `auditjurnaldetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditjurnaldetail` ENABLE KEYS */;


--
-- Definition of table `auditpenerimaaniuran`
--

DROP TABLE IF EXISTS `auditpenerimaaniuran`;
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

--
-- Dumping data for table `auditpenerimaaniuran`
--

/*!40000 ALTER TABLE `auditpenerimaaniuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaaniuran` ENABLE KEYS */;


--
-- Definition of table `auditpenerimaaniurancalon`
--

DROP TABLE IF EXISTS `auditpenerimaaniurancalon`;
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

--
-- Dumping data for table `auditpenerimaaniurancalon`
--

/*!40000 ALTER TABLE `auditpenerimaaniurancalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaaniurancalon` ENABLE KEYS */;


--
-- Definition of table `auditpenerimaanjtt`
--

DROP TABLE IF EXISTS `auditpenerimaanjtt`;
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

--
-- Dumping data for table `auditpenerimaanjtt`
--

/*!40000 ALTER TABLE `auditpenerimaanjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanjtt` ENABLE KEYS */;


--
-- Definition of table `auditpenerimaanjttcalon`
--

DROP TABLE IF EXISTS `auditpenerimaanjttcalon`;
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

--
-- Dumping data for table `auditpenerimaanjttcalon`
--

/*!40000 ALTER TABLE `auditpenerimaanjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanjttcalon` ENABLE KEYS */;


--
-- Definition of table `auditpenerimaanlain`
--

DROP TABLE IF EXISTS `auditpenerimaanlain`;
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

--
-- Dumping data for table `auditpenerimaanlain`
--

/*!40000 ALTER TABLE `auditpenerimaanlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpenerimaanlain` ENABLE KEYS */;


--
-- Definition of table `auditpengeluaran`
--

DROP TABLE IF EXISTS `auditpengeluaran`;
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

--
-- Dumping data for table `auditpengeluaran`
--

/*!40000 ALTER TABLE `auditpengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditpengeluaran` ENABLE KEYS */;


--
-- Definition of table `barang`
--

DROP TABLE IF EXISTS `barang`;
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

--
-- Dumping data for table `barang`
--

/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_barang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_barang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_barang_100` BEFORE INSERT ON `barang` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_barang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_barang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_barang_100` BEFORE UPDATE ON `barang` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_barang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_barang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_barang_100` AFTER DELETE ON `barang` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'barang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `besarjtt`
--

DROP TABLE IF EXISTS `besarjtt`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `besarjtt`
--

/*!40000 ALTER TABLE `besarjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `besarjtt` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_besarjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_besarjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_besarjtt_100` BEFORE INSERT ON `besarjtt` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_besarjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_besarjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_besarjtt_100` BEFORE UPDATE ON `besarjtt` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `trupd_besarjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_besarjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trupd_besarjtt_100` AFTER UPDATE ON `besarjtt` FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF @DISABLE_TRIGGERS IS NULL THEN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_besarjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_besarjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_besarjtt_100` AFTER DELETE ON `besarjtt` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'besarjtt', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `besarjttcalon`
--

DROP TABLE IF EXISTS `besarjttcalon`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `besarjttcalon`
--

/*!40000 ALTER TABLE `besarjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `besarjttcalon` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_besarjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_besarjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_besarjttcalon_100` BEFORE INSERT ON `besarjttcalon` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_besarjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_besarjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_besarjttcalon_100` BEFORE UPDATE ON `besarjttcalon` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `trupd_besarjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_besarjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trupd_besarjttcalon_100` AFTER UPDATE ON `besarjttcalon` FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF @DISABLE_TRIGGERS IS NULL THEN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_besarjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_besarjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_besarjttcalon_100` AFTER DELETE ON `besarjttcalon` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'besarjttcalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `datadsp`
--

DROP TABLE IF EXISTS `datadsp`;
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

--
-- Dumping data for table `datadsp`
--

/*!40000 ALTER TABLE `datadsp` DISABLE KEYS */;
/*!40000 ALTER TABLE `datadsp` ENABLE KEYS */;


--
-- Definition of table `datapenerimaan`
--

DROP TABLE IF EXISTS `datapenerimaan`;
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

--
-- Dumping data for table `datapenerimaan`
--

/*!40000 ALTER TABLE `datapenerimaan` DISABLE KEYS */;
INSERT INTO `datapenerimaan` (`replid`,`nama`,`besar`,`idkategori`,`rekkas`,`rekpendapatan`,`rekpiutang`,`aktif`,`keterangan`,`departemen`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (9,'SPP Bulanan',NULL,'JTT','111','411','150',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA',NULL,NULL,NULL,'2010-03-02 10:06:52',41237,0),
 (11,'Dana Sumbangan Pendidikan',NULL,'CSWJB','111','412','152',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA',NULL,NULL,NULL,'2010-08-03 18:18:36',12756,0),
 (12,'Sumbangan BOS',NULL,'LNN','113','414','152',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA',NULL,NULL,NULL,'2010-03-02 10:06:52',5601,0),
 (13,'Tabungan Siswa',NULL,'SKR','112','413','150',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA',NULL,NULL,NULL,'2010-03-02 10:06:52',55264,0),
 (14,'Sumbangan Pendidikan',NULL,'CSSKR','112','413','152',1,'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.','SMA',NULL,NULL,NULL,'2010-03-02 10:06:52',62929,0);
/*!40000 ALTER TABLE `datapenerimaan` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_datapenerimaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_datapenerimaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_datapenerimaan_100` BEFORE INSERT ON `datapenerimaan` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_datapenerimaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_datapenerimaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_datapenerimaan_100` BEFORE UPDATE ON `datapenerimaan` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_datapenerimaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_datapenerimaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_datapenerimaan_100` AFTER DELETE ON `datapenerimaan` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'datapenerimaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `datapengeluaran`
--

DROP TABLE IF EXISTS `datapengeluaran`;
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

--
-- Dumping data for table `datapengeluaran`
--

/*!40000 ALTER TABLE `datapengeluaran` DISABLE KEYS */;
INSERT INTO `datapengeluaran` (`replid`,`departemen`,`nama`,`rekdebet`,`rekkredit`,`aktif`,`keterangan`,`besar`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (4,'SMA','Bayar Listrik','501','111',1,'Sekedar contoh. Menu ini mengatur setiap jenis pengeluaran yang mungkin dikeluarkan sekolah. Anda harus menentukan rekening Kas dan Beban untuk setiap transaksi pengeluaran.','0',NULL,NULL,NULL,'2010-03-02 10:06:52',17792,0);
/*!40000 ALTER TABLE `datapengeluaran` ENABLE KEYS */;


--
-- Definition of table `groupbarang`
--

DROP TABLE IF EXISTS `groupbarang`;
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

--
-- Dumping data for table `groupbarang`
--

/*!40000 ALTER TABLE `groupbarang` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupbarang` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_groupbarang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_groupbarang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_groupbarang_100` BEFORE INSERT ON `groupbarang` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_groupbarang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_groupbarang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_groupbarang_100` BEFORE UPDATE ON `groupbarang` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_groupbarang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_groupbarang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_groupbarang_100` AFTER DELETE ON `groupbarang` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'groupbarang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `jurnal`
--

DROP TABLE IF EXISTS `jurnal`;
CREATE TABLE `jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
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
  CONSTRAINT `FK_jurnal_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurnal`
--

/*!40000 ALTER TABLE `jurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnal` ENABLE KEYS */;


--
-- Definition of table `jurnaldetail`
--

DROP TABLE IF EXISTS `jurnaldetail`;
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
  CONSTRAINT `FK_jurnaldetail_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurnaldetail`
--

/*!40000 ALTER TABLE `jurnaldetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnaldetail` ENABLE KEYS */;


--
-- Definition of table `kategoripenerimaan`
--

DROP TABLE IF EXISTS `kategoripenerimaan`;
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

--
-- Dumping data for table `kategoripenerimaan`
--

/*!40000 ALTER TABLE `kategoripenerimaan` DISABLE KEYS */;
INSERT INTO `kategoripenerimaan` (`replid`,`kode`,`kategori`,`urutan`,`siswa`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (4,'CSSKR','Iuran Sukarela Calon Siswa',4,1,NULL,NULL,NULL,'2010-03-02 10:06:52',31230,0),
 (3,'CSWJB','Iuran Wajib Calon Siswa',3,1,NULL,NULL,NULL,'2010-03-02 10:06:52',37247,0),
 (1,'JTT','Iuran Wajib Siswa',1,1,NULL,NULL,NULL,'2010-03-02 10:06:52',27011,0),
 (5,'LNN','Penerimaan Lainnya',5,1,NULL,NULL,NULL,'2010-03-02 10:06:52',23315,0),
 (2,'SKR','Iuran Sukarela Siswa',2,1,NULL,NULL,NULL,'2010-03-02 10:06:52',35541,0);
/*!40000 ALTER TABLE `kategoripenerimaan` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kategoripenerimaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kategoripenerimaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kategoripenerimaan_100` BEFORE INSERT ON `kategoripenerimaan` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kategoripenerimaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kategoripenerimaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kategoripenerimaan_100` BEFORE UPDATE ON `kategoripenerimaan` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.kode <> OLD.kode THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kategoripenerimaan', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.kode, oldpk = OLD.kode;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kategoripenerimaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kategoripenerimaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kategoripenerimaan_100` AFTER DELETE ON `kategoripenerimaan` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kategoripenerimaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `katerekakun`
--

DROP TABLE IF EXISTS `katerekakun`;
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

--
-- Dumping data for table `katerekakun`
--

/*!40000 ALTER TABLE `katerekakun` DISABLE KEYS */;
INSERT INTO `katerekakun` (`replid`,`kategori`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (7,'BIAYA',7,NULL,NULL,NULL,'2010-03-02 10:06:52',42231,0),
 (1,'HARTA',1,NULL,NULL,NULL,'2010-03-02 10:06:52',38999,0),
 (3,'INVENTARIS',3,NULL,NULL,NULL,'2010-03-02 10:06:52',2775,0),
 (5,'MODAL',5,NULL,NULL,NULL,'2010-03-02 10:06:52',27935,0),
 (6,'PENDAPATAN',6,NULL,NULL,NULL,'2010-03-02 10:06:52',289,0),
 (2,'PIUTANG',2,NULL,NULL,NULL,'2010-03-02 10:06:52',48701,0),
 (4,'UTANG',4,NULL,NULL,NULL,'2010-03-02 10:06:52',46047,0);
/*!40000 ALTER TABLE `katerekakun` ENABLE KEYS */;


--
-- Definition of table `kelompokbarang`
--

DROP TABLE IF EXISTS `kelompokbarang`;
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

--
-- Dumping data for table `kelompokbarang`
--

/*!40000 ALTER TABLE `kelompokbarang` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelompokbarang` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_kelompokbarang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_kelompokbarang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_kelompokbarang_100` BEFORE INSERT ON `kelompokbarang` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_kelompokbarang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_kelompokbarang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_kelompokbarang_100` BEFORE UPDATE ON `kelompokbarang` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_kelompokbarang_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_kelompokbarang_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_kelompokbarang_100` AFTER DELETE ON `kelompokbarang` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kelompokbarang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `pemohonlain`
--

DROP TABLE IF EXISTS `pemohonlain`;
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

--
-- Dumping data for table `pemohonlain`
--

/*!40000 ALTER TABLE `pemohonlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemohonlain` ENABLE KEYS */;


--
-- Definition of table `penerimaaniuran`
--

DROP TABLE IF EXISTS `penerimaaniuran`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penerimaaniuran`
--

/*!40000 ALTER TABLE `penerimaaniuran` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaaniuran` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_penerimaaniuran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_penerimaaniuran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_penerimaaniuran_100` BEFORE INSERT ON `penerimaaniuran` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `trins_penerimaaniuran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_penerimaaniuran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_penerimaaniuran_100` AFTER INSERT ON `penerimaaniuran` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_penerimaaniuran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_penerimaaniuran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_penerimaaniuran_100` BEFORE UPDATE ON `penerimaaniuran` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `trupd_penerimaaniuran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_penerimaaniuran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaaniuran_100` AFTER UPDATE ON `penerimaaniuran` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_penerimaaniuran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_penerimaaniuran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_penerimaaniuran_100` AFTER DELETE ON `penerimaaniuran` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaaniuran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `penerimaaniurancalon`
--

DROP TABLE IF EXISTS `penerimaaniurancalon`;
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

--
-- Dumping data for table `penerimaaniurancalon`
--

/*!40000 ALTER TABLE `penerimaaniurancalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaaniurancalon` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_penerimaaniurancalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_penerimaaniurancalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_penerimaaniurancalon_100` BEFORE INSERT ON `penerimaaniurancalon` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `trins_penerimaaniurancalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_penerimaaniurancalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_penerimaaniurancalon_100` AFTER INSERT ON `penerimaaniurancalon` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_penerimaaniurancalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_penerimaaniurancalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_penerimaaniurancalon_100` BEFORE UPDATE ON `penerimaaniurancalon` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `trupd_penerimaaniurancalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_penerimaaniurancalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaaniurancalon_100` AFTER UPDATE ON `penerimaaniurancalon` FOR EACH ROW BEGIN
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
    		
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_penerimaaniurancalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_penerimaaniurancalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_penerimaaniurancalon_100` AFTER DELETE ON `penerimaaniurancalon` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaaniurancalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `penerimaanjtt`
--

DROP TABLE IF EXISTS `penerimaanjtt`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penerimaanjtt`
--

/*!40000 ALTER TABLE `penerimaanjtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanjtt` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_penerimaanjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_penerimaanjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_penerimaanjtt_100` BEFORE INSERT ON `penerimaanjtt` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `trins_penerimaanjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_penerimaanjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_penerimaanjtt_100` AFTER INSERT ON `penerimaanjtt` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_penerimaanjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_penerimaanjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_penerimaanjtt_100` BEFORE UPDATE ON `penerimaanjtt` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `trupd_penerimaanjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_penerimaanjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaanjtt_100` AFTER UPDATE ON `penerimaanjtt` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
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
    	idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas;
		
    insert into auditpenerimaanjtt set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjtt=new.idbesarjtt, 
    	idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas;
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_penerimaanjtt_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_penerimaanjtt_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_penerimaanjtt_100` AFTER DELETE ON `penerimaanjtt` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaanjtt', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `penerimaanjttcalon`
--

DROP TABLE IF EXISTS `penerimaanjttcalon`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penerimaanjttcalon`
--

/*!40000 ALTER TABLE `penerimaanjttcalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanjttcalon` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_penerimaanjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_penerimaanjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_penerimaanjttcalon_100` BEFORE INSERT ON `penerimaanjttcalon` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `trins_penerimaanjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_penerimaanjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_penerimaanjttcalon_100` AFTER INSERT ON `penerimaanjttcalon` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_penerimaanjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_penerimaanjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_penerimaanjttcalon_100` BEFORE UPDATE ON `penerimaanjttcalon` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `trupd_penerimaanjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_penerimaanjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaanjttcalon_100` AFTER UPDATE ON `penerimaanjttcalon` FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
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
	
    insert into auditpenerimaanjttcalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjttcalon=old.idbesarjttcalon, idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas;
	
    insert into auditpenerimaanjttcalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjttcalon=new.idbesarjttcalon, idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas;

END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_penerimaanjttcalon_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_penerimaanjttcalon_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_penerimaanjttcalon_100` AFTER DELETE ON `penerimaanjttcalon` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaanjttcalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `penerimaanlain`
--

DROP TABLE IF EXISTS `penerimaanlain`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penerimaanlain`
--

/*!40000 ALTER TABLE `penerimaanlain` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaanlain` ENABLE KEYS */;


--
-- Definition of trigger `trins_penerimaanlain_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_penerimaanlain_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_penerimaanlain_100` AFTER INSERT ON `penerimaanlain` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `trupd_penerimaanlain_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_penerimaanlain_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaanlain_100` AFTER UPDATE ON `penerimaanlain` FOR EACH ROW BEGIN
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
    		
END $$

DELIMITER ;

--
-- Definition of table `pengeluaran`
--

DROP TABLE IF EXISTS `pengeluaran`;
CREATE TABLE `pengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengeluaran`
--

/*!40000 ALTER TABLE `pengeluaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengeluaran` ENABLE KEYS */;


--
-- Definition of trigger `trins_pengeluaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trins_pengeluaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trins_pengeluaran_100` AFTER INSERT ON `pengeluaran` FOR EACH ROW BEGIN
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
END $$

DELIMITER ;

--
-- Definition of trigger `trupd_pengeluaran_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trupd_pengeluaran_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_pengeluaran_100` AFTER UPDATE ON `pengeluaran` FOR EACH ROW BEGIN
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
    		
END $$

DELIMITER ;

--
-- Definition of table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
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

--
-- Dumping data for table `pengguna`
--

/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;


--
-- Definition of table `rekakun`
--

DROP TABLE IF EXISTS `rekakun`;
CREATE TABLE `rekakun` (
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
  KEY `FK_rekakun_katerekakun` (`kategori`),
  KEY `IX_rekakun_ts` (`ts`,`issync`),
  CONSTRAINT `FK_rekakun_katerekakun` FOREIGN KEY (`kategori`) REFERENCES `katerekakun` (`kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rekakun`
--

/*!40000 ALTER TABLE `rekakun` DISABLE KEYS */;
INSERT INTO `rekakun` (`kode`,`kategori`,`nama`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 ('111','HARTA','Kas','Kas yang ada disekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',18600,0),
 ('112','HARTA','Kas Bank','Kas yang ada di bank yang digunakan sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',20390,0),
 ('113','HARTA','Kas BOS','Kas yang diterima dari sumbangan Bantuan Operasional Sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',46147,0),
 ('150','PIUTANG','Piutang Siswa','Piutang siswa kepada sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',38508,0),
 ('151','PIUTANG','Piutang Karyawan','Piutang karyawan kepada sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',54096,0),
 ('152','PIUTANG','Piutang Usaha','Piutang yang lain kepada sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',23895,0),
 ('411','PENDAPATAN','Pendapatan SPP','Pendapatan dari pembayaran SPP siswa',NULL,NULL,NULL,'2010-03-02 10:06:53',22719,0),
 ('412','PENDAPATAN','Pendapatan DSP','Pendapatan dari pembayaran DSP siswa',NULL,NULL,NULL,'2010-03-02 10:06:53',41907,0),
 ('413','PENDAPATAN','Pendapatan Sukarela','Pendapatan dari perolehan dana sukarela',NULL,NULL,NULL,'2010-03-02 10:06:53',10317,0),
 ('414','PENDAPATAN','Pendapatan BOS','Pendaptan dari penerimaan sumbangan Bantuan Operasional Sekolah (BOS)',NULL,NULL,NULL,'2010-03-02 10:06:53',56924,0),
 ('500','BIAYA','Beban Transportasi','Beban yang dikeluarkan untuk pembiayaan transportasi',NULL,NULL,NULL,'2010-03-02 10:06:53',57077,0),
 ('501','BIAYA','Beban Listrik','Beban yang dikeluarkan untuk melunasi tagihan PLN',NULL,NULL,NULL,'2010-03-02 10:06:53',49084,0),
 ('502','BIAYA','Beban Telpon','Beban yang dikeluarkan untuk pembiayaan tagihan telpon',NULL,NULL,NULL,'2010-03-02 10:06:53',8658,0),
 ('503','BIAYA','Beban Internet','Beban yang dikeluarkan untuk pembiayaan taghan Internet',NULL,NULL,NULL,'2010-03-02 10:06:53',27097,0),
 ('504','BIAYA','Beban ATK','Beban yang dikeluarkan untuk pembelian rutin ATK',NULL,NULL,NULL,'2010-03-02 10:06:53',43981,0),
 ('611','INVENTARIS','Peralatan Mengajar','Inventaris alat-alat kegiatan belajar mengajar',NULL,NULL,NULL,'2010-03-02 10:06:53',7554,0),
 ('612','INVENTARIS','Kendaraan','Inventaris kendaraan sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',36888,0),
 ('700','MODAL','Modal Usaha','Modal yang ditanamkan oleh pemodal kepada sekolah',NULL,NULL,NULL,'2010-03-02 10:06:53',30715,0),
 ('900','UTANG','Utang Usaha','Utang sekolah kepada kreditur',NULL,NULL,NULL,'2010-03-02 10:06:53',42913,0);
/*!40000 ALTER TABLE `rekakun` ENABLE KEYS */;


--
-- Definition of table `tahunbuku`
--

DROP TABLE IF EXISTS `tahunbuku`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tahunbuku`
--

/*!40000 ALTER TABLE `tahunbuku` DISABLE KEYS */;
/*!40000 ALTER TABLE `tahunbuku` ENABLE KEYS */;


--
-- Definition of table `transaksilog`
--

DROP TABLE IF EXISTS `transaksilog`;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksilog`
--

/*!40000 ALTER TABLE `transaksilog` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksilog` ENABLE KEYS */;

--
-- Create schema jbsperpus
--

CREATE DATABASE IF NOT EXISTS jbsperpus;
USE jbsperpus;

--
-- Definition of table `aktivitas`
--

DROP TABLE IF EXISTS `aktivitas`;
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
  KEY `IX_aktivitas_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aktivitas`
--

/*!40000 ALTER TABLE `aktivitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aktivitas` ENABLE KEYS */;


--
-- Definition of table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
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
  KEY `IX_anggota_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 2020352 kB; InnoDB free: 2020352 kB; (`NoRegist';

--
-- Dumping data for table `anggota`
--

/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;


--
-- Definition of table `daftarpustaka`
--

DROP TABLE IF EXISTS `daftarpustaka`;
CREATE TABLE  `daftarpustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pustaka` int(10) unsigned NOT NULL,
  `perpustakaan` int(10) unsigned NOT NULL,
  `kodepustaka` varchar(45) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 dipinjam, 1 tersedia',
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
  CONSTRAINT `FK_daftarpustaka_perpus` FOREIGN KEY (`perpustakaan`) REFERENCES `perpustakaan` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_daftarpustaka_pustaka` FOREIGN KEY (`pustaka`) REFERENCES `pustaka` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


--
-- Dumping data for table `daftarpustaka`
--

/*!40000 ALTER TABLE `daftarpustaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `daftarpustaka` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_daftarpustaka_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_daftarpustaka_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_daftarpustaka_100` BEFORE INSERT ON `daftarpustaka` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_daftarpustaka_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_daftarpustaka_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_daftarpustaka_100` BEFORE UPDATE ON `daftarpustaka` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_daftarpustaka_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_daftarpustaka_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_daftarpustaka_100` AFTER DELETE ON `daftarpustaka` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'daftarpustaka', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `denda`
--

DROP TABLE IF EXISTS `denda`;
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

--
-- Dumping data for table `denda`
--

/*!40000 ALTER TABLE `denda` DISABLE KEYS */;
/*!40000 ALTER TABLE `denda` ENABLE KEYS */;


--
-- Definition of table `format`
--

DROP TABLE IF EXISTS `format`;
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

--
-- Dumping data for table `format`
--

/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` (`replid`,`kode`,`nama`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (1,'BU','Buku','',NULL,NULL,NULL,'2010-03-08 08:40:53',0,0);
/*!40000 ALTER TABLE `format` ENABLE KEYS */;


--
-- Definition of table `katalog`
--

DROP TABLE IF EXISTS `katalog`;
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

--
-- Dumping data for table `katalog`
--

/*!40000 ALTER TABLE `katalog` DISABLE KEYS */;
INSERT INTO `katalog` (`replid`,`kode`,`nama`,`rak`,`keterangan`,`counter`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (1,'000','KARYA UMUM',1,'Klasifikasi pustaka dalam kelompok karya umum ',0,NULL,NULL,NULL,'2010-03-07 17:28:08',48886,0),
 (2,'010','Bibliografi',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',34247,0),
 (3,'020','Perpustakaan dan Informasi Sains',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',24576,0),
 (4,'030','Ensiklopedia dan Buku Pintar',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',20137,0),
 (5,'040','(   ...   )',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',26959,0),
 (6,'050','Majalah, Jurnal dan Terbitan Berkala',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',8852,0),
 (7,'060','Asosiasi, Organisasi dan Museum',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',28911,0),
 (8,'070','Media Berita, Jurnalisme dan Publikasi',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',52469,0),
 (9,'080','Kutipan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',44550,0),
 (10,'090','manuskrip dan buku-buku langka',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',65344,0),
 (11,'100','FILSAFAT',1,'Klasifikasi pustaka yang tergolong dalam ilmu filsafat',0,NULL,NULL,NULL,'2010-03-07 17:28:08',62009,0),
 (12,'110','Metafisika',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',48483,0),
 (13,'120','Epistemologi',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',56389,0),
 (14,'130','Parapsikologi dan Perdukunan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',5433,0),
 (15,'140','Filsafat Aliran Pemikiran',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',54588,0),
 (16,'150','Psikologi',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',60049,0),
 (17,'160','Logika',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',5421,0),
 (18,'170','Etika',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',43547,0),
 (19,'180','Filsafat kuno, pertengahan dan lanjutan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',4883,0),
 (20,'190','Filsafat Barat Modern',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',24833,0),
 (21,'200','AGAMA',1,'Klasifikasi pustaka yang berkaitan dengan keagamaan',0,NULL,NULL,NULL,'2010-03-07 17:28:08',43986,0),
 (22,'210','Filsafat dan Teori Agama',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',14372,0),
 (23,'220','Injil',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',5431,0),
 (24,'300','ILMU SOSIAL, SOSIOLOGI dan ANTROPOLOGI',1,'Pengelompokan Pustaka dalam kategori ilmu sosial',0,NULL,NULL,NULL,'2010-03-07 17:28:08',49567,0),
 (25,'310','Statistika Umum',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',34952,0),
 (26,'320','Ilmu Politik',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',26057,0),
 (27,'330','Ekonomi',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',25429,0),
 (28,'340','Hukum',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',48975,0),
 (29,'350','Administrasi Umum dan Ilmu Militer',1,'',2,NULL,NULL,NULL,'2010-03-08 08:44:43',37528,0),
 (30,'360','Permasalahan Sosial dan Pelayanan Sosial',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',40716,0),
 (31,'370','Pendidikan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',25463,0),
 (32,'380','Perdagangan, Komunikasi dan Perhubungan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',5165,0),
 (33,'390','Kewarganegaraan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',14967,0),
 (34,'400','BAHASA',1,'Klasifikasi pustaka dalam kelompok bahasa',0,NULL,NULL,NULL,'2010-03-07 17:28:08',59340,0),
 (35,'410','Linguistik',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',55207,0),
 (36,'420','BAHASA INGGRIS',1,'pengelompokan pustaka (bahasa) dalam kelompok bahasa inggris',0,NULL,NULL,NULL,'2010-03-07 17:28:08',32485,0),
 (37,'430','Bahasa Arab',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',62332,0),
 (38,'500','ILMU MURNI',1,'klasifikasi pustaka dalam kelompok ilmu murni',0,NULL,NULL,NULL,'2010-03-07 17:28:08',17616,0),
 (39,'510','Matematika',1,'pengelompokan pustaka (ilmu murni) dalam kelompok matematika',0,NULL,NULL,NULL,'2010-03-07 17:28:08',32144,0),
 (40,'530','Fisika',1,'pengelompokan pustaka ilmu murni berdasarkan klas fisika ',0,NULL,NULL,NULL,'2010-03-07 17:28:08',42340,0),
 (41,'540','Kimia',1,'klasifikasi pustaka ilmu murni dalam kelompok ilmu kimia',0,NULL,NULL,NULL,'2010-03-07 17:28:08',49740,0),
 (42,'570','Biologi',1,'pengelompokan pustaka ilmu murni kedalam klas biologi',0,NULL,NULL,NULL,'2010-03-07 17:28:08',56148,0),
 (43,'600','ILMU TERAPAN',1,'pengelompokan pustaka kedalam kategori ilmu terapan',0,NULL,NULL,NULL,'2010-03-07 17:28:08',458,0),
 (44,'700','KESENIAN',1,'Pengelompokan pustaka kedalam kategori kesenian',0,NULL,NULL,NULL,'2010-03-07 17:28:08',30437,0),
 (45,'710','Kreasi dan Ketrampilan',1,'',0,NULL,NULL,NULL,'2010-03-07 17:28:08',19752,0),
 (46,'800','KESUSASTERAAN',1,'klasifikasi pustaka berdasarkan kelompok sastra',0,NULL,NULL,NULL,'2010-03-07 17:28:08',7445,0),
 (47,'900','GEOGRAFI dan SEJARAH ',1,'klasifikasi pustaka kedalam kelompok ilmu geografi dan sejarah',0,NULL,NULL,NULL,'2010-03-07 17:28:08',43502,0);
/*!40000 ALTER TABLE `katalog` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_katalog_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_katalog_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_katalog_100` BEFORE INSERT ON `katalog` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_katalog_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_katalog_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_katalog_100` BEFORE UPDATE ON `katalog` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_katalog_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_katalog_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_katalog_100` AFTER DELETE ON `katalog` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'katalog', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `konfigurasi`
--

DROP TABLE IF EXISTS `konfigurasi`;
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

--
-- Dumping data for table `konfigurasi`
--

/*!40000 ALTER TABLE `konfigurasi` DISABLE KEYS */;
INSERT INTO `konfigurasi` (`replid`,`siswa`,`pegawai`,`other`,`denda`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (1,3,4,0,0,NULL,NULL,NULL,'2010-03-25 13:24:56',0,0);
/*!40000 ALTER TABLE `konfigurasi` ENABLE KEYS */;


--
-- Definition of table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penerbit`
--

/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_penerbit_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_penerbit_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_penerbit_100` BEFORE INSERT ON `penerbit` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_penerbit_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_penerbit_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_penerbit_100` BEFORE UPDATE ON `penerbit` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_penerbit_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_penerbit_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_penerbit_100` AFTER DELETE ON `penerbit` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'penerbit', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `penulis`
--

DROP TABLE IF EXISTS `penulis`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penulis`
--

/*!40000 ALTER TABLE `penulis` DISABLE KEYS */;
/*!40000 ALTER TABLE `penulis` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_penulis_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_penulis_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_penulis_100` BEFORE INSERT ON `penulis` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_penulis_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_penulis_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_penulis_100` BEFORE UPDATE ON `penulis` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_penulis_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_penulis_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_penulis_100` AFTER DELETE ON `penulis` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'penulis', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `perpustakaan`
--

DROP TABLE IF EXISTS `perpustakaan`;
CREATE TABLE `perpustakaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Nama` (`nama`),
  KEY `IX_perpustakaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `perpustakaan`
--

/*!40000 ALTER TABLE `perpustakaan` DISABLE KEYS */;
INSERT INTO `perpustakaan` (`replid`,`nama`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (1,'sma','',NULL,NULL,NULL,'2010-03-08 08:40:44',0,0);
/*!40000 ALTER TABLE `perpustakaan` ENABLE KEYS */;


--
-- Definition of table `pinjam`
--

DROP TABLE IF EXISTS `pinjam`;
CREATE TABLE `pinjam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodepustaka` varchar(45) NOT NULL,
  `tglpinjam` date NOT NULL DEFAULT '0000-00-00',
  `tglkembali` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `idanggota` varchar(45) NOT NULL,
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
  PRIMARY KEY (`replid`,`tglkembali`),
  KEY `IX_pinjam_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pinjam`
--

/*!40000 ALTER TABLE `pinjam` DISABLE KEYS */;
/*!40000 ALTER TABLE `pinjam` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_pinjam_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_pinjam_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_pinjam_100` BEFORE INSERT ON `pinjam` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_pinjam_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_pinjam_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_pinjam_100` BEFORE UPDATE ON `pinjam` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_pinjam_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_pinjam_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_pinjam_100` AFTER DELETE ON `pinjam` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'pinjam', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `pustaka`
--

DROP TABLE IF EXISTS `pustaka`;
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
  CONSTRAINT `FK_pustaka_format` FOREIGN KEY (`format`) REFERENCES `format` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_katalog` FOREIGN KEY (`katalog`) REFERENCES `katalog` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_penerbit` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pustaka_penulis` FOREIGN KEY (`penulis`) REFERENCES `penulis` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pustaka`
--

/*!40000 ALTER TABLE `pustaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `pustaka` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_pustaka_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_pustaka_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_pustaka_100` BEFORE INSERT ON `pustaka` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_pustaka_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_pustaka_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_pustaka_100` BEFORE UPDATE ON `pustaka` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_pustaka_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_pustaka_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_pustaka_100` AFTER DELETE ON `pustaka` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'pustaka', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `rak`
--

DROP TABLE IF EXISTS `rak`;
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

--
-- Dumping data for table `rak`
--

/*!40000 ALTER TABLE `rak` DISABLE KEYS */;
INSERT INTO `rak` (`replid`,`rak`,`keterangan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (1,'Rak','contoh data',NULL,NULL,NULL,'2010-03-07 17:25:32',0,0);
/*!40000 ALTER TABLE `rak` ENABLE KEYS */;

--
-- Create schema jbssdm
--

CREATE DATABASE IF NOT EXISTS jbssdm;
USE jbssdm;

--
-- Definition of table `bagianpegawai`
--

DROP TABLE IF EXISTS `bagianpegawai`;
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

--
-- Dumping data for table `bagianpegawai`
--

/*!40000 ALTER TABLE `bagianpegawai` DISABLE KEYS */;
INSERT INTO `bagianpegawai` (`bagian`,`urutan`,`replid`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 ('Akademik',1,1,NULL,NULL,NULL,'2010-03-02 10:08:32',53202,0),
 ('Non Akademik',2,2,NULL,NULL,NULL,'2010-03-02 10:08:32',19723,0);
/*!40000 ALTER TABLE `bagianpegawai` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_bagianpegawai_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_bagianpegawai_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_bagianpegawai_100` BEFORE INSERT ON `bagianpegawai` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_bagianpegawai_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_bagianpegawai_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_bagianpegawai_100` BEFORE UPDATE ON `bagianpegawai` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.bagian <> OLD.bagian THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'bagianpegawai', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.bagian, oldpk = OLD.bagian;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_bagianpegawai_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_bagianpegawai_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_bagianpegawai_100` AFTER DELETE ON `bagianpegawai` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'bagianpegawai', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(50) DEFAULT NULL,
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
  `foto` blob,
  `bagian` varchar(50) NOT NULL,
  `nikah` varchar(10) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `kelamin` varchar(1) NOT NULL,
  `pinpegawai` varchar(25) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
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

--
-- Dumping data for table `pegawai`
--

/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` (`replid`,`nip`,`nama`,`panggilan`,`gelar`,`tmplahir`,`tgllahir`,`agama`,`suku`,`noid`,`alamat`,`telpon`,`handphone`,`email`,`foto`,`bagian`,`nikah`,`keterangan`,`aktif`,`kelamin`,`pinpegawai`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (23,'101','Pegawai','','','Bandung','1987-11-01','Islam','Jawa','','                                ','','','',0xFFD8FFE000104A46494600010100000100010000FFFE003B43524541544F523A2067642D6A7065672076312E3020287573696E6720494A47204A50454720763632292C207175616C697479203D2037300AFFDB0043000A07070807060A0808080B0A0A0B0E18100E0D0D0E1D15161118231F2524221F2221262B372F26293429212230413134393B3E3E3E252E4449433C48373D3E3BFFDB0043010A0B0B0E0D0E1C10101C3B2822283B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3BFFC00011080050003A03012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00DED5B55D4A3D62F238EFEE5116770AAB2300064D543ACEABFF00411BAFFBFADFE34ED617FE2757C7FE9BBFFE846B2B53BAFB069F2DC6DDCCA3E51EA4F028026BEF165DD80026D5EE831E8A25624FEB5872FC4BBF56216E6FB00E0969C83FCEB4F4AF00C9ADE9EB7F7F7522C93FCE153B0ED9A9E6F86563E56D599E497FBCFC7F2A00AF61E34BBD4C116DABDDEE03251A56047EB565B5DD63B6A977FF007FDBFC6B2753F87EFA6E9E6FACE574B8806E2A0FDE1EDEF4BA55CC977621E61FBD43B5CFA9F5A00D07D7B5A038D56F3FEFFB7F8D7AEE9CECFA65ABBB1666850924E493815E30E99AF66D37FE41769FF5C13FF411401E7BAB80759BCE3FE5BBFF00335CF789E32DA4657A09109FA671FD6BA4D5D7FE2717871FF2DDFF0099A822B64BB578648C491BAED652077E33ED8EBC7A5006F47A8C1A3E991472453481100FDD2E6A45D46D25B137E8B218C0C9F970454F73A3E9DA9D92ADD448E060E586718E6A7934AB33A51D3C458B62BB703D280321EE63D5F4C902C32C6B229197C7F426BCF7C396CF159DC0933FEBC81F40057A7DA69165A5E9E62B68D62400F41D7BD7377F690DB5BC51C5188C4795C0FE3E8777FE84280315D074AF5FD3B8D32D7FEB8A7FE822BC959475AF5AD3FF00E41B6BFF005C53F90A00E0355FF90BDE73FF002DDFF99A860964824DD1B956C6323D2AC6A9FF00217BCFFAECFF00CCD53791225DD23AA2FAB1C50074C9748BA7472946940C6517924D508AF105C348BA75E22993CCC346F8DD9CE7AD56D2EF3CDB7636EE09570707A3023834FB5BABC5D4589D2B009FBC1F8FAD006C5CDD2B69CF36C31E01C2B0C106B959A5966C195CB95181935B7AC4B2C5A63BCA543C92222A0E9CB0CFE38CD73F15C4372B98A453EDDC50042E39E6BD5AC3FE41D6DFF5C53F90AF2D75F6AF52B0FF00907DB7FD725FE42803CBF5FBE99B54D49620D1224F2279B8CFCD93D2B32F4496D69189C6F9271CBB8CE063B0ED5B9AB7906E7510E58817F272077AADE218ADBEC96F90E485E30476028033DB517B0B8B3BD8519ADE58C432AA8E78E0371DC71F81ADFB7D6ADE09489AF9123DB928E79FC2B85F11DE496B663468519AE1E5CEE1FC208E47E3C565E9D0CB21F2B056E222630371F95BEA3B7D2803B997599356BF7BA990C76568A4C287AEE3C063EFEDD866B32DCC2F1CCC5C42D130C4A80F20F1C8AA5A4EA0DA8DA8D29A378EEE390994EDC071D01FF3EB566D611269D7AF1CD1E3728C1C8EFEE280231ABDCC21A69801096C2B0E847D3FFD55EDFA638934AB471FC5021FFC745785EAB6922E996CA9B792A061811D0D7B8E9000D1AC40391F678F07FE022803CDF5C923F335058433BAEA337981474E98FEB50EA8B34DF66CC32000742A7DABB5D7ACF5437D8D2EC2178E481C9768A2204BB5B05B772DCECF4EA7AF6A8C3C5130958E936B1809214522362A593F76076255861B2467777C50070DAEC5E5EBEB3B4241C0CB15FF0066B9FD37FE43916EF90C921E7F967EB8FD6BDA52DB5396C6192E34FB4176B70E255F2D5834637052A73C03F29E79C1E6B356C3594D3F4A90E936E6F3CD6377B60841DA1C6DCF6FB99E8473F950079E690009EEA6206F25416F5E4D1126DD1E765FE295011EBC357A12DB7891228CFF0063D8872D89822467866539078FBAA5948EF8CE4F195FB36B8B613471E928F2385F25A58600411B4B6F00E39F9C0C0EC33EB401E6BAC9FF008945BA8E1DF62AFD5B23FAD7B969600D26CC2F410263FEF915CDC365AC35F42B77A45AB42932AE638E2D85470CE73961EAA073C9C93800F5CAA1542A8000180076A00FFFD9,'Akademik','tak_ada','',1,'l','12637',NULL,NULL,NULL,'2010-03-02 10:08:32',4536,0);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_pegawai_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_pegawai_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_pegawai_100` BEFORE INSERT ON `pegawai` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_pegawai_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_pegawai_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_pegawai_100` BEFORE UPDATE ON `pegawai` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.nip <> OLD.nip THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegawai', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.nip, oldpk = OLD.nip;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_pegawai_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_pegawai_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_pegawai_100` AFTER DELETE ON `pegawai` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbssdm', tablename = 'pegawai', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;
--
-- Create schema jbssms
--

CREATE DATABASE IF NOT EXISTS jbssms;
USE jbssms;

--
-- Definition of table `daemons`
--

DROP TABLE IF EXISTS `daemons`;
CREATE TABLE `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `daemons`
--

/*!40000 ALTER TABLE `daemons` DISABLE KEYS */;
/*!40000 ALTER TABLE `daemons` ENABLE KEYS */;


--
-- Definition of table `format`
--

DROP TABLE IF EXISTS `format`;
CREATE TABLE `format` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 presensi, 1 penilaian, 2 pengumuman',
  `format` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `format`
--

/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` (`replid`,`tipe`,`format`) VALUES 
 (1,0,'Kami informasikan presensi [SISWA] tanggal [TANGGAL1]/[BULAN1] s/d [TANGGAL2]/[BULAN2] hadir [HADIR] absen [ABSEN]. [PENGIRIM]'),
 (2,2,'Kami informasikan nilai #SISWA tanggal #TANGGAL1/#BULAN1 s/d #TANGGAL2/#BULAN2 . #PENGIRIM'),
 (4,1,'Kami informasikan nilai [SISWA] tanggal [TANGGAL1]/[BULAN1] s/d [TANGGAL2]/[BULAN2] . [PENGIRIM]');
/*!40000 ALTER TABLE `format` ENABLE KEYS */;


--
-- Definition of table `gammu`
--

DROP TABLE IF EXISTS `gammu`;
CREATE TABLE `gammu` (
  `Version` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

/*!40000 ALTER TABLE `gammu` DISABLE KEYS */;
INSERT INTO `gammu` (`Version`) VALUES 
 (7);
/*!40000 ALTER TABLE `gammu` ENABLE KEYS */;


--
-- Definition of table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
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
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inbox`
--

/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;


--
-- Definition of table `kritiksaran`
--

DROP TABLE IF EXISTS `kritiksaran`;
CREATE TABLE `kritiksaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` text NOT NULL,
  `senddate` text NOT NULL,
  `message` text,
  `from` text,
  `Status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kritiksaran`
--

/*!40000 ALTER TABLE `kritiksaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `kritiksaran` ENABLE KEYS */;


--
-- Definition of table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
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
) ENGINE=MyISAM AUTO_INCREMENT=619178 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbox`
--

/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;


--
-- Definition of table `outbox_multipart`
--

DROP TABLE IF EXISTS `outbox_multipart`;
CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') DEFAULT '8bit',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` varchar(160) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbox_multipart`
--

/*!40000 ALTER TABLE `outbox_multipart` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox_multipart` ENABLE KEYS */;


--
-- Definition of table `outboxhistory`
--

DROP TABLE IF EXISTS `outboxhistory`;
CREATE TABLE `outboxhistory` (
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idsmsgeninfo` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum dikirim, 1 sudah dikirim',
  `SenderID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=571 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outboxhistory`
--

/*!40000 ALTER TABLE `outboxhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `outboxhistory` ENABLE KEYS */;


--
-- Definition of table `pbk`
--

DROP TABLE IF EXISTS `pbk`;
CREATE TABLE `pbk` (
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pbk`
--

/*!40000 ALTER TABLE `pbk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbk` ENABLE KEYS */;


--
-- Definition of table `pbk_groups`
--

DROP TABLE IF EXISTS `pbk_groups`;
CREATE TABLE `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pbk_groups`
--

/*!40000 ALTER TABLE `pbk_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbk_groups` ENABLE KEYS */;


--
-- Definition of table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
CREATE TABLE `pesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `pesan` varchar(160) NOT NULL,
  `pengirim` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan`
--

/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;


--
-- Definition of table `pesanpenerima`
--

DROP TABLE IF EXISTS `pesanpenerima`;
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

--
-- Dumping data for table `pesanpenerima`
--

/*!40000 ALTER TABLE `pesanpenerima` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanpenerima` ENABLE KEYS */;


--
-- Definition of table `phones`
--

DROP TABLE IF EXISTS `phones`;
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

--
-- Dumping data for table `phones`
--

/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` (`ID`,`UpdatedInDB`,`InsertIntoDB`,`TimeOut`,`Send`,`Receive`,`IMEI`,`Client`) VALUES 
 ('MyPhone1','2010-02-03 10:48:05','2010-02-03 10:48:05','2010-02-03 10:48:15','yes','yes','354056001179799','Gammu 1.10.6, Windows XP SP2');
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;


--
-- Definition of table `sentitems`
--

DROP TABLE IF EXISTS `sentitems`;
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

--
-- Dumping data for table `sentitems`
--

/*!40000 ALTER TABLE `sentitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `sentitems` ENABLE KEYS */;


--
-- Definition of table `smsgeninfo`
--

DROP TABLE IF EXISTS `smsgeninfo`;
CREATE TABLE `smsgeninfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `tipe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 presensi, 1 penilaian, 2 pengumuman',
  `info` varchar(1000) DEFAULT NULL,
  `pengirim` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `smsgeninfo`
--

/*!40000 ALTER TABLE `smsgeninfo` DISABLE KEYS */;
INSERT INTO `smsgeninfo` (`replid`,`tanggal`,`tipe`,`info`,`pengirim`) VALUES 
 (2,'2010-04-16',2,'Pengumuman','akademik ');
/*!40000 ALTER TABLE `smsgeninfo` ENABLE KEYS */;

--
-- Create schema jbsumum
--

CREATE DATABASE IF NOT EXISTS jbsumum;
USE jbsumum;

--
-- Definition of table `agama`
--

DROP TABLE IF EXISTS `agama`;
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

--
-- Dumping data for table `agama`
--

/*!40000 ALTER TABLE `agama` DISABLE KEYS */;
INSERT INTO `agama` (`replid`,`agama`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (29,'Budha',5,NULL,NULL,NULL,'2010-03-02 10:07:22',48581,0),
 (28,'Hindu',4,NULL,NULL,NULL,'2010-03-02 10:07:22',61565,0),
 (25,'Islam',1,NULL,NULL,NULL,'2010-03-02 10:07:22',31019,0),
 (26,'Katolik',2,NULL,NULL,NULL,'2010-03-02 10:07:22',35929,0),
 (27,'Protestan',3,NULL,NULL,NULL,'2010-03-02 10:07:22',21057,0);
/*!40000 ALTER TABLE `agama` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_agama_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_agama_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_agama_100` BEFORE INSERT ON `agama` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_agama_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_agama_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_agama_100` BEFORE UPDATE ON `agama` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.agama <> OLD.agama THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'agama', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.agama, oldpk = OLD.agama;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_agama_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_agama_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_agama_100` AFTER DELETE ON `agama` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'agama', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `identitas`
--

DROP TABLE IF EXISTS `identitas`;
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
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_identitas_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `identitas`
--

/*!40000 ALTER TABLE `identitas` DISABLE KEYS */;
INSERT INTO `identitas` (`replid`,`nama`,`situs`,`email`,`alamat1`,`alamat2`,`alamat3`,`alamat4`,`telp1`,`telp2`,`telp3`,`telp4`,`fax1`,`fax2`,`keterangan`,`foto`,`departemen`,`status`,`perpustakaan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (4,'SMA Indonesia Membaca','www.indonesiamembaca.net','info@indonesiamembaca.net','Jl. Pendidikan No.1','',NULL,NULL,'(022)1234567','(022)1234567','','','(022)1234567','',NULL,0xFFD8FFE000104A46494600010100000100010000FFFE003C43524541544F523A2067642D6A7065672076312E3020287573696E6720494A47204A50454720763632292C207175616C697479203D203130300AFFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC0001108004B006403012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FEFE28A28A002B1FC41E21D03C25A1EAFE27F156B9A3F867C35A069F75AB6BBE21F106A765A3687A2E95630BDC5F6A7AB6ADA8CF6D61A769F676E8F3DD5E5E5C436D6F0A3492C888A587C1BFF0501FF8294FC00FF827AF82F44BBF886DAD7C42F8CFF114DED87C0EFD9BBE1C476FAB7C5CF8C1AEDA21F34695A64922DBF86BC17A43959BC5FF00123C4F258784BC2B621DAE6F2EF56974DD1B51FE3CBF6D6FDA4BE367ED4BA6CBF1AFFE0A55E348ECFE0F68FAADB6A1E05FD893E145F5FAFECE9E08BF479EF3C3C3E2A6AD7B368F6BF1CFE21A9B586D5BC59F15752D17E16E9DE229E5B0F0B787F4C8355B1F3FF40E06F0DB8978FAAE2AA657468E0B26CB22EA673C499A54961724CA68C62A73789C5724DD5C472352A783C2C2B62A69C65ECA34B9AAC7F14F183C7CE01F0630F9750E21C4E2F36E2BE20A91C370A70170ED18665C5DC4D8BA9374A94303972A94E386C1FB54E15B35CC6AE132EA2E3387D62A623930F53F7C3F686FF8382FE193EA7AAF80BFE09E9F0735AFDB4BC51637373A55FF00C6CBDD6A4F857FB20F863508257B4B9962F8B9A8E93AAEBDF1765D2EE764B3E9DF073C23E25D1F52B7CAC1E35B262D2C7F917F15FE3AFF00C1437F6A792EA4FDA53F6D8F1CF837C277EB279BF03FF63086FBF668F86F6B6F71B96EF48D53E20E99AA6B3F1FFC6DA74F6F8B6986ABF13347B1B98BCC074681669A397E0FD3FE2B78EBE32684DA2FC26D0B59F0B7C30F1C7875F42F871E30F0C786759F0CEABE1396D35EF16FC3AF19E9BE328355B6D3F50F877A8F867C3773E14F8B5F0F2E21D2BC3F25ECFA4DC785ADA5D4645B51ADE9FC0DF81BF143E1D788E2F89FF187E24E9B7F3FFC20DE2ED3FC59A7BEBDE26D5F4CB23E2987E15F88258EDB59F166A32A68FA5F80BC43E11F1FADBDD23BD9EBF69E319F5D3A778567373A557F61F007821E1EE555F2DAD5387334F119D6F675715C439A54A796F0CE0E94E54DAC4E172A8CE74715859E1A71C7538E638AC5CABE1251AB4E31954A54A5FE59F8D3F4BDF1C389709C4185A5C77C3BE044706F1187CBB81F8768D5CFFC40CD7114A9D452CBF31E239D286272DCC686614AA64F889E4597E5B1C1E694EA616BD5AB0A189AF4BD7BE1B7C22B8F827A94FE20FD91FF0068AFDA2FF664F15CA21D5B50D43E11FC74F18EBDE1DF125E5E8FB5D96AFE3FF86FF12755F883F0E7C7CD7D2235DCD7BE28F0BDE5FEB0AD3CD26A524AC2E13F4E7E0A7FC1683FE0A05FB3C4B6DA67ED59F08FC19FB71FC2EB578E3BCF8A7FB3C69BA6FC19FDA5F48D3D006BAD4F5CF829AF6AAFF093E275E2A90B159F807C59F0CAEE621DADF409A4F2EDDFF01FC3DFB1C786756F85BE29F84DE10F8E3E2AB2D4B51F839F0A3C2D692EA1E1FBFD2751D42FFE13784757F0F7C32F8A36BA6F8BAEF54BCD53E13EB9AAEA76FE32F0F3F85218FC33AB4DA4E857FE03F1AADB58F9D73E89E2EF0A7ED3BF0EBC5DE2DF18F873C5B7DAFF00867E20CBE136D6C585A6B5E346F867ABCFE2DD697C5DE2DF0DF808DB6A5A96B3A4681F08F47F0B784FC3BE15F0D68D793EB5E3ED4A1F12EB3A4B58C1AE5FC7E9F10F869C07C639553CCB17E17AC8A1568F32E20F0E339C9B1387A0E15333A751AC3602D93E2A1456172D556AE2F0D497363B11CF89C2C3053AD5BE7B81FC7FF197C2BE24C4641967D2265C63530D8B8D39F04F8F1C29C5997E3F14AA51E1EAB414B30CE94F8A72FAB8AFED1CFDE1B0B96E3EBB74F27C04A8E0333AD9C52C2E0FFBC5FD8EBFE0A0FF00B247EDE3E1AD4B5DFD9B3E2E693E2BD6BC34228BC7BF0C35CB4D43C17F193E195FB958DF4EF88BF0A7C556DA578D7C2D225D17B38352BCD21B40D5A68657D0B58D56D556E5BED0AFF34DF0FF00C47F873F147C53E03F126BDABF8BFF00673FDAD3C25E1BF1EF8DBC3DF1C3E19EA537C2DF893F09BC33E0DF1AE9FE18D32EFC47E2F4BD77D1E3F13E93E27F0C5D6BFF000C7C67FF000927852D352D5BC49E09D7ADDF58D1AFA01FD1E7EC4BFF0005BAF187C34F12784FF677FF0082A2DCF86F4693C437F63E17F857FB78F8674A87C2BF073E216B174EB69A5F867F683F0D43249A77C04F891AACBE59B4F12DB5C0F841E29B99A74B5B8F054D6634FBAFE4EE3BF06B39E15C155E20C93194B8B384A1EC655B36C052952C764EF114A15A961F88B2AE7AB5B2CAD18D454EA558CEBE1235A32A356BD1C47FB3AFF4B7C1BFA56709F88F9B61F8238BB2BC47869E265578AA784E1ACEB131C4651C52B0388AB85C463781B893D8E1B09C41849D4A32AD430D3A383CCEAE1651C561B078BC0AFAECBFA76A2991C91CD1A4B13A4B1488B247246CAF1C88E0323A3A92AE8CA432B29218104120D3EBF1A3FAAC28A28A002BF2A7FE0A83FF000536F0D7EC11E0BF0DF82BC05E1CB2F8C5FB62FC6E8353B1FD9F3E050BE7B5B394588106AFF16BE2BEA168C2EBC25F05BC0724A973E21D6330EA3E25BF48BC25E162DAA5D5DEA1A37EAB57F01565AA6BBF143F6BEFF8285FC6BF8A1ABEA5E32F8BB17EDB5FB4A7ECFF001F8975E78E5B9F0CFC1DF805F1535FF037C28F865E17B48A38ECFC3BE12D03C37A7D9EA1269DA6C317F6DEB97F7BE23D6A7D4755BC3763F50F07FC3C5E26F1BE0786AB637EA1818D0AF996675E1AE25E5F8295255A8E094A13A7F5BAF2AD4E9539D54E9D18CA75E51ABEC951A9FCEFF4A4F1C67F47CF08739E3FC2E52B3ACE258CC1E41C3D83ACDC7011CEF358E21E17179B4A13A75BFB37054B0D88C557A5876ABE2EA52A381855C37D65E2F0FC8DF25EF81B57F1FF00ED4BFB4C78FF005DF8D3FB497C4C6B797E28FC5FBDD0F56D6F5492D7CC7BCB7F01FC32F0568167AA5FF837E0F7812D23BABDD3BC11E0FD31E0D27C33A2DF788F5B8EF24D3AEAF60E6BE00EB7E26F1EDDF8EF5D93C75E16F8A5F0A7C4F7B7224717DA678863D1FC53268DE19377A1F81B5FF0FE9F6FE17F1A7C20D4BC3F7E8D64355D3342F16F86B5BB4D4F48F10AF896FF0050D4AE344ECFF686F0A781350F036A7E3CF1AAF8D629BE16E8BE21F15F87B50F879E29F10F86BC6761A943A7F9AEBE14FEC2D4B4F8F52F12EACB6A9A1E95A5EA515FD9EB0DA94DE1FBAB4B9D3F5AD42D2EFD83C30FA7CBE1CD0A7D2AF5F53D36E749D3EEEC753963B78A6D52DAEED22B98B53B88ED2D2C6D96E751597EDB73E4595A44D3CF2325B401BCB5FF004EB26E18C364F9C60387329865F92F0DF0CE5B471596E4D96D6AEF158D863A388C1D6C5E6F0954A74EAAC456A58BA72957A198CB10E3531357154B19560E87FCF4715F88398714F0BE73C77C4F533CE2DE3EF1073DC5E5D9FF0015E7F86C1FF6765753269E5F9A6172CE18AB4E857AD85784C2E272BAF1860F1591470517432DC3E5F88CA30D5563757C09E16D2358F8C1F003E1BF88F5DBFF0086DF03BC61F103C1FF000ABC5DE21F8776FE1B83C79E169FC6FA9587823E18C7E11B5F167873C4BE05D3FC387C71A9785BC3FE2B9752F0F6A32E97E15D5AFB55D2A3B09344DD3FE9DEB9FB117ECFFF0007FE1D7ED8F7DE21F0DDD7C52F895FB267ED89FB2BFC48F087C49F8B13D9788FC54BF02B46D6FF00650F8F8F6D61A559E99A5F82B41D0E7B67F8B9F0BF5EB9F0F784748B8F1959F86B5AB8F153EAF77732CEDF93FE3CD2756D73C17E29D2FC3F742C3C4777A0EA89E19D48EDDDA5789A3B3966F0E6AF11721527D2B5B8EC351B79091E55C5B45282A5011FD1B7C51B3D03E35FC08FDA07F6AAD6B59B8F05FECE5FB6A7FC12B3C0DA778AFC53A1E9ADE27F15F807C4D69A1FC54F11783759F0D780A0B8B4D4BC61E2AD57C37FB485E5BE9DA7DADC4777A9EB5F0E3C2FE1B92E6D67BCD3C9FE46FA5EC33FCA33FE1F787CF339870DE7D94D587F624730C4C327A5986515D53AF2A580A5386123CF85C760AEA54A53E75525CED4AD1FF4EFF65F54E0AE26E0BE368E3B83F84EB71F706F12E1EAAE2E9E4797D6E29C4647C4F83957C1D3C4E7788A35B3292A799E519B5BD9E269D1F66E843D929D2E79FB27ED6DF047E12FED1BFB60FEC69F0A7E2E7C3DF0BFC40F0DE95F0B3F6BDF8C171A6788F4C82ED0C5E0E6FD9DFE1A431477388EF6DD23D57E37699AB431DADD441354D1F4BD5113EDBA4D8DD59FF3FBF1DFF675F067C25FD94FE0AFC7CF861F11BE255E7C41FDA6BE38FC47BCF823F0C3C63AD7867C4BF09B4DFD99AEFC75F113C6BE01D675BD4EEFC2171F196F60F0FF00ECEF65F0F34CD3FC513FC4BD7F54D67E25F8CBC332F890EA3A1EAD3BE99FB6773E20FDA57C79F173C79A9F8D7E1AE8FF00083F6B11FB0AFED2CFFB1FFC3FD37C636BE2AF08F88F43F19F893E106A3AA43E2FF88A91D8597847E2E7C2DF88DA5FC09F097C5ED06C34ED6BC0325BF8B3C2FE2DF877F10FC67A77FC24161E15FCBDFF00828F58E8BE0AF8F7FB3B7ECC9E129CBF82BF635FD8D3C0DE03F0EA43B5228AEFE256AF6BA15E6997D1C676AEA1A5F833F673F869A9430B1616D65E2A478485BB937FE2DE02FF00AC38FF0012F85F22C9F3DCEF28C263B31589CD61956638AC1431197E5746B6678AA389851A8A8D5A75A8E16742D5E9D48F3554945C9A3FACFE9A1FEA364BE007889C63C53C1BC23C4F99E5191BC0F0DD5E24C872ECDAB6073CE20C661320CB71580AB8AA13C561EB6131598D2C673612B51A8A186949C942323F2A7E2FFC00F0AFC5E36DA86A33DD68FAF451689617D7D6535F35AF883C39A16B83C5567E0DF10C7617DA36AD2F85DFC550E9DE20BD87C3BACF86357D46F746D36CEFB5797426D4746BEF01F847F116F3C496B27C09FDA6748935CD7FE294DF10AE2CBC27AEF872CA7F09E83F0EFC3579E18F07DBF877C53AC6AD74EFE23D43C53ACEA71EAB62E25F154F65A8F8923F046A7E21BBD7FC3D34D71F7C57C87F103E1EF803C7DFB4C7872D26F1078D3C37E3ED37E1349AEEA975E0EFECCD0EF353F06D8F8C64D3B46D0E5F88474DB8F1B786ECEEB53D5BC4B35DE8DF0F75DF0ACFACC50C92F88AFEEEDEDAC2D9BFD26E2AC9165F8FC0E7D92C3094B1F8FC6E1726CD30189A90A382CFF0D986268D374B154673851AF5A952FAEC69D274E74D2CC31D8EFAB6231B4681FE06F86FC5CF39C9B37E0BE2BA999D7C9724CA732E29E1CCE72FC3D4C4E6DC159864980C45686272DC4D2A3571581C2627151CA2A627134EAD1AF29E4793651F5FC0E5389C733F4CBFE09DDFF0516F14FF00C135FC49E15FD9B7F699F17EB7E31FF827E78A757D3BC2DF06BE35F8B753BBD6BC4DFB196BDAB5DC5A7F87FE197C52F106A134F7FACFECD7A9DDCD6DA4F817C7BAA4F717BF086EA4B3F0D78A2EE4F0549A6EABA1FF0063B0CD0DCC315C5BCB1CF6F3C693413C2EB2C33432A878E58A442C92472232BA3A3156521949041AFE15B5ED0745F14E89AB786FC47A5D86B9A06BDA75E691AD68FAA5AC57BA76A9A66A16F25ADF58DF5A4EAF0DC5ADD5BCB24334322B23C6ECA460D7EE87FC1BB1E38F1AF89FF602F12F837C57E2ED7FC63A0FC03FDAC3F694FD9E3E125DF89EFE4D675AD13E0D7C28F1A45A2F803C2336BB72BFDA5ACD978574F927D1744BAD52E2F2F2D742B4D33488EE16C74DB2B5B6FE14FA4BF84194F87B9AE5FC45C392A785C8F897138AA4F25D57F65E614210AF5560B46BFB3ABC26E74E84A5CD83AB1952A77C3CE8C28FFB1FF400FA51712F8DFC399DF0371E46BE63C5FC0381CBB111E2B7C8DF10E478BA9530986966FAA97F6F60EB51F675F191838E69879D3C4D7E5C752C556C5FEEF514515FCB87FA2815FC1B78974093E1F7EDE1FF00054CF8637912DB6A1A67EDD5E32F8A31DB85D87FB13F682F86FF000D3E30E9174C9C64DF4DE25D4EE84B8C4A24E32C8ECDFDE4D7F1AFFF00054FF01BFC19FF0082C3F893C41E48B7F0E7EDABFB24FC3DF1F58DF4ABE5C77DF14FF663F126A9F0BFC61A4DAB6DDB3DD27C34F18FC2FD4A521CCA6DAD4891123B581A4FDE7E8D39CD3C9FC61E1955A6A147358665934E4DD97B4C6E02BBC243CDD5C751C2D28AEB29A3F8CBE9FDC2B5F8A7E8B7E203C252956C570DD5C838AA9538A6DFB0CA73BC1C734AAEDB470F9362B31C4C9ECA345DEC9B6BC9B4FF00845A97C49F845FB5E7C5F9D273E0FF00D973E11E973E9C20432A2FC65F8B9737BE1AF0F7C48D4B706862D03F654F0835FF00C7DBE17717D957C58BF0F3C50B7B043E04D5ECEF7839758F0D7866C740B01756B6B0EA1F63D17C25A369E925FEA5AEDC0B655D3342F09687A725D6ADE24D52E2DD238B4CD1B41B2D4753BEFDDC7676B3BBAAB7D35FB26FED17E3EFD993F686D02E7C37F11BE12F813E1DFC764B4F875F132C7E3E2EA367F0875CF1568F6DAD5EFC235D4FC6DA5DD4375F07F5DF106A9AA6B9F0FAD7E224BA5F8CB44D56FBC4BE15F097887C01E26BE97C1DA8F857FA74FD9B7F679F871F0DED6E7C7D1FECA5FB297ECF9F163C4125FC5ADDEFECDF63A17886D755D1EE674B9B6B8B8F8943E07FC0CF126B0FA967ED57D6377E145B58260863D4352DDE72FEE5C6BE33F12783FE28F8914B31C830DC418EE21A791D4E1EC762330C4E130B9764383C3E2BFB330B1C2C70951E270F0AB8BC5CB170C3E2307CF994319275E72A9CF0FE3DF09FE8A3C07F4A4FA3BF80988C878DB1FC1593703D5E2FC3F1CE4D82C9305996639E719E6B8ECB7FD60CC6798CF34A30CBF1D570D95E5B0CB2BE3F039AFB2C82A6554E384A34E8FB2ABFC8DFC44F0AFC70F847A4F84FC57F143F664F8FDE03F87FE379FC4B07873C75E23F09687696B37FC21DE02F127C51F13C9AC78163F154DF187C23FD8BF0FBC19E30F17DE41E31F86DA05E2683E13F126A696CF67A26A335BFE80F857F6B2F02F87BFE088DFB517C0AD663D73C67F14FC29F0AFF006E7F81FE0CF879E09D363F10F892E3C2D61F0D35AF8B7E19F151B59AEECEC3C35F0CFE0DFC1AF8C9F0B23F1778EFC43AA699A0E8535AE8DA1D9DF5E78DBC4FE0EF0B6BBFAC5FB5C784BC4BFB47FC6DB7F80BE104B566F82FFB2F7C70F8D97735E4B15BC56FF18BF685F87DF147F657FD9C6D66924CABE8DA8784750FDAC2E35EDE563B4B9D23C352BAC8B3EE87F94CD53E2F4BFB07FEC4BF15BE33FED11F08356F857AA7ED4FE34F11FC17D07E0FF897495D0BE3FF00ED33A27ECFB6F0FC3D9BE18F8DE2D46C646F845FB23784FC5169ADF883E325F4F697FF0013FE3E5C78F2C7E1969F0783BE1841E1BF1778F3F26CEB8F38D3E90B80CAF83EA64F86CE38EEB71A64781E06C8F8632DC47F6966CF8830D9C61731CBE9E1A78AC4CAA53A589C2E4BC95F994A9CAA47EB329D393AD43FB07C1BFA3170BFD1A7C4BA38FF000E6BF12D5E0FE28E00E22C371CD7E25CD30B8EC3E173AE1ECE384AB70A632854C365D81F678EC7E1B34E2A8D6C34A1F579D1A156AE1BEAAF0F2A18AFE84FC1BAA5A7EC83FB7CE877DF1D3F682F8B1F1FFC29E21FD9A35AF865E1EF8C5E30D3FC397DE0CFD9DBC3F69F1CFC2BE1FF0007F823E256A9E1AB9177A4EB1E28D56C74DD1FE267C7AF13698E7C71F1034FD07FE1696B5E0EB2B1F0068963F8B7FB437C58D63E307ED67FB4A78DFC1DE0DF1BFC54F107C49FDA3E7F067847C2DF0FB4CB2D52E7FB03C27E2BF07FEC81F0BEF22D4F5AD5341F0D695A2FC40D6BC0FA5788F459B56D7F4F86FA3F12788FC49029D1341F166A7A3FA0FEC5DE25D1BC63FB39FC01FDABFE0D5ED8F86FC15E3BF0D6A9F05BF696F0E7C58D1AEFC6FE02FF008591F1062F06FC3FF8B7E26F8D1A3DF39BEF1A7C0DFDA5BC41E18F046AFF001D7C4D67749E2CF04F8867F087ED2305D25A0FDA7FC23F167D13F61FFD94BF684F863E11FF008282EA977FB3FF008CFE1B5FFECA171F00EE7E02F85759BA1ABC5F107C41FB177C73F8ADFB42783FE1CFC3DF880F656317C49D07C4BF091FC09F0BB5AF8A3058E951F89DBE235F36ABA7F86FC616BE2DF0CF857F9FFE8E1E3BE02856F13F3CCBB2FABC3BE2878679DF14784DC53C03C6385A6B3BE04F11B8638BB059071A70EE7B83C1E3254DE699761A86231197CF0F8AAB82C7E598B8E634EACE9A741FEA5F497F0525E3165FE1DF87B9E4B339F8779E71453E23E29CD386F174F0F8BC564F80E13E21CC387234F1188C262A1472BC767CF014F1D5DD0FAC51C551C260E97B3A98AFAC51F987C7BA078FFE0E6AFA6F873E3CFC2FF883F01FC45AC5CAD8E8F63F14345B5D3745D7B527DEC9A4784FE21E83A9788BE15F8E35A10A1B99B46F0478EFC47A9DA5B159EF6D2D91813D17C07FD9EAE3F698F8EDE33F845E1136B67F1235BFD9B3C63F133C11E216CB47E16F8ABF03FC61E1C8FE0EDF78B648E395ADBE1C78AB4FF8C1F19FE13F8C61741717BA57C49B8BFD05EDBC49E1DD2B54D33FB2B80FC39F8E7F0CF4CBDB9D33C39F117E177C4FF09691AE5B58788347B0D7BC33E2BF09F89B4DB4D634B92FB46D62DAE6C2FF004FD434FBAB5BA16D7B6B246CAE9BE3C8E3F10BF6E3F895E2EFD82FE19F8A3E1FFECD7E02FD853F635D5BE33F8E744F09FC2EB3F830E75CF8F9F16740BDF1259E9BE2EF1C68FF0008748F841F053C1DF0EBC4BF0EBE17CBE2BF1EDE78EB5CF107C77F09783EFB468746934BF115EEA9A541A8FF004DE67F493E2DF10386A8F04D7E1BC0AE29CCF37C8564BC459463315829E0F33C267182C560313432C951C64FEBCF13469D25568E3E9524AB4DAC338AF653FE54E1FF00A037869E0A71F627C5CC171F670FC38C8385F8C9F16F037146559766D4B33E1ECCB85F36CBB3BC0E2F8829E2B2BA2B278E07175B112C3E2B25C4E23FD9692963FDA3FACD3FC43F09788ADFC5DE14F0CF8B2CED6EECED7C4FE1FD17C436B657C8B1DF5A5BEB5A75B6A50DADE468EEB1DDDBC772B0DCC61D824C9228660327F7A3FE0DC9D064B4FF0082567C2CF1E5C218EE7E37FC66FDAB7E34BEE0DBA5B3F18FED2BF1420D0AF37313E626A1E1BD2346D420914ED7B7BA8482DCBB7F351FB41F8A74FF00803FB2DFC4AD6BC396F25A47E01F8557FA178174E81AE2EAE0EB5FD8C9E14F87DA35B348D35DDC4F75AFDDE83A5C24B4F752C9329FDF4CD87FEDC7F607FD9F87ECA9FB12FEC9FF00B38C96EB6FA87C18FD9F7E14F807C40A36133F8B743F06E936FE31BF7F2C98FCDD4FC55FDB1A8CDE5931F9B74FB0EDC57D77D30F37ACD7875C3D8BAB46A66586CBB31CDF3574138D3956C57D43034AAD283B4A146A62305997B35249F2A4B78B3F33FD967C31854FC74E39CB70D8AA19063F3DC87863873EB8D4B130C265FF00DB39BE270D89A9072A7531547059B641EDDC2525ED25295DC6516FEB7A28A2BF890FF5CC2BF9F8FF008388FE085F6ADFB2BFC2FF00DB47C27A64B7FE33FD807E2D59FC5CF10A5940F73AA6A3FB3978F6C0FC36FDA4346B28915814B0F09EABA37C4ABB793E58A2F8662545799225AFE81EB9FF0016F853C37E3BF0AF89BC0FE32D174FF127843C65E1FD67C29E2AF0EEAD02DD697AF786FC45A75CE91AE68BA95ABFC973A7EA9A65E5D58DE40FF2CD6F3C91B70C6BBB2CCC7179466597E6D80AAE8E3B2CC6E1730C1D65ABA58AC1D786230F512D2FC9569C256BEB6B1E4710645967146439DF0D675878E2F27E21CA731C9335C2CBE1C4E5D9AE0EB6071B41BB3B2AB86AF5617B3B735FA1FC2EEAFF006ED77C3F65AD781F59D36DBC41632E87E35F87BE239ACF4CD7F45B6F136857767E24F07EAB79A66A367AA68DE20F0F4DA95A587F6CE8DA8586A1A4788FC3D717FA36A36779A6EA3716F2FEF17FC12F3F690F8437C2D743F0CEA7FB3E7C37D43C557DA7784FE247C1AF835FF04E5F8C5FB34EABA57C718F47D17525D17C43F1734CF8B5F11BE0378BEE749D335E5BB9B53F09E94DA3EBBA7EBFA5EBDA66B3A3585C1B19BF9EDD27E1178AFF0062DF8EFF00183FE09EDF11AEEFAF6F7E01CF07897F67CF146AC5CDCFC52FD90BC5D7D763E10F8A61BA90A0D4756F00F9179F08BC746D6210587893C2508324C3518A697D9FC31F13BC75FB3EEB3AFF00C5FF00857F173C5FF0375C8341693C69E28F0A5CE8B71A3EB7E19F0EC1777BFF0015BF82FC63A0F8BBE1EF8B63D0ACA4D49B47D57C45E10D535EF0C5BDE6A6BE16D53476D4AF8DC7FA13E25787F82FA43F04F0BF88FC218BC06078829659ECF114F1F5D51C255C2C25527986538DC5429559D0C5E4F982C57D52B54B61E50A989F6BCB4EBD1C451FF0FBC01F1B737FA0D78B9E21F80FE27E5B9D671C1189E21F6D82AF9361258BCCB0D98D6861E8E4BC4F94E5D531387A58DCB38A3237973CCB09439B1F0AB87C07D594F1182C560713FD4678B3C67A2FECC7FB5EF8D7E267C599E0F0D7C18FDA5BE1BFC1BF04E93F18F55905BF843E1EFC59F84DAE7C4CB687E1EFC4BD7E731E9FE08D0BE24E8DF11F47BCF853E20D665B5F0D6A3E3AD2FC71E10D5358D37C55E29F875A378B7E47FF0082DA7FC12B7E1AFF00C14CBE04784BC49ABFC424F867E3FF00D9B6DFC6BE38F0578D6EA432F84B50F076B9A7689AA7C44F09F8A65B7B5D4A6D2B4CD7EC7C17A0DE69FE34D3F4CD76F7C237BA5A6A11F87BC47A6DD6A9A16A5F066B3E30FF0082A67C6CF87D75AB7C62FDA3352FD967F66FD72D9347F137C4EFDA7ADBE0A7ECADE1DD7F4FD6A1FB19D1B47F0D59FC2ED27F691BBD7AF04ECB168D79A87C15D33C4D0B35AE8BE319647F29BE79D3BF626BDF839F08FE227C2FFD9FFF00E0A57E14F81FE08F8C7E0ABEF01F89EC3F683FD80BF6AAF83DFB287C598B5BFB7269CD3FC6AF8F3F14F59F86CFAF35DEAF72FA3F883C15AD5EEBDE2D6BAB7D0B5FFF0084C7C2B29F0B5D7F1965388CEBC2CE22CBF8AF85FC42CAF29E36E16C750CCB23C6F09E3B1F8FC5E0F1F426B96B61B39C1E02792CBF7729A94618FC550AF4DD4C36260A9549467FEC6641C6F8BE34860FD8F86FC7380E1ECCE338E2333E2DC0E4FC352A345D27384AAF0DE679CD3E2C85EAA8D39C71591E0E70525568AAEA2D2FB33F629F82FE3DF8F7E01D3FF62CD63E1BF80FF653FD9FF41FD9FBE07FC52D67C11A24565ADFC42F887FB337ED033FC44D2FC3DE15F0ECFA378DBC5FE1ED1352F1CDC7C30F1EE8BF177E25F893549FE20411DFDCCF67E00D13C4BE31D13E20685FBA9FB447ED23E14F815A1C1A559DB2FC40F8DFE35B4BFB1F829F00FC3B796F37C41F8B5E2C11186C2C34DD310CB71A3F83ECAFA5B597C79F12B5982D7C0FF0DFC3BF6CF12F8C359D334BB3795BF984F0CE91FF000541F1D78EEF3C7FFB547FC156BF659F855E22D1B42F8EBFB2B78223F81DFB35EB5F107F690F18787AD3E25783ADBE32BFC1EF85DF0CEE7C1BE37F14697E2BF147C23F0A369DF107C2765A978D3C3DA2D8C5AA782349F841AE6ABAE4BA959F84BFB257C57FD9BFC71AA5DFEC2DFB6E785747F8EBF10E3B5BAD7FE0AF8EBE147C46FD88FE36FC4FB5D0ED523693C27F07FF006DEFF85D3E1DF8ABA93C0BE545777DE10F00C362F25BC97FF112CDBCB9DFF09F0ABC15F0CFC3E8F174B843FB3B84F31E37E2BC6F187156619EE61C61C459B717714E71275334CFF3EE26CD25C4B9AE2B1D8AADFBCA95B31C74A12C457C56266E84AB57AD5BEC78C78CF8930B532F94784F8838B70585C0CE8CE7C3F5785B0D3CAE861DC161F0D87CAF33CE7229629387B594A1828D4AB18D3A54E8D2C555A8A953FE8874745FD8AFF627F80FF0A35CF891A1685E2BF85FF06FE107C07D17C7BA87C26F88BF187C37A978C3C09F0F349F0F4BA84FF0D7E1D6ADE1DF19EB561AC5BF85B54B9B4B1B7F12787E55926B58A4D44DC18ECEEFF95DF8B3E2DF057C4BF8A2D69F0AF4BF80F6BF057E1B6A925FE9FAC7C0FF00D8A751FD8AD7C71F1EB493F11BE1B78CF55F17785FC7FE35F883F197C4F2FC30F0E6AFAE781B45D53C57AB785342BBD4FC5DE37167E0FD523D23C3DE2B9FDF3E31FED4FF00F0503D4AEB56F815FB437C60FDA27E16EA73E89F6AF11F80EF3E1F7C3DF833ABF897C3F3DD4FA6CB73A57C5CF855E02D1E7F11E9897D6EF67A8EB5F03BE2B0D0E477FECED4AF26B4BEFB1CFF00206B3AB783BE16F81F52D6F539B4AF087813C05E1BBAD46F664862B1D1FC3DE1AF0F69EF3CDE55B5BA247059D8585A9586DADE2E12348608D98A21FF00443C00F016580CD705E24F1466FC3F8DC9F288D5C7E470C9F34C366B83AB8DC373C7FB4B1F8DA50960E8D0CA9C2A56A74A9D7FACD2C7D1A75310F0CB093A55FF00C97FA6BFD33E19D70E66FE01F877C31C7194714F1354C364BC615B8A787330E1BCD70D9463FD8548E439365189A90CD7158BE24854A384C4626BE0A381C46498AAD47011C7BCCE962B07A9F07FE0F3FED81FF0505FD8DBF6518EDDF50F05F84BC6507ED9DFB45448866B483E127ECEDACE9FA97803C3BAEC0C0433E99F12BE3CDD780B407B6760D3E9DA3EB92A065B56493FBB2AFC04FF008205FEC9BE25F007C11F881FB70FC65F0F5D683F1C7F6ECD43C3DE35D13C39ACDBF93ACFC2DFD977C2F67776FF00B3D7C3AB98240C74ED6358D1355D4FE2978CE1B636C6E35CF1C5AD86AB691EA3E1DC27EFDD7F35F8C7C73FF110FC41CF78868CE52CB1558E5B92C6575CB94E5E9D1C3545196B0FAE4FDB6613A6F5855C5D48F43FBEFE8AFE0EFF00C40DF04783B81F154E9C3882586A99FF0016CE9B8CB9F89F3B70C566145D487B9596574BEAB9251AF1D2B61B2CA3537930A28A2BF2F3FA2028A28A00FC68FF0082C87FC13DBC4BFB5EFC24F0AFC6DFD9EEC74DB7FDB4FF00655975AF18FC0F92EA68B4EB3F8B1E15D4ADE1FF008593FB3878BB50731C43C3BF14B49B188786EFAF648E2F0B7C43D37C33AE457BA5D8BEB934FF00C947C5AFDA1BC032785751F84DF1B6CFC5BFB29F8FFC616967A0788FE1D7ED6DE04F889FB3E5EB685A8DDD9DBF8E7C3F6BE25F18F87F44D1EEAE353F0BC9AE691A47887C31ACEA50DB5E5D59EAD0178A3457FF0046EAE77C55E0FF000978EF43BDF0CF8DFC2FE1DF19786F51554D43C3FE2AD134CF10E877E887722DEE93ABDADE585D2AB7CCAB3DBB853C800D7EB3E1EF8C3C4FE1E65B9D64382A584CCF87B8829D5A798E558F96329FB396230F2C26271396E2F0589C357CBF195F0D28D2A95E0EAC5FB2A13F65ED28D39AFE69F1C3E8B5E1EF8E39FF0009F19E7188CD387F8DF826B61EB645C4792C32BACEBC3058FA599E03039FE5B9B65F8FC1E759660B1F09E228612A2C3CA2F138BA4F10E8626B5297F0E907C57F17FC59D5D7E20DBFC658752D49EDE6B5B6F1AFC2DF1BF8EB5EF1E2E9D76877D8597ED17F11BE27FC64FDA27C2FA5CA4B7DABC2DF0A3E30FC30F869AA018B9F874204860B7CCD3BC21A3683A9CFE20F0ABEADE0AF16DDACAB77E38F04EBDAD7847C77A8ACE9B2EE3D67C65A05FD8788FC416BA8C64C5AD69FAFEA5A9E9BAFDBBCB69AED9EA5673CD049FD3A7C49FF008224FF00C1273E29EA32EB1E22FD833F67ED0B59B97924B8D67E15785AE3E06EB13CB2B19249E5D57E0AEA1E00D424B992402492E5EE0CEEFF003B485B9AFC27FDB2BFE097DFB1CFC01F12EABA57C1DF0DFC6FF0169D6F3C621B3D1FF6C7FDB29E18C1B9BA8BE55BFF008FB78788E28D1724ED550171939FD6785BC7AF0B321CAE5954BC0CC9E8D0AD4DD2C5CE9E6185CE6AE320D5A4B115B3BCA6A636AC1EB6A75F1D5E31BBE56AE7F33F88DF430FA46719F10D3E2487D30B8A7178CC357588CBA957C9732E16C3E575232E68CF0383E12E25A19461EAAB2E6AF83CA3073A9CB18CE2D455BE5CB0F092DA699A9E8126A56B0785F5CB86BDF10F837C11F0FBE0DFC0CF0378BF529649A5B8D53E22781BF673F869F07FC23F1535192597CCB6BAF8A3A378C9F467576F0F7F641BABF37766D3C3D1F87B44BBF0FF0084756BEF06F85AE9A1B8D47C0F650687AEFC22D564B47322DD7897E05F8EF47F16FC0BF155D44A6558752F14FC38D6352D3BCD96E34BBED3EF08BA5F33F83FFB24FC25F19EB165A7789B5DFDA1F56B2B8D552DE6B797F6C0FDADE14784A41F2136BF1BE061FEB1FE6560E3770DC0C7F465F07BFE082DFF00049FD5FC2FA178ABC59FB2ABFC44D66FA3B6BABC6F8B1F1DBF695F8B9A6DCCD18DCAD3683F137E31F8B34191339DD0B69A619012B246CA483E854FA40784586C9AAE4B9778199556C0557394F098BAB94D084EA4F5F6B3C54729C7629D68BB7B3ADCDED6928C1529C1463CBE2D0FA12FD27330E29A1C599EFD3138930B9CE1FD942966795E1B897155A950A4A2961E9E025C4D93E5D1C34D45FB6C27B3785C44A552788A356556AB97F333F15FF6A9F87FA078F7E1CEABF15BF687F84B14BE0CF0D78CBC0B6DE188BE2B7C61F167896EB49F155F785351D334DF0BFC31F1F7C64F8DF73A2CFA76AFE13B54B6D27E1B59F82BC1B6D6FAD6A3A7689E03D39469B141F657EC5FFB16F8FF00FE0A77F1EFC0A7E217C23F8AFE01FF00827AFC22D4741F8A9F1335CF8B9F0D3C69F0B57F6B9F18E8FAB9BEF873F06FC13E1DF883A2F87F5BD7FE0FD9EB1A547E30F8B3E233A43699AD5AE9DA47822D9EDA6D5E6BE8FF00AE0F825FB19FEC8BFB35242BFB3D7ECBFF00B3F7C1296189A217BF0B3E107807C0DA9CAAEA5646BAD5BC39A069FA9DECB3292279EF2EE79E7C9F3647C9AFA52BF2DCE3C70CD2A708661C03C2390E5FC19C2599623135B1183C263F36CD73054B193A7531782A5996638A7EC7018A9C24F1187A585873C6AD7A6A71A35AA5397F4570B7D10B8768789F91F8D3E26F19E79E2B78999060F0385C0E6B9964DC35C37924B139651A9432CCDF139064596C3EB79CE5B4EA456071B8ACC6B7B19E1F0988952A98BC261F134DB1C6912245122471C68B1C71C6A1123440151111405545501555400A00000029D4515F879FD7C145145007FFD9,'SMA',0,NULL,NULL,NULL,NULL,'2010-03-02 10:07:22',63030,0),
 (5,'Sekolah Indonesia Membaca','www.indonesiamembaca.net','info@indonesiamembaca.net','Jl. Pendidikan No.1','Jl. Kebersamaan No.1',NULL,NULL,'(022)1234567','(022)1234567','(022)1234567','(022)1234567','(022)1234567','(022)1234567',NULL,0xFFD8FFE000104A46494600010100000100010000FFFE003C43524541544F523A2067642D6A7065672076312E3020287573696E6720494A47204A50454720763632292C207175616C697479203D203130300AFFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC0001108005A005103012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FEFC988519278CF51CF3D001CFA8C670BD38E2BC4BE2C7C70F087C2D84A5F48FAAEBD2C3E65AF87EC65885D32B676CD792B178EC6DB39024951E493FE58C52E0D77DF107C531F82FC15E23F14CAAAE745D32E2EE38642025C5CED115A40D92B913DD490C380CBB8BED0466BF16F5FD7B53F12EB5A8EBBAC5CC977A9EA77525DDD4F231DDE6392CB1C4A4911C30C6C218954FC91284042600FD3BC37E04A5C5989C463332A9529E5197D4A74EA53A32953AD8CC4351A8E82AB1B4A95185394255E706AA7BF0841C79DC97E63E2371C55E16A187C1E5D1A73CD71D0954854AB18CE9E0F0E9CA0ABFB369AA956A4E338D18497227094E5751E57F546B3FB64F8EAE670DA0F87BC3DA4C03EE8BDFB66AB337FBEE93E9F1E71FDC81707DBA62FF00C3617C5CFF009E1E11EDFF00308BDFC3FE62FEE7F238F7F2CF067C14F895E3DB1FED4F0EF87649B4D2E562BCBCB9B4D3ADEE4A8C936B25E4B0FDA11463F7880A123018918AEDBFE195BE3471FF0014ED871C7FC8C3A27AF3FF002FBEDF974AFD9A7947853964E582C44385A8D6A1270A94B198EC3CF13092B271AAF1589957E64F46A6EE9B69D99F904335F1473084319879F1356A35E2A74AAE13078C5879C5F2B4E9FD5B0EA8F2BD1A74D28B4F9968D3374FED83F16CF583C207D8E917BD7A7FD05B19CF1F5A3FE1B0BE2DFF00CF0F08F1FF00507BEE3BF5FED6C7607F2EF5843F656F8D1C7FC53B61C7FD4C1A276CFF00D3EF7EFEBF42721FD95FE347FD0BB63EFF00F150688720763FE9A7239FE7EF52B0FE117F37067FE1665FE5FF004FF5FC37F41AC4F8AFA5A3C61D2DFEC999F97FD38FEAEFCEDB87F6C0F8B6411E47847A11FF00207BD071D38CEA8C38FA1FD4574BE1FF00DB33C5F69201E22F0CE8BABC271E61D3A5BAD1E60B93908647D4A2DC0608DD1ED72B8DF1753E78DFB2C7C68504FF00C23B644FB788345EF8FF00A7D039EFF8FD2BCFBC6BF097C7FF000FEDE2BBF146812D8D95C48B126A16F736B7F62B39E4432DCD9CB347148CA311894C6B210C10BBAED2E39278539BCE380C343862BE22BBE5A54B038FC353C54A5A35EC5E1B130AD29BB3B460DB6AF74D3B0A79C78A5965378DC454E24A187A36954A98EC0D79E1E314A2DBAB1C5E1A708C2CF5934A3ABB494B6FD4DF865F183C1FF142C1A6D0AE9ADF52B640DA86877CF1C7A9596EC2A3140C52E2DDCF0B3C0D2479F95CA3F15EB00A93CF6CFAFE5839C71CE7803B7635F871E0FF00166AFE07F11E9BE26D16578AFF004CB949428DE23B8B71959ECE74574F320B98B31CB1960186DC1539CFED8787F57B7D7F44D275AB5398356D3ECF518704711DE4093A29218E0A87D8C338C838C715F89F88DC0F0E10C761AAE06AD4AB94E63ED7EAEAB7BD570D5A9284A7869D4BDEA45466A746ACBDF9C14D4D73C1C9FED1E1EF1ACF8AF0588A38D853A79A65FECFDBBA4B9696268D4BAA788843EC4B9A2E35A9C6F0849C5C1F2CD25AD91E83F5FF001A2A4C8F7FFBEC7FF15457E707E8A7CCFF00B58DD4F6DF077518E262AB79ADE876B718FE283ED2D7463C671CCB6F13631C15F51C7E53F242E46480A0E0E0F00649271D48CE3DC0C82B5FAA3FB5CFFC920B8CE48FF848F44EA39E1AE40E7A76FEA6BF2B8FAF1C67A0E87B64E08CF3CF3827A64F5FEA8F06A315C2355A8A4E79C631C9ADE4E3430914DFA2D1791FCBBE30CA4F8B29C5BBA8E5184514FECA956C4CA56F569367EE4F8434CB4D2FC33E1CB0B28560B5B3D134B82DA240155238ECA15503A127192CC4E598924EE25ABA46902F52464FA313D48E3D8700E30475E82B27446DBA0E8C41191A569B9CE7FE7CE1CF3C741C7078E9C739F97FF68BF8CB7BE17117843C31722DF5CBCB65B8D46FD023CBA75A485FCB82DC927C9BCB98F2FE6942D142C8F190EC0AFF000178EBE34707780DC09C45E24F1CE27111CB32CAAE9D0C1E1230AB996779BE32ACE382CA32DA756AD1A7531B8DAAA7372AB561470F42962317889C28509C97F5CF08F0D63F89F1F96E479553A6AB55A34EF3A978D0C261285387B5C4569463271A3420A3B26E52F674E3EF4A27D17ADF8F3C19E1B611EBBE26D1B4A94F48AF350B78655079CF945FCC5EBC860381C9C74B3A2F8BFC2FE230C741D7B4BD5F626F22C6F61B864438018A46C582E782597078CF39AFC6992592E257B8B879269A425E596691E5964720E5A592466666E724E739E49E4116F4FD4AFF004ABCB7D434EBCB8B2BEB6912582EEDA668678DD18100491ED728700152C770F94E54915FE3CE13F6C47123E268D4C7782F914783A588E596130BC4F98CB8928E11C92F6AB32AB97C72CC4E22116E6A83CA70B4AA38AA5F58A4A4EAC3FA36A7D1DB09F526A8F12E21E62A9DD54AB81A71C14AADB48FB18569578536F472FAC54925EF7249FBA7ED50915B014E4606301B0791CFE7D4F18EA706BCD3E3369D6BA9FC2EF1C5ADDC31CF10F0EEA57011F076CD6901B98245EA55E39A28D9597041070769AE07E007C5997E2268F2E9BAD4919F12E86234BC915122FED2B3DAAB0EA0B126D55937910DD2A2222CA72AAAAEA07A67C55FF926FE39FF00B15B59FF00D2297FC8FD063A7FB51E09F8A3C2DE30F0B704F895C0F8DAB8AC8788AAE0B17839D6A71A18EC0E268E3A387C6E5F8FA11A95561F30CBB1B46BE13174A352A538D6A3274AAD6A2E9D59FF0030F19E458DC83FB7F24CD68C618AC2E171746B417BD4AAD39E1A52A75694DA8F3D2AD4A71A94E564F96493B4934BF1489E4918F98F18E3923A8F4CE71D38E09F7FD81FD9DAEEE2F7E0F782E4B870EF1585C5B2B124662B5BEBA821539C1CAC288BEC063A703F1FB8C0FF00807E1D38FE647B13D3BFEBC7ECD633F06FC1FC67F737FD31FF00412BAF5F7C67DABFB3FC6F8AFF005772D9349CA39DD28C64F7519E0B19CC95FF009B9637EFCAB53F98BC186D711E60949DA593D57257D1B8E2F04D37E6B9A5E9767BB607B7E63FF8BA299457F319FD2E7CCBFB5D01FF000A8271E9E23D0F3939FE3B938E704E7E8073DC9AFCAEFA81D4E4E073C03C8CF73D7DB9E319AFD51FDAEBFE490DC7603C45A1E303D5AE7B63839073FCB835F95F8EBEF9C8E7AF7E719ED81DBD0722BFAA7C1BFF0092427FF637C6FF00E99C21FCB7E30FFC95B1FF00B14E0FFF004EE2BFAFE91FBABA363FB03471FF00509D37AE08E6D2139F5FAF4E3AF18AFCA7F8C9737175F14FC7125C871243AF5DDB45BF7656DED76DB5B6CDC490A608D0AE303690000302BF56B4350FA168AB9C674AD3B3D3B59C5D8609E9DCF43C7522BE09FDA8BE1C5EE8FE246F1D69F6EF71A3EB91C0BAAC91200B61AAC4B1DB234D991B6C37B0A46C936113CF4951B04AB37F83DFB5878138AB8B7C03CAB3BE1EC36231D97F0271E51CFF0089F09864E72A19362B2CCD32859CD4845394A86578BC6D0862656E5C3E171D5B175651A187AD387FA19E0066981C0714D4C2E3274E94F35C97EA781A951A4A78A8D6C2D75864DD929D7A54EA7226FDF94153F8A504FE4E1DBBE33EBE87BFB671DCF5E339C2FB8FE473DF1E9EDC76E4537F1008E7FAE3A8E0F3F7B19E4E001C387BB28C72727DC83D7AE3B0E39E3815FF003709393B24DBD5F77A2BB7F2576DF45AB3FB42EAD7E96BDFC8FA0FF661B9B883E2CE970C2CDE5DEE99AE4172AA5829B78ECDAE97781C122E61B7605BE5E14A8DC057DF3F1549FF008571E38CFF00D0ADAD7BF4B293907DFBE38E075AF99FF655F8777B672DDF8FF5581A04BDB46D33428650C924B6B23A4B75A8EC2015490C296F6E590096232C89232ED2FF004CFC56007C37F1C633FF0022BEB5FA59480FE647F8715FF511FB2E38178A381FE8E3C2EF8A30B89C0D6E2EE3BC7F18E4F80C5C254B1186C8332591E032EA93A33F7A953CC9E575B37C326A3ED3079861F10A295657FE12F1FB34C0E69C4B9CBC0CE156397E48B2DC4D6A6D4A15319429E2AB578C66BDD93A1F588E1AA59BE5AB46706F9A0D2FC50EC3DF67A93DBF2FFF005F735FAF1FB359FF008B37E0F23FE78DFE3DFF00E26577EE3F4CFD0D7E43F61FF003F4E40FFF00574EFEF5FAF3FB358CFC1BF08673FEA2FF0038EFFF00133BAEDC9C57FB29E377FC937977FD8F687FEA1E38FE1CF063FE4A3C7FFD89AB7FEA5E00F72A2A5D83D4FE9FE1457F311FD307CC1FB5C06FF85417000248F11687D3A005EE3AE33EC3380339EA4935F95C392783C03DB1EFD78E79F41D7927AD7ECAFC72F0D4BE2DF859E2DD22D60FB4DF0B04D474F84005DEF74B9A2BF89225207EF25103C0B83CACA40CF4AFC6B20E4AE31B09520F0DC31F9594F465C6DE7907A8073B7FA83C16C5D2ABC358EC1C64BDBE1734AB3A90E65CDC989A1869529F2EEA2DD2AB1E69593946CB5B9FCCBE32E12AD3E24C1E2E49FB1C56574614E766A3CF87AF5D558736CE4955A72E58DDA8C9B7A58FDD7D0195B43D14820E749D3B186E0FFA1C272319CE40DD91C74EB9CD5CBFD3EC754B59ACB51B482F6D2E62686E2DAE6213432C6C30C9246E0860474C8CE4641DD823F3F7E187ED6B6DE1DF0EE9DA178CF44D4B519F4BB482CAD754D2E486496E2DADE110C2B770DDCD120B945011E459B12A2AB105F8AF4EFF0086CEF87DFF0042EF8B3AE4FEEB49F6FF00A8A63B7707F3E4FE2D9BF865C572AF8FC0D7E1F966383AD3C4D19F2C70F89C1E370B59CE0D4E9D49B8CE9D7A53E5A946AC3E193854859B4FF60CB7C48E12A985C257FEDBA383AEA95194A95555E957A15A3083945B8D3B73539E919C24E2DC54A2EFA2D7F11FECA7E05D5AEA5BAD26F35AF0F199CBBDADABC779631B1392B045751B4D121EA105CB46BD15428C55FF000B7ECC3E02F0EDDC37FA8FF697896E2DCC6F0C7A8B245649346772BBD95A246B31CE0AACD23C7D9A32706B99FF0086CEF87A338F0E78B067FE99691C7181FF00313ED40FDB3BE1EFFD0BBE2C3F58B49F5CFF00D053B71F957F2FE17F67AF82183E258F1761BE8E5C274F3B8E2D63612FECC53CAA9E294E35235A8F0ED4C74B87A84A13E59C151CAE9C213B4A314ED6FBE9FD212BD4C13CBE7E23D79615C15369E22AFB770B59C5E315058B95D7BADBAEDB8FBADB8FBA7D736D0436F0430C512C51C3122471C6A112248D76A222001542A80AAA0000003005709F15D97FE15BF8DC92067C2FAD75200FF8F390639C1EA401C0CE46726BC01BF6CEF87B8E7C3BE2C03FEB9691D49EA71A9FF2E7AF2735E2DF18BF6A45F1C7872F3C2BE14D1EF349B3D4D3C8D5350D4A68C5EBDA178DDEDADA1B6774884EA8D1CB23C8CDE59654C0635FD5990F871C59FDA995D39E4B5F0585A18CC1CEA57ACE852A142850AB4E72768D4D5C69C2D1A74E2E57E54A296ABF37CEFC43E138E5598BA39C61F1988A984C442950C3C6ACEAD6AD5294A105AC22A3194E4B9A739462A3CCD36D58F8E4105548E41D8723DC020FD08C633EA3DABF5EBF66B0C3E0DF83B208CDBDF30C82B953A95D10467A823A1F4E464815F91B6F6D35E4D0DB5AC325C5C5CCC90DBC10AF9934B34B2F97124718396791F840325B0485C6457ED8FC38D01BC2BE09F0BF87190472E95A1E9D6F72AB8DA2F0DBABDE73819DD76F31CF2402B9CF39FD47C70C552864F93E05B5EDABE673C5C637B3F6586C354A729DBAC653C54126BAA6AFBDBF34F05B0B5259CE6D8C49FB1A197470F29747531389A55211BECA4A186949C5EB669BB5E37EE371F4FF00D0BFF89A29703DFF0033FE3457F359FD1E4120DCB82A3031F2F5E412738F63C81D320633C1AF833E387ECC17FA8EA57FE2EF8750C53497D23DD6A3E19CC70B9BA97CC927BBD2A79EE238712BA8692C6408C2467681DB78893EF369546DCF19E4607238031C631D5719C0259453BCC041C720E390738E7208C7B10477C63AF02BDEE1DE24CDB85F1FFDA195578C27282A55E85587B4C362A8A929BA55E9DE2DABABC2709D3A94E5AC66B54FC0E21E1BCB389B05F51CCE93942327528D6A6F931186ABCBCBCF42A6A95D69384E1529CD6928ECD7E1E6B3E06F18F87E5F2B5BF0B6B9A5C9CA8177A5DD20623270B3343E5BF009186C91CF4AC43A56A4339D3AF060F7B39C76CE3FD5F5C0CE7D0938E057EB6F8DAFFC7B6FF123E1FE8BA0DE5927853C4EB7E35F3736504D73A327861DB5AB89ED6496C6E0487C4B67347A0BADCCD1C764214BDB322E15F7713E0FF887E27D77E2F78C7C357D637D67E07D4EDF54D37C05AB49E1FB2B5B54D67C0D35B69BE259EDB5678E4FED63AC5FDFDE4D631DDFEE6DA0F0CCAF0C7243A8653F5BA1E39E2A34E2AB70ED09D449734A9665528C24EEB58D39E0F1128DF5D1D593F3B1F9457F04B0B2A8DD0CFEBC29BB351AB9753AB357697C70C55183B593B2A51EACFCC83A5EA20FFC83AF79C71F639F38E7A7EEF27241F5E871D290697A811FF20FBC3C64E2CE7E9D7FE79F0300F5EC09CF15FA331F8C3E2A5BFC1ED7B5CD46482E3E226B7E2697C05E0CB4D07C39697BF61BED37541E0FBBF12AE973DB5B2DEBCF71A37883C7D269F772FD96DB4A7B5D2D32B102E6B5F13FC48DE1AF825E224BC5F0FDD6B5A943A6F8F7C2434AD313C4FAC6BD06A7A3E81A9E93A3DA6B1A65D5B5DC7A66AEFA94BA9E8BA6DFE91E229F49316B1A45EBC1A45DD85EECBC74AB7D786E16DBFE46F25DB7FF0084EF5D7E7AEA65FF0010429FFD1453FF00C352F2FF00A8EBFA69D3A5B4FCE7FECBD44F4D3AF793818B49C1CF39E4460F4E78C703BE6BA3D0BE1FF8E3C492AC3A1784F5DD4C92A0343A75C2C2379C066B998436E8BDCB349920138239AFD1B83E21F891FE3DCFE19934BBD5F86B25A49E0CB4BD6D021FECF3F10EC74A4F154B7C75EC35C1B7BCD265BBD092CE551689A8E901A32D2DEE5B98F815F12FE287887C6B6DE14F1CC4ED67FF0008AF8BFC516DA9C5A1C5A6D8EB1652F8B749D3BC369E7476E9126A5A246BE21D22F2D2D991AEADEDACF57BA8DDAEA190E35FC72C5CA9C961F87B0F4EB5BDC957CC2B6229C5E9ABA74F0B8772B6BEEBAB0BE9AB7A1B50F04B0D19C7EB19FE2274AE9CE343014A8CDDAD75CF57155A31BAB24FD955B6CE3657507C07FD9B1BC237963E31F1C8B79FC416EC24D33448B64B6BA44C4B2ADDDD5C46CD1DD5FAC6CE62D80C36E5B7879260ACBF688455CED1B7E5033CF6C81CF538C0F5FF001844E8A8BC1F98657AEE61C738FBDDD7A77650319E1E25047423A81821B9C9F4C8EC7E98C115F8FE7D9FE67C499854CCB35AEAAD79250A70A71F67430D463F0D0C3D2BCB929C7BCA53A937EF54A9397BC7EB99164396F0E602197E5945D2A2A5ED2A4E6F9EB622B356957AF52C9CEA4ACB44A34E0972D38423EE93515179C9EFF9515E31EC9F19FC71D6FE37DA7C43B1D2FE184FABC766B6DE01D4A3B68B4886E746D4EE2D8FC53D4F5ED16FF50B8B0921B1875F4D03C29A25FDCADC413DA45A8D8BC4F6F24C864F1AF09FC4BF8F7AA8B2D4E0B8F88FFF000975E41E15BDD0FC0DAEF840DA6817FA56A6FE309BC4C75F9E6D0208F4DBBD2AD60D2364ADAC594F0DE5B58DAC76D73FDA2E973FA647AB7E1FFA0B537F89BFE05FA038A069A5BABEB7DFD34D8FCD7D4FC67F1F049E0EB8F875AEFC43F14DBC72F85F5CF17DBF8B3C1F6FA4B5F6BF67E08F89BAE78BBC016924FE1AD1CE9F69AB5CE8BE1AB48647592D745F11DEE916D1EAC7ED4F67267786FC7FF1A759F0FF00886F75AF18F8C3C2FAC49E15F8677DA25B6A7E17F125B5C6FD4F4BF02EA3E26FB4697A6FC36D622B296FEE2EF5AD1AFB5A92EAF6F3C357B797335C6826DF4C9187E9D0EA7D9323D890327EA69C7AE3B640C7B6538A0775FCABA5BFAD9FDDF79F9BB27C57F8FC5ACEEB49F0BFC4ABDB3D13C4FA0F8BFC456B79A16851DDBFC3FB5F87DF09CEA3E1CBD7BF83C3ABA85CEABAAF887C73A93AF84ACEEB5F8B5FD04DAC3A44567E6DB41D37C62F1C7C7DD1FC7FF10B49F0347E259FC37E2AF05681E1CF045F58F87A2BBB7F01F8BE5D3AFF00C43AA78BE1927D3675BA32F876D75C8E25D49AF6CEDFC51A578674C7B38E5D726825FBF0751F45FE4D4E3C74E3951F8647140AEAE9D9696BAE8FFAFF0087B9F995278C7F685BEF0F78B5F48F1078A478EEDFC6BE075D0F47B9D16E4427428E3D06EB55B5BCB3BAF065BE9169A3EB937DAB4CD4753B3D7750BB82DAF6F6609A7BDBA4CBCBF8AFE2B7ED2B7FFDB3E27D2E4F1AF8534CD7F556F11783FC393F846FE3B8D1B416F02EA971E1CF0DDE4767E0ED7EFA7D6B56D46C34FBDD4AC35110C706BBAAC9A3DDEA3A75AC488BFABD4503E65FCAB7BFE575F87CBF3FCEF4F89DF1BAEF5AF12C9AEE8BF11BC21E08F17789B44D5B44D5E0F0EE8F7BA87843C03A2EBB7DE15D7E0D121D213C45A9DB5D6AD0FF00C215E20BB3E28D3135688F88BC5D7DA3D94BA6E8866B5F43F87BE3FF008977BF17E086E2C3E216A7F07352D225F04E81AFF897C3DA56962EBC57A169D63E223E29D42DA34B0F1659B6B6B3F88FC3F3DD6A9E1AD2FC3B23E89A1CB63772DEEA5711C9F66D1409B4F656D0CBFB44DFF3EEDFF7D2FF00F15456A51408FFD9,'yayasan',0,NULL,NULL,NULL,NULL,'2010-03-02 10:07:22',55385,0),
 (6,'Perpustakaan Umum','','','',NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,0xFFD8FFE000104A46494600010100000100010000FFFE003B43524541544F523A2067642D6A7065672076312E3020287573696E6720494A47204A50454720763632292C207175616C697479203D2037300AFFDB0043000A07070807060A0808080B0A0A0B0E18100E0D0D0E1D15161118231F2524221F2221262B372F26293429212230413134393B3E3E3E252E4449433C48373D3E3BFFDB0043010A0B0B0E0D0E1C10101C3B2822283B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3BFFC0001108004B006403012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F66A28A2800A64B2C70C4D2CAEB1C6832CEC70147A9358FE25F1569FE19B64371BA7BA9B22DED22E6498FB0EC3D49E05798EBFAADEEB086F7C4B362D54E63D3A027C943DB71FE36F76E33D2B6A5427576DBB9C989C5D3C3A5CDAB7B25BB3B2D4FE25DAEF6B7F0F59B6AB20383705BCBB653FEFE32DFF000107EB5CCDE6A3E22D609FED2D6E58A33FF2EDA7FEE107B16FBE7F3AC75BC9EFA2D9691B476F2AED8A4442A5392AC0E7EEE061874E98A769FA7DD5ACC2EAF2E558F96C1C6E240CED3D4F4C10DF9F6AF528E16946DA7379F43E7B1598E2269AE650F25ABFBCB56B646C1CC9A46A37BA7C9D4982E18AB1F5656C86FC456FD878EFC41A610BAB59C5ABDB8EB35A8114E07A943F2B7E045719168713D8C9690DF4819A08D0654824A0215F07AA927231C70306A79E1D52D6E259A398BC736DDD805BCB3939217B80A000077E6AA7429D48DDC2DE688A58CAF467CAAADFCA49F97CFB9EC3A1F89B48F1142D269B76B23A7FAC858159623E8C87915AB5E0D15D5B5E4F0C923C963A9468EEB7309F2DE250D8193DB208F94E47245775A078FE6B49A3D3BC52517790B0EA68BB6290F6120FE06F7FBA7DABCDAB86941734755FD6E7BD86CC21565C935CB2EDDFD1F53BFA2901C8C8A5AE53D10A28A2800AE73C5DE2C8BC396D1C16F18BAD52E8116D6D9E3DDDFD1077F5E82BA3AF195792EFC41ADDEDD3B4B73FDA135BEF6FE18E372A8A3D001FE35D186A3EDAA289C38FC57D5683A895DEC88DB75BC936ABA9DC3DD5FCFF00EBA72A49FF0075547451E83B0CD47A6C92DCB4D279F1DC5B487D4361B03852382B8FC47BD4BA9C3035AB5C4FE6E6052EA6272AC0E3B63BF6AB50ED30A146DCA54107D7DEBDF8D351928AD123E2AA567383A92D652DDBFD075BC28FA8595B492182D24956277880DEBB8ED5C64118C900F1D0D6FC9E1FD3EC6D35469223713E9F7D048934FF00337940C4FD3A01F7D781CE0E6B9CB94792DA448CE242A761F46EC7F3AEE6F163BFD2EF755773158EA7A3A87751B9A36C31042F73893FF1D02BCDCC79A32567A33DFC8BD9CE9CAF15CC9EFD752D6B5A7DA6A9E20D2ED2F2DE39A3586E2621C67A796BFCDC7E55C5EA3A5C365A15A5FDADCCE66BEB8736F0C8C1A310EE62A49C6EE136F393C915D619753B9BF99A7B65B6D4BFB3A6FB0C41F72B0253396ECCAC1011D390413CE39FF14AA5BEA963A6427F75A6D82C6BFF000238C7E51AFE75C984E6755462EC7A599FB38E1A539C536B6BAEFA1CE5F69B15EE198957E0123F88039DA7DB383C63A553B2BA6957EC1A9A6F79F7908C9F2AA0C0C127AE49F7EB8ED5B3599736D6F73ACA0324B1CCB0EE263C025777037751D4F008AF7AA46CF9A3FF000E7C750A9CD1709ECB55E46F7863C512F85668F4DD4E66974591824170E72D664F4563DE3F43FC3D0F15EA0082010720F7AF2192349A268A440E8E086561904575FF000C2E279BC2B2432CCF2A5A5ECD6F097392B1AB61467BE3A578F8EC34693528ECCFA7CA31F3C4C5D3A9BC7AF7FF00827614514579E7B815E3D2C7F66F147886D586197516971ED22AB8FE66BD86BCBBC616DF60F8832498C26A7649203EAF192A47FDF256BB3032E5AEBCCF2B37A6E78395BA599596C9AEB4FD4EF0E7CAB080631FF3D1F80C7D907CFF005C1ED50978A2545C800E1514725BD001DFE82AFE8DAA5C693AB218AE6DE182EFF7728BAC88D986766587DC2724679EA060F18EFF004AD32DAD54DC7F64E9F6572F9DC6D006C8FF007B6293F957655C4CE8569DD5EFB7A1E661F2FA78DC2D3719592BDFD7AFF5D8F35BA86FACA38E5BAD32EE18652DB247403A296395CEE185527903A1ADA8759822F86BA85838796E2386EA08E28C6E6DBB4B83ECAAAEB927DBB902BA3D6A19754D4858438FF46B396739FF009E922B451FE18F37F215E74F7A7C3BE1BB9BDD46CDADDAFE430AC0EB89AE447F2EC6FEEC40E4B776DD8E0609E6955A98A4A16BCAFA5BCCF4F0D81860EADE9DECD3BDFCAD6FD4ED6071A278A91AFB50B8BD8DED0C4B7120056DC798005623A1271963D4E338E2B95D4EF5EFB5EBF9E1865B879EEB6224433C02225E4E0004A83D7B93D8D4FA0CA93E9165AB59308E2950C17693AEF4DED8572E3BA390BB8F5070DFDF0D3F87F46D46D2DF5A63A7CB01D3CC46D918E7CC30C8D20556FE20576AEEEFBBB1C81C582C5A5CF24AD28DE2D3E8D3B3474E3B0BF5851A72F85BBBB7A3B7E267DCC7716322C77F6B359BB1C28997018FA0619527D8134FD3B4C3AB6A92D9C3813B5AB4B1BFF764461B33FEC9DEEA7FDEF6AF511F66D42C958AA4F6F3A06019415752323835C9F882EE6F0E59496FA6DBE95A5B5CC812116FCCD28CE0B040AA1485C9C92C063BD77CB1B3AB0E4B6BA6A79D0CA2961EA7B652F752774FB5BB9C943289E08E50081228600F51915D8FC2E8CAF81ADE73D6EA79E7FCE56C7E805707A9CCBA6E893BC631E4C256303D71851F9E2BD63C39A6FF0063F86F4DD37186B6B68E36FF007828CFEB9AD73297C317B9CF90D35FBCA8B6D12FEBEE34E8A28AF24FA50AE2FE2769ECFA1DBEB512E65D226F39B1D4C2DF2C83F221BFE035DA5473431DC41241320922954A3A30E1811820D38C9C5A6899C14E2E32D99E44FBA4883C0EA1C61E27C02030E41C7423DBB8AEC7C23AAD9B62389ACE06908496DEDF4B7808970382FB8A1EBDBD6B8A4B29741D52EBC3D7249369F35B3B7FCB5B73F70FD47DD3EE2AD43773E9923DE5A5E4968E17F78E8461947F794820E39EA38ED5EDD7A2B154D5486E7C9613152CB6BCA855578DFF00A7F33D0669D349D7E5BABB223B5BE8A345B86FBB1C885BE563D810C307A6411D48CE6F8FBC1F6DE2CD2E295EE3ECF3590692390FDD2A402C0FA6768E7B63BD63493F8AAFED0BDE6A4DA758B8C3CD7823B75607B01B77E7DBE5CFAD525D01AC6C27B5D3FC4B1DA4573198DC5D69B3456F2E7A7CEEDB73CF51D7DC715E545CA8C94E12B49763E9E155D4FB0EDE7A7E1B9A9A0585C6A56ABA2BDB45A75925B452B46BCBC90C9B800304819DAC0B1E7DB2735D7EA7AAC5A744100F3AEE5045BDAA1F9E56F61D87AB7403935C0449E28B8BA371AAF8AEC2DDD565B48FECD685E771B86FD8AB82725072391DB6D2D968B77A55CB1D0B5B8D6F26E5ADE485AD65971E8936E0DF90FAD7261F0B4A9737268DBBBDDDDF76F535A9566ADEEB7E963B64FF00890F86ECED1EE51248208E0594C2D2A9655033B54827A1EE2BCF2F6682EEFB1689682D20390D6D606D77CA372924312C76824738EA78E86AE5F6B1E20766B0D46F2F2DD8AE5E2312C45874E1D473F556ACC91E1B3B66762B1430A64F60AA057B783C259FB59B5647CDE6999F345E1E9A69BDEEADF2F98EB1B1FEDBF16697A481BA28E4FB6DD7A79719F941FABED1F81AF5FAE33E1C68D2DB69B36B97B194BBD54875461CC500FF0056BF5C12C7FDEF6AECEB831357DAD572E87B380C37D5B0F183DF77EA145145739DC1451450072DE39F0CCBADD8477DA72A8D56C32F6F9E04AA7EF447D9874F438AF36BDD4EDCC0D697CB269D34802B457D1B4271FC432463A67915EE551CD04371118A789258DBAABA8607F035D347133A49C56CCE0C56029626519BD24BAFF99E4A2F26BD93ED02F4336302486462F8FF00AE8CCCE3E8AC07B5356048DCC916E8A53D648D8AB9FAB0E4FE35DF5D7803C2778FBE4D06CD18F56813CA3F9A62B90D77C23A369B33259C5750A83D16FA7FFE2EBA69E2E8C55BD99C15B2CC5549737B77F97E4CCF5876A3465808DCE5A38E24891CFAB2C6AA1BFE059A558845198E1731467AC630633F58D8153F88AAF63A2DA4F205964BC604E31F6E9BFF008BAEE2C7E1CF84DE04965D2BCF73C9F3EE25901FC1988A7F5CA0A3CAA990B2BC5B9F3CABBBFCFF00CCE0AF358B78EEA07BBD46DC7948D184F39D98838C00ACCD8E476C0E7A56A683A0DC78B75487ED169710E896E44B2B4F1347F6B607E5450C012B91927F0AF4AD3F42D234AC7F6769767698EF0C0A87F302AFD73CB14F91D382B23BA9E5D155957AB2E692F45F8080606052D145721E9851451401FFD9,'P_alls',1,'alls',NULL,NULL,NULL,'2010-03-25 13:22:39',22308,0);
/*!40000 ALTER TABLE `identitas` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_identitas_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_identitas_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_identitas_100` BEFORE INSERT ON `identitas` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_identitas_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_identitas_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_identitas_100` BEFORE UPDATE ON `identitas` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_identitas_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_identitas_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_identitas_100` AFTER DELETE ON `identitas` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'identitas', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `jenispekerjaan`
--

DROP TABLE IF EXISTS `jenispekerjaan`;
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

--
-- Dumping data for table `jenispekerjaan`
--

/*!40000 ALTER TABLE `jenispekerjaan` DISABLE KEYS */;
INSERT INTO `jenispekerjaan` (`replid`,`pekerjaan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (14,'PNS',NULL,NULL,NULL,'2010-03-02 10:07:22',10914,0),
 (15,'Wiraswasta',NULL,NULL,NULL,'2010-03-02 10:07:22',53173,0);
/*!40000 ALTER TABLE `jenispekerjaan` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_jenispekerjaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_jenispekerjaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_jenispekerjaan_100` BEFORE INSERT ON `jenispekerjaan` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_jenispekerjaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_jenispekerjaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_jenispekerjaan_100` BEFORE UPDATE ON `jenispekerjaan` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.pekerjaan <> OLD.pekerjaan THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'jenispekerjaan', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.pekerjaan, oldpk = OLD.pekerjaan;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_jenispekerjaan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_jenispekerjaan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_jenispekerjaan_100` AFTER DELETE ON `jenispekerjaan` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'jenispekerjaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `petasekolah`
--

DROP TABLE IF EXISTS `petasekolah`;
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

--
-- Dumping data for table `petasekolah`
--

/*!40000 ALTER TABLE `petasekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `petasekolah` ENABLE KEYS */;


--
-- Definition of table `sekolah`
--

DROP TABLE IF EXISTS `sekolah`;
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

--
-- Dumping data for table `sekolah`
--

/*!40000 ALTER TABLE `sekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `sekolah` ENABLE KEYS */;


--
-- Definition of table `suku`
--

DROP TABLE IF EXISTS `suku`;
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

--
-- Dumping data for table `suku`
--

/*!40000 ALTER TABLE `suku` DISABLE KEYS */;
INSERT INTO `suku` (`replid`,`suku`,`urutan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (32,'Jawa',0,NULL,NULL,NULL,'2010-03-02 10:07:22',36536,0),
 (34,'Padang',0,NULL,NULL,NULL,'2010-03-02 10:07:22',23157,0),
 (33,'Sunda',0,NULL,NULL,NULL,'2010-03-02 10:07:22',6177,0);
/*!40000 ALTER TABLE `suku` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_suku_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_suku_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_suku_100` BEFORE INSERT ON `suku` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_suku_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_suku_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_suku_100` BEFORE UPDATE ON `suku` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.suku <> OLD.suku THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'suku', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.suku, oldpk = OLD.suku;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_suku_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_suku_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_suku_100` AFTER DELETE ON `suku` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'suku', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `tabledep`
--

DROP TABLE IF EXISTS `tabledep`;
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

--
-- Dumping data for table `tabledep`
--

/*!40000 ALTER TABLE `tabledep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabledep` ENABLE KEYS */;


--
-- Definition of table `tingkatpendidikan`
--

DROP TABLE IF EXISTS `tingkatpendidikan`;
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

--
-- Dumping data for table `tingkatpendidikan`
--

/*!40000 ALTER TABLE `tingkatpendidikan` DISABLE KEYS */;
INSERT INTO `tingkatpendidikan` (`replid`,`pendidikan`,`info1`,`info2`,`info3`,`ts`,`token`,`issync`) VALUES 
 (25,'D1',NULL,NULL,NULL,'2010-03-02 10:07:22',26946,0),
 (24,'D3',NULL,NULL,NULL,'2010-03-02 10:07:22',50668,0),
 (23,'S1',NULL,NULL,NULL,'2010-03-02 10:07:22',41443,0),
 (22,'S2',NULL,NULL,NULL,'2010-03-02 10:07:22',55209,0),
 (21,'S3',NULL,NULL,NULL,'2010-03-02 10:07:22',20656,0),
 (28,'SD',NULL,NULL,NULL,'2010-03-02 10:07:22',3183,0),
 (26,'SMA',NULL,NULL,NULL,'2010-03-02 10:07:22',19478,0),
 (27,'SMP',NULL,NULL,NULL,'2010-03-02 10:07:22',22307,0);
/*!40000 ALTER TABLE `tingkatpendidikan` ENABLE KEYS */;


--
-- Definition of trigger `fsync_trins_tingkatpendidikan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trins_tingkatpendidikan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trins_tingkatpendidikan_100` BEFORE INSERT ON `tingkatpendidikan` FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530)) $$

DELIMITER ;

--
-- Definition of trigger `fsync_trupd_tingkatpendidikan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trupd_tingkatpendidikan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trupd_tingkatpendidikan_100` BEFORE UPDATE ON `tingkatpendidikan` FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.pendidikan <> OLD.pendidikan THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'tingkatpendidikan', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.pendidikan, oldpk = OLD.pendidikan;
     END IF;
  END IF;
  END $$

DELIMITER ;

--
-- Definition of trigger `fsync_trdel_tingkatpendidikan_100`
--

DROP TRIGGER /*!50030 IF EXISTS */ `fsync_trdel_tingkatpendidikan_100`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `fsync_trdel_tingkatpendidikan_100` AFTER DELETE ON `tingkatpendidikan` FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsumum', tablename = 'tingkatpendidikan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END $$

DELIMITER ;

--
-- Definition of table `wilayah`
--

DROP TABLE IF EXISTS `wilayah`;
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

--
-- Dumping data for table `wilayah`
--

/*!40000 ALTER TABLE `wilayah` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayah` ENABLE KEYS */;


--
-- Definition of table `wilayah1`
--

DROP TABLE IF EXISTS `wilayah1`;
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

--
-- Dumping data for table `wilayah1`
--

/*!40000 ALTER TABLE `wilayah1` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayah1` ENABLE KEYS */;

--
-- Create schema jbsuser
--

CREATE DATABASE IF NOT EXISTS jbsuser;
USE jbsuser;

--
-- Definition of table `adminsiswa`
--

DROP TABLE IF EXISTS `adminsiswa`;
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

--
-- Dumping data for table `adminsiswa`
--

/*!40000 ALTER TABLE `adminsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminsiswa` ENABLE KEYS */;


--
-- Definition of table `hakakses`
--

DROP TABLE IF EXISTS `hakakses`;
CREATE TABLE  `jbsuser`.`hakakses` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
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
  CONSTRAINT `FK_hakakses_login` FOREIGN KEY (`login`) REFERENCES `login` (`login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hakakses`
--

/*!40000 ALTER TABLE `hakakses` DISABLE KEYS */;
INSERT INTO `hakakses` (`clientid`,`region`,`location`,`replid`,`login`,`modul`,`tingkat`,`departemen`,`keterangan`,`theme`,`lastlogin`,`aktif`,`info1`,`info2`,`info3`) VALUES 
 (NULL,NULL,NULL,20,'101','SIMAKA',1,NULL,'',1,'2010-03-05 14:00:05',1,NULL,NULL,NULL),
 (NULL,NULL,NULL,21,'101','KEUANGAN',1,NULL,'',1,'2010-03-05 14:00:29',1,NULL,NULL,NULL),
 (NULL,NULL,NULL,22,'101','SIMTAKA',1,NULL,NULL,1,NULL,1,NULL,NULL,NULL),
 (NULL,NULL,NULL,23,'101','INFOGURU',1,NULL,NULL,1,'2010-04-16 10:01:22',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hakakses` ENABLE KEYS */;


--
-- Definition of table `hakaksesinfosiswa`
--

DROP TABLE IF EXISTS `hakaksesinfosiswa`;
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

--
-- Dumping data for table `hakaksesinfosiswa`
--

/*!40000 ALTER TABLE `hakaksesinfosiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakaksesinfosiswa` ENABLE KEYS */;


--
-- Definition of table `hakakseskeuangan`
--

DROP TABLE IF EXISTS `hakakseskeuangan`;
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

--
-- Dumping data for table `hakakseskeuangan`
--

/*!40000 ALTER TABLE `hakakseskeuangan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakakseskeuangan` ENABLE KEYS */;


--
-- Definition of table `hakaksessimaka`
--

DROP TABLE IF EXISTS `hakaksessimaka`;
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

--
-- Dumping data for table `hakaksessimaka`
--

/*!40000 ALTER TABLE `hakaksessimaka` DISABLE KEYS */;
/*!40000 ALTER TABLE `hakaksessimaka` ENABLE KEYS */;


--
-- Definition of table `landlord`
--

DROP TABLE IF EXISTS `landlord`;
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

--
-- Dumping data for table `landlord`
--

/*!40000 ALTER TABLE `landlord` DISABLE KEYS */;
INSERT INTO `landlord` (`clientid`,`region`,`location`,`replid`,`isnew`,`haschange`,`password`,`lastlogin`,`info1`,`info2`,`info3`) VALUES 
 ('GMS2','BD','AT',1,'1','0','5f4dcc3b5aa765d61d8327deb882cf99','2010-12-01 14:00:25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `landlord` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
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

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`clientid`,`region`,`location`,`replid`,`login`,`password`,`keterangan`,`aktif`,`info1`,`info2`,`info3`) VALUES 
 (NULL,NULL,NULL,7,'101','5f4dcc3b5aa765d61d8327deb882cf99','',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `loginsiswa`
--

DROP TABLE IF EXISTS `loginsiswa`;
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

--
-- Dumping data for table `loginsiswa`
--

/*!40000 ALTER TABLE `loginsiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginsiswa` ENABLE KEYS */;


--
-- Definition of table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
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

--
-- Dumping data for table `lokasi`
--

/*!40000 ALTER TABLE `lokasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokasi` ENABLE KEYS */;


--
-- Definition of table `modul`
--

DROP TABLE IF EXISTS `modul`;
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

--
-- Dumping data for table `modul`
--

/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;

--
-- Create schema jbsvcr
--

CREATE DATABASE IF NOT EXISTS jbsvcr;
USE jbsvcr;

--
-- Definition of table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `komentar` text NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_agenda_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenda`
--

/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;


--
-- Definition of table `angket`
--

DROP TABLE IF EXISTS `angket`;
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

--
-- Dumping data for table `angket`
--

/*!40000 ALTER TABLE `angket` DISABLE KEYS */;
/*!40000 ALTER TABLE `angket` ENABLE KEYS */;


--
-- Definition of table `beritaguru`
--

DROP TABLE IF EXISTS `beritaguru`;
CREATE TABLE `beritaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idguru` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritaguru_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beritaguru`
--

/*!40000 ALTER TABLE `beritaguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritaguru` ENABLE KEYS */;


--
-- Definition of table `beritasekolah`
--

DROP TABLE IF EXISTS `beritasekolah`;
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
  `idpengirim` varchar(20) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_beritasiswa_nip` (`idpengirim`),
  KEY `IX_beritasekolah_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beritasekolah`
--

/*!40000 ALTER TABLE `beritasekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritasekolah` ENABLE KEYS */;


--
-- Definition of table `beritasiswa`
--

DROP TABLE IF EXISTS `beritasiswa`;
CREATE TABLE `beritasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_beritasiswa_nip` (`idpengirim`),
  KEY `IX_beritasiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beritasiswa`
--

/*!40000 ALTER TABLE `beritasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritasiswa` ENABLE KEYS */;


--
-- Definition of table `buletin`
--

DROP TABLE IF EXISTS `buletin`;
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

--
-- Dumping data for table `buletin`
--

/*!40000 ALTER TABLE `buletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin` ENABLE KEYS */;


--
-- Definition of table `buletin_cmt`
--

DROP TABLE IF EXISTS `buletin_cmt`;
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

--
-- Dumping data for table `buletin_cmt`
--

/*!40000 ALTER TABLE `buletin_cmt` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin_cmt` ENABLE KEYS */;


--
-- Definition of table `buletin_rate`
--

DROP TABLE IF EXISTS `buletin_rate`;
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

--
-- Dumping data for table `buletin_rate`
--

/*!40000 ALTER TABLE `buletin_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `buletin_rate` ENABLE KEYS */;


--
-- Definition of table `catatankategori`
--

DROP TABLE IF EXISTS `catatankategori`;
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

--
-- Dumping data for table `catatankategori`
--

/*!40000 ALTER TABLE `catatankategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatankategori` ENABLE KEYS */;


--
-- Definition of table `catatansiswa`
--

DROP TABLE IF EXISTS `catatansiswa`;
CREATE TABLE `catatansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idkategori` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `nip` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_catatansiswa_idkat` (`idkategori`),
  KEY `IX_catatansiswa_ts` (`ts`,`issync`),
  CONSTRAINT `FK_catatansiswa_idkat` FOREIGN KEY (`idkategori`) REFERENCES `catatankategori` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catatansiswa`
--

/*!40000 ALTER TABLE `catatansiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatansiswa` ENABLE KEYS */;


--
-- Definition of table `chat`
--

DROP TABLE IF EXISTS `chat`;
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

--
-- Dumping data for table `chat`
--

/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;


--
-- Definition of table `dirshare`
--

DROP TABLE IF EXISTS `dirshare`;
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

--
-- Dumping data for table `dirshare`
--

/*!40000 ALTER TABLE `dirshare` DISABLE KEYS */;
INSERT INTO `dirshare` (`replid`,`ts`,`token`,`issync`,`idroot`,`dirname`,`dirfullpath`,`idguru`,`nis`,`info1`,`info2`,`info3`) VALUES 
 (1,'2010-03-02 10:08:16',60772,0,0,'root','root/',NULL,NULL,NULL,NULL,NULL),
 (2,'2010-03-12 09:49:11',0,0,1,'101','root/101/','101',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dirshare` ENABLE KEYS */;


--
-- Definition of table `draft`
--

DROP TABLE IF EXISTS `draft`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `draft`
--

/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;


--
-- Definition of table `fileshare`
--

DROP TABLE IF EXISTS `fileshare`;
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

--
-- Dumping data for table `fileshare`
--

/*!40000 ALTER TABLE `fileshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileshare` ENABLE KEYS */;


--
-- Definition of table `galerifoto`
--

DROP TABLE IF EXISTS `galerifoto`;
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

--
-- Dumping data for table `galerifoto`
--

/*!40000 ALTER TABLE `galerifoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `galerifoto` ENABLE KEYS */;


--
-- Definition of table `gambarbuletin`
--

DROP TABLE IF EXISTS `gambarbuletin`;
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

--
-- Dumping data for table `gambarbuletin`
--

/*!40000 ALTER TABLE `gambarbuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambarbuletin` ENABLE KEYS */;


--
-- Definition of table `gambarlogin`
--

DROP TABLE IF EXISTS `gambarlogin`;
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

--
-- Dumping data for table `gambarlogin`
--

/*!40000 ALTER TABLE `gambarlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambarlogin` ENABLE KEYS */;


--
-- Definition of table `gambartiny`
--

DROP TABLE IF EXISTS `gambartiny`;
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

--
-- Dumping data for table `gambartiny`
--

/*!40000 ALTER TABLE `gambartiny` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambartiny` ENABLE KEYS */;


--
-- Definition of table `gambartinypesan`
--

DROP TABLE IF EXISTS `gambartinypesan`;
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

--
-- Dumping data for table `gambartinypesan`
--

/*!40000 ALTER TABLE `gambartinypesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `gambartinypesan` ENABLE KEYS */;


--
-- Definition of table `jawabanangket`
--

DROP TABLE IF EXISTS `jawabanangket`;
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

--
-- Dumping data for table `jawabanangket`
--

/*!40000 ALTER TABLE `jawabanangket` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabanangket` ENABLE KEYS */;


--
-- Definition of table `jawabangket`
--

DROP TABLE IF EXISTS `jawabangket`;
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

--
-- Dumping data for table `jawabangket`
--

/*!40000 ALTER TABLE `jawabangket` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabangket` ENABLE KEYS */;


--
-- Definition of table `kategoribuletin`
--

DROP TABLE IF EXISTS `kategoribuletin`;
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

--
-- Dumping data for table `kategoribuletin`
--

/*!40000 ALTER TABLE `kategoribuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategoribuletin` ENABLE KEYS */;


--
-- Definition of table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
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

--
-- Dumping data for table `komentar`
--

/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;


--
-- Definition of table `lampiranberitaguru`
--

DROP TABLE IF EXISTS `lampiranberitaguru`;
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

--
-- Dumping data for table `lampiranberitaguru`
--

/*!40000 ALTER TABLE `lampiranberitaguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranberitaguru` ENABLE KEYS */;


--
-- Definition of table `lampiranberitasiswa`
--

DROP TABLE IF EXISTS `lampiranberitasiswa`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lampiranberitasiswa`
--

/*!40000 ALTER TABLE `lampiranberitasiswa` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranberitasiswa` ENABLE KEYS */;


--
-- Definition of table `lampirandraft`
--

DROP TABLE IF EXISTS `lampirandraft`;
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

--
-- Dumping data for table `lampirandraft`
--

/*!40000 ALTER TABLE `lampirandraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampirandraft` ENABLE KEYS */;


--
-- Definition of table `lampiranpesan`
--

DROP TABLE IF EXISTS `lampiranpesan`;
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

--
-- Dumping data for table `lampiranpesan`
--

/*!40000 ALTER TABLE `lampiranpesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lampiranpesan` ENABLE KEYS */;


--
-- Definition of table `mutiara`
--

DROP TABLE IF EXISTS `mutiara`;
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

--
-- Dumping data for table `mutiara`
--

/*!40000 ALTER TABLE `mutiara` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutiara` ENABLE KEYS */;


--
-- Definition of table `new`
--

DROP TABLE IF EXISTS `new`;
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

--
-- Dumping data for table `new`
--

/*!40000 ALTER TABLE `new` DISABLE KEYS */;
/*!40000 ALTER TABLE `new` ENABLE KEYS */;


--
-- Definition of table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
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

--
-- Dumping data for table `pertanyaan`
--

/*!40000 ALTER TABLE `pertanyaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertanyaan` ENABLE KEYS */;


--
-- Definition of table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan`
--

/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;


--
-- Definition of table `pesanterkirim`
--

DROP TABLE IF EXISTS `pesanterkirim`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanterkirim`
--

/*!40000 ALTER TABLE `pesanterkirim` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanterkirim` ENABLE KEYS */;


--
-- Definition of table `pilihan`
--

DROP TABLE IF EXISTS `pilihan`;
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

--
-- Dumping data for table `pilihan`
--

/*!40000 ALTER TABLE `pilihan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihan` ENABLE KEYS */;


--
-- Definition of table `profil`
--

DROP TABLE IF EXISTS `profil`;
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

--
-- Dumping data for table `profil`
--

/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;


--
-- Definition of table `subkategoribuletin`
--

DROP TABLE IF EXISTS `subkategoribuletin`;
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

--
-- Dumping data for table `subkategoribuletin`
--

/*!40000 ALTER TABLE `subkategoribuletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `subkategoribuletin` ENABLE KEYS */;


--
-- Definition of table `tujuanpesan`
--

DROP TABLE IF EXISTS `tujuanpesan`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tujuanpesan`
--

USE `jbsclient`;
ALTER TABLE `jbsclient`.`deleteddata` ADD INDEX `IX_DELETEDDATA_SYNC`(`ts`, `issync`);
ALTER TABLE `jbsclient`.`pkchanges` ADD INDEX `IX_PKCHANGES_SYNC`(`ts`, `issync`);

USE `jbsfina`;
DELIMITER $$


DROP TRIGGER IF EXISTS `trupd_penerimaanjtt_100`$$
DROP TRIGGER IF EXISTS `trupd_penerimaanjtt_101`$$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaanjtt_101` AFTER UPDATE ON `penerimaanjtt` FOR EACH ROW BEGIN
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
			idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas;
			
		insert into auditpenerimaanjtt set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjtt=new.idbesarjtt, 
			idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas;
		
	END IF;		
END $$

DROP TRIGGER IF EXISTS `trupd_penerimaanjttcalon_100`$$
DROP TRIGGER IF EXISTS `trupd_penerimaanjttcalon_101`$$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaanjttcalon_101` AFTER UPDATE ON `penerimaanjttcalon` FOR EACH ROW BEGIN
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
		
		insert into auditpenerimaanjttcalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjttcalon=old.idbesarjttcalon, idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas;
		
		insert into auditpenerimaanjttcalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjttcalon=new.idbesarjttcalon, idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas;

	END IF;
END $$

DROP TRIGGER IF EXISTS `trupd_penerimaanlain_100`$$
DROP TRIGGER IF EXISTS `trupd_penerimaanlain_101`$$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaanlain_101` AFTER UPDATE ON `penerimaanlain` FOR EACH ROW BEGIN
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
END $$

DROP TRIGGER IF EXISTS `trupd_penerimaaniuran_100`$$
DROP TRIGGER IF EXISTS `trupd_penerimaaniuran_101`$$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaaniuran_101` AFTER UPDATE ON `penerimaaniuran` FOR EACH ROW BEGIN
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
	
END $$

DROP TRIGGER IF EXISTS `trupd_penerimaaniurancalon_100`$$
DROP TRIGGER IF EXISTS `trupd_penerimaaniurancalon_101`$$

CREATE DEFINER = `root`@`%` TRIGGER `trupd_penerimaaniurancalon_101` AFTER UPDATE ON `penerimaaniurancalon` FOR EACH ROW BEGIN
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
    		
END $$

DROP TRIGGER IF EXISTS `trupd_besarjtt_100`$$
DROP TRIGGER IF EXISTS `trupd_besarjtt_101`$$

CREATE DEFINER = `root`@`localhost` TRIGGER `trupd_besarjtt_101` AFTER UPDATE ON `besarjtt` FOR EACH ROW BEGIN
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
END $$

DROP TRIGGER IF EXISTS `trupd_besarjttcalon_100`$$
DROP TRIGGER IF EXISTS `trupd_besarjttcalon_101`$$

CREATE DEFINER = `root`@`localhost` TRIGGER `trupd_besarjttcalon_101` AFTER UPDATE ON `besarjttcalon` FOR EACH ROW BEGIN
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
END $$


