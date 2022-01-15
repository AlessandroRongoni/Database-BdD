-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: super8
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acqbar`
--

DROP TABLE IF EXISTS `acqbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acqbar` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Data` date DEFAULT NULL,
  `Ora` time DEFAULT NULL,
  `CostoTotale` decimal(6,2) NOT NULL,
  `Cliente` char(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `acqbar_chk_1` CHECK (((`Ora` <= _utf8mb4'23:30:00') and (`Ora` >= _utf8mb4'15:30:00'))),
  CONSTRAINT `acqbar_chk_2` CHECK ((`CostoTotale` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acqbar`
--

LOCK TABLES `acqbar` WRITE;
/*!40000 ALTER TABLE `acqbar` DISABLE KEYS */;
/*!40000 ALTER TABLE `acqbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acqfisico`
--

DROP TABLE IF EXISTS `acqfisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acqfisico` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CostoTotale` decimal(6,2) DEFAULT NULL,
  `Film` varchar(50) NOT NULL,
  `DataProiez` date NOT NULL,
  `Orario` int DEFAULT NULL,
  `Cliente` char(16) DEFAULT NULL,
  `Pagamento` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `acqfisico_chk_1` CHECK ((`CostoTotale` > 0)),
  CONSTRAINT `acqfisico_chk_2` CHECK (((`Pagamento` = _utf8mb4'Contanti') or (`Pagamento` = _utf8mb4'Carta') or (`Pagamento` = _utf8mb4'Bancomat')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acqfisico`
--

LOCK TABLES `acqfisico` WRITE;
/*!40000 ALTER TABLE `acqfisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `acqfisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acqonline`
--

DROP TABLE IF EXISTS `acqonline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acqonline` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CostoTotale` decimal(6,2) DEFAULT NULL,
  `Film` varchar(50) NOT NULL,
  `DataAcq` date NOT NULL,
  `DataProiez` date NOT NULL,
  `Orario` time DEFAULT NULL,
  `Cliente` char(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `acqonline_chk_1` CHECK ((`CostoTotale` > 0)),
  CONSTRAINT `acqonline_chk_2` CHECK ((`DataAcq` <= `DataProiez`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acqonline`
--

LOCK TABLES `acqonline` WRITE;
/*!40000 ALTER TABLE `acqonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `acqonline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appart`
--

DROP TABLE IF EXISTS `appart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appart` (
  `Film` int NOT NULL,
  `Genere` int NOT NULL,
  PRIMARY KEY (`Film`,`Genere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appart`
--

LOCK TABLES `appart` WRITE;
/*!40000 ALTER TABLE `appart` DISABLE KEYS */;
/*!40000 ALTER TABLE `appart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clicpc`
--

DROP TABLE IF EXISTS `clicpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clicpc` (
  `CodiceFiscale` char(16) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Sesso` varchar(10) DEFAULT NULL,
  `Nazionalita` varchar(20) DEFAULT NULL,
  `NumeroCarta` char(16) NOT NULL,
  `Citta` varchar(30) DEFAULT NULL,
  `CAP` varchar(5) DEFAULT NULL,
  `Via` varchar(20) DEFAULT NULL,
  `NumeroCivico` char(4) DEFAULT NULL,
  PRIMARY KEY (`CodiceFiscale`),
  UNIQUE KEY `NumeroCarta` (`NumeroCarta`),
  UNIQUE KEY `Telefono` (`Telefono`),
  CONSTRAINT `clicpc_chk_1` CHECK (((`Sesso` = _utf8mb4'Maschio') or (`Sesso` = _utf8mb4'Femmina') or (`Sesso` = _utf8mb4'Altro')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clicpc`
--

LOCK TABLES `clicpc` WRITE;
/*!40000 ALTER TABLE `clicpc` DISABLE KEYS */;
INSERT INTO `clicpc` VALUES ('ABJJYE69R88Q428S','Matteo','Serpicelli','1962-12-30','5342739223','Maschio','Italiana','3220875162870282','Senigallia','30411','Via Rapagnano','22'),('ACDSFI85Y15A481U','Franco','Spalletti','1954-11-26','8623577948','Maschio','Italiana','214201712898229','Porto Recanati','98313','Via Re Emanuele','54'),('ADWYAG68G18Y765J','Alessandro','Moretti','1990-11-11','456964998','Maschio','Italiana','8091868705761302','Jesi','91728','Via San Tommaso','9'),('AKUBIX13W55M858H','Franco','Rongoni','2001-10-13','2898852517','Maschio','Italiana','4749988443624232','Porto Recanati','69226','Via Mancini','16'),('AMYULS23B09S394R','Marica','Zaccari','2003-12-18','2981815880','Femmina','Italiana','8607904788134805','Porto Recanati','43112','Via Napoli','15'),('AODIKY77C01M168U','Samanta','Marziali','1962-11-23','1647014061','Femmina','Italiana','2831476208122343','Pedaso','68842','Via Borsellino','68'),('AOHEUH45V13D171K','Franco','Cesarini','1995-10-26','1130145824','Maschio','Italiana','1210099427395427','Ancona','42129','Via San Giovanni','39'),('AOPRJC28S90R626L','Susanna','Sartini','1980-11-20','7238247016','Femmina','Italiana','1972493058491400','Pedaso','10566','Via Roma','25'),('ARSYTF43E60J235O','Susanna','Franchi','1988-11-26','6691498118','Femmina','Italiana','7810285160429482','Pedaso','54187','Via Re Emanuele','27'),('ASQNHB39M86Y779V','Marta','Maiolatesi','2002-05-26','2338845102','Femmina','Italiana','9076109283472112','Senigallia','89016','Via Santa Lucia','22'),('ASQNT569M86Y779V','Luca','Pistolesi','2013-09-26','2334545102','Femmina','Italiana','9099109283562112','Jesi','45389','Via Recanati','65'),('AVBYNW36Q86F368J','Andrea','Marziali','1972-10-27','794381931','Femmina','Italiana','3824394695098062','Fano','4368','Via Papa Bonifacio','78'),('BAMASF80O07J791X','Andrea','Zupo','1986-12-25','7442996722','Femmina','Italiana','8760807018603019','San Benedetto','58930','Via Della Liberta','56'),('BCQNHQ63G16D370V','Matteo','Scortichini','1967-12-28','907931342','Maschio','Italiana','4140701029815295','Senigallia','16556','Via Papa Bonifacio','12'),('BDIGEV18K25M433J','Lorenzo','Luconi','1968-11-27','2932378361','Maschio','Italiana','9531593736905290','Recanati','97507','Via San Tommaso','88'),('BFDRCG07C82L690X','Giulia','Verdini','1956-12-11','9141806069','Femmina','Italiana','7159479815837708','Senigallia','83894','Via Borsellino','74'),('BFLVCY94U88I532X','Ludovica','Serpicelli','1982-12-27','1602803707','Femmina','Italiana','1374452993164102','Civitanova Marche','69084','Via Della Liberta','32'),('BIRKEU01F63X370F','Matteo','Franconi','1992-10-27','2091379304','Maschio','Italiana','3522735830154654','Perugia','26168','Via Rapagnano','88'),('BLXDGJ14W40G226L','Giuseppe','Scortichini','1956-12-30','2414398962','Maschio','Italiana','5556174129462066','Fano','50818','Via Della Liberta','16'),('BNDWIX37Y94C464L','Mattia','Scortichini','1955-10-13','275490134','Maschio','Italiana','3617772526198099','Pesaro Urbino','19871','Via Santo Stefano','80'),('BSIQEU72W04Y022G','Renzo','Scortichini','1957-12-30','2728749119','Maschio','Italiana','1055201302229030','Porto Recanati','10870','Via Puccini','13'),('BTIQLO59V28J898H','Arianna','Mereu','1997-10-30','9640004671','Femmina','Italiana','9767801640856356','San Benedetto','30568','Via Puglia','50'),('BTLQMC35R69P448F','Arianna','Zaccari','1992-10-15','7079092955','Femmina','Italiana','5643111243542711','Fano','12088','Via Mancini','67'),('BUAHXM69K43U464A','Michele','Santini','1973-12-29','7168406768','Maschio','Italiana','4167885536365360','Perugia','74326','Via San Tommaso','34'),('BUPGMY69V23X729P','Lucia','Zupo','2001-10-17','4136299879','Femmina','Italiana','9070624567002034','Pedaso','37567','Via Santo Stefano','33'),('BWFNDC11W36U848Y','Lorenzo','Santini','1957-12-25','8949650388','Maschio','Italiana','6758226374894668','Pesaro Urbino','85030','Via Santo Stefano','63'),('BWOJFL65K75W670U','Samanta','Panni','1954-11-14','9141960088','Femmina','Italiana','284438679127309','Senigallia','30864','Via Puglia','26'),('BXTOOS22H75L624J','Matteo','Moretti','1987-12-10','9416959381','Maschio','Italiana','7285385371366769','Ascoli Piceno','34313','Via Temistocle','84'),('CFWSTU64Q50V426X','Marica','Rongoni','1974-11-14','9539632762','Femmina','Italiana','9497007812978912','Porto San Giorgio','64786','Via Roma','10'),('CJYTJO59L82L944N','Luca','Sartini','1951-10-12','7394787269','Maschio','Italiana','8045110412645607','Varano','68556','Via Temistocle','62'),('CLANAT35X15L347R','Alessandro','Franconi','1964-10-12','7564019478','Maschio','Italiana','9838164608669296','Varano','15772','Via Mancini','48'),('CNIPWW35B30X330E','Luca','Scortichini','1995-10-19','5820557646','Maschio','Italiana','380797511510969','Recanati','30563','Via Santo Stefano','58'),('CUYJXK09L40N900W','Lucia','Scortichini','1962-11-21','4362525409','Femmina','Italiana','6917573991315507','Porto San Giorgio','29372','Via Roma','10'),('CWFKDG45N48A500J','Ludovica','Serpicelli','1967-10-10','8466165574','Femmina','Italiana','3885885668700616','Porto San Giorgio','42331','Via Papa Bonifacio','47'),('CWUGRQ49O74J242J','Susanna','Zaccari','1955-12-14','5655776559','Femmina','Italiana','8594430614405607','Senigallia','16711','Via Falcone','6'),('DANETE26B84E447I','Marica','Zupo','2003-12-18','6331313062','Femmina','Italiana','6968244618245287','Pedaso','50898','Via Puglia','84'),('DCYYOV09K98V347B','Andrea','Zupo','1992-11-22','2490856488','Femmina','Italiana','9723070399109644','Civitanova Marche','89980','Via Santo Stefano','25'),('DEKWNY05H31Y580J','Arianna','Zaccari','2004-10-30','9726774570','Femmina','Italiana','6774215753212757','Senigallia','99865','Via Della Liberta','38'),('DLSVWN58G75H353F','Federico','Franconi','1982-12-13','9611618377','Maschio','Italiana','3520876851685926','Jesi','57419','Via Roma','7'),('DMKGLE15X51L250N','Matteo','Santini','1962-12-29','4415604834','Maschio','Italiana','5914870371927291','Varano','40726','Via Rapagnano','57'),('DMVFCS33J29S135L','Lucia','Spalletti','1984-11-25','4678922299','Femmina','Italiana','2420883830255728','Jesi','5755','Via Temistocle','33'),('DOCOOK49D81K941K','Marica','Scortichini','1987-10-22','1548130755','Femmina','Italiana','8907778424546145','Pedaso','61126','Via Pontefice','59'),('DPCWYG26B03R885Y','Marica','Spalletti','1988-10-30','3176746803','Femmina','Italiana','8444440641946493','San Benedetto','15156','Via Rapagnano','66'),('DQNAUO41B02D802V','Luca','Panni','1979-11-15','5979578064','Maschio','Italiana','5651477315926462','Recanati','95928','Via Pontefice','27'),('DRTYFU16D24L385G','Francesca','Giorgini','1985-10-12','8195644698','Femmina','Italiana','3269699832644542','Pesaro Urbino','88208','Via dei Fortunati','50'),('DSADEO52D87D686V','Francesca','Luconi','1953-10-12','9086960436','Femmina','Italiana','8478152202080834','Camerino','51525','Via Rapagnano','30'),('DSJFIX97I47Q705W','Matteo','Luconi','2000-10-28','6301831651','Maschio','Italiana','1598973961070074','Ancona','47567','Via Borsellino','77'),('DTGHWQ01W36M908J','Sandro','Franzoni','1975-10-14','3846209837','Maschio','Italiana','2422900487678736','Civitanova Marche','95461','Via Re Emanuele','50'),('EBHFQE08E24U610N','Samanta','Santini','1974-10-17','969269522','Femmina','Italiana','3048528159109378','Ascoli Piceno','87846','Via Temistocle','82'),('EBISCI46J23C487J','Laura','Solustri','2002-11-21','8770920735','Femmina','Italiana','4380038604305092','Camerino','15305','Via Della Liberta','25'),('ECONOF17M18R437S','Giulia','Scortichini','1961-11-28','3363761347','Femmina','Italiana','1659921075647659','Porto San Giorgio','63254','Via Falcone','81'),('ECPTNB50R95O987F','Francesca','Zaccari','1990-12-19','8153739507','Femmina','Italiana','3753410528967876','Camerino','76656','Via Puglia','25'),('EFKPON47W86D547F','Laura','Solustri','1953-10-10','44371857','Femmina','Italiana','307488037119570','Civitanova Marche','34225','Via Rapagnano','31'),('EHQJSR46W37F922N','Francesco','Cesarini','1959-11-11','830376498','Maschio','Italiana','5100326673926732','Jesi','80171','Via Re Emanuele','14'),('EJJLKQ00C03R891I','Renzo','Luconi','1993-10-11','4300490799','Maschio','Italiana','7730664589969141','Recanati','95856','Via Puccini','45'),('ELRSDN70I46N339P','Marica','Serpicelli','1979-11-11','5702668834','Femmina','Italiana','4700704367572677','Varano','50718','Via Borsellino','4'),('ENLQQD95U02R026G','Alessandro','Rongoni','1975-12-17','4606178477','Maschio','Italiana','4974194656581037','Civitanova Marche','89395','Via Santo Stefano','73'),('ERACED91T37O276A','Giulia','Scortichini','1985-11-30','5722598418','Femmina','Italiana','379803440205641','Grottammare','32940','Via San Tommaso','72'),('ERYQLP66F89H616T','Michele','Pretini','1965-11-22','7566177256','Maschio','Italiana','8771770546954071','Camerino','98863','Via Puccini','35'),('EUCYGB39J98Y122V','Annalisa','Corroni','1965-01-31','3758294638','Femmina','Italiana','7499995637578239','Genova','56789','Garibaldi','23'),('EUCYGB39N06Y122V','Giorgia','Meloni','1956-12-04','1223836098','Altro','Italiana','7495885637578239','Roma','45896','Via delle Foibe','46'),('FAIEPQ89T38F904S','Mattia','Luconi','1991-10-22','285929372','Maschio','Italiana','7969008469266720','Ascoli Piceno','45117','Via Santo Stefano','4'),('FBMIPS93J77F110T','Laura','Zaccari','1950-10-23','2483792304','Femmina','Italiana','2397488545102829','Fano','9078','Via Puglia','30'),('FCHGUC04K53P338T','Lorenzo','Giorgini','1986-11-12','9447313588','Maschio','Italiana','4568164589609666','Ancona','88140','Via Borsellino','25'),('FEEEIQ14G34R017G','Lorenzo','Giorgini','2001-10-20','9466265255','Maschio','Italiana','5712827232369598','Fano','99693','Via Della Liberta','70'),('FFMHPA13L96R442Q','Alessandro','Scortichini','1958-10-30','5080386451','Maschio','Italiana','7081378685871848','Jesi','15496','Via Della Liberta','36'),('FHMEJO87E69I669Y','Francesco','Cesarini','1982-10-29','559355124','Maschio','Italiana','7560641483742381','Pesaro Urbino','49151','Via Falcone','61'),('FKEKFG43Q05Q355P','Franco','Moretti','1973-10-27','752367448','Maschio','Italiana','31172672973328','Ancona','79779','Via San Giovanni','65'),('FOBWTD37L87C086D','Ciro','Luconi','1962-12-20','6726030819','Maschio','Italiana','5540395617233732','Jesi','80909','Via Re Emanuele','4'),('FYRKFO86X31E127V','Arianna','Cesarini','1973-10-15','6308154193','Femmina','Italiana','9242129499557927','Civitanova Marche','3916','Via Santo Stefano','45'),('GCQQTP53X82T796O','Marzio','Panni','1971-11-28','3635294376','Maschio','Italiana','252692238888698','Varano','38273','Via Falcone','78'),('GEOGOO28E41J510K','Federico','Giorgini','2003-10-13','9727847466','Maschio','Italiana','2767367090932989','Perugia','67921','Via San Tommaso','39'),('GFKPSS63B62W696L','Marica','Mereu','1965-10-27','8681813675','Femmina','Italiana','5111231642293083','Porto Recanati','90622','Via Papa Bonifacio','8'),('GFMYWH60S84N992X','Alessandro','Marziali','1952-12-27','1741087539','Maschio','Italiana','1190320822024533','San Benedetto','95143','Via Pontefice','54'),('GFTYGB67J98Y777V','Luisa','Giacomozzi','1995-09-05','3757694638','Femmina','Italiana','4657382957453910','Londra','54489','Greendays','67'),('GIHGRM35E04O518M','Sandro','Spalletti','1983-11-17','3932658631','Maschio','Italiana','9137288656175755','Pedaso','1020','Via Napoli','12'),('GKPERB39N06Y100V','Francesco','Verdi','1998-12-22','4229987098','Maschio','Italiana','9834812954403956','Fermo','23906','Via Marco Polo','22'),('GLIKHT17F83N207F','Francesco','Santini','1992-11-15','257241172','Maschio','Italiana','4671209139187342','Pedaso','92149','Via Pontefice','15'),('GTBJEO48A89S294W','Francesca','Santini','1984-12-28','6759829058','Femmina','Italiana','6931357972090685','Fano','10946','Via Napoli','32'),('GXNJPU55M70N450F','Alessandro','Pretini','1999-11-19','2894378391','Maschio','Italiana','9226001821413611','Senigallia','62693','Via Falcone','73'),('HACLEP70F69X564C','Ciro','Moretti','1962-12-25','2769053911','Maschio','Italiana','646751154014850','Porto Recanati','93746','Via dei Fortunati','3'),('HAIMDK97X48M199L','Franco','Cesarini','1961-10-24','7879640169','Maschio','Italiana','1739376455946124','Porto San Giorgio','78701','Via Borsellino','51'),('HBPXIS03I48A438D','Alessandro','Luconi','2001-10-28','949251847','Maschio','Italiana','3817501945606899','Pesaro Urbino','65691','Via Mancini','81'),('HENARJ08I28I936F','Francesco','Scortichini','1997-12-13','5014178565','Maschio','Italiana','666692665648048','San Benedetto','81110','Via dei Fortunati','50'),('HJYJIE59Y80Q070L','Lorenzo','Marziali','1950-12-22','1876533108','Maschio','Italiana','1605757405148240','Senigallia','47543','Via San Giovanni','68'),('HMXXFY69A16E941L','Andrea','Sartini','1973-10-30','9232700082','Femmina','Italiana','4891484994667142','Ancona','49393','Via Falcone','55'),('HSWRRB39N06Y122V','Franco','Farina','1999-10-12','1223457098','Maschio','Italiana','7495801234578239','Fermo','23896','Via dei Feriti','10'),('HUDMRB93C64L789R','Luca','Franchi','1969-11-25','4385275200','Maschio','Italiana','7104276053612946','Recanati','43583','Via Borsellino','45'),('HUFBVQ62O83H451P','Renzo','Cesarini','1995-11-20','4314352348','Maschio','Italiana','3498703301674391','Porto San Giorgio','64947','Via Pontefice','65'),('IFFPSW77X34K542L','Lorenzo','Franconi','1984-12-20','7348971890','Maschio','Italiana','2916222352974111','Ancona','27763','Via Falcone','29'),('IICHLB17S69L198B','Laura','Pretini','1956-10-27','6553207996','Femmina','Italiana','7171703335332199','Varano','68871','Via Puglia','46'),('IMTBPW58B78K351T','Samanta','Marziali','1957-12-30','4762478738','Femmina','Italiana','8752990576551267','Pedaso','58081','Via Puccini','11'),('IORAXL26Q29D408E','Giulia','Moretti','1994-10-19','6608755904','Femmina','Italiana','397045519922440','Civitanova Marche','24403','Via Borsellino','48'),('IPJXXQ49K64O993X','Franco','Rongoni','1981-11-26','982658175','Maschio','Italiana','293862112132532','San Benedetto','34234','Via Santo Stefano','63'),('ISUXTC48H20L548O','Francesco','Franchi','1962-10-15','6106578825','Maschio','Italiana','769389526030292','Pesaro Urbino','93719','Via Falcone','78'),('ITEKLG22X00K636E','Giuseppe','Zaccari','1996-10-19','6758447625','Maschio','Italiana','1377876491257296','Camerino','45559','Via Della Liberta','49'),('IVVGXP73H36O952O','Franco','Giorgini','2001-10-18','3886374613','Maschio','Italiana','951385021696850','Porto Recanati','42471','Via Puccini','64'),('IYSUTG91P25V719P','Giuseppe','Luconi','1959-11-24','4300088431','Maschio','Italiana','4710527001194103','Perugia','29911','Via Puglia','85'),('JCMKPO48G77F128T','Luca','Franconi','1989-11-10','2881674','Maschio','Italiana','5952600465453321','Jesi','25479','Via Rapagnano','3'),('JEIUWW72A89G551I','Martina','Solustri','1992-11-10','2012964678','Femmina','Italiana','3679427278861788','Pedaso','5428','Via San Giovanni','51'),('JHJNHT08W58W538G','Alessandro','Giorgini','1995-11-18','6258324237','Maschio','Italiana','6955395383475516','Recanati','76156','Via Napoli','46'),('JKEWPK95G66M534I','Martina','Spalletti','1992-10-30','2874833767','Femmina','Italiana','2591189733099492','Pedaso','73697','Via San Giovanni','45'),('JLCKNO14B03E387A','Marzio','Marziali','1961-12-12','4174854169','Maschio','Italiana','2154574827562177','Pesaro Urbino','16848','Via Santo Stefano','53'),('JNNTYI82M11Q318R','Federico','Franzoni','1989-10-15','3592308519','Maschio','Italiana','1097063319628423','Civitanova Marche','30545','Via Temistocle','42'),('JUBMFY79I94F287L','Ciro','Verdini','1987-12-21','276248627','Maschio','Italiana','3233026059529964','Porto San Giorgio','12072','Via Papa Bonifacio','62'),('JUWHWK90H73B013U','Martina','Serpicelli','1995-12-15','764023279','Femmina','Italiana','8247353049484577','Porto San Giorgio','75497','Via Santo Stefano','53'),('JYCYJQ18V22O492W','Ludovica','Franchi','1985-11-12','8860219599','Femmina','Italiana','2617086225179347','Civitanova Marche','49698','Via San Giovanni','1'),('JYVBAX84S00P302T','Ludovica','Cesarini','1976-10-23','2643091868','Femmina','Italiana','6929184921052021','San Benedetto','25818','Via Santo Stefano','77'),('KBFCLR99E06E934G','Arianna','Mereu','1997-10-29','3439812672','Femmina','Italiana','9433098459244042','Jesi','25848','Via Puglia','76'),('KCACEJ66F62N045B','Francesco','Serpicelli','1978-10-25','1271312481','Maschio','Italiana','2257545832623935','Civitanova Marche','97159','Via dei Fortunati','26'),('KELWFL25C45S592K','Lucia','Moretti','2002-12-17','2838562878','Femmina','Italiana','5658581631219304','Fano','44942','Via Borsellino','23'),('KEOOYL57A15V592F','Mattia','Sartini','1959-12-10','2683809411','Maschio','Italiana','1998065246764507','Perugia','55546','Via San Giovanni','75'),('KGLMVF86X93R697V','Luca','Zaccari','1969-10-18','6862497586','Maschio','Italiana','6155222325596785','Ascoli Piceno','6553','Via Puglia','54'),('KHTMUC44N18J806O','Ludovica','Franzoni','1993-10-16','9247204206','Femmina','Italiana','118262157090437','Fano','88244','Via Re Emanuele','33'),('KMAIWR10F87V969Q','Marzio','Solustri','1978-12-12','3477271349','Maschio','Italiana','488687658062902','Pesaro Urbino','35041','Via dei Fortunati','67'),('KMBCUI44F24U742D','Sara','Cesarini','2004-11-18','9087200014','Femmina','Italiana','9942575882636838','Pesaro Urbino','97847','Via Pontefice','58'),('KQNMKG91G03M537I','Giulia','Zupo','1959-12-18','3344462067','Femmina','Italiana','521313683711305','Jesi','30717','Via Roma','11'),('KQQWUK55U66D580F','Alessandro','Rongoni','1970-10-19','9346392882','Maschio','Italiana','2362210694035633','Ascoli Piceno','23269','Via Della Liberta','55'),('KUJKLA82K45N753C','Andrea','Cesarini','1981-10-23','372301919','Femmina','Italiana','4630702497984496','Camerino','35389','Via San Giovanni','40'),('KUUHEJ11C51R168I','Ciro','Franconi','1977-11-21','8391580909','Maschio','Italiana','4103175757507826','Perugia','40187','Via Pontefice','70'),('KXYJHP30D10A786H','Martina','Sartini','1970-12-26','4006354530','Femmina','Italiana','274272935741186','Grottammare','41502','Via Borsellino','78'),('LECWXS29M53C678D','Matteo','Spalletti','1996-10-13','1952707189','Maschio','Italiana','4328146620993527','Grottammare','15717','Via Papa Bonifacio','20'),('LGJUDQ24F41M778G','Lorenzo','Santini','1963-12-25','9556430242','Maschio','Italiana','1158087686680373','Camerino','68046','Via Temistocle','26'),('LHSUPK08O85W501X','Arianna','Pretini','1951-11-29','6436079469','Femmina','Italiana','2363171132910199','Grottammare','15529','Via dei Fortunati','36'),('LHVGHL22S05W253M','Martina','Panni','1997-12-13','5219448889','Femmina','Italiana','3879648574884182','Ancona','58872','Via Papa Bonifacio','55'),('LOXTEI05C69L400K','Laura','Franchi','1959-12-27','100065281','Femmina','Italiana','6043798892955730','Ancona','42694','Via San Tommaso','27'),('LPADJY59X03P052D','Sara','Spalletti','1986-10-12','3204187471','Femmina','Italiana','71279274209790','Porto San Giorgio','60185','Via Mancini','29'),('LQXFLK89S95I587F','Sara','Solustri','1953-10-24','2581223347','Femmina','Italiana','630270958465022','Porto San Giorgio','49125','Via Papa Bonifacio','81'),('LRJLOC33G24T482J','Laura','Panni','1976-12-20','3955756225','Femmina','Italiana','1554154685668190','Senigallia','42165','Via Papa Bonifacio','78'),('LSCKQJ26S50R964K','Luca','Zaccari','1971-10-25','1351253973','Maschio','Italiana','6765220866958283','Porto Recanati','99914','Via Borsellino','62'),('LSFLHT82O37V407H','Giulia','Spalletti','1963-11-30','261746031','Femmina','Italiana','933488355180032','Grottammare','67676','Via San Tommaso','29'),('LTCSGA07H54P616F','Martina','Marziali','2002-11-20','8502355805','Femmina','Italiana','3908553262899015','San Benedetto','1600','Via Papa Bonifacio','21'),('LYUMYW72P19M575S','Samanta','Franconi','1971-12-12','6371242063','Femmina','Italiana','2329603108643208','Perugia','36904','Via San Tommaso','22'),('MBDWFP79K78G529X','Ciro','Zaccari','1951-12-29','916572674','Maschio','Italiana','3347064448097691','Ancona','97263','Via Puglia','5'),('MCNOEP56N19F359R','Lorenzo','Luconi','1969-11-22','9218569763','Maschio','Italiana','2933933776300356','Perugia','27453','Via Napoli','14'),('MCWXBC11J94P436I','Ciro','Pretini','1953-11-26','1182512722','Maschio','Italiana','9661829920101325','Pesaro Urbino','16685','Via Napoli','85'),('MHTPAC50T79W994F','Michele','Serpicelli','1964-12-16','2096525418','Maschio','Italiana','1205189829435584','Civitanova Marche','6597','Via Puccini','27'),('MNNMXF28S52Q088U','Martina','Serpicelli','1966-11-30','4682299053','Femmina','Italiana','954384397480160','San Benedetto','59409','Via Puglia','18'),('NENWRF36N65B469Y','Andrea','Franconi','1998-11-11','5440308880','Femmina','Italiana','1353043419863561','Porto San Giorgio','38376','Via Puglia','64'),('NFRRLT17O61S725J','Franco','Mereu','2002-10-21','671275271','Maschio','Italiana','5293867404864950','Senigallia','36262','Via Della Liberta','49'),('NLFWGC17I72M448L','Luca','Sartini','2002-11-16','6570832906','Maschio','Italiana','8610332386440144','Civitanova Marche','63557','Via Puglia','11'),('NMUQRD65E72G832B','Federico','Luconi','1983-10-15','9851512193','Maschio','Italiana','7333395859572474','Pedaso','15461','Via dei Fortunati','14'),('NNVYPL60A63S127N','Arianna','Scortichini','1976-11-16','6003839044','Femmina','Italiana','684998230583133','Varano','12823','Via Rapagnano','50'),('NPYJHS90S45Q039F','Luca','Panni','1989-10-24','4248040149','Maschio','Italiana','9815248420696652','Senigallia','97479','Via Mancini','89'),('NQOIQD55X32H375T','Susanna','Sartini','2004-10-11','1240753272','Femmina','Italiana','2944031287054255','Ancona','92148','Via Temistocle','14'),('NTONAK96P59R071B','Lucia','Mereu','1969-11-11','2954654166','Femmina','Italiana','3270543746475656','Pedaso','80062','Via Re Emanuele','18'),('NUOYXV61U80X214V','Samanta','Franconi','2001-10-23','102360613','Femmina','Italiana','8147906632408075','Perugia','72665','Via Napoli','32'),('NXMBEN30V29T775Y','Laura','Luconi','1969-12-15','1410184679','Femmina','Italiana','8216472855900081','Varano','7163','Via Mancini','41'),('NYICBD65P66V687X','Renzo','Santini','1978-10-15','4109852280','Maschio','Italiana','4630230503590354','Perugia','61394','Via Mancini','42'),('OAKYVS25F28P367B','Federico','Scortichini','1980-10-12','9643341315','Maschio','Italiana','5421159139395873','Varano','13865','Via Santo Stefano','10'),('OERQUJ71T27V603C','Susanna','Franconi','1981-10-15','6280447099','Femmina','Italiana','3874977222715524','Porto Recanati','92649','Via dei Fortunati','39'),('OHFDHY05V11B368N','Michele','Giorgini','1970-10-17','6973012154','Maschio','Italiana','7295061059692812','Grottammare','73672','Via Pontefice','11'),('OJWULM33Q16A909W','Renzo','Luconi','1975-12-17','3226238286','Maschio','Italiana','8545385405242238','Ascoli Piceno','54533','Via Borsellino','3'),('OLGOJU60C58H722N','Arianna','Marziali','1987-11-10','3250538825','Femmina','Italiana','4165451240852716','Senigallia','10939','Via Puccini','86'),('OOAGPS74M64H616V','Andrea','Verdini','1996-10-29','290985675','Femmina','Italiana','6888444095535196','Porto San Giorgio','13130','Via Puglia','59'),('OQJWMO81U97P078V','Marica','Luconi','1958-11-10','5089750595','Femmina','Italiana','5764491701552148','Ancona','87502','Via Napoli','74'),('OUXRXQ66L37Y461U','Alessandro','Luconi','1965-11-22','9794879100','Maschio','Italiana','5462371033930203','Recanati','89514','Via Santo Stefano','20'),('OYRIUL57D20F509X','Lorenzo','Serpicelli','2004-12-19','9907317918','Maschio','Italiana','6132288648241126','Perugia','16606','Via Roma','86'),('PETCEH36Q42X325U','Sandro','Zaccari','1964-11-30','7657157561','Maschio','Italiana','1659960573279705','Jesi','16691','Via Della Liberta','52'),('PKJJLE49I19C014F','Lorenzo','Zupo','1992-10-20','8785064384','Maschio','Italiana','1162320238594922','Camerino','60472','Via Puccini','81'),('PMAHDD06Q83S300F','Sandro','Luconi','1999-12-15','7753148808','Maschio','Italiana','8123041524679458','Porto Recanati','9644','Via Pontefice','50'),('PSLNVC94S76K687U','Ludovica','Panni','1967-11-21','3772087807','Femmina','Italiana','85651043313000','Ascoli Piceno','97346','Via Papa Bonifacio','71'),('PSQNBY38K61U568Q','Giuseppe','Rongoni','1975-12-16','4405748391','Maschio','Italiana','2681360665781213','Recanati','89963','Via Rapagnano','48'),('PUIEVB39M86Y177V','Emily','Ratajkowski','1991-06-07','3669235468','Femmina','Inglese','7382910283472145','Ancona','23236','Via della Vittoria','23'),('PVBGVB39M86Y176V','Maria','Scoperti','2002-05-26','1276923548','Femmina','Italiana','9405109283472145','Porto San Giorgio','87936','Via Suor Benvenuti','11'),('PVJITP05T48V757O','Federico','Franzoni','1999-10-29','968134704','Maschio','Italiana','2121177033203268','Civitanova Marche','966','Via Papa Bonifacio','25'),('PYCTHS06E13Y836X','Francesca','Franconi','1963-12-14','5987657829','Femmina','Italiana','3457034650293979','Ascoli Piceno','94905','Via Falcone','4'),('QAVUKN20K38U516N','Luca','Luconi','1981-11-25','5051570186','Maschio','Italiana','3737572122034618','Porto San Giorgio','97268','Via Puglia','14'),('QDTKFY58W83U558D','Lucia','Franconi','1976-11-18','1284437989','Femmina','Italiana','5219120608289826','Perugia','43669','Via Roma','18'),('QFTHGW74W61P201T','Mattia','Serpicelli','1979-12-27','9596459060','Maschio','Italiana','6508870367585731','Perugia','58122','Via dei Fortunati','12'),('QGGTAW54Y16N547I','Federico','Franchi','1954-10-17','4476458880','Maschio','Italiana','8727329119040772','Senigallia','13760','Via Temistocle','19'),('QIYNGC39M67Y779V','Michele','Sartini','1996-02-12','2330745111','Maschio','Italiana','9089109232674812','Senigallia','87716','Viale dei Caduti','17'),('QRJDBR60M30H935M','Renzo','Giorgini','2004-12-28','4385983591','Maschio','Italiana','8237151766770622','Grottammare','78995','Via Santo Stefano','51'),('QVGIPV48G02H675W','Marzio','Spalletti','1992-12-20','9710437838','Maschio','Italiana','4330266679367491','Camerino','87594','Via Falcone','85'),('QWKBKH48W17Y691X','Sandro','Zupo','1988-11-21','7028094379','Maschio','Italiana','9577727645451713','Porto San Giorgio','9591','Via Falcone','89'),('QXGIAQ88V52W955I','Matteo','Franconi','1998-10-12','7551080788','Maschio','Italiana','9401152570250336','Pesaro Urbino','66168','Via Della Liberta','31'),('RBWWYS46H39D285E','Samanta','Franchi','1974-11-17','6306660087','Femmina','Italiana','621649507373151','Recanati','11032','Via Puglia','84'),('RCUUSI63D62J338G','Andrea','Spalletti','1950-12-16','4116081249','Femmina','Italiana','3901259463302289','Senigallia','13614','Via Falcone','68'),('RGOVUS86J44X971O','Federico','Franconi','1964-10-21','687033947','Maschio','Italiana','8502286136594974','Ancona','52629','Via Temistocle','5'),('RKJOYT97H93X755U','Martina','Giorgini','1963-10-12','4374166442','Femmina','Italiana','556470834362971','Porto Recanati','26304','Via Santo Stefano','37'),('RRDRFE06Y16M946W','Federico','Cesarini','1978-11-20','1370149749','Maschio','Italiana','3926024486104607','Senigallia','82136','Via Mancini','57'),('RUUEHO22S46A672T','Franco','Cesarini','1987-11-19','8594320544','Maschio','Italiana','4365877033123750','Camerino','38178','Via Falcone','56'),('SACLQO01J70M592T','Francesca','Giorgini','1988-11-28','8994616355','Femmina','Italiana','205517171640120','Pesaro Urbino','97207','Via Mancini','36'),('SCDMHN25U90J273U','Giuseppe','Moretti','1952-10-15','9306159719','Maschio','Italiana','1300856945523424','Perugia','5934','Via Santo Stefano','83'),('SCLPFP95M04T246H','Marzio','Santini','1978-10-22','3550439182','Maschio','Italiana','4215082040937328','Fano','34586','Via dei Fortunati','20'),('SEBBUW29W39N010R','Samanta','Luconi','2004-10-29','9816148552','Femmina','Italiana','4199629281767008','Jesi','45710','Via Pontefice','27'),('SFUHYM67S26V008Y','Mattia','Franconi','1973-11-18','4552671262','Maschio','Italiana','5326077864690525','Senigallia','57489','Via Puccini','84'),('SGICWS88T02X614V','Renzo','Franchi','1954-11-24','3248988310','Maschio','Italiana','2525292465417942','Porto Recanati','28478','Via Pontefice','51'),('SJBXPJ51R69B522T','Mattia','Santini','1956-10-12','5653928885','Maschio','Italiana','5047949674792059','Porto Recanati','76547','Via Roma','52'),('SJSJJA92P13T834G','Federico','Pretini','1986-10-16','4624334248','Maschio','Italiana','4862009999589219','Pesaro Urbino','33787','Via Santo Stefano','9'),('SMJXJM78I84T277X','Mattia','Marziali','1996-10-25','1856376507','Maschio','Italiana','2000819644946515','Camerino','47621','Via Della Liberta','81'),('SPHMJY68O20V499Q','Giuseppe','Marziali','1987-12-14','9025223807','Maschio','Italiana','1875971844521640','Camerino','3136','Via dei Fortunati','38'),('SQFDEY56K98J659B','Marica','Franconi','1987-10-15','2748209371','Femmina','Italiana','3004464456953772','Senigallia','63376','Via Napoli','84'),('SSHLVB15G99P588G','Samanta','Spalletti','1996-10-10','3128979817','Femmina','Italiana','2731823041731709','Civitanova Marche','27350','Via Roma','53'),('STAUDC90Q72T685S','Michele','Franchi','1959-12-16','1517064033','Maschio','Italiana','6081355447801198','Ancona','23487','Via Puglia','30'),('SXUUAS01Q18W528N','Federico','Panni','1952-10-17','3041770995','Maschio','Italiana','3844278945170542','Recanati','27813','Via Mancini','44'),('TAINTB94N06F908Y','Renzo','Luconi','1973-12-16','4373432927','Maschio','Italiana','326498236490273','Civitanova Marche','85655','Via Rapagnano','85'),('TAKSRY24H51X819Q','Mattia','Verdini','1968-11-28','1223196119','Maschio','Italiana','7150917437762206','Ascoli Piceno','46873','Via Borsellino','16'),('TEFUTW29V26A742D','Franco','Franzoni','1974-11-10','6351514834','Maschio','Italiana','4421357562139637','Varano','63968','Via Napoli','74'),('TFPKYL19P40G076S','Mattia','Solustri','1989-11-29','4596664719','Maschio','Italiana','9262178031082927','Grottammare','33930','Via dei Fortunati','10'),('TGNTBL16D64O677O','Marica','Spalletti','1967-12-25','6792367739','Femmina','Italiana','8809100841004377','Varano','9248','Via Della Liberta','3'),('TIGWCA53K47U640F','Giulia','Marziali','1987-10-17','5365611215','Femmina','Italiana','7041833095986319','Jesi','76114','Via San Tommaso','44'),('TMSBRB15F33C770K','Lorenzo','Verdini','1971-10-15','7296038440','Maschio','Italiana','188796050684356','Civitanova Marche','63780','Via Re Emanuele','22'),('TPVCCV19C47P030L','Sara','Panni','1971-12-15','1485874807','Femmina','Italiana','6459015433270224','Pedaso','98730','Via Puccini','87'),('TSKARQ77L44P575S','Francesco','Solustri','1952-12-27','2377032399','Maschio','Italiana','7022757547021404','Perugia','88594','Via Puglia','80'),('TTPQJW09C34R447E','Michele','Mereu','1951-12-27','4470077712','Maschio','Italiana','5624725555373980','Jesi','41382','Via Santo Stefano','80'),('TYITWB84F92I250X','Samanta','Luconi','1994-12-10','160841465','Femmina','Italiana','6377901648499689','Pedaso','37243','Via Puglia','59'),('UEEKSF75L62M567X','Luca','Zupo','1990-10-23','717043348','Maschio','Italiana','8339994445105832','Civitanova Marche','77056','Via Borsellino','39'),('UFILIS56O30K325K','Mattia','Santini','1991-12-19','1040826300','Maschio','Italiana','1675404279259962','Jesi','27145','Via Puccini','8'),('UJCSIJ46E53E474T','Lorenzo','Cesarini','1970-12-23','9730922336','Maschio','Italiana','4634836590018616','Varano','91867','Via Falcone','70'),('UJQHKC52I85S396L','Ludovica','Franchi','1975-12-25','9776638908','Femmina','Italiana','6922343167042961','Varano','37120','Via Puccini','49'),('UNIEAB47O43V602P','Andrea','Moretti','1988-10-21','926725378','Femmina','Italiana','5398488103908550','Varano','49313','Via Roma','21'),('UUMJSW57T21O603R','Andrea','Panni','1959-10-10','6349207847','Femmina','Italiana','7135178423646687','Civitanova Marche','34772','Via Falcone','47'),('VGGNHK22D74M385B','Susanna','Moretti','2001-12-22','9047103618','Femmina','Italiana','2074255537268025','Varano','98318','Via Napoli','66'),('VIKMWI30N35T747I','Sara','Luconi','1982-12-22','374006495','Femmina','Italiana','6582548341054956','Senigallia','20722','Via San Giovanni','89'),('VINPNK63J55W335K','Mattia','Spalletti','1953-11-23','1566027004','Maschio','Italiana','8429708750869030','Pesaro Urbino','6511','Via Puglia','12'),('VIUNAE22F53V061V','Renzo','Panni','1981-10-15','6084187802','Maschio','Italiana','3178565600725197','Perugia','4864','Via Roma','11'),('VJSBHN19A25S904X','Matteo','Zaccari','1983-12-24','6033980948','Maschio','Italiana','2832841596309945','Ancona','99864','Via Napoli','73'),('VPKROK02H02A227P','Lorenzo','Scortichini','1973-11-11','7129688362','Maschio','Italiana','7209334432967962','Fano','47530','Via Roma','53'),('VRMTEJ48R18F690M','Susanna','Scortichini','2001-12-26','8807115663','Femmina','Italiana','5398469090395965','Pesaro Urbino','30084','Via San Tommaso','33'),('VSMIHX92H06H875E','Samanta','Giorgini','2000-11-23','6278851333','Femmina','Italiana','3712803021000225','San Benedetto','75493','Via Falcone','8'),('VTABKM57U98F537T','Renzo','Spalletti','1953-10-15','9479143697','Maschio','Italiana','1272550554469485','Pedaso','10785','Via Pontefice','85'),('VTMINB40H23B970C','Franco','Moretti','2003-12-27','9724666662','Maschio','Italiana','1032958730735065','Porto Recanati','5467','Via Puccini','17'),('WAANDA63L78Q879I','Andrea','Luconi','1954-10-21','7163971519','Femmina','Italiana','1263781905046443','San Benedetto','49661','Via Della Liberta','72'),('WIWRGQ68J53M851E','Mattia','Santini','1999-10-21','4414063872','Maschio','Italiana','2191335143506317','Recanati','31944','Via Re Emanuele','19'),('WKAHFB84M36Q554N','Susanna','Solustri','1988-12-28','897056171','Femmina','Italiana','6728170212279540','Jesi','28502','Via Roma','34'),('WNJCOJ11M51U591H','Franco','Rongoni','1984-11-12','7322127913','Maschio','Italiana','2721081436367866','Recanati','99311','Via Mancini','49'),('WNOLTW93S57R819E','Ciro','Solustri','1951-12-25','6549837458','Maschio','Italiana','5491444020877026','Porto San Giorgio','55487','Via Puglia','26'),('WOQSGB02M76X445Q','Lorenzo','Santini','2000-12-28','4910110127','Maschio','Italiana','7615966819403056','Ancona','20394','Via Puccini','51'),('WPCUXT79Q64H855D','Francesca','Giorgini','1970-10-11','5093526601','Femmina','Italiana','8941203406615126','San Benedetto','57975','Via Re Emanuele','63'),('WTUOBR47B32R980P','Ludovica','Luconi','1960-10-23','4997895557','Femmina','Italiana','3677987811570179','Varano','88242','Via Re Emanuele','67'),('WWYVTW93T99E877K','Marica','Giorgini','1993-11-30','3210174794','Femmina','Italiana','9020118098975634','Pedaso','18256','Via Rapagnano','1'),('WXBQUX62Y67V566S','Luca','Panni','1992-10-18','1968684812','Maschio','Italiana','3365250667618563','Senigallia','70358','Via Borsellino','71'),('XBNUUB66T53X467H','Francesco','Panni','1956-11-21','8644779967','Maschio','Italiana','9761619776972740','Pesaro Urbino','31216','Via Puglia','1'),('XBRJJN12C48B249A','Laura','Santini','1983-11-28','5284924130','Femmina','Italiana','9169822108412304','Varano','17984','Via Pontefice','58'),('XFMNYF93J48E378M','Federico','Mereu','1981-10-21','5078042375','Maschio','Italiana','2401238076751289','Perugia','48711','Via Della Liberta','39'),('XGJVTJ89V84M321L','Sandro','Spalletti','1965-12-12','9592389678','Maschio','Italiana','9005264701654358','Pesaro Urbino','96578','Via Puglia','61'),('XHSWDH00E32N723U','Marica','Marziali','1980-11-11','3619086529','Femmina','Italiana','7415922103791455','Perugia','11665','Via San Tommaso','1'),('XMGWMG89O34N763N','Mattia','Pretini','1969-11-25','5553128075','Maschio','Italiana','6060675577139394','Camerino','44973','Via Papa Bonifacio','42'),('YAMXAQ44C85U196G','Arianna','Rongoni','2000-11-14','1415116977','Femmina','Italiana','1336006490235204','Ancona','22486','Via Roma','59'),('YAOCSG46T07Y357B','Susanna','Franzoni','1976-12-24','8949041435','Femmina','Italiana','5432036329408075','Pesaro Urbino','42635','Via Rapagnano','17'),('YGLHUO32T08X577Q','Ciro','Rongoni','1966-12-11','9145724744','Maschio','Italiana','1782441189744775','Fano','60390','Via Santo Stefano','59'),('YHBMMC53L15X614K','Arianna','Rongoni','1992-10-17','4152692228','Femmina','Italiana','2124324329781467','Camerino','16453','Via Re Emanuele','61'),('YKCLCK31G70B442U','Matteo','Luconi','2002-10-29','9623476515','Maschio','Italiana','5219623728397924','Pedaso','52588','Via San Giovanni','28'),('YKEEGO00K91J568F','Marica','Pretini','1999-10-13','7690335068','Femmina','Italiana','4867245368130206','Ascoli Piceno','66283','Via Temistocle','48'),('YMBSSN10H28R278O','Ludovica','Franchi','1983-10-26','3437495505','Femmina','Italiana','3107701024620726','San Benedetto','4424','Via Pontefice','43'),('YOGGLW86J08O901T','Lorenzo','Franzoni','1978-11-20','6305640213','Maschio','Italiana','1975541514658399','Pesaro Urbino','74894','Via Puccini','32'),('YTQWDE15I17O982C','Samanta','Franconi','1997-11-22','8991282222','Femmina','Italiana','2226433767207369','Porto Recanati','97208','Via Rapagnano','12'),('YXHPHE76F58P923T','Luca','Franchi','1967-12-13','3089917431','Maschio','Italiana','4369780621727971','Civitanova Marche','48770','Via Pontefice','10'),('YXIKTV83N56O373K','Luca','Franzoni','1958-12-13','2026108733','Maschio','Italiana','4217799467026976','Grottammare','55682','Via Santo Stefano','13'),('ZXNTHB39M67Y779V','Michela','Marini','2005-05-11','2338785109','Femmina','Italiana','9089109283427812','Senigallia','86516','Viale Garibaldi','57');
/*!40000 ALTER TABLE `clicpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clionline`
--

DROP TABLE IF EXISTS `clionline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clionline` (
  `CodiceFiscale` char(16) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  `Telefono` char(10) DEFAULT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`CodiceFiscale`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clionline`
--

LOCK TABLES `clionline` WRITE;
/*!40000 ALTER TABLE `clionline` DISABLE KEYS */;
INSERT INTO `clionline` VALUES ('ADDUQS27O84W536R','Mattia','Serpicelli','1992-10-12','9787837800','mattia.serpicelli12@bd.com','MattiaSerpicelli'),('AEHODG18L98D145G','Marzio','Solustri','1981-10-30','2885891005','marzio.solustri30@db.it','MarzioSolustri'),('AHUSDE59L18B291Y','Alessandro','Spalletti','1956-11-17','5518569951','alessandro.spalletti17@bd.com','AlessandroSpalletti'),('AIEDCR03F03G901F','Franco','Marziali','1967-11-19','9338957649','franco.marziali19@db.it','FrancoMarziali'),('AKJAEX70O52M603T','Andrea','Luconi','1955-11-30','5482708804','andrea.luconi@db.com','AndreaLuconi'),('ALEQLL38L09O627S','Ludovica','Zupo','1975-11-29','6511264963','ludovica.zupo29@sql.it','LudovicaZupo'),('ANGLTY82X21B451P','Lucia','Cesarini','1978-12-29','5874461358','lucia.cesarini29@sql.it','LuciaCesarini'),('ANSXIF41D42W120F','Giuseppe','Pretini','1961-10-26','2363223521','giuseppe.pretini26@sql.it','GiuseppePretini'),('AOHLUQ88C81J711O','Susanna','Giorgini','1975-12-22','1158371637','susanna.giorgini22@db.it','SusannaGiorgini'),('ASPRCJ48D47U175Q','Luca','Rongoni','1960-12-27','878243640','luca.rongoni27@bd.com','LucaRongoni'),('AUEVCC94C94J961D','Matteo','Franchi','1956-12-20','7197913933','matteo.franchi20@db.it','MatteoFranchi'),('AYBMSC61Y29X555O','Ludovica','Giorgini','1979-12-30','6319346647','ludovica.giorgini30@sql.it','LudovicaGiorgini'),('AYNOBD81Q88T715L','Andrea','Santini','1962-11-22','3493858612','andrea.santini22@sql.com','AndreaSantini'),('BABQEE43I07J751C','Ciro','Zupo','1952-11-20','9152172325','ciro.zupo20@sql.com','CiroZupo'),('BANVPP74V75X653Q','Laura','Spalletti','1987-10-15','8102310381','laura.spalletti15@sql.it','LauraSpalletti'),('BCNQDF71O17J917X','Lucia','Cesarini','1961-10-27','9383983025','lucia.cesarini@db.com','LuciaCesarini'),('BDQIPB71K90K829N','Arianna','Giorgini','1994-10-19','717852877','arianna.giorgini19@sql.it','AriannaGiorgini'),('BECSVC92B58T015B','Martina','Giorgini','1998-10-12','9126648861','martina.giorgini@db.com','MartinaGiorgini'),('BFDUHM90X70X739D','Federico','Serpicelli','1999-12-15','8780488026','federico.serpicelli15@bd.com','FedericoSerpicelli'),('BHSESJ22F72F903F','Arianna','Panni','1956-10-14','7085809357','arianna.panni14@db.it','AriannaPanni'),('BITFND39E62J873L','Andrea','Panni','1952-12-20','3936738138','andrea.panni20@sql.it','AndreaPanni'),('BLFCDM30C69P666F','Laura','Moretti','1974-11-18','6139271309','laura.moretti18@sql.it','LauraMoretti'),('BMOYHB07G41C800H','Giulia','Franconi','1974-12-21','8770450735','giulia.franconi21@bd.com','GiuliaFranconi'),('BQCMEF23P84K584M','Michele','Giorgini','1963-11-12','7811209930','michele.giorgini12@sql.com','MicheleGiorgini'),('BSLTWF43A46C137X','Lucia','Spalletti','1955-10-14','4462028846','lucia.spalletti14@db.it','LuciaSpalletti'),('BTOOAI25L75J538Q','Francesco','Marziali','1975-12-20','8373947981','francesco.marziali@db.com','FrancescoMarziali'),('BUPIFV26I24K751V','Samanta','Sartini','1975-12-28','3287505017','samanta.sartini28@bd.com','SamantaSartini'),('BUUXWE04B83A194P','Michele','Giorgini','1966-10-28','1138198690','michele.giorgini@db.com','MicheleGiorgini'),('CEDIQG53P66Y840P','Luca','Rongoni','1972-10-29','4327344607','luca.rongoni29@sql.com','LucaRongoni'),('CFJQAO71T62L452P','Giulia','Solustri','1951-10-19','4742496819','giulia.solustri19@sql.com','GiuliaSolustri'),('CFNRME66G36Y321S','Sara','Franzoni','1991-10-16','7236955709','sara.franzoni16@db.it','SaraFranzoni'),('CKMTUM34Q88O150H','Franco','Marziali','1987-11-11','439763947','franco.marziali11@db.it','FrancoMarziali'),('CMFGCI25X70N517V','Lucia','Solustri','1970-10-16','54879945','lucia.solustri16@db.it','LuciaSolustri'),('CPHXSS01C62M488D','Laura','Pretini','1962-11-15','4341584300','laura.pretini15@sql.com','LauraPretini'),('CRMPND83M38X318H','Laura','Moretti','1979-10-19','7759070202','laura.moretti@db.com','LauraMoretti'),('CVRPRE40T70A839F','Marco','Santinelli','1984-03-21','3110097465','marco.santinelli@db.com','MarcoSantinelli'),('CWIPCM28L01K805Y','Matteo','Scortichini','1993-12-20','2425851000','matteo.scortichini@db.com','MatteoScortichini'),('DAMDFN03O95J593B','Giulia','Sartini','2003-11-21','8655649867','giulia.sartini21@bd.com','GiuliaSartini'),('DDCMGI60N27L547G','Francesco','Luconi','1969-11-20','2623100571','francesco.luconi20@sql.com','FrancescoLuconi'),('DEGJXD51B58V067R','Alessandro','Zaccari','1966-11-10','5851228652','alessandro.zaccari10@bd.com','AlessandroZaccari'),('DFHVKW38M16G268L','Ciro','Franchi','1986-11-29','1720549160','ciro.franchi@db.com','CiroFranchi'),('DKICOA20M22S797G','Lorenzo','Pretini','1975-12-27','3174728929','lorenzo.pretini27@db.it','LorenzoPretini'),('DMBADI93F33D082D','Michele','Serpicelli','1951-12-17','6513893035','michele.serpicelli17@db.it','MicheleSerpicelli'),('DMRDQH36J48C364D','Marica','Sartini','1952-12-22','1109014535','marica.sartini22@sql.com','MaricaSartini'),('DTJYVV44M17V665Q','Marzio','Zupo','1970-11-14','5056879005','marzio.zupo14@bd.com','MarzioZupo'),('EAIPJD89C23D436B','Lucia','Zupo','1974-11-23','4450426966','lucia.zupo23@sql.com','LuciaZupo'),('EDQQSN68D79R065A','Sandro','Santini','1962-12-12','2968256592','sandro.santini12@sql.it','SandroSantini'),('EITSQN04V85H875A','Mattia','Mereu','1966-11-13','4537753445','mattia.mereu13@db.it','MattiaMereu'),('EJJFNK38X13F115O','Marica','Moretti','2003-10-15','9568604569','marica.moretti15@sql.it','MaricaMoretti'),('EJRNEW18J42J460M','Andrea','Moretti','1961-11-15','8628691621','andrea.moretti15@sql.it','AndreaMoretti'),('EOUFMJ18V08C066D','Marica','Moretti','1974-12-30','4861321374','marica.moretti30@sql.it','MaricaMoretti'),('EXANNC34A77G491U','Martina','Franchi','1999-11-17','9739394511','martina.franchi17@db.it','MartinaFranchi'),('EXIFNJ17V07L957N','Andrea','Verdini','1979-10-29','6161145947','andrea.verdini29@sql.com','AndreaVerdini'),('FHAGIP75W16U754T','Arianna','Luconi','1976-10-20','8607265834','arianna.luconi20@sql.it','AriannaLuconi'),('FISKER03O47M350M','Sandro','Franzoni','1995-10-12','9016395042','sandro.franzoni12@db.it','SandroFranzoni'),('FJBMOX02H32P259O','Martina','Santini','1951-11-17','2832786646','martina.santini@db.com','MartinaSantini'),('FOFRBF31X33X763W','Marzio','Solustri','1963-12-18','6765332851','marzio.solustri18@sql.com','MarzioSolustri'),('FQGPVJ34T49Q853H','Francesco','Giorgini','1956-10-26','2932796202','francesco.giorgini26@db.it','FrancescoGiorgini'),('FQIEEX52Q67X081C','Susanna','Luconi','1963-11-23','970712531','susanna.luconi23@sql.com','SusannaLuconi'),('FRGTRR28H87C287S','Susanna','Spalletti','1969-10-15','7895392309','susanna.spalletti@db.com','SusannaSpalletti'),('FTSYPT52M48X645N','Renzo','Mereu','2003-12-29','6292726580','renzo.mereu29@bd.com','RenzoMereu'),('FVPIUR32E40D227S','Laura','Scortichini','1980-11-26','2755657088','laura.scortichini26@db.it','LauraScortichini'),('FXRXCR97D01N228D','Ciro','Verdini','1954-10-27','396798143','ciro.verdini27@sql.com','CiroVerdini'),('FZTQLN69A43L015R','Marco','Viti','1970-09-10','3555597789','marco.viti@db.com','MarcoViti'),('GBNXYR04L73A203J','Francesco','Mereu','1976-10-27','5192705261','francesco.mereu27@db.it','FrancescoMereu'),('GLSNCC41T70N727Q','Franco','Luconi','1972-11-11','901374163','franco.luconi11@sql.com','FrancoLuconi'),('GMMJDW10Q76S961E','Lorenzo','Panni','2003-11-11','7298010089','lorenzo.panni11@sql.com','LorenzoPanni'),('GNVTOQ35G62V846D','Francesco','Panni','1960-10-19','7076386567','francesco.panni@db.com','FrancescoPanni'),('GTBNWS15W80J671Y','Francesco','Spalletti','1964-11-23','8349909214','francesco.spalletti@db.com','FrancescoSpalletti'),('GTSCSL66D66F957M','Mattia','Palestri','1994-06-21','3990097465','mattia.palestri@db.com','MattiaPalestri'),('GXHPSB84K54E555H','Laura','Franchi','1975-11-26','3583827085','laura.franchi26@sql.it','LauraFranchi'),('GXTCXB82W54H303Y','Sandro','Franconi','1987-12-29','9961378499','sandro.franconi@db.com','SandroFranconi'),('HCBHYS75Y53O025B','Marzio','Verdini','1992-10-30','8159387485','marzio.verdini30@db.it','MarzioVerdini'),('HCEQYG05R70K212M','Matteo','Verdini','1962-12-10','157616574','matteo.verdini@db.com','MatteoVerdini'),('HGTYOM31M97P202E','Luca','Luconi','1971-12-20','3529517872','luca.luconi20@db.it','LucaLuconi'),('HLRAIP46R22N842W','Samanta','Zaccari','1996-12-13','6263988623','samanta.zaccari13@db.it','SamantaZaccari'),('HNUSXQ69T28B819E','Giuseppe','Marziali','1994-12-15','5110796987','giuseppe.marziali15@db.it','GiuseppeMarziali'),('HPAUYX91R47S989Y','Samanta','Giorgini','1956-11-28','4060811878','samanta.giorgini28@sql.com','SamantaGiorgini'),('HQJAFN38Q74T208G','Sara','Mereu','1987-12-22','8643981724','sara.mereu22@bd.com','SaraMereu'),('HRDTAK24A99X290O','Renzo','Cesarini','1951-10-29','3147423097','renzo.cesarini29@sql.com','RenzoCesarini'),('HUOMVY51L93P725F','Giulia','Giorgini','1979-10-18','891223072','giulia.giorgini18@db.it','GiuliaGiorgini'),('HXEFFP06X00F740R','Giulia','Giorgini','1961-12-18','213299375','giulia.giorgini18@sql.com','GiuliaGiorgini'),('ICGGEH95L37I823L','Matteo','Solustri','1966-10-25','4521176061','matteo.solustri25@sql.it','MatteoSolustri'),('IDFOLN97J30H541D','Federico','Serpicelli','1986-12-11','4813588680','federico.serpicelli11@sql.com','FedericoSerpicelli'),('IFJQTV53Y62A448Q','Ludovica','Pretini','1996-10-17','7212958636','ludovica.pretini@db.com','LudovicaPretini'),('IFLRMG31T45I625E','Samanta','Serpicelli','1984-10-11','8963256601','samanta.serpicelli11@sql.com','SamantaSerpicelli'),('IHNRYK28R27K988K','Francesca','Solustri','1969-12-11','7194368967','francesca.solustri11@db.it','FrancescaSolustri'),('IHORKO12L90N127U','Marica','Marziali','2004-11-13','5472556625','marica.marziali13@db.it','MaricaMarziali'),('IIXAEB48T76U667U','Arianna','Solustri','2004-12-30','500023312','arianna.solustri@db.com','AriannaSolustri'),('ILOCAY42T68A240K','Samanta','Moretti','1991-10-29','4902964053','samanta.moretti29@db.it','SamantaMoretti'),('IRSETC74K73N815Q','Samanta','Spalletti','1967-10-21','348749636','samanta.spalletti21@sql.com','SamantaSpalletti'),('IYDUBS10X23Y291D','Lorenzo','Spalletti','1967-10-24','7997777490','lorenzo.spalletti24@sql.com','LorenzoSpalletti'),('JAARWC32C91H960D','Martina','Santini','1975-10-22','4286200864','martina.santini22@db.it','MartinaSantini'),('JCCCTE90H85P624D','Martina','Pretini','1961-11-19','1702965285','martina.pretini19@sql.com','MartinaPretini'),('JGJBGO83I07P196M','Lorenzo','Solustri','1963-11-23','2744208971','lorenzo.solustri23@db.it','LorenzoSolustri'),('JHWMXN10Q46S795A','Susanna','Sartini','1989-12-11','5597370328','susanna.sartini11@sql.com','SusannaSartini'),('JIMBIH27M80I901V','Marica','Giorgini','1976-12-27','189372691','marica.giorgini27@sql.it','MaricaGiorgini'),('JJQFQB38U82C578I','Arianna','Scortichini','1996-12-18','1510033071','arianna.scortichini@db.com','AriannaScortichini'),('JLXXYT18V04T662I','Matteo','Mereu','1965-12-13','4476761959','matteo.mereu@db.com','MatteoMereu'),('JQTMXU69B70K833E','Samanta','Pretini','1999-11-19','7178854725','samanta.pretini19@sql.com','SamantaPretini'),('JWWMNM88U59A606W','Samanta','Zaccari','1965-12-16','9236384242','samanta.zaccari16@sql.it','SamantaZaccari'),('JWYFNQ80K62Q941X','Francesco','Rongoni','1994-12-26','5671800327','francesco.rongoni26@sql.it','FrancescoRongoni'),('JXIEEX04M82J818G','Ludovica','Zaccari','1994-11-20','8809354503','ludovica.zaccari20@bd.com','LudovicaZaccari'),('KBECCM85U47X272D','Ludovica','Zupo','2002-10-20','5430409266','ludovica.zupo20@sql.com','LudovicaZupo'),('KDGSDD41Y49J755X','Andrea','Verdini','1987-10-22','2720552042','andrea.verdini22@db.it','AndreaVerdini'),('KDXPYV66U41J408A','Francesca','Rongoni','1960-10-13','6032493966','francesca.rongoni13@db.it','FrancescaRongoni'),('KFIOUI67M14G810M','Federico','Rongoni','1994-12-10','3697688740','federico.rongoni10@db.it','FedericoRongoni'),('KGFPVR12V52E824Y','Giulia','Spalletti','1962-12-24','2632600203','giulia.spalletti24@sql.com','GiuliaSpalletti'),('KGUTQW25S56P608Y','Renzo','Giorgini','1960-11-17','7325711026','renzo.giorgini17@sql.com','RenzoGiorgini'),('KKQFCH54E83I111O','Franco','Panni','1960-11-21','340347123','franco.panni21@sql.com','FrancoPanni'),('KKXQCI74W32X202A','Marica','Zupo','1983-10-19','5842552050','marica.zupo19@sql.it','MaricaZupo'),('KPCTTF77E79N469T','Luca','Panni','1958-11-16','53883261','luca.panni16@bd.com','LucaPanni'),('KPRBKT44D50V547J','Giulia','Luconi','1973-11-13','9731304906','giulia.luconi13@sql.com','GiuliaLuconi'),('KQFXQL75T06M746P','Federico','Sartini','1956-11-10','8472284512','federico.sartini10@sql.com','FedericoSartini'),('KWLPTK06B86O943E','Alessandro','Franconi','1955-10-14','5664830034','alessandro.franconi14@bd.com','AlessandroFranconi'),('LBLSGN09D15Y863K','Giulia','Serpicelli','1960-12-18','4168154323','giulia.serpicelli18@db.it','GiuliaSerpicelli'),('LFKIUG84G20H719A','Andrea','Verdini','1970-10-18','5412493179','andrea.verdini18@db.it','AndreaVerdini'),('LGPYSX05G86U653K','Martina','Franconi','1957-12-20','1184405968','martina.franconi20@sql.com','MartinaFranconi'),('LJDFQL91G00T928W','Luca','Mereu','1985-10-22','971732591','luca.mereu22@bd.com','LucaMereu'),('LNUFAU75O43H477N','Matteo','Marziali','1999-12-17','7971471108','matteo.marziali@db.com','MatteoMarziali'),('LOQVJM12F72H249Q','Michele','Zaccari','1981-10-17','1242605788','michele.zaccari17@sql.com','MicheleZaccari'),('LPJQVF57W30Q518A','Giuseppe','Serpicelli','1975-10-12','6919744994','giuseppe.serpicelli12@sql.com','GiuseppeSerpicelli'),('LRRHBE13L76S052G','Laura','Luconi','1968-10-24','6019685171','laura.luconi@db.com','LauraLuconi'),('LSKJTT59B21S012D','Francesca','Luconi','1976-11-27','5496577560','francesca.luconi27@sql.com','FrancescaLuconi'),('MCOFIJ87N27I789I','Ciro','Luconi','1962-12-28','9060565724','ciro.luconi@db.com','CiroLuconi'),('MEGFJP57S33J892K','Michele','Luconi','1992-11-24','9513910908','michele.luconi@db.com','MicheleLuconi'),('MEMUUI33N79S568S','Francesca','Zupo','1969-12-11','9059873164','francesca.zupo11@sql.it','FrancescaZupo'),('MGUAAP55U32R647R','Marica','Rongoni','2001-12-28','7998456946','marica.rongoni28@bd.com','MaricaRongoni'),('MHTPBR01K25I046Y','Susanna','Sartini','1953-10-15','4614463003','susanna.sartini15@bd.com','SusannaSartini'),('MIVTES72O45G325I','Federico','Pretini','1974-10-29','1361596873','federico.pretini29@db.it','FedericoPretini'),('MLXEBW26A33R099B','Lucia','Sartini','1955-11-10','9583746585','lucia.sartini10@bd.com','LuciaSartini'),('MMTFMF97M39G528B','Martina','Rongoni','1958-12-30','5052393046','martina.rongoni30@sql.it','MartinaRongoni'),('MPKSHK81N63N605F','Lorenzo','Marziali','2002-11-23','4913660767','lorenzo.marziali23@bd.com','LorenzoMarziali'),('MPNPWE09I89E490I','Michele','Moretti','1967-12-23','4164550892','michele.moretti23@sql.it','MicheleMoretti'),('MPPRPW54B09G697H','Alessia','Rossini','2001-11-22','7833097465','alessia.rossini@db.com','AlessiaRossini'),('MPYAOD66M87V540E','Ciro','Luconi','1987-12-10','5483709619','ciro.luconi10@db.it','CiroLuconi'),('MRBLLU28R84U283B','Sandro','Franzoni','1985-12-10','3156365861','sandro.franzoni10@sql.it','SandroFranzoni'),('MSLBXP55H48I578E','Gregorio','Mosconi','2000-11-22','9711597789','gregorio.mosconi@db.com','GregorioMosconi'),('MTEOHO63X17Q585S','Marica','Verdini','1955-11-22','9888213208','marica.verdini22@sql.com','MaricaVerdini'),('MVLMAP04T69S573R','Laura','Zaccari','1994-12-17','9578539560','laura.zaccari17@sql.com','LauraZaccari'),('NADJKY58I30E508A','Ludovica','Spalletti','1962-12-13','1751952019','ludovica.spalletti13@sql.com','LudovicaSpalletti'),('NATYXK93A12M674T','Luca','Spalletti','1965-11-22','807775848','luca.spalletti22@sql.com','LucaSpalletti'),('NDCLGB20C50T240K','Renzo','Sartini','1969-10-17','993302388','renzo.sartini17@sql.com','RenzoSartini'),('NPAFWC07P57O608X','Lorenzo','Franzoni','1979-12-28','8462455887','lorenzo.franzoni28@sql.com','LorenzoFranzoni'),('NXEHQR93K86Y301R','Francesca','Solustri','2002-12-17','1304624087','francesca.solustri17@bd.com','FrancescaSolustri'),('NYGKEQ78W86D178T','Renzo','Rongoni','1986-12-10','5755790215','renzo.rongoni@db.com','RenzoRongoni'),('OADJAF09O32A610T','Matteo','Spalletti','1983-11-22','8719963632','matteo.spalletti22@sql.com','MatteoSpalletti'),('OALFTE09H30U862D','Lucia','Verdini','1952-10-28','2003041189','lucia.verdini28@db.it','LuciaVerdini'),('OCAIBQ43D66P761D','Alessandro','Sartini','2000-10-15','7111701706','alessandro.sartini15@sql.com','AlessandroSartini'),('OFSPLR99Q44F978A','Matteo','Marziali','1971-10-11','9855783243','matteo.marziali11@db.it','MatteoMarziali'),('OJIORB09O61H886C','Luca','Moretti','1950-10-13','6899588943','luca.moretti@db.com','LucaMoretti'),('OJVPUK64J41J538Q','Martina','Mereu','1966-12-21','4302788991','martina.mereu21@bd.com','MartinaMereu'),('OLXTXN13K52K519F','Francesca','Franconi','1972-12-15','6628640651','francesca.franconi15@db.it','FrancescaFranconi'),('ORIKYO06W36C154B','Mattia','Pretini','1961-10-21','338608571','mattia.pretini21@sql.it','MattiaPretini'),('OROSPA38C94T300D','Marica','Zupo','1973-12-30','3155680113','marica.zupo30@db.it','MaricaZupo'),('OUTVXU69A64H967L','Susanna','Solustri','1965-12-19','3927801469','susanna.solustri19@bd.com','SusannaSolustri'),('OWJIID44W15Q671K','Sandro','Scortichini','1995-12-17','875132646','sandro.scortichini17@bd.com','SandroScortichini'),('OXNOLH71N59D308R','Alessandro','Sartini','1954-12-25','2423478004','alessandro.sartini@db.com','AlessandroSartini'),('OYVVXP38L83J141L','Martina','Zupo','1998-10-10','4644225941','martina.zupo10@db.it','MartinaZupo'),('PBHGQL46W90I189K','Sara','Cesarini','1987-11-23','1249057646','sara.cesarini23@sql.it','SaraCesarini'),('PCNDNH97W52F422R','Giuseppe','Santini','2001-10-17','3412310679','giuseppe.santini17@bd.com','GiuseppeSantini'),('PCWXAU34H57O955S','Franco','Scortichini','1983-11-28','4062673236','franco.scortichini28@db.it','FrancoScortichini'),('PDUWVQ90W81I817C','Lorenzo','Franconi','2001-12-14','2052557188','lorenzo.franconi@db.com','LorenzoFranconi'),('PEQHXW32G92L886Y','Franco','Rongoni','1985-11-12','7687812539','franco.rongoni@db.com','FrancoRongoni'),('PMILUV76U91F265Y','Renzo','Sartini','1990-12-16','7369961484','renzo.sartini16@bd.com','RenzoSartini'),('PWKBIU93U40P278N','Marzio','Scortichini','1968-12-19','2380996695','marzio.scortichini19@sql.it','MarzioScortichini'),('PYEBPY87H40N477V','Samanta','Luconi','1992-10-24','6424328361','samanta.luconi@db.com','SamantaLuconi'),('QCFHOL18O92X631B','Matteo','Mereu','1997-11-11','4607058813','matteo.mereu11@sql.it','MatteoMereu'),('QGJLUM38F73E011G','Matteo','Santini','2003-12-22','8446927676','matteo.santini22@db.it','MatteoSantini'),('QGXSQD72H40U623O','Mattia','Rongoni','1950-10-10','2905084454','mattia.rongoni10@sql.com','MattiaRongoni'),('QJRDFV20H67H716V','Sandro','Serpicelli','1991-10-22','3830265954','sandro.serpicelli22@sql.it','SandroSerpicelli'),('QJRTJW74Q49K747U','Renzo','Solustri','1980-11-29','6162545313','renzo.solustri29@bd.com','RenzoSolustri'),('QMUVDY93A83F581O','Samanta','Luconi','1984-10-10','6600571697','samanta.luconi10@bd.com','SamantaLuconi'),('QNASFB93Q36W440J','Martina','Marziali','1994-10-23','4896177661','martina.marziali23@db.it','MartinaMarziali'),('QNDUHB95I95Y029V','Marzio','Marziali','1985-11-18','939438097','marzio.marziali18@db.it','MarzioMarziali'),('QQJAOA89J74O449C','Francesca','Mereu','1950-10-11','8382416833','francesca.mereu11@db.it','FrancescaMereu'),('QRIHCT09O73H323B','Arianna','Sartini','1994-10-27','4307624560','arianna.sartini27@db.it','AriannaSartini'),('QVGONH20O75H801J','Luca','Mereu','1965-10-27','9357527133','luca.mereu27@bd.com','LucaMereu'),('QWYWDW76K83U262L','Arianna','Santini','1992-10-22','8247310954','arianna.santini22@db.it','AriannaSantini'),('QXOLGT46M37Q916C','Ludovica','Serpicelli','1997-10-18','7675669797','ludovica.serpicelli18@bd.com','LudovicaSerpicelli'),('QYASXI33K70N227Q','Martina','Santini','1996-11-10','7168964339','martina.santini10@db.it','MartinaSantini'),('RAJUOE22Y71I518R','Luca','Sartini','1993-10-20','6470506345','luca.sartini20@bd.com','LucaSartini'),('RARJAL23D02B811B','Lucia','Spalletti','2001-12-12','707680245','lucia.spalletti@db.com','LuciaSpalletti'),('RDCIMS37I33C122Y','Arianna','Verdini','1963-11-12','4526273951','arianna.verdini12@bd.com','AriannaVerdini'),('REPKXR44W29E993R','Marica','Marziali','1983-10-21','6941931297','marica.marziali21@bd.com','MaricaMarziali'),('RFKSAK62X28V444M','Giuseppe','Rongoni','1963-12-14','7441836138','giuseppe.rongoni14@sql.com','GiuseppeRongoni'),('RGRHDC70F42Y707D','Federico','Franchi','1963-12-10','5379959912','federico.franchi10@bd.com','FedericoFranchi'),('RHBSHM69N85T702C','Samanta','Franzoni','1995-12-27','2376635536','samanta.franzoni27@bd.com','SamantaFranzoni'),('RICCSO93Y37R116N','Michele','Giorgini','1955-12-22','6249956822','michele.giorgini22@bd.com','MicheleGiorgini'),('RIHXKL71N78Y521V','Luca','Scortichini','1996-11-11','8381173521','luca.scortichini@db.com','LucaScortichini'),('RKRASV84F17U702Y','Susanna','Zaccari','1996-10-12','4739482651','susanna.zaccari12@bd.com','SusannaZaccari'),('RMMCYA13A73A090E','Mattia','Zupo','1968-12-25','1060385769','mattia.zupo25@db.it','MattiaZupo'),('RPVJBV24J90B572T','Samanta','Marziali','1961-12-14','3685742676','samanta.marziali14@bd.com','SamantaMarziali'),('RXRKYJ31B19O069O','Federico','Sartini','1982-10-16','2858205172','federico.sartini@db.com','FedericoSartini'),('SHDQKB94Q43A063B','Francesco','Mereu','1997-12-13','9224727394','francesco.mereu@db.com','FrancescoMereu'),('SOSLOS56Q70C657H','Giulia','Panni','1961-11-14','9639968594','giulia.panni@db.com','GiuliaPanni'),('SPCEQN44U04A185G','Giuseppe','Verdini','1989-12-14','810393649','giuseppe.verdini14@bd.com','GiuseppeVerdini'),('SRREPC79N18R009M','Lucia','Luconi','1979-11-20','7801718135','lucia.luconi@db.com','LuciaLuconi'),('SSFWMX90X01L069H','Michele','Moretti','1971-12-10','7290175326','michele.moretti10@sql.com','MicheleMoretti'),('SVDJGM31M29A335S','Irene','Mosconi','1999-11-11','8733097789','irene.mosconi@db.com','IreneMosconi'),('SWEQLT76Y93C718D','Ludovica','Verdini','1996-10-19','5561534306','ludovica.verdini19@sql.it','LudovicaVerdini'),('SWHLRM56N84O111J','Arianna','Giorgini','1995-10-30','4305076423','arianna.giorgini@db.com','AriannaGiorgini'),('SXSNPW32L21E899R','Arianna','Serpicelli','1992-10-24','8279526651','arianna.serpicelli24@sql.it','AriannaSerpicelli'),('TGEKWS19O07A943P','Franco','Luconi','1998-11-18','9693917843','franco.luconi@db.com','FrancoLuconi'),('TKBACG52R62E919D','Federico','Scortichini','1961-12-26','3071983782','federico.scortichini@db.com','FedericoScortichini'),('TKMLVF17I01S940U','Francesca','Giorgini','1996-10-29','9075178391','francesca.giorgini29@sql.it','FrancescaGiorgini'),('TMDSEP78V06Q228O','Samanta','Luconi','1957-12-29','7919484513','samanta.luconi29@sql.it','SamantaLuconi'),('TPWMLD99U29L545M','Andrea','Zaccari','1962-12-23','7610040578','andrea.zaccari23@bd.com','AndreaZaccari'),('TQUURB42P42O153E','Renzo','Franchi','1976-11-28','8618800769','renzo.franchi28@sql.it','RenzoFranchi'),('TQXROW65K33K180Y','Andrea','Spalletti','1980-10-22','2504131629','andrea.spalletti22@sql.it','AndreaSpalletti'),('TYDGAP14O08X597P','Mattia','Rongoni','1973-12-15','5439238161','mattia.rongoni15@bd.com','MattiaRongoni'),('UAATEX46P76F266D','Susanna','Moretti','1965-10-13','1570005334','susanna.moretti13@sql.com','SusannaMoretti'),('UCHHVD09X81X372X','Luca','Panni','1955-11-10','3922408160','luca.panni10@db.it','LucaPanni'),('UHDWMV98R88U847G','Samanta','Giorgini','1961-11-18','1592870956','samanta.giorgini18@db.it','SamantaGiorgini'),('UJVFMH88C31G250C','Franco','Solustri','1958-10-20','8292715705','franco.solustri@db.com','FrancoSolustri'),('UQGVSH50L56S695H','Lucia','Luconi','1982-10-13','3602242477','lucia.luconi13@sql.com','LuciaLuconi'),('UTFCNA50C77I458L','Mattia','Spalletti','1952-10-17','9771567216','mattia.spalletti17@sql.com','MattiaSpalletti'),('UTPKMT10N17C411U','Marzio','Marziali','1992-12-23','1971961750','marzio.marziali@db.com','MarzioMarziali'),('UVKOKN21X65C740V','Martina','Franconi','1953-11-11','5036606910','martina.franconi11@db.it','MartinaFranconi'),('VCSGDL96W30N510K','Marzio','Cesarini','1950-10-30','6096948888','marzio.cesarini30@db.it','MarzioCesarini'),('VGKHBI04K97K497U','Ludovica','Serpicelli','1954-12-30','3005987288','ludovica.serpicelli30@bd.com','LudovicaSerpicelli'),('VHRAHF72L22H095E','Franco','Franchi','1983-11-15','444445386','franco.franchi15@sql.com','FrancoFranchi'),('VJRJVB38V18H368A','Ludovica','Zaccari','1969-11-30','5169857413','ludovica.zaccari30@bd.com','LudovicaZaccari'),('VMGUQG51I53K864Q','Ciro','Cesarini','1984-11-11','4334595828','ciro.cesarini11@sql.it','CiroCesarini'),('VQVVKH12P88Y129F','Ciro','Scortichini','1989-11-30','9456727074','ciro.scortichini@db.com','CiroScortichini'),('VSNSDP29J50H718X','Andrea','Luconi','1969-10-14','461210330','andrea.luconi14@sql.it','AndreaLuconi'),('VUHVKW00T00X103F','Lucia','Serpicelli','1965-12-18','298329945','lucia.serpicelli@db.com','LuciaSerpicelli'),('WASQRM60K88K451E','Francesco','Sartini','2000-10-12','6338157802','francesco.sartini12@bd.com','FrancescoSartini'),('WAWIIY90Y48A026L','Giuseppe','Serpicelli','1983-10-15','5958918313','giuseppe.serpicelli15@sql.it','GiuseppeSerpicelli'),('WBHHVN93S44Q597W','Lucia','Franzoni','1969-11-14','5200242542','lucia.franzoni@db.com','LuciaFranzoni'),('WKAXKD50B01K810P','Ludovica','Rongoni','1988-12-11','7348175622','ludovica.rongoni11@db.it','LudovicaRongoni'),('WKOTDE02M58K397O','Francesco','Scortichini','1966-10-18','2909110262','francesco.scortichini@db.com','FrancescoScortichini'),('WKSJIA36D89D842N','Lucia','Cesarini','1952-10-13','1109098638','lucia.cesarini13@sql.com','LuciaCesarini'),('WMFPYG86P94I114W','Sara','Rongoni','1959-11-22','7335544854','sara.rongoni22@sql.com','SaraRongoni'),('WMJAKQ14A12O638M','Martina','Marziali','1976-10-29','5596503231','martina.marziali29@sql.com','MartinaMarziali'),('WSKGWH63G73I491C','Michele','Scortichini','1954-10-23','7820490796','michele.scortichini@db.com','MicheleScortichini'),('WTWLVM72U58T728X','Franco','Franconi','1957-12-20','9153759670','franco.franconi@db.com','FrancoFranconi'),('WXKEDW60W77R509N','Laura','Solustri','1967-11-23','258330523','laura.solustri23@sql.it','LauraSolustri'),('XBMULS07M76K071M','Laura','Rongoni','1998-11-22','8500982795','laura.rongoni22@bd.com','LauraRongoni'),('XEJHIQ64P57C032L','Sandro','Rongoni','1964-10-12','5661622283','sandro.rongoni12@sql.it','SandroRongoni'),('XHCJFL55W11K087P','Sara','Solustri','1972-12-17','8450052926','sara.solustri17@db.it','SaraSolustri'),('XKLLLI53R80Y364F','Laura','Giorgini','1959-12-20','473393079','laura.giorgini20@sql.it','LauraGiorgini'),('XLBKVP06T82H729E','Alessandro','Franconi','1987-10-24','5015308863','alessandro.franconi@db.com','AlessandroFranconi'),('XLQTXT41N71X518I','Lorenzo','Panni','1989-12-28','664492403','lorenzo.panni28@db.it','LorenzoPanni'),('XMOXGF58R25M518T','Matteo','Luconi','1980-11-17','7947813747','matteo.luconi@db.com','MatteoLuconi'),('XNGTOK67L27D032M','Franco','Luconi','1965-10-23','3847790497','franco.luconi23@sql.it','FrancoLuconi'),('XSXJET21S54B766W','Lucia','Solustri','1994-10-26','4872668993','lucia.solustri@db.com','LuciaSolustri'),('XYVBJP05S10U456W','Giuseppe','Cesarini','1990-10-15','2021040778','giuseppe.cesarini15@db.it','GiuseppeCesarini'),('XYWBBK16I64C590F','Renzo','Franconi','1968-11-20','6600082112','renzo.franconi@db.com','RenzoFranconi'),('YBOKAU40O40C512T','Susanna','Luconi','1959-12-21','1436040941','susanna.luconi@db.com','SusannaLuconi'),('YCCXDY94Y14S592D','Francesco','Zupo','1980-10-11','1574861027','francesco.zupo11@sql.com','FrancescoZupo'),('YCVSDA32Y79R780D','Arianna','Verdini','1983-10-15','5457788651','arianna.verdini15@db.it','AriannaVerdini'),('YGOFAE44D63P126O','Laura','Spalletti','1989-12-23','1208944691','laura.spalletti23@bd.com','LauraSpalletti'),('YJHYSI57I76S251A','Lorenzo','Marziali','1998-10-15','3534773778','lorenzo.marziali15@sql.com','LorenzoMarziali'),('YLTFVR44R27O474N','Marzio','Solustri','1975-10-19','483518568','marzio.solustri19@sql.it','MarzioSolustri'),('YNKTXX38Y82L355Q','Andrea','Franchi','1964-10-16','27887084','andrea.franchi@db.com','AndreaFranchi'),('YXNCHS61O24H434A','Luca','Verdini','2003-11-27','8815208706','luca.verdini27@bd.com','LucaVerdini'),('YYQTED14F00E781O','Franco','Franzoni','1963-12-11','7359988837','franco.franzoni@db.com','FrancoFranzoni'),('ZDLBDS82E59L367X','Matteo','Straccia','1974-11-29','3775597789','matteo.straccia@db.com','MatteoStraccia');
/*!40000 ALTER TABLE `clionline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compos`
--

DROP TABLE IF EXISTS `compos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compos` (
  `Composto` int NOT NULL,
  `Componente` int NOT NULL,
  `Quantita` int NOT NULL,
  PRIMARY KEY (`Composto`,`Componente`),
  CONSTRAINT `compos_chk_1` CHECK ((`Quantita` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compos`
--

LOCK TABLES `compos` WRITE;
/*!40000 ALTER TABLE `compos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenere`
--

DROP TABLE IF EXISTS `contenere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenere` (
  `AcqBar` int NOT NULL,
  `Prodotto` int NOT NULL,
  `Quantita` int NOT NULL,
  PRIMARY KEY (`AcqBar`,`Prodotto`),
  CONSTRAINT `contenere_chk_1` CHECK ((`Quantita` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenere`
--

LOCK TABLES `contenere` WRITE;
/*!40000 ALTER TABLE `contenere` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fila`
--

DROP TABLE IF EXISTS `fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fila` (
  `Lettera` char(1) NOT NULL,
  `Sala` int NOT NULL,
  PRIMARY KEY (`Lettera`,`Sala`),
  CONSTRAINT `fila_chk_1` CHECK (((`Lettera` <= _utf8mb4'N') and (`Lettera` >= _utf8mb4'A')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fila`
--

LOCK TABLES `fila` WRITE;
/*!40000 ALTER TABLE `fila` DISABLE KEYS */;
INSERT INTO `fila` VALUES ('A',1),('A',2),('A',3),('A',4),('A',5),('A',6),('A',7),('A',8),('B',1),('B',2),('B',3),('B',4),('B',5),('B',6),('B',7),('B',8),('C',1),('C',2),('C',3),('C',4),('C',5),('C',6),('C',7),('C',8),('D',1),('D',2),('D',3),('D',4),('D',5),('D',6),('D',7),('D',8),('E',1),('E',2),('E',3),('E',4),('E',5),('E',6),('E',7),('E',8),('F',1),('F',2),('F',3),('F',4),('F',5),('F',6),('F',7),('F',8),('G',1),('G',2),('G',3),('G',4),('G',5),('G',6),('G',7),('G',8),('H',1),('H',2),('H',3),('H',4),('H',5),('H',6),('H',7),('H',8),('I',1),('I',2),('I',3),('I',4),('I',5),('I',6),('I',7),('I',8),('J',1),('J',2),('J',3),('J',4),('J',5),('J',6),('J',7),('J',8),('K',1),('K',2),('K',3),('K',4),('K',5),('K',6),('K',7),('K',8),('L',1),('L',2),('L',3),('L',4),('L',5),('L',6),('L',7),('L',8),('M',1),('M',2),('M',3),('M',4),('M',5),('M',6),('M',7),('M',8),('N',1),('N',2),('N',3),('N',4),('N',5),('N',6),('N',7),('N',8);
/*!40000 ALTER TABLE `fila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(50) NOT NULL,
  `Anno` int DEFAULT NULL,
  `Durata` int DEFAULT NULL,
  `Valutazione` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  CONSTRAINT `film_chk_1` CHECK (((`Anno` < 2100) and (`Anno` > 1900))),
  CONSTRAINT `film_chk_2` CHECK (((`Valutazione` >= 1.0) and (`Valutazione` <= 5.0)))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Non e un paese per vecchi',2010,120,4.5),(2,'Tick,Tick...Boom!',2021,98,4.6),(3,'Red Notice',2021,123,3.5),(4,'Spiderman',2002,114,4.9),(5,'Lady Bird',2017,102,4.1),(6,'Caccia a Ottobre Rosso',1985,130,3.7),(7,'The Last Duel',2021,130,4.8),(8,'Dune',2021,145,4.9),(9,'Iron Man',2008,135,4.5),(10,'Split',2013,95,3.3),(11,'Shutter Island',2008,127,4.2),(12,'Pirati dei Caraibi',2005,95,4.5),(13,'Cars',2005,99,4.6),(14,'Wall-E',2008,97,3.6);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genere`
--

DROP TABLE IF EXISTS `genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `Genere` varchar(20) NOT NULL,
  PRIMARY KEY (`Genere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES ('Animazione'),('Avventura'),('Azione'),('Biografico'),('Commedia'),('Documentario'),('Drammatico'),('Fantascienza'),('Fantasy'),('Guerra'),('Horror'),('Musical'),('Storico'),('Thriller'),('Western');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orario`
--

DROP TABLE IF EXISTS `orario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orario` (
  `Numero` int NOT NULL AUTO_INCREMENT,
  `OraInizio` time NOT NULL,
  `OraFine` time NOT NULL,
  PRIMARY KEY (`Numero`),
  CONSTRAINT `orario_chk_1` CHECK ((((`OraInizio` = _utf8mb4'16:00:00') and (`OraFine` <= _utf8mb4'19:00:00')) or ((`OraInizio` = _utf8mb4'19:00:00') and (`OraFine` <= _utf8mb4'22:00:00')) or (`OraInizio` = _utf8mb4'22:00:00')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orario`
--

LOCK TABLES `orario` WRITE;
/*!40000 ALTER TABLE `orario` DISABLE KEYS */;
INSERT INTO `orario` VALUES (1,'16:00:00','18:50:00'),(2,'19:00:00','21:50:00'),(3,'22:00:00','01:50:00');
/*!40000 ALTER TABLE `orario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partecip`
--

DROP TABLE IF EXISTS `partecip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecip` (
  `Film` int NOT NULL,
  `Persona` int NOT NULL,
  `Ruolo` varchar(10) NOT NULL,
  PRIMARY KEY (`Film`,`Persona`),
  CONSTRAINT `partecip_chk_1` CHECK (((`Ruolo` = _utf8mb4'Attore') or (`Ruolo` = _utf8mb4'Regista')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partecip`
--

LOCK TABLES `partecip` WRITE;
/*!40000 ALTER TABLE `partecip` DISABLE KEYS */;
/*!40000 ALTER TABLE `partecip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (20,'Will','Smith','1968-09-25'),(21,'Thimothee','Chalamet','1995-12-27'),(22,'Jack','Nicholson','1937-04-22'),(23,'Jeff','Bridges','1949-12-04'),(24,'Zendaya','Coleman','1996-09-01'),(25,'Emma','Stone','1988-11-06'),(26,'Jennifer','Lawrence','1990-08-15'),(27,'Scarlett','Johansson','1984-11-22'),(28,'Natalie','Portman','1981-06-09'),(29,'Charlize','Theron','1975-08-07'),(30,'Leonardo','Di Caprio','1974-11-11'),(31,'Brad','Pitt','1963-12-18'),(32,'Martin','Scorsese','1942-11-17'),(33,'Steven','Spielberg','1946-12-18'),(34,'Quentin','Tarantino','1963-03-27'),(35,'Chloe','Zhao','1982-03-31'),(36,'Denis','Villeneuve','1967-10-03'),(37,'Damien','Chazelle','1985-01-19'),(38,'James','Cameron','1954-06-12');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `Numero` int NOT NULL,
  `Fila` char(1) NOT NULL,
  `Sala` int NOT NULL,
  PRIMARY KEY (`Numero`,`Fila`,`Sala`),
  CONSTRAINT `posto_chk_1` CHECK (((`Numero` > 0) and (`Numero` < 19)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
INSERT INTO `posto` VALUES (1,'A',1),(1,'B',1),(1,'C',1),(1,'D',1),(1,'E',1),(1,'F',1),(1,'G',1),(1,'H',1),(1,'I',1),(1,'J',1),(1,'K',1),(1,'L',1),(1,'M',1),(1,'N',1),(2,'A',1),(2,'B',1),(2,'C',1),(2,'D',1),(2,'E',1),(2,'F',1),(2,'G',1),(2,'H',1),(2,'I',1),(2,'J',1),(2,'K',1),(2,'L',1),(2,'M',1),(2,'N',1),(3,'A',1),(3,'B',1),(3,'C',1),(3,'D',1),(3,'E',1),(3,'F',1),(3,'G',1),(3,'H',1),(3,'I',1),(3,'J',1),(3,'K',1),(3,'L',1),(3,'M',1),(3,'N',1),(4,'A',1),(4,'B',1),(4,'C',1),(4,'D',1),(4,'E',1),(4,'F',1),(4,'G',1),(4,'H',1),(4,'I',1),(4,'J',1),(4,'K',1),(4,'L',1),(4,'M',1),(4,'N',1),(5,'A',1),(5,'B',1),(5,'C',1),(5,'D',1),(5,'E',1),(5,'F',1),(5,'G',1),(5,'H',1),(5,'I',1),(5,'J',1),(5,'K',1),(5,'L',1),(5,'M',1),(5,'N',1),(6,'A',1),(6,'B',1),(6,'C',1),(6,'D',1),(6,'E',1),(6,'F',1),(6,'G',1),(6,'H',1),(6,'I',1),(6,'J',1),(6,'K',1),(6,'L',1),(6,'M',1),(6,'N',1),(7,'A',1),(7,'B',1),(7,'C',1),(7,'D',1),(7,'E',1),(7,'F',1),(7,'G',1),(7,'H',1),(7,'I',1),(7,'J',1),(7,'K',1),(7,'L',1),(7,'M',1),(7,'N',1),(8,'A',1),(8,'B',1),(8,'C',1),(8,'D',1),(8,'E',1),(8,'F',1),(8,'G',1),(8,'H',1),(8,'I',1),(8,'J',1),(8,'K',1),(8,'L',1),(8,'M',1),(8,'N',1),(9,'A',1),(9,'B',1),(9,'C',1),(9,'D',1),(9,'E',1),(9,'F',1),(9,'G',1),(9,'H',1),(9,'I',1),(9,'J',1),(9,'K',1),(9,'L',1),(9,'M',1),(9,'N',1),(10,'A',1),(10,'B',1),(10,'C',1),(10,'D',1),(10,'E',1),(10,'F',1),(10,'G',1),(10,'H',1),(10,'I',1),(10,'J',1),(10,'K',1),(10,'L',1),(10,'M',1),(10,'N',1),(11,'A',1),(11,'B',1),(11,'C',1),(11,'D',1),(11,'E',1),(11,'F',1),(11,'G',1),(11,'H',1),(11,'I',1),(11,'J',1),(11,'K',1),(11,'L',1),(11,'M',1),(11,'N',1),(12,'A',1),(12,'B',1),(12,'C',1),(12,'D',1),(12,'E',1),(12,'F',1),(12,'G',1),(12,'H',1),(12,'I',1),(12,'J',1),(12,'K',1),(12,'L',1),(12,'M',1),(12,'N',1),(13,'A',1),(13,'B',1),(13,'C',1),(13,'D',1),(13,'E',1),(13,'F',1),(13,'G',1),(13,'H',1),(13,'I',1),(13,'J',1),(13,'K',1),(13,'L',1),(13,'M',1),(13,'N',1),(14,'A',1),(14,'B',1),(14,'C',1),(14,'D',1),(14,'E',1),(14,'F',1),(14,'G',1),(14,'H',1),(14,'I',1),(14,'J',1),(14,'K',1),(14,'L',1),(14,'M',1),(14,'N',1),(15,'A',1),(15,'C',1),(15,'E',1),(15,'G',1),(15,'I',1),(15,'K',1),(15,'M',1),(16,'A',1),(16,'B',1),(16,'C',1),(16,'D',1),(16,'E',1),(16,'F',1),(16,'G',1),(16,'H',1),(16,'I',1),(16,'J',1),(16,'K',1),(16,'L',1),(16,'M',1),(16,'N',1),(17,'A',1),(17,'B',1),(17,'C',1),(17,'D',1),(17,'E',1),(17,'F',1),(17,'G',1),(17,'H',1),(17,'I',1),(17,'J',1),(17,'K',1),(17,'L',1),(17,'M',1),(17,'N',1),(18,'A',1),(18,'B',1),(18,'C',1),(18,'D',1),(18,'E',1),(18,'F',1),(18,'G',1),(18,'H',1),(18,'I',1),(18,'J',1),(18,'K',1),(18,'L',1),(18,'M',1),(18,'N',1);
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Prezzo` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nome` (`Nome`),
  CONSTRAINT `prodotto_chk_1` CHECK ((`Prezzo` > 0.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `Film` int NOT NULL,
  `Sala` int NOT NULL,
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  PRIMARY KEY (`Film`,`Sala`),
  CONSTRAINT `program_chk_1` CHECK ((`DataInizio` <= `DataFine`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `Numero` int NOT NULL,
  `Metratura` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  CONSTRAINT `sala_chk_1` CHECK (((`Numero` > 0) and (`Numero` < 9)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,150.00),(2,175.00),(3,200.00),(4,165.00),(5,150.00),(6,170.00),(7,160.00),(8,140.00);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sceltafisica`
--

DROP TABLE IF EXISTS `sceltafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sceltafisica` (
  `AcqFisico` int NOT NULL,
  `Sala` int NOT NULL,
  `Fila` char(1) NOT NULL,
  `Posto` int NOT NULL,
  `Tariffa` int NOT NULL,
  PRIMARY KEY (`AcqFisico`,`Sala`,`Fila`,`Posto`,`Tariffa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sceltafisica`
--

LOCK TABLES `sceltafisica` WRITE;
/*!40000 ALTER TABLE `sceltafisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `sceltafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sceltaonline`
--

DROP TABLE IF EXISTS `sceltaonline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sceltaonline` (
  `AcqOnline` int NOT NULL,
  `Sala` int NOT NULL,
  `Fila` char(1) NOT NULL,
  `Posto` int NOT NULL,
  `Tariffa` int NOT NULL,
  PRIMARY KEY (`AcqOnline`,`Sala`,`Fila`,`Posto`,`Tariffa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sceltaonline`
--

LOCK TABLES `sceltaonline` WRITE;
/*!40000 ALTER TABLE `sceltaonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `sceltaonline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariffario`
--

DROP TABLE IF EXISTS `tariffario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tariffario` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) NOT NULL,
  `Prezzo` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Codice`),
  CONSTRAINT `tariffario_chk_1` CHECK ((`Prezzo` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffario`
--

LOCK TABLES `tariffario` WRITE;
/*!40000 ALTER TABLE `tariffario` DISABLE KEYS */;
INSERT INTO `tariffario` VALUES (21,'Intero',8),(22,'Ridotto (bambini)',6),(23,'Ridotto (anziani)',5),(24,'Martedi al cinema',5),(25,'INGRESSI CPC',5);
/*!40000 ALTER TABLE `tariffario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-15 10:42:33
