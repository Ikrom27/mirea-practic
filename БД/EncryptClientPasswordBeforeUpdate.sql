CREATE DEFINER=`root`@`localhost` TRIGGER `EncryptClientPasswordBeforeUpdate` BEFORE UPDATE ON `client` FOR EACH ROW BEGIN
    SET NEW.password = CONCAT('$2a$', 12, '$', SHA2(NEW.password, 512));
END