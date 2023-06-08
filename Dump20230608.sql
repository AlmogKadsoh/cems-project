-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cems
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(45) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `course_subject_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_course_subject_id_idx` (`course_subject_id`),
  CONSTRAINT `course_course_subject_id` FOREIGN KEY (`course_subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('01','Algebra1','01'),('02','Algebra2','01'),('03','Data Stracture','02'),('04','C Programming','02'),('05','OOP','02'),('06','Physics1','03'),('07','Organic Chemistry','04'),('08','Calculus1','01');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` varchar(45) NOT NULL,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1','Software Engineering'),('2','Information Systems Engineering'),('3','Industrial Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_number` varchar(3) NOT NULL,
  `subject_id` varchar(45) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  `exam_id` varchar(7) NOT NULL,
  `num_questions` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `examinees_notes` text,
  `professor_notes` text,
  `professor_full_name` varchar(45) DEFAULT NULL,
  `professor_id` varchar(45) DEFAULT NULL,
  `password` varchar(5) DEFAULT NULL,
  `isActive` varchar(2) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `exam_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_number`,`subject_id`,`course_id`,`exam_id`),
  KEY `exam_professor_id_idx` (`professor_id`),
  KEY `idx_exam_id` (`exam_id`),
  CONSTRAINT `exam_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('01','01','01','010101',3,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','computerized',NULL),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','0','computerized',NULL),('03','01','01','010103',2,40,'test','test','Daniel Armaganian','209146943','1234','1','computerized',NULL);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `exam_id` varchar(7) NOT NULL,
  `question_id` varchar(6) NOT NULL,
  `score` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`exam_id`,`question_id`),
  KEY `exam_question_question_id_idx` (`question_id`) /*!80000 INVISIBLE */,
  KEY `exam_question_exam_id_idx` (`exam_id`),
  CONSTRAINT `exam_question_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010103','01001','50'),('010103','01003','50'),('020502','02004','100');
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_stats`
--

