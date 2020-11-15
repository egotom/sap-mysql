USE air_compressor;

DELIMITER $$
DROP PROCEDURE IF EXISTS getFulladdr $$
CREATE PROCEDURE getFulladdr(
    in  addr_id int(11), 
    out p_customerLevel  varchar(10))
BEGIN
    DECLARE creditlim double;

    SELECT creditlimit INTO creditlim
    FROM customers
    WHERE customerNumber = p_customerNumber;

    IF creditlim > 50000 THEN
 SET p_customerLevel = 'PLATINUM';
    ELSEIF (creditlim <= 50000 AND creditlim >= 10000) THEN
        SET p_customerLevel = 'GOLD';
    ELSEIF creditlim < 10000 THEN
        SET p_customerLevel = 'SILVER';
    END IF;

END$$



DELIMITER $$
DROP PROCEDURE IF EXISTS foo $$
CREATE PROCEDURE foo() BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE _aid BIGINT UNSIGNED;
  DECLARE _rid BIGINT UNSIGNED;
  DECLARE cur CURSOR FOR SELECT a.id AS aid, r.id AS rid FROM addr r INNER JOIN addr a ON a.parent_code=r.area_code;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
  OPEN cur;
  testLoop: LOOP
    FETCH cur INTO _aid,_rid;
    IF done THEN
      LEAVE testLoop;
    END IF;
    UPDATE addr SET parent_code=_rid WHERE id =_aid;
  END LOOP testLoop;
  CLOSE cur;
END$$

CALL foo();