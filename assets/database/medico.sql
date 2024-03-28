-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: medico
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `date` datetime NOT NULL,
  `departmentId` int NOT NULL,
  `doctorsId` int NOT NULL,
  `message` varchar(450) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departmentid_idx` (`departmentId`),
  KEY `doctorsId_idx` (`doctorsId`),
  KEY `uId_idx` (`userId`),
  CONSTRAINT `departmentid` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `doctorsId` FOREIGN KEY (`doctorsId`) REFERENCES `doctors` (`id`),
  CONSTRAINT `uId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (7,3,'2024-03-26 17:54:00',2,1,'none','Rejected'),(8,6,'2024-03-12 14:32:00',3,1,'hi there','Accepted');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `message` varchar(1000) NOT NULL,
  `subject` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userf_idx` (`userid`),
  CONSTRAINT `userf` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,3,'h','main'),(2,3,'srtyuio','yo'),(3,3,'marcia grifiths','babyloan'),(4,3,'gods love is alway sufficient','Gods love');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `image` varchar(200) NOT NULL,
  `sammary` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Cardiology','Cardiology is a medical specialty that deals with the study, diagnosis, and treatment of diseases and disorders of the heart and circulatory system. Cardiologists are trained to diagnose and manage conditions such as coronary artery disease, heart failure, arrhythmias, congenital heart defects, and valvular heart disease. They use various diagnostic tools, including electrocardiography (ECG or EKG), echocardiography, stress tests, and cardiac catheterization, to assess heart function and identify abnormalities. Treatment options range from lifestyle modifications and medications to interventional procedures such as angioplasty and coronary artery bypass grafting (CABG). Preventive cardiology also plays a crucial role, focusing on risk factor management to prevent the development or progression of cardiovascular diseases. Cardiology encompasses a broad spectrum of care, from routine screenings and management of common conditions to complex interventions and specialized care for patients with advanced cardiovascular disease.','departments-1.jpg','Cardiology focuses on the diagnosis, treatment, and prevention of diseases and disorders of the heart and circulatory system.'),(2,'Neurology','Neurology is a branch of medicine that specializes in the study, diagnosis, and treatment of disorders affecting the nervous system, including the brain, spinal cord, nerves, and muscles. Neurologists are trained to evaluate and manage a wide range of conditions, such as epilepsy, stroke, multiple sclerosis, Parkinson\'s disease, Alzheimer\'s disease, neuropathies, and neuromuscular disorders. They employ various diagnostic techniques, including neurological examinations, imaging studies (such as MRI and CT scans), electrophysiological tests (such as EEG and nerve conduction studies), and lumbar puncture, to assess the structure and function of the nervous system. Treatment approaches may include medication management, rehabilitative therapies, surgical interventions, and lifestyle modifications tailored to each patient\'s specific condition and needs. Neurology is a rapidly evolving field with ongoing research and advancements in understanding the complexities of the nervous system and developing novel treatments to improve patient outcomes and quality of life.','departments-2.jpg','Neurology deals with the diagnosis and treatment of disorders affecting the brain, spinal cord, nerves, and muscles.'),(3,'Hepatology',' Hepatology is a specialized field of medicine dedicated to the study, diagnosis, treatment, and prevention of disorders affecting the liver, gallbladder, bile ducts, and pancreas. Hepatologists, who are often gastroenterologists with specialized training in liver diseases, evaluate patients with a wide range of conditions, including viral hepatitis (such as hepatitis B and C), fatty liver disease, cirrhosis, liver cancer, autoimmune liver diseases, gallstones, and pancreatitis. They utilize a variety of diagnostic tools, including blood tests, imaging studies (such as ultrasound, CT scan, and MRI), liver biopsy, and endoscopic procedures (such as ERCP), to assess liver function and identify underlying pathology. ','departments-3.jpg','Hepatology focuses on the diagnosis, management, and prevention of diseases related to the liver, gallbladder, bile ducts, and pancreas.'),(4,'Pediatrics','Pediatrics is a branch of medicine focused on providing comprehensive healthcare to infants, children, and adolescents, from birth through adolescence. Pediatricians are trained to diagnose, treat, and manage a wide range of medical conditions specific to this population, including infectious diseases, developmental disorders, genetic conditions, growth and development concerns, nutritional issues, and behavioral problems.','departments-4.jpg',' Pediatrics specializes in the medical care of infants, children, and adolescents, addressing their physical, emotional, and developmental needs.');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `image` varchar(200) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Walter White','Chief Medical Officer','doctors-1.jpg','walter@gmail.com','walter'),(2,'Sarah Jhonson','Anesthesiologist','doctors-2.jpg','sarah@gmail.com','sarah'),(3,'William Anderson','Cardiology','doctors-3.jpg','william@gmail.com','william'),(4,'Amanda Jepson','Neurosurgeon','doctors-4.jpg','amanda@gmail.com','amanda');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'gallery-1.jpg'),(2,'gallery-2.jpg'),(3,'gallery-3.jpg'),(4,'gallery-4.jpg'),(5,'gallery-5.jpg'),(6,'gallery-6.jpg'),(7,'gallery-7.jpg'),(8,'gallery-8.jpg');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `Amount` varchar(45) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
INSERT INTO `pricing` VALUES (1,'Basic Care Plan','0',' Designed for individuals or families seeking essential medical services. Includes basic consultations, routine check-ups, and common treatments at an affordable price point, suitable for general healthcare needs','Pending'),(2,'Standard Care Plan','19','Ideal for patients requiring additional services and specialist consultations. Offers a broader range of medical procedures, diagnostic tests, and access to specialists, catering to those with moderate healthcare requirements.','Pending'),(3,'Premium Care Plan','29','Tailored for patients with complex medical conditions or high-demand healthcare needs. Provides comprehensive coverage, priority appointments, and advanced treatments, ensuring top-tier medical care and personalized attention.','Pending'),(4,'Corporate Health Plan','49','Customized solutions for businesses or organizations prioritizing employee health and wellness. Includes tailored healthcare packages, occupational health services, and preventive care programs, designed to support the well-being of employees and enhance productivity.','Pending');
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'peter mbio','mbiopeter401@gmail.com','password.',759595268),(4,'Emmanuel Kibet','emmanuel@gmail.com','emmanuel',712345678),(5,'john doe','john@gmail.com','john',759595261),(6,'boaz','boazjuma98@gmail.com','123456',768092028);
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

-- Dump completed on 2024-03-25 13:06:07
