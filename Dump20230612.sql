-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cems
-- ------------------------------------------------------
-- Server version	8.0.21

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
  CONSTRAINT `course_course_subject_id` FOREIGN KEY (`course_subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `exam_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('01','01','01','010101',1,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','Computerized','Algebra1 2022'),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','0','Computerized','OOP 1921'),('03','02','04','020403',2,120,'Don\'t forget to free memory!','Don\'t forget to give a factor!','Daniel Armaganian','209146943','0010','1','Computerized','C Programming 1936'),('04','01','01','010104',3,45,'Good luck!','Make a lot of noise during the exam.','Tzahi Bakal','315730176','0110','0','Computerized','Algebra1 2020'),('05','01','02','010205',3,10,'','','Daniel Armaganian','209146943','1234','0','Computerized','Algebra2 2031'),('06','01','01','010106',4,90,'Good luck!','','Daniel Armaganian','209146943','3q4k','0','Computerized','Algebra1 2000'),('07','01','08','010807',1,20,'','','Daniel Armaganian','209146943','zqq9','0','Computerized','Calculus1 2012'),('08','01','02','010208',0,30,NULL,NULL,'Daniel Armaganian','209146943','6565','0','Manual','Algebra manual');
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
  CONSTRAINT `exam_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010104','01001','10'),('010104','01003','35'),('010104','01011','55'),('010106','01001','33'),('010106','01003','33'),('010106','01011','28'),('010106','01013','6'),('010205','01003','33'),('010205','01005','33'),('010205','01011','34'),('010807','01012','100'),('020403','02006','50'),('020403','02007','50'),('020502','02004','100');
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
-- Table structure for table `exam_time_request`
--

DROP TABLE IF EXISTS `exam_time_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_time_request` (
  `exam_id` varchar(45) NOT NULL,
  `exam_time_request` int DEFAULT NULL,
  `isApproved` varchar(2) DEFAULT NULL,
  `professor_id` varchar(45) DEFAULT NULL,
  `professor_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `professor_id_time_request_idx` (`professor_id`),
  CONSTRAINT `exam_id_time_request` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `professor_id_time_request` FOREIGN KEY (`professor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_time_request`
--

LOCK TABLES `exam_time_request` WRITE;
/*!40000 ALTER TABLE `exam_time_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_time_request` ENABLE KEYS */;
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
INSERT INTO `manual_exam` VALUES ('010208',_binary 'PK\0\0\0\0\0!\02�oWf\0\0�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0E����Ѷ\�J�(�\�ɢ�eh��4ND�B����\�81�$14\�\� \�\�{\�1�\�ښl	�w%\�=���^i7+\�\�\�-d&\�0\�A\�6�l4��L60#�Ò\�S\nO����X�\0�*��V$:\�B~���^\�K\����ڃ\r/P��I\�\�~7$�\�i��J&B0Z�Du�t\�OJ�K(H�\���xG\r�L�+\�v����dcӻ�\�\�W>*��\\XR�mp��\�Z}\����HwnM\�V�\�n\��\�-\�\")/\�ZwB`\��\�4�\��	��s\�DX���j�\�;A*ʝ���\�c�֝�\�\04\��\�[�S�\�9�> ������{�V\�4p���\�W\�&��\��A���\�|�d�?\0\0\0��\0PK\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j\�0@\���ѽQ\���N/c\�\�\�[IL\�\�j\���<\�\�]\�aG\�\�ӓ\�zs�Fu\��]�\Z�U\r��	\��^\�[��x\0����1x\�p\��\��f�\�#I)ʃ�Y�\�\Z����\��\�*D�\�i\")\�\�c$���qU\���~3��1\�\�jH[{�=E���\�~\nf?��3-��\�޲]\�Tꓸ2�j)�,\Zl0/%��b�\n\Z�\�\�z���ŉ�,	�	�/�|f\\Z�\�\�?6\�!Y�_\�o�]A�\0\0��\0PK\0\0\0\0\0!\0��Y��\0\0K?\0\0\0\0\0word/document.xml\�[\�n\�8��\�@��L\"Jԯ\�IC\�\�l\�nz�\�##іI(:��41\�qOs\�\�}�dI�O��\�\��$\�\�\0-�?�\�+E\�\��\�<�U)-�F\�%RD4N�\�\�\�Ǐ\�=\�E�3Z��ђT��\��\�\�b\�h���QT\�E]�\�˱�TQBr\\]\�i\�hE��2��B�\�4\"ʂ�XѠ\n\�_%��*џ��\\�\�p\�c?��\�h,u%J0\�\�q���b(�b\�ig\0�j\�>:\�T�T{@�Y@B�=$\�<��3\�C\�����\�>�}Ҟ;\��NKR�\�)e9\�\�͔��yy!�K\�ӻ4K�R`Bs�\�\���D�-B�\�,%�1\�P�A�W�9+\�\��\��R�����mA�~݊\��<�⛶��\�V\��u`���0�	=ҢJ\�r�s\�De�y8���<\�<�(՞T{.��+3\�\0����]��$?��\�֔\�}Dh���$�\��,\�4���>\0m��H\�\�b�a�1�h\�n����\�ge��\�����]a\Z\0��$\rm\�ټ�U\�<NN�\�\�H�m1\�	�����\�\Z[�e\�\�w9�<R}\�\�ܡ����a^2\�9kM\�f��>O�\��\"\�\�\��ì�\�eB\"A5 \�j\���\�\�K��<\�\�\�\�@ƫѵ\�\�\�h��\�R\�\�\�3�A8�Ḯc@T����\�R}\�\�rE\�Xd��?�FP�΄hW\�)�g\\\� Wu\�ɦ\��p\�\�\r���d�����=Hq�\�\�H�~����\�\�}�,\���\�sRճ�\n��\09\��\�±|��\Z�z\�ׂ\�\�a[\��\�1-ܰ\�i׼�j@wB\�F�\�\�\�˶i!�o���h�L(\�ގ���\���\�U�\n^z��fi�J\�\�-�NQT5\�k�\�\��h��ē���tp��\\\�?T J\�\���\n\�(�k�]\���N�����\�6Fȁ�߱��\�ԜR�ϣ\�iv/O#*RW\��IF�6\�=m���\�Y~(K���\�\�~\\�8�s\�HE\�]�&�\�	�g��9�)�J\�x\�\���\�\��Զ�\r3��d ��Z(�7�\09.�@��U�NA�RJ{K��\�\"&\�\�g\��3�,�x�f\��ı;�2\'���N\�6R��^	��]\�bm.X��\�9a\�]�-gh�d�Ի\�ï\�:\�fh��l�b�g \�FZ�`�f���\�Sk?^l]\� Xy˗\�H�їgX�%٫0m�tA�\�	H����\�\�d\�e��y�k\�\�v\\\�\�\r�r%;8\�3\�\\C�t��=\���\�\�8h\�\r\�\�Ǭ�\�J��KF\�4`r<|Y�Yz\�p~\�1\�k\����vَ\�.(\�u\�C��\�zRQ�:�,c��3\�!~\�\�7ݑ�]\Z\�S��\Z��Ƀ�\�Z����\�`�>��\�\�3\�\�Bn#\�\�R}\�1�N�����ٞ\\�D8FL\�6�ew�g�\�t��=h\�\r���\�<\�m���o-�=3/ۆ�iZ獏j��:Cf�	Bi6B\�\�:;y�i{�[\�t\�\�[#�\�\�4�pr|OjVM	\��ᜰK�͉2\�YE:s\�v�\��\�\�\�\'`�HuՑ�E\�\�\�P5�?0�\�[�\�wvΡО:\����0\�,۽�\0f�]ׯ8R@��:��\�P͆c�\��\�\�\�6\�-�\�JGw�\�D�\�Hqx\�\�_\"�Xo\�o7\�AZ\�\�\�\�)\�b��\�j;��`�\�\�\�OD.A�\�;��\n�\�	\�\�l\�H�NL]$��CQ�&(�\�o\�\�\��Cz��Ĥ%�F�l�;Q3	]\�\�c�oLԦ����ՇWzh:\��\�\�\� ��֞잧П\�3��\��	tओ\�U�\�_��j�zul9�\�@$�1�k7�=\0IZ�F\�)\�3��\�\�\�O�=�����\�\�_H\�\��/�\�/���x��\�.p\��h����eȞ��x��\�3�j؞\�92���\�\�\�g\�5L\��o�o\�}����\�\�\�@}�d8�凝e\�\��-ȟ�$��\r뫖z��[)\�B\�h�#?�ߦ�\�U�\�\�,9-e��N:\�$pw{G9��\�~uFus�ѯkZM)\�\�\�\\�ԄT�H��|�.�i�=�_U���\�Mʣd{Vٌ�����J\�}�\0\0\0��\0PK\0\0\0\0\0!\0���\0\0�\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0��\�{-;mC	�s)�\\[�d{�C�c�MZ�}EJ�Ӄ�3bg��\�z�;��5�$���uoZ\��\��\'ij��A#z\�\��w\�7T�\�����b���hXq\���Є�\�:-)H\��AV��E�H\�%w\�ȯ2ٮ\�v�#�b�?ٶi�\n_m�\�h\�F�H6�!S�I�\�IB�\���4*��\\}�\�\�u�.l|!8[s˘f�p��f6\������\nY�	\�ٚ�x�	�\������\'~�\��\0\0\0��\0PK\0\0\0\0\0!\0��g�\�\0\0\� \0\0\0\0\0word/theme/theme1.xml\�YK�G����\�z\�\�a�5\�H�k\�6޵���Rk���i\�\�ڵ0�`�r	��C�\�B1\�\�c�I��\�I3-�ď]�	��U?�������4s\�\���:G��[=Wq��ؘ$aǽ}0,�\\GH��e	\�,܋;�v�����8�:n$\�\�|�,F0�\�96\�	\�M���.\�c��AoL˵J�Q�I\\\'A1��1��v�Jwg�|@\�_\"�\ZQ��TcCBc\�Ӫ�P\�!\�qa�1;>���\�P$$Lt܊�s\�;\�k!*dsrC���[\n��5-\�\�õ�\��^��֯Tn\�\�Ac\�X\�\�\04\Z�NS.�\�f-�\�(mZt���z\��\��׷�]_}��Mo?�\rs��\�o\��^�\�7�kP\�llᛕn\�k\Zx\r�(I�[\�ߨ�ݮ!F/[\�m\�6kKx�*\�+�OdQ�\�\�\�C\0h\�\"IG.fx�F�%��8�$� �f(a�+�ʰR��\�\�\��(:�QN:\Z��!\�\�#Nf�\�^�n�\�ŋ����|��\�Ǐ_>�u���\�e��y�7?}�\�\�/����͓o\�x�ǿ�\�\���_\�A\�g��?{��\���\�\�rt���\�:>vn�6hY\0���8�\�Kt�P�)z #}}�(�\�zش\�\�\��4�gޏ�\\�Z�=\�h�q랮���V�\'�}q>\�\�n!td[;\���`>��\'6�A�\r�7)��8�\�Qsl��E\�.!�]�Ȉ3�&ҹK�\"V��C#�2�\�$�,l�߆m�\�8=Fm\���\�D\�\�@ԦSÌ�\�\\�\�\�\�4�\�E2��\�_�ap!�\�!�\���6�|aнi\�\��=��M$�djC\�\"\��\�>��gV\�$��\�+b\n!���LZI0�>�%�\�C�\�\�ې�\��f\�\�v$03\�\�N�)\��\�H�]N�\�ћ�Fh\�bL\�1\Zc\�ܾbó�a��\��\�el�\�Udƪ\�\'X@����c�0Bv���\�\�b#�,P#^���\��\\u�5^\�hj�R\�ա���!bc�ZoF\�+\��x]p\�\�r\�@\�\�\�\����\��ζ9@\�X �U�-݂�\��LD\'-6�\�M\�C����Q�\�$yk�Q�����\n\�\�O-\�өw\���T:E\�d��)\�mV5\�c�\�5}4Onb�G,г�欦�\�\�4E\����9�d\�*�\�G�d�\�E?Z=\�\�Z\�§>B\�\\P�+t\�#\�쏇0�;Zh��iAs���9\�m�3��\�~�f�LU���\�P83&�p\�\�V\�j�\�\�=6NG�\�\�sM@2�\�k5e�LG\�\�\�Z�\��A늀�}�\�Lu�\�j�-$�\�N�E\�¢�\��\�_K��\�\� �H\��RFn\�c\�T~\�\�S�t�1\�m\�,\�k+��\�i�D.\�L�0�\��\�>e_�3�\Z��)�i4[\�\�*�l\���=\�\�\\\�5#4\��\�\�x��\�T��I\�ɥ�?$�̸�}$���\��\�Db\�PC�\�\�@��[�\�T{�Dɵ+��\��W\�\�x2�#Y0�ua.Ub�=!Xu\�H\�G\�c\�\��-��Ue�1rm\�1\�\�ά����G\�xߒQDgZ\�(�d�\�u{M\'�\�tsWf��\�P9\�ķ\�ۅ\�D.i\\ \�ִ珏w\�\�Xey\�`��\�\�\\\�^庢[\�\�B�Z��AM1�P\�FMj�X\�[�f\�qڷ�fԪbUW\�\�֋mvx\"�\�\�J��¯��\�+\�4\�\�Uv�/�9\'�A\�\�zA\�J��?(yu�Rj�\�z�\���\���V��\�C0��⪟�=��t�|o�Ƿ\�\�ǫR�܈\�e�\�\�\�\�\�w�\�<hԆ\�z�\�(�\�\�a\�\��Z�v\�\����\���\�>t�#\r����kZ�F5J^��\�ڥ�W�u�f�5�������W\�ռv�\0\0��\0PK\0\0\0\0\0!\0G���<\0\0:\0\0\0\0\0word/settings.xml�V\�o\�6~���\����G�S\�N���עΰgJ�,\"�(��w\���#%ZN�I��\�\�}w\��\�;�{��\�hG����y\�Y\��H]L\�\�\���n5�z#�Q�5�y�������n�)�5��P\�*\�\�̫�n2\�WEE8Rg�!5���i\�ʭϑ�o�q!x�4\�)��\�GA�z=��y����b\�i!��6&�(KZ��\�Yȗ�\�L�D\�rRk\�ї�A�Vm�c\�?\�`\�Hv?:Ď3���w/$>Z�$<c\�HQ�\��8s\�zp<yBt�}��#Z*0�:�<yA� -\�\�\�8�=���<��\'=�\�!�a�s��(�q�*�\�\�\�7�H�\n�cF򺠒#݁9R\�%U\�A�4�Hvo�/^d7\�ZH�3Jg�?�љ_H���K�`\�&\�%�B�\�>k�,\�@�	\�7\0��(7\Zi�\�TC��`�\�}���C�pk�I�Z�\�P�Ѣ����G=eQ!�\nM\�A�-E��`N���^Bߑ�,zۅ�զ\�h`Q#G}ԥ\�Y+\�\�\�\�X\�ar\��[G:���ܙo���_ɼ\�[�)0\�^��(\0Rϟ�(\�\rY�[H\�9�7�b�YS)���1\�ƛ9�eI$8�Pkk(*\�\�\��� �\�����\��&\�;(\���\�Z�\�CSA�\�&m���\�\�+��\"�>�\�E�:�w�\Z�I\� ~��M<\�\�\�sH�NΗ\�\�i�\�?D\�\"�$Jm�\�xf\�g\�V\�!�xg�D<��\�f\��F#��Z;<\'\�\�\�)�is�\��8blW\�\0�N�a��+R\�5[#�x{\r���\�\�#�\�rD�)E\�t\�^��+p�N&�%��-\�N�\�|\�j\��\'P[\�O;i�4�g�i(\�(n�-��bSNd|s\�W&�SUd���+\�|\�<F��M=i\�a�$��|�Xd��\�\�\�h�\�/Y\�d\'z��Ńl\�d�A�8Y2\�R\'K���v$a6\�\��\�\�\�K��\�|=\�OD]T�\ZrՍ�/\�	�Y�F��<�`\"�j�\�m(\�\��̩(5\�6C\�\�G�3\�\�c3\��\�\�?2�5�M,f�\�qs\��0�κ�U\�U\ZjZH��a�p�aQܘ�;\�\�\�E<\r.��a:\�a�m\�{�B\�R��3M:\�\�\�y�Z\�\��E�Oҫp<�x|\�˫\�j/\�/�\�_��\��\0\0��\0PK\0\0\0\0\0!\0�4K\�\0\0\�\0\0\0\0\0word/numbering.xml��\�n\�6�\���L��%YXg�d\�\"ŶXl\��%\�\"\"�I��\�;\�Ɏ\��8L�\�|�g8$\�\�\�=\�\'[\"|n9��5!<)\�\��\�\�\�&�&Jc�\�\\p2�DY_\�~�\�\�.\��$&N��U�+���i]\��$#�[F)�X\�\�D0$V+��2E�\�\�\�B��(�G̷XY5.\����\��\�\0}�dXj�?2���)���rG��C\�颼��\0U�?\n�:�\�8\�\�q$�K\nǑ�.)\ZG\�\�&�(����k�)׈a��)n\0\\`M�4��\0L;h0��\����%0/L)ɽ������<�\�oZ{#=�\�릵 y�ea�\"{�+\�\�\�>��̿�d\�\�eԐ$9\�Qp�Ѣ�\�X\Zf\rd�Q\0�,o\�\�\n�\�Q{\�j�Vm\�\�G~�w,��Lt\��i�E	o\�l�0\�\�\�£Bs\\�\�\�\�\0\� HH\�ǢaD5%\�\�m8�\�j8ծ=\�\�y��9��A\�kt�Ƙ��T�\�l�\�#dl�\�V\�1D2\��i�;��x\�\��?�\�G\Z�\��x�\�L�3�U\�\�C}N̿.\�\�eI��\�B\�e�\�M\�L\�0��t�)��}\�o�zb\�+\�J4�TZ\�D��a�7��!ϡ\�Z,	\�w\�tV\�\��J� 	~5S�+�N�\�p���a`{���\�\�\�~\'[��\n\�\�\�KIӿ\�Xnƪ��y3\�ѱ��|�\Zɷf�BS��u�\�K\�OAzA��\�ؘ;��\�v�$�׋\���f\�\�\��+izs�\�Uw�C��r\�\�[�[J\�0_����jQ;Y\�\�Bp�LtUB!\�%\��\�v�;Q���k#y�!J��D\�B6\�\��W\�W\�wTK(\�F�;\�t��Ą?gV���薘����߉�t�TwpP\��0��]r;.=|ƥ��a~\�#\�G����]r�\�KN\�\�%\�\�%{1ҥ\�\��Cn�\�!�zI7\�x0¥\�Ւ.�t�wv;�J�\�:Iޡ�=\�Z��t\�p�³k��K\�Ւn6<\��\�jx\'\�ЛJ��6)?M\�a��t�\�MYؘ\�\�,|\�	�\�e˳Y�׬\�\r�j��\�\�\0\0\0��\0PK\0\0\0\0\0!\0w���\�\0\0\�s\0\0\0\0\0word/styles.xml��[sۺ\�\�;\�\��\�S��\��EN2\�\�\�$��v\�9\�3DBj�Py�\�~� %A^�\�[�$\�e\0�\��\�M���\�\�\����\�\�\��(\�Y��ݟ�~\�}y�n%\�&U\�\�Fϼ���_��\�㇢|���4 +>��\�hY��\�q/yʊ�j\�3�\�B\�)+�\��~����Z��U�b��)\�\��\���t\�`�>�X��Rq���\�KMTY��bM{\�C{Ty�\�ŰBot*k^\�D��L�(q�\n�(\�\�izdQ:|r`�J\�p��4\�O8ƻ�1֑.G$8\�t\��\�	\�(�2Y�(�\�q�XV�%+�.�\�:u��=�f�\��\�\�}�r6���U��p������\��ɾo6a���B�\�O|�*Y\�e~�7/�W��/*+�\��+b!\�tu+�\�\r^�g�\�O8+\��B�\��\�\�O\�t\��(1\Z���\�1y6:<\\�saz��dٽ\��وgo~\�w�IzH���k�\�q�)��\��^��M�X,,�-J��=��&���_��^�\�fU��F,����1\�~\�\�\�IH\�\�*~\�ɬ\���l[�\�W��P�N4g���M�挧\�R$	Ϝ/fK��K��(x�}�\�/6Y4oĪ\��\�G�S��,�\�O1_�ԣ?͘Q\�	�\�ە\�6n\����M��o�_rf�o4y��\�G!MD\�lm;�z�\��[���^��\�\�j\�\�\Z��VC��\�л\�j\�b��\r�,ѩ\�~6��87�9��9/�9��9\'�9���\�x\�1�㙦N�b\�,t&��g�ws�\�#¸�w	a\��{�0\���\�ݟ\�ø�\�yw�\�\�O\�xn�Ԋ��Ͳr�\�J��*yT�\�4�i�-Jixf�\�s��$�ԙ�\��\�̾\�?C�I\��祩\�\"��\�\�y1�\�<�ťZ�%�\�s^V�gDB\�t\�<\�Y\�)\'6\�T�QV�s���b�d,�%\�÷&�$�̈́\���ҘDL\�Ź\Z\�5\�\��õ(����D+)9\�+\���ᵁ\�/\r,fxe`1\�G3�!jhD#\�Ј���[=?�ƭ��[C#\Z��6|\�\�D)m�wW��\�\�.�2��c&\�3�\0\�w7\�1\�\�\�\�>g�ed�C�c\�mƶ�Q%\�\�\�>mC�Z\�\�)r��Zd\��ݡQ�k\�#�׆Gd�\ro�\�n�2\�,\�.i\�Y5/[MkI�L;c���\�\�\�\�\�3lk�/\"/\�lЎ%��_\�r\�\�I����ޱ-k��^f%\�\�5H�^J?Ф\�\�\�\�uY�0��EI�yBG����\�k�C+I/\�NWKV[+\� �\�\�\� D7l5x�n%�n�ߤLȈnqywsݩ�)3\��\�\0?��T)�9���|�w��\�\"8{&\�\�s�\�Cv!v25I%D$�\�� هZ\�?��\\�<��\�漾\�\�D\�KW����[:/>\��C�\Z���\\�\�BT��#�9�\r�j�oOu_UDrd\�[U\�\�v�k�\�p×	;�\�K��\�=��K��;�\����\�\�ɊBxO��6wͣ\�\�\�\�_\�SR\�J\�\r\�\ZH6�k \�*Y�YA�ŖG���G���S\��\�Y\�?r���aaTJX�F����\n0�\n6�26�Z�\ZF�p`T�t�Ot�ǁQ\�3��gF5\�,�j�}��b��t�I5\�$ݎ&+y�R9˟���%�gHk\�m�\�f�\�q \�1jI�خqT\"�\�s��e���2)�\":��\�\�\�\�\�k\���\�{7w\�V��/�Lx\�\�&���g�m/�o�\�\�絸_�\�l�9\�\�b�{#\��N\��\�\�|����-\�\'�J\��7SL��\��|�?x��؉<\�	ۜ\�ܮ�w\"O{F\�6\����>݉\��\�\'�?�N�Ӯ����<�\�km�[�\�H�ȶ)x\�5�v��Ǳ9[\0\�\�\�|?��\�1.�S0v�Sz�ʏ\�2\�w�K�=;&i\��6WO��oѽ2矕��\�\�p\�Sו^8e�Z9G�O\\\�d�8�N7~D\�\�G�N@~D�L\�\rG�$?�wn�#z\')?��\���`<.[���l)!\�j�*��\��#\�F��Q���QAx�Q!mT�@\"\�F�0�Qa<Ψ0>Ĩ�bTHA\"\�F��Q!mT�@5pm\�\r2*���\nh�Bڨv�8��0gTbTH	1*���\nh�Bڨ�6*D��\n(��� �B\nڨ�6*D��Z\�jnT�3*�1*��R\�F��Q!mT�@\"\�F��QAx�Q!mT�@\"\�F�\'\�\�\n\�C�\n)!F��Q!mT�@\"\�F��Q!eTdTHA\"\�F����ٜ��]f?���^�\��\�Uө\�\�\�.\�?j\�+?����z�Zo<<��F?��K�\�!j\�iu�k/�@���v\�}��K�Х\�^{\����F�c*\�]SލE\�q\�Lw#���+���`7xܕt�/\��\�\�\�J3N�\�ޕ��p8\�]9\�	�#ܕ��@8�]�\�	<�Lr~}\�s���\�K�k::�S?�kZB�\�\�\Z��h~B_����2�	(=���~Za?*Ljh3�\�\�F��RCB�\�\0.5DK\rQaR\�Ĉ�\Z�R�\'g?!Hj�	�\Z�����0�\�+5$`���\�w\�^L�\�,5D�I\rwX�!+5$`��� �&\\j�\n�\Z�¤U2ZjH�J\r	X�!!Hj�	�\Z�����.�\�Q��Q\n;\�E��\�!;��\�\�TKNt`�\��%�\�Zs\\�\�\�\'�U\�O\�+���\�Ӌ�\�G���¤\�UKmR�\�O�J����R㪥N�q\�R�Ըj\�/5�Zj�\ZW-�I���� �q\�R�Ըj�Sj\\�\�\ZW-�I���ڤ\�UKmR\�!{1\�R㪥N�qՒ_j\\�\�&5�Zj�\ZW-�I����R㪥N�q\�R�Ըj\�/5�Zj�\ZW-�I���ڤ\�UK^�q\�R�Ըj�Sj\\�t�C�#�f)\�ˈ\�yq��X�l�\�	d9/��œ�vS�Q[9~\���+ö�Ƨ�_\�13O@wnWJ\�\'�6@�\�+Mb��L\'�\�����}m\�\�֍\�\�J�\�\�\�\�c�|��f<O��\�ng\��\�\�\�m��\�ΰt��43���\�@Ԟ��\�}c�}\�ݘ\��\'\��WY��\�ρ\�L�X�ҟ_p)oX�m��U�EY:9��$x���~��7>�i\�\�v�~\��,�g�\�\�\�7\�����e�\�*CG\�߯+l{rzb\�\��>�z�\�3f�_iv�9Ͽu�\�B�\�\�\�O\�?7����<a\�Q\�\\�\�$�\�<ᩬ�l\�Ԯ7n��x\�F��*~�\0\0\0��\0PK\0\0\0\0\0!\0\�\n)NN\0\0~\0\0\0\0\0word/webSettings.xml�\�_k\�0\0����Cɻ�\�)Va\�^\�`\��\�Ն%����\�\�\�کs�b����\�.!�\�\�\�\���\rS��\�X�\�\��\�j0	E\�e\�C.�@b����7Y\�W��OR�\�\�\\T1֙��+p��X�\�\��S��a#�\n\�z�\�\�*���&\�\�8M�\���k,K�\��ց�]�`YDO��\�5\�h\r�����\�q�\�s\��3����\�	\�8\�bu��\�n\�\�/0\��/���]?cv0$G�;�\�\�LO�)Μ�%sP���2>ޫlcUT��\�\\�~IMN\�޵w\�t���\�ڲį��\�%ܶ\\\�uC\�u\�m	b�\�h������\rA�\���\�G�\�?�f�\r\0\0��\0PK\0\0\0\0\0!\0�Qa\��\0\0K\0\0\0\0\0word/fontTable.xmlԓ\�n\�0\�\�\'\�\"ߗ8�0�\Z*\�i7���0�C��O\�c��N��2���w	�\���|�\�\�\�\�Q�\� Hkr�L(��ᶐf��������3S0e�\�\�I\0y\\}��\�,Kk<D\�o`�yN*\�\�e��f0��0X,�\�\�\�\�Ś�_���[]3/�RI�SJ\�Ǹ[(�,%_-\�ka|菝PH�*YÙ\�\�Bk�+jg�\0@\�Zu<ͤ0\�\�\n�%wl\�\'h��(��=�a�\� H�\0s.�\���c\�%G\�8�#�\�ǆ�\0@\�j%=\�\Z��̳�AuI\�\�\�I�i���3ֱ�B\�z�p���ۿ�Ǡ�Ȫ�fi�\�ε�L�fƂH�r`*\'\�\��\�錶^�\�\�\�F^1�Eti\'�LKu:�\�H��PKϫ�~`x \�ܕ@�-\�\��4}\�lH�$9yF\�\�\"{ꕴ=+|\�{e:(�Ux\��Ǥ\����\��q\��*�W�D\�E�����$�b\"S�a*���q���$�\�VI#C�\�9w���,��$K\�\�d\�?,&gC��x��\�~�\�\0\0\0��\0PK\0\0\0\0\0!\0��yʋ\0\0�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��AN\�0E�H\�!�>u�BQ\Z$@\�\0E vƞ��Ķl�\�{�A \�\n������)E�\�\����\Z;;x,�\��\�RQ܋P\0�J\�\�t�.ǣp\��H!\�:ȷ�2�R*5�k�@[&�N¤T\r\�\�Z�bl\�Jbz�^�H]\�[=Ŋ\�{2�D\�\0�`	#�\�\�0T�#ZZ2\�Y��.\ZF1P��ǽ�Y�44\��\�v�\�Ot%v��\�XUU�\�7�\�?\�\�g�\�UC.\�(�<c4�\��gx]�\�\�o\�\���k|M5+u~RH\�Ep1#Z��Z)u\�����f\�\�otc`�\�\���l\�7<]c\��\�N8�\�E\�\�ܫ{qO��p\�\�\�}��\��VOjx\��ɓ�\�\�lw�\"��ǔ������\��x��$J�a�&�\�x�\�\�(���ܘ_�\��\�2h�\����7\0\0\0��\0PK\0\0\0\0\0!\0�bW�\�\0\0\�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�S�n\�0�\�?�7r�4\�EŐb\�a[\�mϚL\'\�dI�ؠ\�׏�O\�v�O��\�\�#)�\�\�\�VG�\�x�f�Y\�*pڷ\�\�\�\��|��U	�k��\�\��\�\��\�\�6�\0\r��$\\Z�bXq��z�f�v�\�|\�R�\�w�\�p\��K�u]/9�\"�ګ0	�Qqu\��m�\��\�Ss\n�\'E}�\nA~\�\'\��\�>���lcz�s��@l\�R\�F �}l��x#��\�栢\�H�7��\�E,>�`�VH��_��>����o�\�^�\�a�%\Z<\�Z�2_�������E��*\�\�M�\�ieaC\�\�N\���&\�=��٭2\�\�WG\�\�c�\�O\�\�5���yfkvT\�(�l,�ې0\�Ơ%\�)`YVb�\�&GpY8�\�\�CG�\�?\�\�K���\�ja�tv�\�Ս\�r4_>!\Z���\Z�_\�\�/\�b\�\���4\�d��\���#ZZ贓��\�A�Y�κ=�皿�E=����/g5}\�:s���H�\0\0��\0PK-\0\0\0\0\0\0!\02�oWf\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0��Y��\0\0K?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/document.xmlPK-\0\0\0\0\0\0!\0���\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0��g�\�\0\0\� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0G���<\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0�4K\�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\0w���\�\0\0\�s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^ \0\0word/styles.xmlPK-\0\0\0\0\0\0!\0\�\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T,\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0�Qa\��\0\0K\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�-\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0��yʋ\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�/\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0�bW�\�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�2\0\0docProps/app.xmlPK\0\0\0\0\0\0\0\0\�5\0\0\0\0','C');
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
  CONSTRAINT `professor_subject_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `professor_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `question_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor_subject` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `professor_subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','1','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','3','Ruby','C','C++','Java'),('005','01','01005','Calculate det of mat M\nM = {{1,2 3}, {4, 5, 6}, {7, 8, 9}}','Daniel Armaganian','209146943','2','-4','-6','12','31'),('006','02','02006','How many bytes is an int?','Daniel Armaganian','209146943','1','4','1','64','32'),('007','02','02007','What is the time complexity of Bubble sort?','Daniel Armaganian','209146943','3','O(logn)','O(n^loglogn)','O(n^2)','O(1)'),('008','04','04008','What is the general formula for alkanes?','Tzahi Bakal','315730176','2','Cn+2n','CnH2n+2','H2O','Olives'),('009','04','04009','What is the difference between an alkene and an alkyne?','Tzahi Bakal','315730176','1','double bond and triple bond','both single bond','both triple bond','both double done'),('010','02','02010','What do you prefer:\nComputer science or lawn mowing ?','Tzahi Bakal','315730176','2','Computer Science','Lawn Mowing','Neither','Both'),('011','01','01011','123456789 + 987654321 = ?','Tzahi Bakal','315730176','1','1111111110','347','135000000004','24'),('012','01','01012','What is the derivative of the function f(x) = x^2?','Tzahi Bakal','315730176','4','f\'(x) = sqrt(33)','0','f\'(x) = 11x','f\'(x) = 2x'),('013','01','01013','Is math good?	','Daniel Armaganian','209146943','4','YES!','NO!','Maybe?','Lawn Mowing is better');
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
  CONSTRAINT `question_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_course_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_course`
--

LOCK TABLES `question_course` WRITE;
/*!40000 ALTER TABLE `question_course` DISABLE KEYS */;
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01011','01'),('01013','01'),('01003','02'),('01005','02'),('01011','02'),('01013','02'),('02002','03'),('02010','03'),('02006','04'),('02007','04'),('02010','04'),('02004','05'),('02010','05'),('04008','07'),('04009','07'),('01012','08'),('01013','08');
/*!40000 ALTER TABLE `question_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam`
--

DROP TABLE IF EXISTS `student_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_exam` (
  `exam_id` varchar(45) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `grade` int DEFAULT NULL,
  `correct_answers` varchar(45) DEFAULT NULL,
  `wrong_answer` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `isConfirmed` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_id`,`student_id`),
  KEY `student_id_exam_idx` (`student_id`),
  CONSTRAINT `student_id_exam` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam`
--

LOCK TABLES `student_exam` WRITE;
/*!40000 ALTER TABLE `student_exam` DISABLE KEYS */;
INSERT INTO `student_exam` VALUES ('010101','068798452',100,'1','','fine','1'),('010101','123456789',100,'1','','fine','1'),('010101','159753684',0,'','1#2','fine','1'),('010101','252525252',0,'','1#1','too bad','1'),('010101','500000000',100,'1','','fine','1'),('010104','068798452',45,'1,2','3#3','fine','1'),('010104','159753684',100,'1,2,3','','fine','1'),('010104','252525252',45,'1,2','3#2','ok','1'),('010104','500000000',45,'1,2','3#3','fine','1'),('010205','068798452',66,'1,2','3#3','fine','1'),('010205','159753684',67,'1,3','2#3','fine','1'),('010205','252525252',100,'1,2,3',NULL,'great','1'),('010205','500000000',67,'2,3','1#3','fine','1');
/*!40000 ALTER TABLE `student_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grade_toremove`
--

DROP TABLE IF EXISTS `student_grade_toremove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grade_toremove` (
  `student_id` varchar(45) NOT NULL,
  `exam_id` varchar(7) NOT NULL,
  `exam_grade` int DEFAULT NULL,
  `exam_comment` text,
  `isConfirmed` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`exam_id`),
  KEY `student_grade_exam_id_idx` (`exam_id`),
  CONSTRAINT `student_grade_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_grade_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_question_remove` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grade_toremove`
--

LOCK TABLES `student_grade_toremove` WRITE;
/*!40000 ALTER TABLE `student_grade_toremove` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_grade_toremove` ENABLE KEYS */;
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
  CONSTRAINT `student_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`user_id`,`username`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('068798452','Yana','nana','yana@gmail.com','yana','123456','student',0),('123456789','Almog','Kadosh','almod@gmai.com','almog','123456','student',0),('147852369','Barak','Obama','obarak@gmail.com','barak','123456','student',0),('159753684','Dana','Cohen','dana@gmail.com','dana','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('252525252','randa','rousi','r@gmail.com','randa','123456','student',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0),('500000000','Guy','Edri','guy@gmail.com','gutadri','123456','student',0);
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

-- Dump completed on 2023-06-12 11:21:45
