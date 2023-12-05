CREATE DEFINER=`root`@`localhost` TRIGGER `EncryptClientPasswordBeforeInsert` BEFORE INSERT ON `client` FOR EACH ROW BEGIN
    SET NEW.password = CONCAT('$2a$', 12, '$', SHA2(NEW.password, 512));
END