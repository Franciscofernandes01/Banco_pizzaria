-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzaria
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `TELEFONE` varchar(20) NOT NULL,
  `ENDERECO` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TELEFONE` (`TELEFONE`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Joao','84997058669','Rua das laranjas'),(11,'Maria','85998674785','Rua das bananeiras');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientes_pedidos`
--

DROP TABLE IF EXISTS `clientes_pedidos`;
/*!50001 DROP VIEW IF EXISTS `clientes_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientes_pedidos` AS SELECT 
 1 AS `Pedido`,
 1 AS `Cliente`,
 1 AS `TELEFONE`,
 1 AS `DATA_PEDIDO`,
 1 AS `STATUS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (4,'calabresa'),(3,'manjericão'),(1,'queijo'),(2,'tomate');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedidos`
--

DROP TABLE IF EXISTS `itens_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedidos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_PEDIDO` int NOT NULL,
  `ID_PIZZA` int NOT NULL,
  `QTD` int DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ID_PEDIDO` (`ID_PEDIDO`),
  KEY `ID_PIZZA` (`ID_PIZZA`),
  CONSTRAINT `itens_pedidos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `itens_pedidos_ibfk_2` FOREIGN KEY (`ID_PIZZA`) REFERENCES `pizzas` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedidos`
--

LOCK TABLES `itens_pedidos` WRITE;
/*!40000 ALTER TABLE `itens_pedidos` DISABLE KEYS */;
INSERT INTO `itens_pedidos` VALUES (5,1,1,2),(6,2,2,1);
/*!40000 ALTER TABLE `itens_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `media_preco`
--

DROP TABLE IF EXISTS `media_preco`;
/*!50001 DROP VIEW IF EXISTS `media_preco`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `media_preco` AS SELECT 
 1 AS `avg(PRECO)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int NOT NULL,
  `DATA_PEDIDO` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pendente','preparando','entregue','cancelado') DEFAULT 'pendente',
  PRIMARY KEY (`ID`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `clientes` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2025-03-15 15:58:29','pendente'),(2,1,'2025-03-15 16:13:30','pendente'),(3,1,'2025-03-15 16:13:39','pendente'),(6,1,'2025-03-15 16:42:50','pendente'),(7,11,'2025-03-15 16:42:50','pendente');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `PRECO` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
INSERT INTO `pizzas` VALUES (1,'Marguerita',40.00),(2,'Calabresa',45.00),(3,'Marguerita',40.00),(4,'Calabresa',45.00),(5,'Marguerita',40.00),(6,'Calabresa',45.00),(7,'Marguerita',40.00),(8,'Calabresa',45.00);
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pizzas_e_ingredientes`
--

DROP TABLE IF EXISTS `pizzas_e_ingredientes`;
/*!50001 DROP VIEW IF EXISTS `pizzas_e_ingredientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pizzas_e_ingredientes` AS SELECT 
 1 AS `ID_PIZZA`,
 1 AS `PIZZA_NOME`,
 1 AS `ID_INGREDIENTE`,
 1 AS `INGREDIENTE_NOME`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pizzas_ingredientes`
--

DROP TABLE IF EXISTS `pizzas_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas_ingredientes` (
  `ID_PIZZA` int NOT NULL,
  `ID_INGREDIENTE` int NOT NULL,
  PRIMARY KEY (`ID_PIZZA`,`ID_INGREDIENTE`),
  KEY `ID_INGREDIENTE` (`ID_INGREDIENTE`),
  CONSTRAINT `pizzas_ingredientes_ibfk_1` FOREIGN KEY (`ID_PIZZA`) REFERENCES `pizzas` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `pizzas_ingredientes_ibfk_2` FOREIGN KEY (`ID_INGREDIENTE`) REFERENCES `ingredientes` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas_ingredientes`
--

LOCK TABLES `pizzas_ingredientes` WRITE;
/*!40000 ALTER TABLE `pizzas_ingredientes` DISABLE KEYS */;
INSERT INTO `pizzas_ingredientes` VALUES (1,1),(2,1),(1,2),(1,3),(2,4);
/*!40000 ALTER TABLE `pizzas_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `clientes_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `clientes_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_pedidos` AS select `pedidos`.`ID` AS `Pedido`,`clientes`.`NOME` AS `Cliente`,`clientes`.`TELEFONE` AS `TELEFONE`,`pedidos`.`DATA_PEDIDO` AS `DATA_PEDIDO`,`pedidos`.`status` AS `STATUS` from (`pedidos` join `clientes` on((`pedidos`.`ID_CLIENTE` = `clientes`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `media_preco`
--

/*!50001 DROP VIEW IF EXISTS `media_preco`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `media_preco` AS select avg(`pizzas`.`PRECO`) AS `avg(PRECO)` from `pizzas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pizzas_e_ingredientes`
--

/*!50001 DROP VIEW IF EXISTS `pizzas_e_ingredientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pizzas_e_ingredientes` AS select `pizzas`.`ID` AS `ID_PIZZA`,`pizzas`.`NOME` AS `PIZZA_NOME`,`ingredientes`.`ID` AS `ID_INGREDIENTE`,`ingredientes`.`NOME` AS `INGREDIENTE_NOME` from ((`pizzas` join `pizzas_ingredientes` on((`pizzas`.`ID` = `pizzas_ingredientes`.`ID_PIZZA`))) join `ingredientes` on((`pizzas_ingredientes`.`ID_INGREDIENTE` = `ingredientes`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 23:17:05
