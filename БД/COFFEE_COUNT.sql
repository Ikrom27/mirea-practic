CREATE DEFINER=`root`@`localhost` FUNCTION `COFFEE_COUNT`(coffeeId INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE orderCount INT;
    SELECT COUNT(*) INTO orderCount
    FROM coffee_order
    WHERE coffee_coffee_id = coffeeId;
    RETURN orderCount;
END