DROP TABLE IF EXISTS `exam_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_stats` (
  `exam_id` varchar(7) NOT NULL,
  `date` date DEFAULT NULL,
  `time` int DEFAULT NULL,
  `actual_time` int DEFAULT NULL,
  `no. student` int DEFAULT NULL,
  `no. completed` int DEFAULT NULL,
  `no. uncomplete` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_stats`
--

LOCK TABLES `exam_stats` WRITE;
/*!40000 ALTER TABLE `exam_stats` DISABLE KEYS */;
INSERT INTO `exam_stats` VALUES ('010101','2023-06-20',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `exam_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_exam`
--

DROP TABLE IF EXISTS `manual_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_exam` (
  `idmanual_exam` varchar(20) NOT NULL,
  `manual_exam_file` blob,
  `exam_path` varchar(200) DEFAULT 'C:',
  PRIMARY KEY (`idmanual_exam`),
  UNIQUE KEY `exam_path_UNIQUE` (`exam_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_exam`
--

LOCK TABLES `manual_exam` WRITE;
/*!40000 ALTER TABLE `manual_exam` DISABLE KEYS */;
INSERT INTO `manual_exam` VALUES ('010201',_binary 'PK\0\0\0\0\0!\0ߤ\�lZ\0\0 \0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�n\�0E�����Ub袪*�>�-R\�{V��Ǽ��QU�\nl\"%3�\�3Vƃ\�ښl	�w%\�=���^i7+\�\�\�-d&\�0\�A\�6�l4��L60#�Ò\�S\nO����X�\0�*��V$z�3��3\���\��\�%p)O�^���\�5}nH\"d\�s\�Xg�L�`��\�|\�ԟ�|�P�rۃs��\Z?�PW�\�tt4Q+\�\�\"�wa���|T\\y���,N\�\��U�%��\�-D/�\�ܚ��X�ݞ�(���<E\�\�)�\�\Z\0;\�N�L?�F�˼��܉�\Z�<Fk\�	�h�y�\�\�\�ڜ��\�q�i�\�?\�ޯl�\�i\�\01\�\�]�H\�g\��m�@\�\�\��m�\0\0��\0PK\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j\�0@\���ѽQ\���N/c\�\�\�[IL\�\�j\���<\�\�]\�aG\�\�ӓ\�zs�Fu\��]�\Z�U\r��	\��^\�[��x\0����1x\�p\��\��f�\�#I)ʃ�Y�\�\Z����\��\�*D�\�i\")\�\�c$���qU\���~3��1\�\�jH[{�=E���\�~\nf?��3-��\�޲]\�Tꓸ2�j)�,\Zl0/%��b�\n\Z�\�\�z���ŉ�,	�	�/�|f\\Z�\�\�?6\�!Y�_\�o�]A�\0\0��\0PK\0\0\0\0\0!\0\�Q�<\0\0�\0\0\0\0\0word/document.xml��_o\�0�\�\'\�;Dy�\�*V\�\�\�$���8�X�\�\�6�\�w\�B��\n\�x��\����\�wq\�N<��T*&ҙ\�\�9�ES\"\"�\�g�˯\�`b[J\�4H\�\�>Se?̿~�\�\�H����\0��0\�\�̎�\�B��)\�\�3\"�;}GGb�c��\\\�y�\�O��*�qz\�ʮp\�ԍI�����\��\�0ܛ!#4E�6\�\��zn\�ߌ\n��\Z��W-Ҩ\�\��H^�4\�G�ۤI?R\�8��Map\'$\�\Z�r�8���l\0\�k�e	\�g`:A��,}\�\�h]܏n&�M�����}�iX\�.�\���ԯ��M��sSDO:Q�֕]bW�/�\�RD\rI�@E�b�]�\�K����?\n��\'��<s;�ڿJ۲܆\�\��j\�xRz�1\�u:\�A\\4���\�f\�	�\�\���\��O\r�Z��Ў/��1��4\�m8�cZ՜rW�5�u;\�����D���_�a\Z�~\�R��\�\�p�!��5���$�!\�\�8�\�\��*\�\��sI�]�C\�\�\�\�h림\�\�s�J\�낡>\�\�s�3����\�}*$\�&\���\�b;`�\�Й�x��Bn�\�2�ʞ\�\rm+��i3��x\r|\�\�r\�-\�B\n\�7m�\�r�|Z-F \r\�6��َ3��?���t��6#�Go\�.\n+\�F�F�M�\�=\�?bxU\�t��l��=��Q3��J\��\�\�1\�3��^)\�,�-��Z\�\�=�63u9�4\�^q0|�6zZ�ޮx\\�ެ�ZW-\�\�w��-�����]\�(�\�\� qם��EB���ğCf\�l�Z��\���\���n�[��\�M?���ј∂ݱWtwB\�\�����S�#\"Q U&��S�\�\�4�4LXJ7L�\��QT��x,�*j�*\�\0\0\0��\0PK\0\0\0\0\0!\0\�d�Q�\0\0\01\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0E�����}-;}PB\�lJ!\�\��\0E?�,	\��`HI\�\�`��r��sπ6\�\���w�\�{��\�r茯{\�*x��\�AkWk\�*�`[^^l�\�jNK\���D�8R\�1���d:4e>�K/���\�4\�Vm^u�r�\�w2NP�0ŮVw�5�j��o�\�\��7o:>S!?p��\�\�8JX[d�0KD�\�EVK�\��c2�P,���ũ�a���]��\�.��\�ﰘs�Yҡ�+����\�(!O>z�\0\0��\0PK\0\0\0\0\0!\0��g�\�\0\0\� \0\0\0\0\0word/theme/theme1.xml\�YK�G����\�z\�\�a�5\�H�k\�6޵���Rk���i\�\�ڵ0�`�r	��C�\�B1\�\�c�I��\�I3-�ď]�	��U?�������4s\�\���:G��[=Wq��ؘ$aǽ}0,�\\GH��e	\�,܋;�v�����8�:n$\�\�|�,F0�\�96\�	\�M���.\�c��AoL˵J�Q�I\\\'A1��1��v�Jwg�|@\�_\"�\ZQ��TcCBc\�Ӫ�P\�!\�qa�1;>���\�P$$Lt܊�s\�;\�k!*dsrC���[\n��5-\�\�õ�\��^��֯Tn\�\�Ac\�X\�\�\04\Z�NS.�\�f-�\�(mZt���z\��\��׷�]_}��Mo?�\rs��\�o\��^�\�7�kP\�llᛕn\�k\Zx\r�(I�[\�ߨ�ݮ!F/[\�m\�6kKx�*\�+�OdQ�\�\�\�C\0h\�\"IG.fx�F�%��8�$� �f(a�+�ʰR��\�\�\��(:�QN:\Z��!\�\�#Nf�\�^�n�\�ŋ����|��\�Ǐ_>�u���\�e��y�7?}�\�\�/����͓o\�x�ǿ�\�\���_\�A\�g��?{��\���\�\�rt���\�:>vn�6hY\0���8�\�Kt�P�)z #}}�(�\�zش\�\�\��4�gޏ�\\�Z�=\�h�q랮���V�\'�}q>\�\�n!td[;\���`>��\'6�A�\r�7)��8�\�Qsl��E\�.!�]�Ȉ3�&ҹK�\"V��C#�2�\�$�,l�߆m�\�8=Fm\���\�D\�\�@ԦSÌ�\�\\�\�\�\�4�\�E2��\�_�ap!�\�!�\���6�|aнi\�\��=��M$�djC\�\"\��\�>��gV\�$��\�+b\n!���LZI0�>�%�\�C�\�\�ې�\��f\�\�v$03\�\�N�)\��\�H�]N�\�ћ�Fh\�bL\�1\Zc\�ܾbó�a��\��\�el�\�Udƪ\�\'X@����c�0Bv���\�\�b#�,P#^���\��\\u�5^\�hj�R\�ա���!bc�ZoF\�+\��x]p\�\�r\�@\�\�\�\����\��ζ9@\�X �U�-݂�\��LD\'-6�\�M\�C����Q�\�$yk�Q�����\n\�\�O-\�өw\���T:E\�d��)\�mV5\�c�\�5}4Onb�G,г�欦�\�\�4E\����9�d\�*�\�G�d�\�E?Z=\�\�Z\�§>B\�\\P�+t\�#\�쏇0�;Zh��iAs���9\�m�3��\�~�f�LU���\�P83&�p\�\�V\�j�\�\�=6NG�\�\�sM@2�\�k5e�LG\�\�\�Z�\��A늀�}�\�Lu�\�j�-$�\�N�E\�¢�\��\�_K��\�\� �H\��RFn\�c\�T~\�\�S�t�1\�m\�,\�k+��\�i�D.\�L�0�\��\�>e_�3�\Z��)�i4[\�\�*�l\���=\�\�\\\�5#4\��\�\�x��\�T��I\�ɥ�?$�̸�}$���\��\�Db\�PC�\�\�@��[�\�T{�Dɵ+��\��W\�\�x2�#Y0�ua.Ub�=!Xu\�H\�G\�c\�\��-��Ue�1rm\�1\�\�ά����G\�xߒQDgZ\�(�d�\�u{M\'�\�tsWf��\�P9\�ķ\�ۅ\�D.i\\ \�ִ珏w\�\�Xey\�`��\�\�\\\�^庢[\�\�B�Z��AM1�P\�FMj�X\�[�f\�qڷ�fԪbUW\�\�֋mvx\"�\�\�J��¯��\�+\�4\�\�Uv�/�9\'�A\�\�zA\�J��?(yu�Rj�\�z�\���\���V��\�C0��⪟�=��t�|o�Ƿ\�\�ǫR�܈\�e�\�\�\�\�\�w�\�<hԆ\�z�\�(�\�\�a\�\��Z�v\�\����\���\�>t�#\r����kZ�F5J^��\�ڥ�W�u�f�5�������W\�ռv�\0\0��\0PK\0\0\0\0\0!\0�\'�v\0\0\�\0\0\0\0\0word/settings.xml�V\�o\�6~���\��Y��8B�\�v\�%E�u�=S\"m\���\�\���)\�r��pZ\�Ŧ\��\�x<\��\��\'\�;�4�b\Z\�\�`@D)1\�i��aN��6H`Ĥ \�\�@t����\�\�\�sM�5=\0\n�s^N�ʘ:�\"]V�#}!k\"\0\�Hő�O��8R�M��\�\�Ђ2jQ2fAG#�A�D\�Q���Jj�1\�$��\r-I�\�-\�9~[�Y6�\�<F�0�A\n]\�Z{6��l\0V�d��M\�8�z�xx\�v�R\�\�9\�Y�Zɒh\rę��\�q��\�\��|w[tT`\�\�4��\��YI�^\�1\�8\"�<\��u<ّ������\�@c��W�$>���EUH�\�2�\�5>\�x�#\�Ω����B���]\��2�\�\n�P� (����Eg!��\�-ɓ�\�<\�\�#�H\���&���\rf<\"`�A\r3�XY�\�A��I�R�4D�kTB\r/�0J2��\�\�\�,��((�\�\�u�~�n�X\�!\�gg%1��}\�(z~~����O]~\�HB7U����90��\�\���	��ц�\�;��� \�z��p�ɒ \�@�\�ș;�%���*%՝�p\�o\�n6D��YA�P%�.Ϸabo\�\�\�_P��5z��|�Kc$�=\�\��\�N\�\�{tZ�0����OR��\�0�&m�=�̲\�(�2[$W��\�y\�c�(���;\�\��BQ4X\�AY�B=Ω�xA���Sd\�\�\�1��$z�%�\�\���lܚ��\��������ȇ#�\�1D��dS�\�^��-I��igI���\�\�uS�����w5\�)��>=�\����}�\\�8]\"\�\�g{�ŶHxw\�USk[d�\�-�bOF������/\�#�Ql�K����@�\�(hw�^�xى\�\�\�F�,������l\�\�2/ˬ��v���1���dL\�	�\���6	�B5�i[?T�l\�,Ѓ]N�`HL\r�:k�9�B<L2k\�i3t��y�k1�\\?g��\�\�3cW�\�\�bGRI�:\�^��\�\r�Q\r]���d��\��\�\��\�\����\'\�(�\�\�(�\�n�\�8\�\�?�\�i�;̛�[ӯ\�y\'�e&��e�&��pr3���E�\�\\��x6�\�\�Y�\0��\0\0��\0PK\0\0\0\0\0!\0{ע�\0\0Os\0\0\0\0\0word/styles.xml��]sۺ�\�;\���\�U{�\��x�s\�q�\�S;\�\'��k��$\� ��Tl�\�\0)	�\��&�(\�/\�%�\�o�?�2�\��B�\�|0z0�x�Dd���\���wQQ�,aRe�|��\����ߞΊ�E�\"Ҁ�8K\����,�g\�a/xʊ�j\�3�\�L\�)+�\�|>LY��Z��U�d��\n)ʗ\�\���xPc�.5���Q�*\�Yi\�9����b!�Ś�ԅ���d����\�\�TV���l�P*\�\\jV�\�;S�Ȣt�\����\�-\�8�q̟q�5c�#]�Hp��#�\�P$e�@Q\�\�:4��dV,\\\"\�u\�d�{I\���\��<S9�JMҪGZ�ȂͿz�\��O�l��]|\�^HT��\�\�J��y�\�\��\����\�\�\�\"z:cE,Ľ\�n%������gEyQ\��\�\��\��N\\�\�\�\�\"��i�\�~��\�\�jS�\�͖͆Kө�m�e��6���xp;g7=L̦�nJ�9w}cG\�gR\�Y�\�ub0�,�\�yr���?�+&͇���T�;õ|�\��r\�ba;\�f%\�ib4>0=�\�d�Ó�\�?VF<�*U݈T�o�C��\�:�L���\�\�?�dR\�7\��-��\��.*\�i\�|�Ѷ�7Nx*�D��\��`�	��\�\�C��\��?�\�\�So�\�*\���\�,�E��9\�K�\���3�~7\�|z%��\����a�Z���g&�G�\�\�}\�\�D\�\�63W��\�~\n\�\�\�[5t�V\r��UC\�j\���\Z��V\rY\���!�%��a?�\�}�\��\�\���\��U\��\�\�DGs<�\��LS�T�o:��\�3\�۹��a\����0\��#@w\�\�\�\�\�a\��\�<��?{�q�\'k<�ZjE\�\�fY\�\�e3�\�L�<2�\�\�4�i�-qix\�\�s��$�T��>��\�̾\�?C�IÏ祩#5�fbnJ�\�\�\�/.ՒG,I4��s]�yF$dN\�|\�s�Ŝrb\�AM%e�tJ07�lN\�\�YB<|k\"IR\�Lh]?/�I��NY���]S�,?܈��XH�y%%\'b}��b�տ6�����\���,�a\�hF5D5�h�j\Zр\�4�q�\�\'ո\�4�q�iD\�V\���۽(�M�\�c\��\�ݥT\�D\�~L\�<�ge{�\�s�\�\�\�<g\�Ed\�j7c\�}ƶ�Y%/\�=\�1mC�Z\�\�)b\�e�l\�@whT\�\���\�\�l\�\�o�[�L6�+�zf�������N��0����\�\�\��3lk�o\"/\�lЌ%��\�\�r\�\�I����\�߱-���^g%\�\�\�H�^J?Ҥ᫗%\�uY�؛�MI��xBG����\�k�C+I\'\�M�V[+\� �\�׷3D�l\�{�\�$�n_ߥLȈnqu{ݫ�)3\��\�\0?��T)�>���|�w�^\�\"8{!\�\��\�Cv)2I%D$�\�� 9�Z\�?�\�T�<��\�强��\�D\�	K�բ��[:/>\��C�\Z���\\��BT��\'�9�\r�\��\�<\�꾫�\�\�\��Ҟ�K]M�\�L\���_\"X5�\��\�_��\���\�\�\�\�^JV\�{	5�G��k���/�j��*��$\�\0��d#��\r���4+(�\��w\����p\�X�)9\��G.21,�J	���¨4�0R�ߡ\���ߦ\���߫S���\0�j������80�yfaT�\�¨晅Qͳ�/�\��\"�\�\� �會�;\�d%O�*g��\�sFp���\�\�jf-QYu7Ҝ����\�\nG%�O>%\�aQ��\��(�R)�sk\���ܽwm_�}�w\�$��BɄ\�}�\�\�zyR=�����N{ވ���&�\�\�~3>\��.\�w\��7\�4\�\��\�/Ma�<�t\�Q�0\���{��\�;�\����+��ȓ���\���\�\�*y\'�c$l�C\�H\�ӝ\�6?|a�c\�D8m�?�\Z\�3�N\�f\�&��ٶ���l���m�h\�*\�E��P�n��\�w3�?\�\"?c\'?�����6��࿄9�c��mos�\��v\�)s��R\�y��N\�\�\���\�Q#\�����,\�\�\�\�Ə\�w��\�	ȏ蔉�ᨔ\�t\�M~D\�$\�G��<\"\��\�e+�� %$[�X���~ڨ�6j����2*2*���\nh�Bڨp�3*�\�ƇRB�\n)h�Bڨ�6*D��\nh��\�\�AF��Q!mT�@ծ{\�\�\n\�C�\n)!F��Q!mT�@\"\�F��Q!eTdTHA\"\�F��Q�G\rÍ\n\�qF��!F���B\nڨ�6*D��\nh�Bڨ�2*2*���\nh�Bڨ�ba�\�x�Qa|�Q!%Ĩ��6*D��\nh�Bڨ�6*D��\n�\n)h�Bڨ\�6?\�K��\�\�G���\�;��_��;�\�}�\�EuG�{\�gu\�R�QデG�\�\�S)�=E\�\�r\�-��\\�?\�\�\�{~\�R�,��f\n\�\�]#�9�\�)\�F�\"\�m���`\�yܖ}\�Hp<nK�֗\�R�\���\'x\�	o\�\�N8\�\�\�n\�\�N \�|\��D&9��>\�8N\�\����\�6©�\�6-�V\�t�\�U4?��z~BW���^^X?\n��&5�V\�p��	X�!!Hj�	�\Z�����0�ab\�J\r	X�Ó��$5��K\rQ�RCT�\��P��\Z�RCV\�d/&\\j�\n�\Z�¤��;�Ԑ��\Z�RCB�\�\0.5DK\rQaR�*-5$`���Ԑ$5��K\rQ�RCT�\��,ʎ\�(��p\�\"\�	\���@\\rv�%\':�Zr�\�\�j�9�ZrE���\�\'t�\�O@\�\�\�\����\�\n�QaR㪥&�Í\�\'`�\�UK^�q\�R�Ըj�Uj\\�\�\ZW-5I�����O\�~B�Ըj�Uj\\�\�*5�Z�K�����\�UKMR㪥&�{���p�q\�R�Ըj\�/5�Zj�\ZW-5I�����\�UK^�q\�R�Ըj�Uj\\�\�\ZW-5I�����\�UKMR\�%�Ըj�Uj\\�\�*5�Z�\�!�\�+�&)\�ˈ\��\�X�(Y�/\'|\�r^(��\'\�ޠ�r����W�m\�O�\�cf�\�y\\)���\�^\'���2��\'Q�\�a�f\�\��rmբ\r�M\�\�V\\w����;h7Q\�o�}ݰ\�jmG�p�\�zH�\�U}ng�Z�]�	\�\�gk�\�1�<\�\�\�\�:	\�\�\�\�TV?����\�\rx�.�\�i�\�*�~��Ky˪O�����\�\�\�\�с�ʂW\�O�o\��\�\�6M{\�\�\�T/\�m�w�}���\�)irQ\�pۛY����o뿊O�\0\0��\0PK\0\0\0\0\0!\0\�\n)NN\0\0~\0\0\0\0\0word/webSettings.xml�\�_k\�0\0����Cɻ�\�)Va\�^\�`\��\�Ն%����\�\�\�کs�b����\�.!�\�\�\�\���\rS��\�X�\�\��\�j0	E\�e\�C.�@b����7Y\�W��OR�\�\�\\T1֙��+p��X�\�\��S��a#�\n\�z�\�\�*���&\�\�8M�\���k,K�\��ց�]�`YDO��\�5\�h\r�����\�q�\�s\��3����\�	\�8\�bu��\�n\�\�/0\��/���]?cv0$G�;�\�\�LO�)Μ�%sP���2>ޫlcUT��\�\\�~IMN\�޵w\�t���\�ڲį��\�%ܶ\\\�uC\�u\�m	b�\�h������\rA�\���\�G�\�?�f�\r\0\0��\0PK\0\0\0\0\0!\0��c\0\0�\0\0\0\0\0word/fontTable.xmlܓۊ\�0�\�}���e簩Yg\�(�^,\�Pd9\��h�8y��d\'\r���\�B\�[�G�y\�\�\��U��5%\�&�$\�p[I�-\��\��ݒ$\�����F�\�(�<�޿{\�\�\Z	\�(4/I\�}[�)�Fh\�\n��\�:\�<��m����k\�\�-�r#��\�4�tA�{\�ֵ\�\�\�;-����\n�\�@#[8Ѻ�\�:\�\�Y.\0�g�z�fҜ1\�\�\n�%wl\�\'\�\�PQDazF\�J�_��8@~Xpq\�X�3/9�\Z\�Y�9��\��^1\0�|Ռ�\�\'_Ӑ\�<k4�D1���w\��#͋/[c\�($\�_O�\�%\�\�xĥ8D=�@V\�($]a�\�\�OLɍ�1\�2cAd\�3U\�aM\�4��\���;I\�F\�0\"@����k��:�T\�$@h�\�\�I\�3\'C\�}\�;\�В<\�(͟\�k\�+V�\�;�\�?\rJ���2=+4(<r\�k\�sx\��\�7\�ށ+\'>bY\�Ot��ND7���\�T\��\�ë\��o�K^�f\�#9:2\�\�1�\'d:\����#Ì$_\��7\'%\�\�:)\�V?\0\0��\0PK\0\0\0\0\0!\0��(ǁ\0\0�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N\�0�w$\�!�8i�BQ�J�:Q	�\"����i\�X�۴\�\n ^(����)\�\�|\��w�\�x�\�3g\rJ�B$(�|䀠\�b���\�ؽ@�6D0���F\�\�ILeD����\�X%�#*�0FFk���h\�\�g�ʉ���cI\�\�|�s0�Cp-\�\�N\�$\�$\�Je�\0�2\�A�/�ր\��ц��̹\�J8�\��Ѽ˲�ʰA\��~�\�\�5Wu�����Ҙ\�\�p�A\Z\�Ch#�z~j\�\�.�1U@L�\�\���ޝ\�z�>�/��7\�^;��mY(��J/�M�ƾg;�w`\�h3�<\��.�\�\��\�\�Nk^��t\�]\Z\�LoW\�X��\�\�}\�!����Q:��럻a0��QF��To\�\�?\���x\�W\��F�?l�\0\0��\0PK\0\0\0\0\0!\0z\'�m\0\0\�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�R\�N\�0�#��\�ӂ\0U[W�\��Kjhϖ�I,۲݊�=!�>\�\�zG�c\�\�5\�C\�\�.\�l���r�����w��\�$m)���d\'�l%\�\�\�%8�!i�IظdMJ~�yT\r�2N�m�S�\�\�D0\�\�U�V�q\�ТM|�\�W\�\�ˉY��8����Nu�\�8y\�P`\�L(��I| �pI�B�(fD\0^d��\���.�Q\\\�X72H�(:1�>�p\�\�J&\�T<j\\tUʞ?�f\�8�� �[T��\�I\��\��\�m�\�\n�\�7_\�[%\r�imQI�k\�ziI�\�\�W_�M\�\�\�or�\�^�f\�\"�x\�Q�\�bI����t�4kk,�\��mt�\��/)fWӜ\�g`\��=��\0\0��\0PK-\0\0\0\0\0\0!\0ߤ\�lZ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0\�Q�<\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/document.xmlPK-\0\0\0\0\0\0!\0\�d�Q�\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0��g�\�\0\0\� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0�\'�v\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Y\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0{ע�\0\0Os\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0\�\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0o#\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0��c\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�$\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0��(ǁ\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\'\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0z\'�m\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�)\0\0docProps/app.xmlPK\0\0\0\0\0\0�\0\0},\0\0\0\0','C:\\\\Test\\\\keeping _afile.docx'),('cdc',_binary 'calming tune slow speaking \r\npause before important \r\ndoesnt look at the screen \r\nthe presentaion \r\njokes ','C:');
/*!40000 ALTER TABLE `manual_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_subject`
--

DROP TABLE IF EXISTS `professor_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_subject` (
  `professor_id` varchar(45) NOT NULL,
  `subject_id` varchar(45) NOT NULL,
  PRIMARY KEY (`professor_id`,`subject_id`),
  KEY `professor_subject_idx` (`subject_id`),
  CONSTRAINT `professor_subject_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `professor_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_subject`
--

LOCK TABLES `professor_subject` WRITE;
/*!40000 ALTER TABLE `professor_subject` DISABLE KEYS */;
INSERT INTO `professor_subject` VALUES ('209146943','01'),('315730176','01'),('209146943','02'),('315730176','02'),('315730176','04');
/*!40000 ALTER TABLE `professor_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_number` varchar(4) NOT NULL,
  `subject_id` varchar(45) NOT NULL,
  `id` varchar(6) NOT NULL,
  `question_text` text,
  `professor_full_name` varchar(45) DEFAULT NULL,
  `professor_id` varchar(45) NOT NULL,
  `correct_answer` varchar(2) NOT NULL,
  `answer1` varchar(45) DEFAULT NULL,
  `answer2` varchar(45) DEFAULT NULL,
  `answer3` varchar(45) DEFAULT NULL,
  `answer4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`question_number`,`subject_id`,`id`,`professor_id`),
  KEY `question_professor_first_name_idx` (`professor_full_name`),
  KEY `question_subject_id_idx` (`subject_id`),
  KEY `question_professor_id_idx` (`professor_id`),
  KEY `question_id_index` (`id`),
  CONSTRAINT `question_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`),
  CONSTRAINT `question_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `professor_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','1','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','3','Ruby','C','C++','Java');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_course`
--

DROP TABLE IF EXISTS `question_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_course` (
  `question_id` varchar(6) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  PRIMARY KEY (`question_id`,`course_id`),
  KEY `question_course_course_id_idx` (`course_id`),
  CONSTRAINT `question_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `question_course_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_course`
--

LOCK TABLES `question_course` WRITE;
/*!40000 ALTER TABLE `question_course` DISABLE KEYS */;
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01003','02'),('02002','03'),('02004','05');
/*!40000 ALTER TABLE `question_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `student_id` varchar(45) NOT NULL,
  `course_id` varchar(45) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `student_course_course_id_idx` (`course_id`),
  CONSTRAINT `student_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `student_course_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES ('200000000','01'),('200000001','01'),('200000000','02');
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam_merge_with_garde`
--

DROP TABLE IF EXISTS `student_exam_merge_with_garde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_exam_merge_with_garde` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(45) NOT NULL,
  `correct_answer` varchar(45) DEFAULT NULL,
  `wrong_answer` varchar(45) DEFAULT NULL,
  `exam_grade` int DEFAULT NULL,
  `exam_comment` varchar(45) DEFAULT NULL,
  `is_confirmed` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  KEY `exam_id_idx` (`exam_id`),
  CONSTRAINT `exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_exam_student` FOREIGN KEY (`student_id`) REFERENCES `student_course` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam_merge_with_garde`
--

LOCK TABLES `student_exam_merge_with_garde` WRITE;
/*!40000 ALTER TABLE `student_exam_merge_with_garde` DISABLE KEYS */;
INSERT INTO `student_exam_merge_with_garde` VALUES ('200000001','010101','1,2',NULL,100,'none','1'),('200000001','010103','1,2,3',NULL,80,'none','1');
/*!40000 ALTER TABLE `student_exam_merge_with_garde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade`
--

DROP TABLE IF EXISTS `student_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(7) NOT NULL,
  `exam_grade` int DEFAULT NULL,
  `exam_comment` text,
  `isConfirmed` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  KEY `student_grade_exam_id_idx` (`exam_id`),
  CONSTRAINT `student_grade_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `student_grade_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_question_remove` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade`
--

LOCK TABLES `student_grade` WRITE;
/*!40000 ALTER TABLE `student_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_question_remove`
--

DROP TABLE IF EXISTS `student_question_remove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_question_remove` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(45) NOT NULL,
  `question_id` varchar(6) NOT NULL,
  `answer` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`,`question_id`),
  KEY `student_question_question_id_idx` (`question_id`),
  KEY `student_question_exam_question_idx` (`exam_id`),
  CONSTRAINT `student_question_exam_question` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `student_question_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_course` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_question_remove`
--

LOCK TABLES `student_question_remove` WRITE;
/*!40000 ALTER TABLE `student_question_remove` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_question_remove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` varchar(45) NOT NULL,
  `subject_name` varchar(45) NOT NULL,
  PRIMARY KEY (`subject_id`,`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('01','Mathematics'),('02','Computer Science'),('03','Physics'),('04','Chemistry');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `isLogged` int DEFAULT '0',
  PRIMARY KEY (`user_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('200000000','Test','Testovich','test@gmail.com','test','123456','student',0),('200000001','Almog','Kadosh','almod@gmai.com','almog','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 14:20:25
