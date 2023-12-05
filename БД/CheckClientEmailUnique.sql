CREATE DEFINER=`root`@`localhost` TRIGGER `CheckClientEmailUnique` BEFORE INSERT ON `client` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM client WHERE mail = NEW.mail) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email уже существует';
    END IF;
END