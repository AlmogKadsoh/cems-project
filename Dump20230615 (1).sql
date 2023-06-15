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
INSERT INTO `course` VALUES ('01','Algebra1','01'),('02','Algebra2','01'),('03','Data Stracture','02'),('04','C Programming','02'),('05','OOP','02'),('06','Physics1','03'),('07','Organic Chemistry','04'),('08','Calculus1','01'),('09','Software Testing','02'),('10','Logic Gates','06'),('11','Circuit Analysis','06'),('12','Electromagnetic Fields and Waves','06'),('13','Control Systems','06'),('14','Anatomy','05');
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
  `head_of_department` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`,`head_of_department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1','Software Engineering','319003935'),('2','Information Systems Engineering','398765432'),('3','Industrial Engineering','224466880'),('4','Electrical Engineering','321455555');
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
  `isActive` varchar(3) DEFAULT NULL,
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
INSERT INTO `exam` VALUES ('01','01','01','010101',1,60,'Don\'t forget to do something!','Don\'t forget to do nothing!','Daniel Armaganian','209146943','8520','0','Computerized','Algebra1 2022'),('02','02','05','020502',1,60,'Yes	','No','Daniel Armaganian','209146943','1234','-1','Computerized','OOP 1921'),('03','02','04','020403',2,120,'Don\'t forget to free memory!','Don\'t forget to give a factor!','Daniel Armaganian','209146943','0010','0','Computerized','C Programming 1936'),('04','01','01','010104',3,45,'Good luck!','Make a lot of noise during the exam.','Tzahi Bakal','315730176','0110','0','Computerized','Algebra1 2020'),('05','01','02','010205',3,10,'','','Daniel Armaganian','209146943','1234','0','Computerized','Algebra2 2031'),('06','01','01','010106',4,90,'Good luck!','','Daniel Armaganian','209146943','3q4k','-1','Computerized','Algebra1 2000'),('07','01','08','010807',1,20,'','','Daniel Armaganian','209146943','zqq9','0','Computerized','Calculus1 2012'),('08','01','02','010208',0,30,NULL,NULL,'Daniel Armaganian','209146943','6565','0','Manual','Algebra2 manual'),('09','06','13','061309',5,60,'Before providing your response, \nplease take the time to carefully read each question.','A test on the basic knowledge of the course.','Daniel Armaganian','209146943','1111','-1','Computerized','Control Systems 2023A'),('10','05','14','051410',6,90,'GOOD LUCK !','','Noa Kirel','333444555','2222','0','Computerized','Anatomy 2022B'),('11','01','01','010111',8,90,'Before providing your response, please take the time to\ncarefully read each question.','Please note that this test does not include a formula page.\nBasic level test.','Noa Kirel','333444555','1122','0','Computerized','Algebra1 2022A');
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
INSERT INTO `exam_question` VALUES ('010101','01001','100'),('010104','01001','10'),('010104','01003','35'),('010104','01011','55'),('010106','01001','33'),('010106','01003','33'),('010106','01011','28'),('010106','01013','6'),('010111','01001','15'),('010111','01003','15'),('010111','01011','10'),('010111','01025','10'),('010111','01026','15'),('010111','01027','15'),('010111','01028','10'),('010111','01029','10'),('010205','01003','33'),('010205','01005','33'),('010205','01011','34'),('010807','01012','100'),('020403','02006','50'),('020403','02007','50'),('020502','02004','100'),('051410','05019','15'),('051410','05020','20'),('051410','05021','15'),('051410','05022','15'),('051410','05023','20'),('051410','05024','15'),('061309','06014','20'),('061309','06015','20'),('061309','06016','20'),('061309','06017','20'),('061309','06018','20');
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
  `date` varchar(12) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `actual_time` int DEFAULT NULL,
  `students_total` int DEFAULT NULL,
  `students_completed` int DEFAULT NULL,
  `students_uncompleted` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_stats`
--

LOCK TABLES `exam_stats` WRITE;
/*!40000 ALTER TABLE `exam_stats` DISABLE KEYS */;
INSERT INTO `exam_stats` VALUES ('020502','2023-06-13',60,60,2,1,1),('061309','2023-06-13',60,31,3,3,0);
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
  `isApproved` varchar(3) DEFAULT NULL,
  `professor_id` varchar(45) DEFAULT NULL,
  `professor_name` varchar(45) DEFAULT NULL,
  `reason` varchar(150) DEFAULT NULL,
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
  `manual_exam_file` longblob,
  PRIMARY KEY (`idmanual_exam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_exam`
--

LOCK TABLES `manual_exam` WRITE;
/*!40000 ALTER TABLE `manual_exam` DISABLE KEYS */;
INSERT INTO `manual_exam` VALUES ('010208',_binary 'PK\0\0\0\0\0!\02�oWf\0\0�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0E����Ѷ\�J�(�\�ɢ�eh��4ND�B����\�81�$14\�\� \�\�{\�1�\�ښl	�w%\�=���^i7+\�\�\�-d&\�0\�A\�6�l4��L60#�Ò\�S\nO����X�\0�*��V$:\�B~���^\�K\����ڃ\r/P��I\�\�~7$�\�i��J&B0Z�Du�t\�OJ�K(H�\���xG\r�L�+\�v����dcӻ�\�\�W>*��\\XR�mp��\�Z}\����HwnM\�V�\�n\��\�-\�\")/\�ZwB`\��\�4�\��	��s\�DX���j�\�;A*ʝ���\�c�֝�\�\04\��\�[�S�\�9�> ������{�V\�4p���\�W\�&��\��A���\�|�d�?\0\0\0��\0PK\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j\�0@\���ѽQ\���N/c\�\�\�[IL\�\�j\���<\�\�]\�aG\�\�ӓ\�zs�Fu\��]�\Z�U\r��	\��^\�[��x\0����1x\�p\��\��f�\�#I)ʃ�Y�\�\Z����\��\�*D�\�i\")\�\�c$���qU\���~3��1\�\�jH[{�=E���\�~\nf?��3-��\�޲]\�Tꓸ2�j)�,\Zl0/%��b�\n\Z�\�\�z���ŉ�,	�	�/�|f\\Z�\�\�?6\�!Y�_\�o�]A�\0\0��\0PK\0\0\0\0\0!\0�*9�F\0\0\�\\\0\0\0\0word/document.xml\�]_s�H����u~\�q\�@�ױ\�	�v�\�\�NGw\�\�\�#Fe�5�����\�=\�׸��/7�\�\n�\0!X��~hY ���\�_fefe�\�o�\0<�(�q�\�.\0\n=<�\�黋�}uު N\�p\�8D\�.�P|�\�\��۟V7\�-\�(L\0i\"�oV\�\�\�,I7\�ױ7Cs7���^�c|�\\yx~�\�\�}]�p4�8�c-\"\�8&\�3\��э/�\�o\�Z�D\�<L���%\�ۦ\r�s#ҵv�n7$�h��Pෛ�����i��\Z{5Dz�Ւԯ���\��Z�[R���[R���\�N�m\����8��	�\ZM�\�n��\\�%\r/\�Ŀ�?y\"mrrތ\�=zD�Z�0��\�-(\�s<A�\�\�w\�(�ɞ�~�v�&}>�X?��v�%�Ӯѷ$���٨\r\�\�ǭXծ#:\�0���5:\���Fn\��F��8�߭|KQ\�mV:\r�\�t?��y����E�k1����m�P~gޓ9\�\�͋{��@\\�%�\�\r[\r\�j�,�6Ԭ�ko#ݴ��X\�\�B\��7�\�[b`�3�&\�NM0\����ڊ\'\�d֭�|��\�n\�\�\�x-4�E\�m�Һ��y�ދ\��\�}���Mk��Z���\�5t:��	g0\�\�u\�\�\�]ԝ{7�!�ܻ��\Z \�\�\��	\�\��\'�Ʈӹ�.n��v�\'O�sA\�77r?��#\�P\�/\�U�\�zU\����7\�\Z�|~w�q�.�P^_�н��\�;�\n�\�?E\���\�\'�xt�\�\�.�\�(�þܙ1��\���g�\�f\\�v�={�n=��o{��e~�R<@ŗ�n�۟\�$�\�ޔS\�SDG�K���l�\�\�\��O��\�>p4�zE��=��\�ɒ\�U&�3-hH���Lp��T,o\�\�)ZD(F\�#����;G7���\�&\�^ZK�&��΅i/�w���j\�0����\�w��\�)@���t�\��\�Ҋ�|&O2(w�\��\�1~XO����\��Q�|\�+\��\Z�ٷ\�M\�9]n\���\�\'!�`���\�\�\�o�Ot0�N���	�sJ>Ii_eM\�\�^N�ȟLְVb\��s\�V5K��9�+E�<mr�k��!��LZn��ؕ-j\�\�$#��QX�Nn�Io�\�ow�^�\����¬�\�Od7\�dϥ\�K��\'\r\�m�S&M����4|\�PZd\�\�\�B6�\�\�ˈUQq�j)�\�43e\�\�ې8Yi�\��ލ\��&����\�t\�\�\�\�%5\�6��\�l���\r�\�m��WP��7�V\�աʢh�\�\�\"�L\�Z\�t�\�\�(�~\�߫\ZI�\�M\�+\"�	}֍=�,\0\���̥d�\�a\\�\�\���Vڪ�\�Mʂ��9\��b��e\�\�h�(�ݙ�u2\����Ӌ�N~+c\��}\�NЍ\\e����|AQ��4\�o\�\��b/�Iu\�lP�\�\���\�3%�\��yÔTE��\�ǫ��Qyڃݎ��#[\�M���\�\�4\�(;�\�\�Ɍ\�\�\�\� t�M0h��\�\�I�jʿ\�\�\�N\�\���J\�_��Y�{\�Kv�\�q\�\��!/y\�q\�P\�\�?\�\0�PL\�\r\��#m��4%�U,舢ӫ\�^�����c\�\�r\\d�;�\�^\�ڍ�(�\�̔\�\�m3\�1��G�6V8z\0o\�n�\"\�\r@\�.���! �|��2s@�p�ÍVY�*�:����BϿ\":�,���\�=���o˪Jm胑pD�^RVoyv�z��\�\�)\��3^�=�n�\�S�E�\�\�a�\�{@\�\�1�\�ْ*[͒�mČ��0�ZqDN4T���ߣ��׃2�Y�\��	��MgX�J\�{G�po\�\�n/A\�\��e\�W�ߋ\�{;��Ieh\Z��/�1�\������k�`��\�\�\Z�\�-G\�9���G�l/ꉦa��I�(R�zkU�b\�1�Uo��\�V\�4\�Ψ�r�\���7w�q�{;-\�\�P�)/�\n8��Є��(��]\�����gBѹ���$�@��5�\��pɀ���#:�u2\n�\�\�!tB?\�gK�\���,�V�.\\�Lx\�\�-��\r��x\\ڱ	\�B��.Ҍ��I�9Uٓ\�`\���2\�^��ۘ\�Y\�C��?\�,�x\�\�ħ\�#\�\0�=y~�1��7.��K�r\�\�DA]���\Z��0N�]j\�~M��/S��\�F��\���eW��e@\�\�4\�QRM��\�Cfş�j?웬TL;�von�\"@n���$�7\�rH0��>g�\��F�n�jDM\�\�\�g4�j�@�aB\�vhx�Z�$��h5f-����� \�\�M?.J�v��َ\�ɚ��\�~6\�1Ӊ�\�\ZJ^`/\�\�jv\�-�Yd���\�\�\"KsE�g�\�\�X�&�vU\�\�|GL)\�\r\�Np=$�\�T�zh$}���,P\�&�#jO}�۲i\�\�h\�	\�4U\���\�\�\�,�\�3�\�mI,��v-ǈ �e8A�\�\�G>J�\������ɒ\�\r�,�q\�\���w#b�/|/o*o\�I;���Wm�\�,{�F/Hw\�jn��}\�`һ\�}D�`�I�B���S\n>�\�u\�;+��ğ��\�\�m�,�\�8���Ô(d�ɒ���,��%��/�\\�[YO\�}ڴ�\�@\�h�Q\ntdK\�\���\"uD��R�f���d\�&��К���:&1���<c�K@�џ�\�\�\�\�2֟�S��0�\�\�3D\�L�dyK�,�I�(\����c�\�)���a�(�\��D�z#O���(K�a�\"��O2\��\�\�e����3\�)���U\�W\��&�f\���dK��\�ϝ�_�\�۰v�^�9�\�\�\�8͝���Q\�@�OD\�\r�!\�e[�\�b\\QU\�ř\�lN�\��؎&b�1\�\��T�-�\�\��^E>U۔UjCP[\�8��?��{ⰵ]wTP�U]i\�A?R|+1m�HVt�_B5k�\�[c��	j\�8\�.\�ܕ4͐�Vlf\�݀��z\�/�\\\�\�v͚n�\�\�w��.�\�\�(���\�\�\�\�8Ep���s�\�Ћs\�\�P\�8���E�ږ���\�h	܌\�^@Ԇ	\�P:�Ӓ5ܘ�~�\���ˉ-��\�cN4�>un`��\�]�[������\�v�\� �=�{�\'�\�޿\0�<}\�\�e�\�ȣ\�bP\�G��JM(�fV\�]@č\��O�\�i:�!\�O���\�l�*�z3L���7#�~ϯ\�\�hJ�j���\���{wA7\�(��ۻ��<\�\�\�Ndz��|�	�\�\�\����ֽ�\re.\�j\�*ޮ`v�\��\�lD�;JW�-\�}��xQ\�\�W��qޖ��P��,H��y���Z\���\�;ڐ#\�PYK�-\�\��;{����\�v���C/��P�\n>\�44yhۆf��R\'���Q]g�\�\�\�m���\�\�\�\�☢e\�\�Uɴ\�>��c\��^�yuE8jl\�\�\�M\���\�\�\�{\�\Z�u=SL���*��LS�#��*0ѡ�q/�\�^\�?�Iy��m��Y��5:BCt���c�cKv\�\�ޝ�$ՂM�\�;�r\�\��FM4|�\�\�}\0�-ZsOkxX�����|z@�K�\�\�M\�d\�\�~��\�m%O,Q\�\�\�!\�s\���\�$4��/\�\�\r�\�S7\�z�K*B�7�\�i]\�^\�4� X:|F����G�S�\�/w�@\�*E\�ͯ~��\�\�@ �0�_y�:C �\�S\�V���A����+~\\\�j��p׵�sx�Dr�\�\�:���\�\�\�q_e��ą�#���m;\�a\n����\�\'P5(\�\�NDH�\��\n�&\�D%9\rx^\\�u>�c�\�N�\�\�\�\�t\�M#c\�AB!�$�QJ>\�ݿ]�K�\">\�e\�u\�\�*%%NwK\�_	mH���lȺ&rTH^\��0-\�t^\�ۛWcX�]\� /CI�J��+�\�K-xD\�C�\�z\�#���g\\A\�%\�\�ި&�<g�O]Sˆ�Z�W�f\�y�>P�\�_��O�G\�\�\�r\�%]|\�\�E)�\�\nW\�^��`Ox	<q�~\Z`G\�\�\��\n�J���tK,\�&tGZ\�?�l(m����\�p\�\���\�%AŪT%o`�Q\�\�\�\�r\�ό\�SƦ�yֲ�h6\�7�:LuY��\�$\��x���4\�\�J�\�\�\"	�\��E\�\�(���\��\�\�BD�-�T�]�\�F\���ǿ�oOu��(c:,�ǈ|_\�/���� �\�\"?�c�7\�8d\�a7�\\U�q\�iz�\0\�\�ء8\�\���;^\�k#V�]���A\���ӵ[tT\�W\�{�\�_R\�)\��][e\�-�	A��\�;�yx!:\�h\�n\�۰�\�aiȰ��h�g�\�:�\�\�8y���hu���hZ/\�+\�x�\\��eWY�\�7�#e����\�n\�,j{�\�B���S\�R\�eQ�Ҁr\�3�J\�=�hU��[�\�,[�\�\��\�\Z\�`W;�K�5΂��\�mx\�E��[\�7u\�R\�J\�\ZYRe[77\�v�\�n\r(��e��.��&�<\�޴\�+\�rd��hJh���3?\�\�A�\�\nLV��$JL\�a���v38�\���\�)\�vg\'�\�\\o���]�zs�~�\�\0?\�\n�3�9]�P��\�q�*��q\�_\��G(MOr\�jVF�v؊�\�ǭs��\�1-�z�։M\�2VjBT	�B\�Y�<F�N��TA��������\�p��\�\rw���^Z��\�14�7�|��\\�\��3E��n//Alz�L����nCNz����Nq;��[�IQ\�\����\�Kp\�\�E��$\n��-:�2��\�F����\�[��+�)�vƝ%`\�R;h\�6!�\�\" gX�d��E�\���F�!\�\Zt�w�\�Qg����mi�@\�Zg���+\�D�1>�Y�K�\nEa\�6�q\�N~d�\��fQ�\�mC!�$��\�ۃ�ڃֿ,\�?~�3r\'o��աY�fj��\�*�\"*�\�{���ț�!8�k�E\�PT\�d�����17&Z��\�h�\�\�}�\�L�(�\�\�c\�\�#���8Ȣ\�Ξ\�\�#�/0̎5ݭT\�;X�g.�!\'\�\��NH,Ee:�����o-��{�XD\�Z�2�N�vn��[�X\�)\�\�\�\���\��z($\��(��\'\n\�I�m3~�\�\�6&\��[�b�.1\�M>*\�\�{T\�Ї\�\0Gv�g��m�;}Y\�\�}\�Y��y�:�\�\�LjP5\Z���d��9˨drP0uKd6�^N\�\�t�\�0���>�uTLQL\�*gF�8\n��D7>d�q\�&t\�\�S��(���e�Og2\�hi\�>\�mVq��p\�1�o�!S\��/�,�\�q�쳻�\�z\��̹�\�m�d�L�\�~S\'\�ܣ�.�\�A�WuE�`��Aٖ���\�\�\�\�}\�\�^+��|\�\�_\�\�\�҄R#,�\�\'3�볙�\��{\�DE�yC�\�\�\Z\Z�,�ƦBT��>l@\�;s~6�Y�\�L\n��}[Z\'�\�\�{;��v8��Q\��\�\�O\�\��\�%�^�}Qf3Lf\�#\�h�k����!���\��;\�ƽ\�G��\��\�\�(\��\�\��%M\�7|�!~(�Шn˫Re܂݁+;E�eIuS\�\�W0,)\�DRJ�1`��\�\�\�Fd�ĶTݷ񧉖��TR�ni��\�\�:\�nKSh�\�\���NL\�q\��\�_N\"J�����_�EՄ�\���u�� H���fY��\�\�\�\�i���m\�ΞD\�=DJ��\�ԇ�je�3-S\�W�\�e+\r^����ƈ� �\��\�4{�֍.[����x\�\�4f	��q�j�}�p;͆�\�qw��\�0%\�Ӿ�ϋ\Zg�\�+\�^9o9�KX�\�F�-�TJ{WC�\�r2f�!^\r�T�fWC?�\'\�\�\�M\ZJ\�5\�\�{a�3E!8jp�S�\�\n�\�\0\'ˎ\�e\���KhQw?��m\�\'Sy^Q����ȱ�q��EI \\�2I�����\�1���q�_˫Ĭ�\�\�RW\�|I��TNE;}ݭ<#:� =��~!\\�\'�YQl�\���hNsS9]ю�Ļ��,ۚ<\�\\6Nx����!=9�\�ϟ�Y١=@\"^ˏ�e�ݥE���#ݡ����\�T\�̬!�p\�w��\�\�4vV\�x\�\�\�\��8�\���\�\�G\\\0\�* F\'`�\�8z�c\�\'yy�Vg�\�<\�z՛\�k�ek<\�\�~�S����5G\�9��\�B\�/�$�\Z�6\�\�M`ar�sJa\�Ӄ\�z7���,\�-�\�\�\��Ԟ�\�\�[vO�?�wJ%3�\�`E�0B`�Yy\�\�0(�H�w\�\�:/\�g\�t���%w?���W�\�l�pP\�Փ��Ε\�P��Y�\��C�ŧjp�\�\�\�oY\�IQD���dQw����֣��3�XPۚ.r,�~\\\�j�\�φ�\�	�\�\�;E�\�6T�\�=7��L�����\�*�\�\���;�RĀДF٬\���\�\�\�\�?|SwxS\�\�3��ll^�#�\�\�ɢ	\�Mѷ畛�$(\Z\�D\�v�\�=�in6�B\�d\�\�O�U\�Q\�w(j\�\�	�y\�H�O@+\�#`��ЕA�\�(D���\�M#\�v���	\�\�\�u��p\�_5J\�I%\��*v(sqڞ�_���,���zCcdz\\3\�c\�_g~�Z��]P4٬\�z\��,��vqB.\�fVe\��\�,��͢\��{c�ۯ�JW\�c\�\�*&\\&�S��m\�2O泬��z�#�\"Z�]\�rݒ��\�$��߭jd.�4\�\�(s\�Q+\�#�\\\0\�(�i9�m\�N�y9KT���˨_g]g%n4�-M\�*œNo/V�!�tQw$Z\���]d\"r\�\�\�!P�#@\��K��\�\��s\�5[l��>��E1�w˄F\rW~�\��7s!0YF�)�O\�\�sޡ�|\�@\�G\Zm\�j\��ܽt	��NI:\�S�\�z���E�\�\��^�[u3G��<X# �����|\�7	�\"�hT.�?H��-�,1��(���#\�{��<\�\�ʙ�8)ޑ�S]r\�a��f\0:�0ݺC\'#�\�h\�#<�\'p\�NY\�]b�IPkQJpz3Y5\�CP�\�#\�\'�\�4�\�\�}@ĂI�>\�=��6K��Z��\�i,�i��%�x\�aT\�\�Oi	\�N&��؈��%\�mn�\� �\�e0�	\�4�R֧��\'\�5�ܶ9�\�a;Ј)C`K��\� h�c�9�\�^�\�#�*\�F�3l_�VM��@�Fٝ?��\�\�\�J9��θ\���u�5*�Qq<K�n�f�օ�\�\"��5%���^&�<L\���0��L\�~��2C~�QqC[0t��)���.��2�=7Au\�\�s�V�,\�:�\�[\n�Ejn�]��;Z6�\Z��g\�h(CE�D�\�\�\�DX\'8�\�\�1Z}آѵ\�Ny\�e\�0q�L\�\�ք\"\'ȕ��j`{�LtC��\�\�\�D�Ыw�\�\�T�!����\�:Te�e���.��\�JiI\�$(�-j韥v���.��h�C�\�$(F�\Z3�pgT0�Ţ=\�4����\��\�b\�\�0�wL�\�\�sT�\�y�\�ԐEx�����\�84�#\Z��2$\�d��\�ǐn�\�m��t�:j oGϯ��\�\�\nG5\nm\�\�\��s�\�T���\�.�;ñtk\�X\�!h\�C��zV\�#)�����t*�\�x�\�\�\�9^~�S�\�ؽK�^�y�ݔU{<Al��\�\�̾j�%�\�\�eVF4i�&\�|��-K�>\�\��&��lB�ۊ%ȘA\��<2:$K�\�\�!)��F�\�總N�\�ɚ`[{l��~��o���R�\�Əlr\0o\�5m6�o%������OT����`ɦ0��v��\�\0\�\�\�ؙ[�\�4�\�k:h4���[\'�4-\�p��\n\�Q�u�%)F&��^�ʥ�9����n�\Z\�\��\�=]�� �</R\�&U��\�\�XwN\�1,�\�\�*X\��)�\�\�3���w�>tcvz�\0m�*N�\�a��7\��:\'�ǭ�u�1|EA\0�t\�t�V\�\��\�\�\�={�EK��\rqd\�\�pM�\�8\�9r���&���ն(�F�\n745��	Y��4	j\�B�M1\�\���[K\�u[Q�JZ��K�A�k�\�)�\�X��\����\�WCDt\r�A7�\�\�E����B��W>\r\�+; \�\�\r\�;����@����ZX4-\�y\�`�<�F2O{�%\�\�(*2���\�n\��*ڃ-\�SV/\�\�V,;3O\�-[4��\��\�j�_g8\�\n<��\�CR%M\�\�\�}\�����\�\��\�\�1��t��3\�q��[vvL	�Dnɚ�mVL\��En\�\�]P;\"\�-���\�\�\Zg�:�=�\�vj�ta[w���b2-\�q\�k�d �$k�OQǑ|!ѫ�(\�R��p1�B{��e�\�����y�cM\�\�G!y& \�{\���\\L�\�җ�������\�Og	\rW��?\�p�\��\�v�\�wgȝ��&6\���7�\'��\�%=\�cM=�,�(����sJ\�$xϞ`\�&\�{O�}��O~\�ͨ\�\\�R��y�\'O\��\�rNz��\0\0\0��\0PK\0\0\0\0\0!\0]\�`SH\0\0y\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�n\�0E����\�5��@\�bش�XtC\�g�~D�����K	*��\�rn\�3g\�r\�˃���+�fd�H\0Z��\�#\�\���	r�pi40Ҁ#\�\�\�\�|\r��?\��t��h\�H�X>S\�D��Д���\�X\�ї6�%;��F�)�]Y\\0�U]%$\�4%��mҴ�jD�@\�\���\�y&� #�$�,B�+̆T@\��\��\'�9D��	\�%\��\�!\�\�J\�`�\�[�s\�\'1R\"5\Z7<���8G}�!%rO��лV\�\�<��\�1V1�\�(Zs�r\�&\�:��X\�i}\�U��l6;_\�I�\�\��j�\��C�PC��\�Uu\�\�.\�\�c�\0\0��\0PK\0\0\0\0\0!\0��g�\�\0\0\� \0\0\0\0\0word/theme/theme1.xml\�YK�G����\�z\�\�a�5\�H�k\�6޵���Rk���i\�\�ڵ0�`�r	��C�\�B1\�\�c�I��\�I3-�ď]�	��U?�������4s\�\���:G��[=Wq��ؘ$aǽ}0,�\\GH��e	\�,܋;�v�����8�:n$\�\�|�,F0�\�96\�	\�M���.\�c��AoL˵J�Q�I\\\'A1��1��v�Jwg�|@\�_\"�\ZQ��TcCBc\�Ӫ�P\�!\�qa�1;>���\�P$$Lt܊�s\�;\�k!*dsrC���[\n��5-\�\�õ�\��^��֯Tn\�\�Ac\�X\�\�\04\Z�NS.�\�f-�\�(mZt���z\��\��׷�]_}��Mo?�\rs��\�o\��^�\�7�kP\�llᛕn\�k\Zx\r�(I�[\�ߨ�ݮ!F/[\�m\�6kKx�*\�+�OdQ�\�\�\�C\0h\�\"IG.fx�F�%��8�$� �f(a�+�ʰR��\�\�\��(:�QN:\Z��!\�\�#Nf�\�^�n�\�ŋ����|��\�Ǐ_>�u���\�e��y�7?}�\�\�/����͓o\�x�ǿ�\�\���_\�A\�g��?{��\���\�\�rt���\�:>vn�6hY\0���8�\�Kt�P�)z #}}�(�\�zش\�\�\��4�gޏ�\\�Z�=\�h�q랮���V�\'�}q>\�\�n!td[;\���`>��\'6�A�\r�7)��8�\�Qsl��E\�.!�]�Ȉ3�&ҹK�\"V��C#�2�\�$�,l�߆m�\�8=Fm\���\�D\�\�@ԦSÌ�\�\\�\�\�\�4�\�E2��\�_�ap!�\�!�\���6�|aнi\�\��=��M$�djC\�\"\��\�>��gV\�$��\�+b\n!���LZI0�>�%�\�C�\�\�ې�\��f\�\�v$03\�\�N�)\��\�H�]N�\�ћ�Fh\�bL\�1\Zc\�ܾbó�a��\��\�el�\�Udƪ\�\'X@����c�0Bv���\�\�b#�,P#^���\��\\u�5^\�hj�R\�ա���!bc�ZoF\�+\��x]p\�\�r\�@\�\�\�\����\��ζ9@\�X �U�-݂�\��LD\'-6�\�M\�C����Q�\�$yk�Q�����\n\�\�O-\�өw\���T:E\�d��)\�mV5\�c�\�5}4Onb�G,г�欦�\�\�4E\����9�d\�*�\�G�d�\�E?Z=\�\�Z\�§>B\�\\P�+t\�#\�쏇0�;Zh��iAs���9\�m�3��\�~�f�LU���\�P83&�p\�\�V\�j�\�\�=6NG�\�\�sM@2�\�k5e�LG\�\�\�Z�\��A늀�}�\�Lu�\�j�-$�\�N�E\�¢�\��\�_K��\�\� �H\��RFn\�c\�T~\�\�S�t�1\�m\�,\�k+��\�i�D.\�L�0�\��\�>e_�3�\Z��)�i4[\�\�*�l\���=\�\�\\\�5#4\��\�\�x��\�T��I\�ɥ�?$�̸�}$���\��\�Db\�PC�\�\�@��[�\�T{�Dɵ+��\��W\�\�x2�#Y0�ua.Ub�=!Xu\�H\�G\�c\�\��-��Ue�1rm\�1\�\�ά����G\�xߒQDgZ\�(�d�\�u{M\'�\�tsWf��\�P9\�ķ\�ۅ\�D.i\\ \�ִ珏w\�\�Xey\�`��\�\�\\\�^庢[\�\�B�Z��AM1�P\�FMj�X\�[�f\�qڷ�fԪbUW\�\�֋mvx\"�\�\�J��¯��\�+\�4\�\�Uv�/�9\'�A\�\�zA\�J��?(yu�Rj�\�z�\���\���V��\�C0��⪟�=��t�|o�Ƿ\�\�ǫR�܈\�e�\�\�\�\�\�w�\�<hԆ\�z�\�(�\�\�a\�\��Z�v\�\����\���\�>t�#\r����kZ�F5J^��\�ڥ�W�u�f�5�������W\�ռv�\0\0��\0PK\0\0\0\0\0!\0Q\�:\�\0\0\0\0\0\0\0word/settings.xml�XKo\�8�/����yK\�\�F\�B\�m�d���\�3-\�6I(:�[\�\�!%\�N:-��\�\�|�\�\�p8̛wu5�g�㢹�\�\�tB��\�^N��\�g\�t\�)ڔ�\r��Y7}���\�\��S\nغ	�h�e]\\NwJ�\���+v��݅hY\�FȚ*��\�yM\�ݾ��n�\�k^qu�\��\Zq9\�\�f9��ռ���E�b�\�~F	���H*�}\�\Ze,\�%��\�t;\�v���G���\�o�u5�l\�\�=Y>J�\�=-\�JQ���\�\�\� oN�ݯ=ھ\0\�\��*�-�:�\�{���`�\�:\� y����\�\�?\�\��\���9s��+U�{�2\�u�e��;\�=V�\�\�^\���\�X�b\�U/���\�kIe&����\�ն��+pJgٟ\��_��1K�`\�:ӷ\�#>QO˖\�\n4˚\�5\0\�)6+E�Xv-�*\�q��Q�xXn%��W�#S�\r\�WꖮWJ��tOacT;*i��\\��\0m�h�\�\�W���J�\�H8��\�B�ժ\�h \�\�\Z���K݈�i\����<\'Z�X��s�\�\r	\����\�V�x��\����̢���\���W��\�s�5\��G(�\�c\�rF\�\�􋌙L\�oo��B^5%\�\�/3\�7&�\0�Z���\�RL�\�3Z\�\���\�\�;�/0Ùtn�,\�b���\�\�\��\�2i\�}~^�p}�ݸ�$�zd�∸�\�{�\�bYd��8\�	A�\��E|��Y�z�D�\"\�P$�\�<@�\�I��\�\�H�\"�x(b/\�8D}��`\�2��\�(B,ǏЈ۲3t?�\�\�7�8�\�(��i�#i\�9�\�㠙s\"\�OP��,\r�\���8B�v-\�!hD]\���\n�\��1Zon\�\0���\�%\�N=\�IC\\fagj\�\�</Fc\��\�\0�?�R���k���~j\�Hf�(��\�\'\�\�v�:V�\� \�|�`�V���E\��\����9�\��\�3$������D�\��hD�\�Kp;�\�%x�}7�P;qdx\�\�O2�F�\�G\�Գ3C�f!�!��$�H�\�A\n��2\�	C��|4sYf���\�/	ѳ��P���|a�\�x=\�!��\�~�-Ǖi&u/�\�z-9�\�\�G\�\\s�\�]̛_3�L\�9�گGp6끮�U�\�\�:ƵzY�M\�Ƭ�*�\'��D�0_~xԥ\�U&��b\��\�AҶUF\�uIިk^��n�^�R\r\�\�gо)?\�K�SxKW����!ּԃ�]]�\�.*�\����mۏ\�}9��v�l=(�*\�qm>\�[2`\�`�\�\�-�ր{X�hd���9#\�9\�ܑ\�h\�H�N4������R���U%�|¿\"�A\�v�ei���=axt��%{�\'+��N���5}\�/b\�\��]ѣث\'�\Z\�\�\�S\r�56\�x�\'¦Ɵ��\'�z\\\��\�\�q\�;^�\�\��\'J\��\�`��,EqG	V�\�9y�\�C۰=�Qf���b��v��Q\�\�E�D�\�i\�β,�g��Y���Z��\�\�y�\�pJ\�߼�\0\0��\0PK\0\0\0\0\0!\0�FC3$\0\0� \0\0\0\0\0word/numbering.xml\�\�n\�6������\�-�3�&q���]\�m\�E );\�\�\�\�#��\�z(Y���$��\�\"�I��G?y�?���\�\�\ZKE�Y\�c�0ODJ�jf��8��X#�OϬ-V\�Ǜ���y�X\�\�0��7y2�2��ضU�a�\�5#�J,�u\"�-�K�`{#dj{�딟r)�pn_#e\�p\�s7Z*\��\r0��I����7$����\r��\�	=���{�\"\�d\��@�U�#��p\�0�\�&����6i2�\�:N�}�E�9.�dH\�W���OE~\�i� �\�-0��\� dQ\r��io\�\�f\"\�\�Ok��Y�\��.���7�\�U��i\"0\�,,7��Jױ��vU��H\n��.U�%���\�*#ys;��4\�j\��-֌\��6�۱\��\�j���a\��n\��2�\�:v\� ��.)�Yg\�\�\�$́�n\�˧x-@�\��/��1\�1\�d_݆C:�Uͩv\�p\�^X�\��2�@Z�Bx~��iL�K�:\��\�\�=�M,\�(C�)\ZC\��0lp[v�w�:��~��\��4r\Z\�a�n�\�\��\�\�ᅡNK\�K�r�uY?���hA!#(�T˨\���iʏ��\�7{=2��u\r-��(џ6:��\0\��\�b��\�I\�Y��OK�\�O�\'3\�P�2\�\�k��{7�;�X�a\�\�W�\��q�\�zN�]H��fƨ�\�j�\�z\��\�s\�N5B\�f�@S%\�t5?n�C�c�DtΚ\�EA)\�\r�\�>�\���5��$u/\�\�\���wi\Z\�\�c�\�5�\�L2\�W���2Y��,w\�\\p���*!p�l\�B\�2�\�v\�A8�S�D�\�VR\�2��J�-%��\�d�:\\c3\�deD_]\� &̭($�r�o\�yћ��\�~�y-\�\��W\��\�o}u�\�h�n\�l�ט:P\��@\�!:.�A�\�\�M&�w\�gYq�\�YW\\U_\�Wq�?�\nδ\�Bg\�U�~7>ˊ\�\�\���\�&gZqQ0�\n?�\�\�#wk\�x\���\�m}\�Ax�δz��\�w>v<\�>j\�m��b}/\��b}/\��b}ka.\�wX\�]�\�\������Vqge}yiy��\�5�)�Ӣ�?r\�\��ԟD�_�u\�\�\��\�@�\�hA\�\�\�u\�c�rί2˝��U[9\0\0��\0PK\0\0\0\0\0!\07\�Os\0\0r�\0\0\0\0\0word/styles.xml\�[s۸\�\�;\�\��\�S�\��\�k6�Ύ\�ĵ�I\�9�g��,\�$��\���@�\"u\nD�i����$��p�\�\���˯OI|�Y\�xz6���?	h\Z��g�\�wW{�&A^�4\"1O\�\�\�\�_\���/�<�΋\�\�\0��\�$<���b�z:\�\�MH�_\�Tl\\�,!���\�O�=�뽐\'kR��Y�<=\�\�?�hLfC\�\�%\�[�	Me?\�h,�<\�Wl�״G\�#Ϣu\�C�\�\�I\\�\�\�3;���\����I4F\�H���l_}J\�\r\�8\0���>\��4c*,\�\�8\'\r�E-�[eZ�<*��rP�\�Tڒ��H�j)�R\�\r\�9�}���o\�S��E,HB�@(���h���>\�\'��l\�\�����o钔q�˯\�m��\�o\�\�O�<x|M�;QAQJ\�D�\�\�i\�&b%yq�3һq%?�n	����\�d*K̿��_I|698���5\�����U�ل�{�璻$ѥt\�\�\�u��R�m5p��M�&!Sd�,�p\�\�ɾ�\�LƑ�\�\�/�J\�ݤ,�.D��\rv\n�X����y�\�V�|\�\�\Z\��\�l�\�?~��\�\�D�9���\�?\�i®YѴ�c�b���\�\�F�\��R�B��2�OO�\�q�{\n\�Z��5%R��\� �{�lS�2�w\r�\�\�_Q\"\�o0\�F�\�\�\"o���Yn�]\�*\��\n:z���_����*\���\nz�R)\��,����jX�\�\��\�18�c�%4\�\�*h��\�\�@Gs\�\�1S�\�i���a�sw\�n\�\�S�w�\�\�\��ݸ�\�ww8w\�\�\�n\�\��\Zϭ�Z��p��\�eK΋�4(\�\�x\ZIK%�~xrң��Fz�T�MOģi!Q\�w�\�\��y!s��/�%�/3���8M�Ҙ�i@�H�<3Z���G\\\�tF�4�iH}lP�	i�,<�\�5��Ƣi\��j���\�h�?���0�:!a\�\�W�o�\�=\�\����eSO��~��b�\�\rf|j�0\�3���4�\�E�橧4\�S�i��~�Ƨ�~\�4O��i��M\�\��\�+b\�۫�����˘\�\��\�1g�)��Ӎ>f\Zܒ�\�gd�\n\�q\�~l�\�\�r.x�\���\�\Z��u�\Z\"��\�,-\�wh�\�˹\Z�\'�jx��\�w�b�,h\�~�y�(z�V���vN\�ZЎ�6R�a�bY\�\�\r��F�G���r��|�Z��؆5ޭ���\�\�i��Z\�<|����\�4i\�\�h\��c�H#\�y��j��]�@Ib\��\���\�L\�J��T__�| \�\�\r��	K�\��n/!,�� �\�>�\��Z���c�\0/xQ�\�S	�\�����\n��$8}�\�\�sO��\�y�d*�<�\�2��\�\��x��\�N�\�\�6�\�5?�D��d]-:<�����\"�xX\r)\�$c�/���k6\�\�ſh8>\�}䁗#C���:����\�\�n�2���DPj�\�A�_�\�\�\�7���\�\�˘\�93�Bu\��jn\��\�\��ɟ\��g\�2�ׁ5\�[\�@o]\�\�2Is�-V<�\rV<\�\��8d\�\�!9\��G\�\"ob(�/%̗\n\�K�*��+tZ��\�`\�թ`��\0-��q\�u��t���5\�\�\�8S0_\�L�|��÷].\�\"\�\�\�B�\Zs-���&-h�\�ɞ=!\�\���x8@Z\�n3��7�𴺈\�R��=.�+�/��Ѕ��I�\�zy8\"J\�sO\�\�6��\�^��\�Lݻ1�\n�1	\�\�\�m2ۊ|y^ݖ�]}U\r�Þ\�\���\�\�hs��ӲN\�;f�\�\����>�4beRW\�Lqrho�Ft\��h��f%ѱ<���e�\�ܬ�;�����\�W��\�O;�C��d�\�th�49�a���Ƹ�ء�\�X�\r�ӡQ\�q�\�<\�\����Ϙ\�\�\�l��\"3\�Nf��_�C��~erf\�MU^s���jm9/yuܾs\�\�����pJs\Z�r\�O\\u����Íaw\�\�\0dFXE\"�9*$�)ֱɌ�Rf:Z���=.ZA{�h).\�j\�*���^�hG����X)�(G\�N�\n)hG���B\�Q\�\�\�\�\�\�\�Q!\�\�Q!\��vT�@;*D�\"Ў긶7�;9*��\"Ў\nhGU\�\��\n\�q�\n\�]R\\RЎ\nhG���B\�Q!\��rT`\�䨐�vT�@;*D���\�\�\�Q�=\�Q����B���B\n\�Q!\��vT�@;*D�\"P�\n̝RЎ\nhG������#\�\�ڻ8*��8*��\"Ў\nhG���B\�Q!\��\�\�Q!\��vT�\Z���\�2�����}�SW�R�ڷr�Q����Vf����?�7�|\�\�1\�\��\�z��.�@���\�r��6}\�C���\�)�\�Z�c*GCC�m	�����޶�Σ�\�۶\�\�\�P\�U~Y_�\"�#`<fZ\�3��P�n�\�.�\�-C\�\�C��e;x(������-�餹���c�pj&\rK�U��c؊f&تg&\�\�h&��4b�Qh�\�(7���a�vwT3+5$8I\r0\�RC��\�\�&5�X�!+�{p6��w�!\�Yj�r�\ZNeX�!+5$`�9!1\�RC��\�\�&5\\\�a���Ԑ��\Z��w�!\�Yj�r�\Zd\�h�!+5$`��\'�\�]j�r�\Z���VGQ:R�n�\�a-C܄\�2\�疡C�Բv̖Z\�l	jUk�˖ڢ�	�\�	�2�	(=���fZa3\�Mj\\�\�\'����	X�qْQj\\�4(5.[\Z�\Z�-��\�eK}R㲥>�݃��\�$5.[\Z�\Z�-\rJ�˖\�R㲥>�q\�R�Ըl�O\��\�.5.[\Z�\Z�-��\�eK}R㲥>�q\�R�Ըl\�(5.[\Z�\Z�-\rJ�˖\�R㲥>�q\�R�Ըl�Oj\\�d�\Z�-\rJ�˖�\�eK�	���yB�\"����k��\n2�ᄟӌ\�<�J��oSߣZ9}\��J�\�\��\���\�3��\�\�JQ�X\rT;\�Qo������T]��Z�9\�E:��\�߿8?8:\�~�\���`S\��K�گ�:j����\�𦴳\�Kh|���\'�\�囷��lToJ\�\�\��\�\�W�\�S��W�էq�W��ߪ��Uկ_�������~��I�} �\�ɽ�&���\�cl3���:ç������\0C5�L;L��Y\�]\�Xĕ�\�\�M*Gܣ@U�\'R�\��K\Z\�H�7_�w�鲨�\��գ��/��\Z\�35]\�ne��Ã�z/���\�\�\�=]�.\�\�\��7�8\�;\�\�O���$��\�d`S{= a]\�	vgX�_�&z\�D�z^�&]wPq�� i4g\�\Z9t\�{�\�ۼ\�\�\"��ɢr�]>�\\\��MH�>�n�\��\�r\�lr~,��\�/b�	�˕��\�1����6\�\�[{�Oj\��M\'oB�F�\�L�+o[\�\'0A��i�U�/s�W�[\��J��]����/Ө^��N�{�]iոZS�f\"\�2\�8\�\�\�1h\��q���Y5P�\�\�ʘ6r�\�E\�?^#^\�qj�Z\���gK����}�F��\�\�N\�ꔩu܏\�L9|��f~�F.D��A�B5ђ>�m*�\�k�}�\�\�1+}�	��%AD�\"��R*�\�a�\�\�n��\�<\�V��d�`��On\�=��\n���k�u\�~���3E�0U\�^\�]\rZ\�Ao�\��_�0\\\\\�\�#�=�֛\�\�.T\Z@_�\�E�\�\r΅9L\�\�em\�N/R\�/RZ�~�$\�v\����?#z\�qR�\�bl�\�jׂ\�>U8���n��B{�\�\�+u�\�\�z�O��y�\�l\�\\Ue�}Ts\rWk\�R�r��\���\��k\Z���Y=�\�Ɏ8�$,\�\�;��ܮ\'�\�\�\\=\�2\�su����e\rE{����V��\�̦\�\�H\�\�t\�T��|\�$S�\�\��,o\�K�P>\���(I�,\��\�\�\�	����\�}\�m\�l\�m��˘s\�\�_���i�H��b_�w�����QO|�*ן�7�\0\0��\0PK\0\0\0\0\0!\0\�\n)NN\0\0~\0\0\0\0\0word/webSettings.xml�\�_k\�0\0����Cɻ�\�)Va\�^\�`\��\�Ն%����\�\�\�کs�b����\�.!�\�\�\�\���\rS��\�X�\�\��\�j0	E\�e\�C.�@b����7Y\�W��OR�\�\�\\T1֙��+p��X�\�\��S��a#�\n\�z�\�\�*���&\�\�8M�\���k,K�\��ց�]�`YDO��\�5\�h\r�����\�q�\�s\��3����\�	\�8\�bu��\�n\�\�/0\��/���]?cv0$G�;�\�\�LO�)Μ�%sP���2>ޫlcUT��\�\\�~IMN\�޵w\�t���\�ڲį��\�%ܶ\\\�uC\�u\�m	b�\�h������\rA�\���\�G�\�?�f�\r\0\0��\0PK\0\0\0\0\0!\0c\�b\0\0�\n\0\0\0\0\0word/fontTable.xml\�[o\�0�ߑ��\�\�\\�^V��\�؀�=�Ϯ\�4����ϱ�v�\�Bi�\�8\�����ss��e�\��VS�\"p\�t&\�bJ�>?^�I\0����Z�)\�r ���on֓\\+�W0�lJ\nk�I+��\�\�WX�k#�\�[�%5ߗ\�Ӳ�V\�E)\�6L�hH\Z�����\\0�^��\�\����\�%��BT���/���\�*��9˲\�I*\��-�\�hй\�\�d�yv�#_�\�`\�\r��\0C\�7\�\�b\�C�Ⱥq�{�\�8�7�\0d6+:Q��\�\�����C\"\�6����Αd�O�\r��H·\��<\��\��\�\��\�\�\�ȬI�`=QTb\�/[9ץ�WTi\�1V�h9%\�\0\�8rKd\r�:�F$t\rYA\rpǨ&u8�R�\�]\�hIU]Q	ˊ]|E�p���@,�b	�9\�A\�H�~IZm�\�\�9\�\�H|\��\�Z\"��\�<�u�ُ���Z�QM��K���6\��\�Fp\�\�\�\�㋑{��ƃ���\��q͹\�Ƚ^\Z��sr\�\�\r\\{+\�F\�Ɇ\�7�t\�bó\�]��\�\�n�\�3g2�ut\����%\�;\�\�\r#�\�0=R� \�˂��\0xE\��+n��]���\�͡�\��W=�5=\�/\�\�C\�G�&\�r��O\�_xh\n0�\0\0��\0PK\0\0\0\0\0!\0�\�G�\0\0�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��AN\�0E�H\�!�>u��(\r�n�E v\�Z\�Ķl\�\�{�A \�\n������)E�\�\����\Z;;|,�`\�p)(\�E(\0A%\�b2@�\�a��c�`��h\�\�[U)�\ZεT�-x\'aR�hj�J16t\n%1=O/\�I]\�[=��\��\0N�h�`	#�\�\�0T�#ZZ2\�Y�]4�b(�a\r�{1^�ti�h�d\�\�B��\�J\�\�G\�;���^\�oP���Gg\�UC.\�(�<c4�\��gx]�\�<\�\��\�q\���j V\������\�bJ�\r�R\�\�g���f\�\�otc`�\�\���l\�7<]cG�i\�8��E\�\�ܫ{qO��p\�\�\�}��\��VOj����\�ICtm���]X\�cJ\�PW\�U��d<Dy%�0\�	��q��\�\�QtSo�1�6,��\�qe\���U�o\0\0\0��\0PK\0\0\0\0\0!\0�Q��}\0\0\�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�R\�N\�0�#�Q\�\�!�R��*BxI\r�lٛ\�±-\� ��l� n\�;\�\�L\�\�\�0D\�\�:?�y�V:�m�Ο�\�e�\�$�\�Y\\\�{��?<�\�\�<��1fDa\�:oS�+Ƣl�qFcK�څN$jC\�\\]k�WN�vh+�b��=�U���H�����_R\�d�/>W{O|*\�	�}�ifʥ؈B\�0��\r<�#?6�sAE~r~l(aӊ d�y��/�M\0��\�h)�\�\�.�:e����\0\����-\�נӞ��-\�jK\n\�9��\"mA4A�6�E/p\�`+��\r�ka\"�`\�:/,�\"���\�+w\�g���\�\�\�\�n��$a>/ϧ�\'#\����\ZF\0n\�\�_@��A�}\��yx��x1+\��\�\�#\�\�\�\0\0\0��\0PK-\0\0\0\0\0\0!\02�oWf\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�*9�F\0\0\�\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/document.xmlPK-\0\0\0\0\0\0!\0]\�`SH\0\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04%\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0��g�\�\0\0\� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\'\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0Q\�:\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�.\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0�FC3$\0\0� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�4\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\07\�Os\0\0r�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�8\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0\�\n)NN\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yG\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0c\�b\0\0�\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�H\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0�\�G�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�K\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0�Q��}\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0MN\0\0docProps/app.xmlPK\0\0\0\0\0\0\0\0\0Q\0\0\0\0');
/*!40000 ALTER TABLE `manual_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_department`
--

DROP TABLE IF EXISTS `professor_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_department` (
  `professor_name` varchar(45) NOT NULL,
  `professor_id` varchar(45) NOT NULL,
  `head_of_department_id` varchar(45) NOT NULL,
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_department`
--

LOCK TABLES `professor_department` WRITE;
/*!40000 ALTER TABLE `professor_department` DISABLE KEYS */;
INSERT INTO `professor_department` VALUES ('Daniel Armaganian','209146943','319003935'),('Tzahi Bakal','315730176','319003935');
/*!40000 ALTER TABLE `professor_department` ENABLE KEYS */;
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
INSERT INTO `professor_subject` VALUES ('209146943','01'),('246810121','01'),('315730176','01'),('333444555','01'),('135791113','02'),('209146943','02'),('315730176','02'),('246810121','03'),('333444555','03'),('315730176','04'),('333444555','04'),('135791113','05'),('315730176','05'),('333444555','05'),('135791113','06'),('209146943','06'),('246810121','06');
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
  `answer1` varchar(60) DEFAULT NULL,
  `answer2` varchar(60) DEFAULT NULL,
  `answer3` varchar(60) DEFAULT NULL,
  `answer4` varchar(60) DEFAULT NULL,
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
INSERT INTO `question` VALUES ('001','01','01001','1 + 1 = ?','Daniel Armaganian','209146943','2','1','2','3','4'),('002','02','02002','What is the time complexity of merge sort algorithm?','Daniel Armaganian','209146943','2','O(Logn)','O(nLogn)','O(n^2)','O(n)'),('003','01','01003','solve for x:\n4x + 2 = 6\nx = ?','Daniel Armaganian','209146943','1','2','1','3','4'),('004','02','02004','Which of the following is not an OOP question?','Daniel Armaganian','209146943','2','Ruby','C','C++','Java'),('005','01','01005','Calculate det of mat M\nM = {{1,2 3}, {4, 5, 6}, {7, 8, 9}}','Daniel Armaganian','209146943','2','-4','-6','12','31'),('006','02','02006','How many bytes is an int?','Daniel Armaganian','209146943','1','4','1','64','32'),('007','02','02007','What is the time complexity of Bubble sort?','Daniel Armaganian','209146943','3','O(logn)','O(n^loglogn)','O(n^2)','O(1)'),('008','04','04008','What is the general formula for alkanes?','Tzahi Bakal','315730176','2','Cn+2n','CnH2n+2','H2O','Olives'),('009','04','04009','What is the difference between an alkene and an alkyne?','Tzahi Bakal','315730176','1','double bond and triple bond','both single bond','both triple bond','both double done'),('010','02','02010','What do you prefer:\nComputer science or lawn mowing ?','Tzahi Bakal','315730176','2','Computer Science','Lawn Mowing','Neither','Both'),('011','01','01011','123456789 + 987654321 = ?','Tzahi Bakal','315730176','1','1111111110','347','135000000004','24'),('012','01','01012','What is the derivative of the function f(x) = x^2?','Tzahi Bakal','315730176','4','f\'(x) = sqrt(33)','0','f\'(x) = 11x','f\'(x) = 2x'),('013','01','01013','Is math good?	','Daniel Armaganian','209146943','4','YES!','NO!','Maybe?','Lawn Mowing is better'),('014','06','06014','What is the main objective of a control system?','Daniel Armaganian','209146943','3','To amplify the signal','To measure the input','To regulate the output','To store energy'),('015','06','06015','What is the transfer function of a control system?','Daniel Armaganian','209146943','2','The ratio of output to input','The mathematical model of the system','The time delay of the system','The control action applied to the system'),('016','06','06016','Which type of control system maintains a constant output in the presence of disturbances?','Daniel Armaganian','209146943','2','Open-loop control system',' Closed-loop control system','Feedback control system','Feedforward control system'),('017','06','06017','What is the unit of measurement for the stability of a control system?','Daniel Armaganian','209146943','4',' Decibel (dB)','Hertz (Hz)','Ohm (Î©)','No unit'),('018','06','06018','Which control system parameter determines the response speed of the system?','Daniel Armaganian','209146943','2','Gain','Time constant','Damping ratio','Bandwidth'),('019','05','05019','What is the primary function of the respiratory system?','Noa Kirel','333444555','4','Pumping blood throughout the body','Regulating body temperature','Producing hormones','Facilitating gas exchange'),('020','05','05020','What is the purpose of red blood cells in the human body?','Noa Kirel','333444555','1','Carrying oxygen to body tissues','Fighting off infections','Breaking down food particles','Regulating body temperature'),('021','05','05021','Which of the following is a long bone in the human body?','Noa Kirel','333444555','3','Skull','Rib','Femur','Vertebra'),('022','05','05022','Which organ is responsible for filtering waste products from the blood?','Noa Kirel','333444555','1','Kidney','Liver','Stomach','Pancreas'),('023','05','05023','What is the purpose of the lymphatic system in the human body?','Noa Kirel','333444555','4','Pumping blood throughout the body','Regulating body temperature','Carrying nutrients to body cells','Defending against infections and diseases'),('024','05','05024','Which of the following is a function of the skeletal system?','Noa Kirel','333444555','3','Producing hormones','Facilitating digestion','Providing support and protection for the body','Regulating blood pressure'),('025','01','01025','Which operation is used to find the inverse of a matrix?','Noa Kirel','333444555','4','Addition','Subtraction','Multiplication','Inversion'),('026','01','01026','What is the degree of the zero polynomial?','Noa Kirel','333444555','4','0','1','2','It has no degree (undefined)'),('027','01','01027','Which property states that the order of numbers can be changed when adding or multiplying?','Noa Kirel','333444555','2','Associative property','Commutative property','Distributive property','Identity property'),('028','01','01028','What is the value of 4x + 3y when \nx=2 and y=5?','Noa Kirel','333444555','3','20','23','28','32'),('029','01','01029','Which of the following is a quadratic equation?','Noa Kirel','333444555','2','2x +3 =7','x^2 +3x+2=0','3x-2=5x+1','4x-6=10x'),('030','05','05030','Which of the following is responsible for pumping \nblood throughout the body?','Roni Aloni','135791113','3','Lungs','Liver','Heart','Kidneys'),('031','05','05031','Which organ system is responsible for providing \nsupport, protection, and movement in the human body?','Roni Aloni','135791113','4','Nervous system','Endocrine system','Muscular system','Skeletal system'),('032','05','05032','Which of the following is a part of the central\nnervous system?','Roni Aloni','135791113','1','Spinal cord','Spleen','Adrenal gland','Gallbladder'),('033','05','05033','What is the function of the gallbladder in the\ndigestive system?','Roni Aloni','135791113','2','Producing bile','Storing and concentrating bile','Breaking down carbohydrates','Absorbing water and electrolytes'),('034','05','05034','Which organ is responsible for producing insulin \nin the endocrine system?','Roni Aloni','135791113','3','Thyroid gland','Adrenal gland','Pancreas','Pituitary gland'),('035','05','05035','What is the function of the red bone marrow \nin the skeletal system?\n','Roni Aloni','135791113','1','Producing red and white blood cells','Storing minerals such as calcium','Supporting and protecting organs','Facilitating muscle contraction'),('036','05','05036','Which of the following is responsible for producing \nurine in the human body?','Roni Aloni','135791113','3','Liver','Lungs','Kidneys','Stomach'),('037','05','05037','Which organ is responsible for detoxifying harmful \nsubstances in the human body?','Roni Aloni','135791113','3','Pancreas','Spleen','Liver','Gallbladder'),('038','05','05038','What is the function of the small intestine in the \ndigestive system?','Roni Aloni','135791113','1','Absorbing nutrients from food','Storing bile',' Producing enzymes for digestion','Filtering waste products'),('039','05','05039','What is the primary function of the pancreas in the \ndigestive system?\n','Roni Aloni','135791113','2','Producing bile','Regulating blood sugar levels','Breaking down proteins','Absorbing nutrients'),('040','05','05040','Which organ system is responsible for providing \nsupport, protection, and movement in\nthe human body?','Roni Aloni','135791113','4','Nervous system','Endocrine system','Muscular system','Skeletal system'),('041','05','05041','Which part of the brain is responsible for \nregulating balance and coordination?','Tzahi Bakal','315730176','2','Cerebrum','Cerebellum',' Medulla oblongata','Hypothalamus'),('042','05','05042','Which organ is responsible for producing and\nsecreting bile in the digestive system?','Tzahi Bakal','315730176','1','Liver','Pancreas','Stomach','Small intestine'),('043','05','05043','What is the function of the red blood cells\nin the circulatory system?','Tzahi Bakal','315730176','2','Fighting off infections','Carrying oxygen to body tissues','Breaking down food particles','Regulating body temperature'),('044','05','05044','What is the purpose of the mitral valve in the heart?','Tzahi Bakal','315730176','2','Regulating blood sugar levels','Preventing blood from flowing back into the left atrium','Pumping oxygenated blood to the body','Facilitating gas exchange');
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
INSERT INTO `question_course` VALUES ('01001','01'),('01003','01'),('01011','01'),('01013','01'),('01025','01'),('01026','01'),('01027','01'),('01028','01'),('01029','01'),('01003','02'),('01005','02'),('01011','02'),('01013','02'),('02002','03'),('02010','03'),('02006','04'),('02007','04'),('02010','04'),('02004','05'),('02010','05'),('04008','07'),('04009','07'),('01012','08'),('01013','08'),('06014','13'),('06015','13'),('06016','13'),('06017','13'),('06018','13'),('05019','14'),('05020','14'),('05021','14'),('05022','14'),('05023','14'),('05024','14'),('05030','14'),('05031','14'),('05032','14'),('05033','14'),('05034','14'),('05035','14'),('05036','14'),('05037','14'),('05038','14'),('05039','14'),('05040','14'),('05041','14'),('05042','14'),('05043','14'),('05044','14');
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
  `uploaded_exam_file` longblob,
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
INSERT INTO `student_exam` VALUES ('010101','068798452',100,'1','','fine','1',NULL),('010101','159753684',0,'','1#2','fine','1',NULL),('010101','252525252',0,'','1#1','too bad','1',NULL),('010101','500000000',100,'1','','fine','1',NULL),('010104','068798452',45,'1,2','3#3','fine','1',NULL),('010104','159753684',100,'1,2,3','','fine','1',NULL),('010104','252525252',45,'1,2','3#2','ok','1',NULL),('010104','500000000',45,'1,2','3#3','fine','1',NULL),('010106','068798452',94,'01001,01003,01011','01013#2',NULL,'0',NULL),('010106','123456789',39,'01001,01013','01003#3,01011#4',NULL,'0',NULL),('010205','068798452',66,'1,2','3#3','fine','1',NULL),('010205','159753684',67,'1,3','2#3','fine','1',NULL),('010205','252525252',100,'1,2,3',NULL,'great','1',NULL),('010205','500000000',67,'2,3','1#3','fine','1',NULL),('020502','068798452',100,'02004','',NULL,'0',NULL),('020502','123456789',0,'','02004#','too bad','1',NULL),('061309','159753684',0,NULL,'06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL),('061309','252525252',0,'','06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL),('061309','500000000',0,'','06014#1,06015#1,06016#1,06017#1,06018#1',NULL,'0',NULL);
/*!40000 ALTER TABLE `student_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_manual_exam`
--

DROP TABLE IF EXISTS `student_manual_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_manual_exam` (
  `exam_id` varchar(7) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `uploaded_file` longblob,
  PRIMARY KEY (`exam_id`,`student_id`),
  KEY `student_manual_exam_student_id_idx` (`student_id`),
  KEY `student_manual_exam_exam_id_idx` (`exam_id`),
  CONSTRAINT `student_manual_exam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `student_manual_exam_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_manual_exam`
--

LOCK TABLES `student_manual_exam` WRITE;
/*!40000 ALTER TABLE `student_manual_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_manual_exam` ENABLE KEYS */;
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
  `head_department_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject_id`,`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('01','Mathematics','319003935'),('02','Computer Science','319003935'),('03','Physics',NULL),('04','Chemistry',NULL),('05','Biology',NULL),('06','Electricity','319003935');
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
INSERT INTO `users` VALUES ('023456781','Yehuda','Levi','yehuda@gmail.com','yehuda','123456','student',0),('068798452','Yana','nana','yana@gmail.com','yana','123456','student',0),('078543399','Yarden','Vizel','yarden@gmail.com','yarden','123456','student',0),('087452683','Bar','Zomer','bar@gmail.com','bar','123456','student',0),('123456789','Almog','Kadosh','almog@gmai.com','almog','123456','student',0),('135791113','Roni','Aloni','roni@gmail.com','roni','123456','professor',0),('147852369','Barak','Obama','obarak@gmail.com','barak','123456','student',0),('159753684','Dana','Cohen','dana@gmail.com','dana','123456','student',0),('209146943','Daniel','Armaganian','daniarmag@gmail.com','daniel','123456','professor',0),('222233334','Aviv','Peretz','aviv@gmail.com','aviv','123456','student',0),('224466880','Shira','Oren','shira@gmail.com','shira','123456','head',0),('245890666','Omer','Adam','omer@gmail.com','omer','123456','student',0),('246810121','Alon','Ahron','alon@gmail.com','alon','123456','professor',0),('252525252','randa','rousi','r@gmail.com','randa','123456','student',0),('315730176','Tzahi','Bakal','tzahi.bakal@gmail.com','tzahi','123456','professor',0),('319003935','Matan','Czuckermann','cz.matan@gmail.com','matan','123456','head',0),('320126999','Idan','Raichel','idan@gmail.com','idan','123456','student',0),('321455555','Yossi','Adi','yossi@gmail.com','yossi','123456','head',0),('323232323','Ron','Gabay','ron@gmail.com','ron','123456','student',0),('326789112','Bill','Gates','bill@gmail.com','bill','123456','student',0),('333444555','Noa','Kirel','noa@gmail.com','noa','123456','professor',0),('342255667','Gili','Bili','gili@gmail.com','gili','123456','student',0),('345678912','Maya','Zamir','maya@gmail.com','maya','123456','student',0),('398765432','Ben','Ashor','ben@gmail.com','ben','123456','head',0),('432456432','Anna','Zak','anna@gmal.com','anna','123456','student',0),('500000000','Guy','Edri','guy@gmail.com','guy','123456','student',0),('654322889','Yael','Shalbia','yael@gmail.com','yael','123456','student',0);
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

-- Dump completed on 2023-06-15 18:42:08
