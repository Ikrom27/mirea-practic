CREATE PROCEDURE DeleteClientBills(IN client_id INT)
BEGIN
  DECLARE bill_id INT;
  
  -- Получить список счетов клиента
  DECLARE cur CURSOR FOR SELECT bill_id FROM bill WHERE client_client_id = client_id;
  
  -- Для каждого счета клиента
  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO bill_id;
    IF bill_id IS NULL THEN
      LEAVE read_loop;
    END IF;

    -- Удалить связанные записи в coffee_order
    DELETE FROM coffee_order WHERE bill_bill_id = bill_id;
    
    -- Удалить счет клиента
    DELETE FROM bill WHERE bill_id = bill_id;
  END LOOP;
  CLOSE cur;
  
END;
