CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_COFFEE_TO_BILL`(IN p_coffee_id INT, IN p_bill_id INT, IN p_client_id INT)
BEGIN
  DECLARE total_price double;
  
  IF p_bill_id = -1 THEN
	INSERT INTO bill (client_client_id, total, date)
    VALUES (p_client_id, 0.0, NOW());
    SET p_bill_id = LAST_INSERT_ID();
  END IF;

  -- Получить цену выбранного кофе
  SELECT price INTO total_price
  FROM coffee
  WHERE coffee_id = p_coffee_id;

  -- Попробовать вставить запись в coffee_order
  INSERT INTO coffee_order (price, coffee_coffee_id, bill_bill_id, count)
  VALUES (total_price, p_coffee_id, p_bill_id, 1)
  ON DUPLICATE KEY UPDATE count = count + 1;

  -- Обновить общую сумму в счете
  UPDATE bill
  SET total = CALCULATE_TOTAL(p_bill_id)
  WHERE bill_id = p_bill_id;
END