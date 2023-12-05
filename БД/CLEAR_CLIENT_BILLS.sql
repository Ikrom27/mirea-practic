CREATE DEFINER=`root`@`localhost` PROCEDURE `CLEAR_CLIENT_BILLS`(IN p_client_id INT)
BEGIN
	DELETE FROM coffee_order
    WHERE bill_bill_id IN (SELECT bill_id FROM bill WHERE client_client_id = p_client_id);
    
    DELETE FROM bill WHERE client_client_id = p_client_id;
END