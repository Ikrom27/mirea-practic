CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULATE_TOTAL`(p_bill_id INT) RETURNS double
    DETERMINISTIC
BEGIN
    DECLARE total_amount DOUBLE;
    SELECT SUM(price * count) INTO total_amount
    FROM coffee_order
    WHERE bill_bill_id = p_bill_id;
    RETURN total_amount;
END