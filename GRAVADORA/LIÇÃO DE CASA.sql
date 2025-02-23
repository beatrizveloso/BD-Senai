USE cdsenaiqualifica;

/*ONDE:
'+' CALL sp_soma(25,5);*/
DELIMITER //
CREATE PROCEDURE sp_soma (IN n1 INT, n2 INT)
BEGIN
	DECLARE soma INT;
    SET soma = n1 + n2;
    SELECT soma;
END //
DELIMITER ;

CALL sp_soma(25, 5);

/*'-' CALL sp_sub(25,5);*/
DELIMITER //

CREATE PROCEDURE sp_sub (IN n1 INT, IN n2 INT)
BEGIN
    DECLARE sub INT;
    SET sub = n1 - n2;
    SELECT sub AS subtracao;
END //
DELIMITER ;

CALL sp_sub(25, 5);

/*'*' CALL sp_mult(25,5);*/
DELIMITER //

CREATE PROCEDURE sp_mult (IN n1 INT, IN n2 INT)
BEGIN
    DECLARE mult INT;
    SET mult = n1 * n2;
    SELECT mult AS multiplicacao;
END //

DELIMITER ;

CALL sp_mult(25, 5);

/*'/' CALL sp_divi(25,5);*/
DELIMITER //
CREATE PROCEDURE sp_divi (IN n1 INT, IN n2 INT)
BEGIN
    DECLARE divi DECIMAL(10,2); 
    SET divi = n1 / n2;
    SELECT divi AS divisao;  
END //
DELIMITER ;

CALL sp_divi(25, 5);

/*'F' CALL sp_fatorial(25,5);*/
DELIMITER //
CREATE PROCEDURE sp_fatorial (IN n INT)
BEGIN
    DECLARE fatorial INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;

    WHILE i <= n DO
        SET fatorial = fatorial * i;
        SET i = i + 1;
    END WHILE;

    SELECT fatorial AS fatorial;
END //
DELIMITER ;

CALL sp_fatorial(5);

/*'P' CALL sp_primo(25,5);*/
DELIMITER //
CREATE PROCEDURE sp_primo (IN n INT)
BEGIN
    IF (n = 2 or n = 3 or n = 5 or n > 1 AND mod (n,2) AND mod (n,3) AND mod (n,5) != 0) THEN
        SELECT 'Sim' AS primo;
    ELSE
        SELECT 'Não' as primo;
    END IF;
END //
DELIMITER ;

CALL sp_primo(25);
CALL sp_primo(5);

/*'I' CALL sp_imPar(25,5);*/
DELIMITER //

CREATE PROCEDURE sp_imPar (IN n INT)
BEGIN
    IF n % 2 = 0 THEN
        SELECT 'Par' AS resultado;
    ELSE
        SELECT 'Ímpar' AS resultado;
    END IF;
END //

DELIMITER ;

CALL sp_imPar(25);

CALL sp_imPar(5);

/*'M' CALL sp_multiplo(25,5);*/
DELIMITER //

CREATE PROCEDURE sp_multiplo (IN n1 INT, IN n2 INT)
BEGIN
    IF n1 % n2 = 0 THEN
        SELECT n1, 'é múltiplo de', n2 AS resultado;
    ELSE
        SELECT n1, 'não é múltiplo de', n2 AS resultado;
    END IF;
END //

DELIMITER ;

CALL sp_multiplo(25, 5);

/*'B' CALL sp_baskara(25,5);*/
DELIMITER //
CREATE PROCEDURE sp_baskara (IN a DECIMAL(10,2), 
							 IN b DECIMAL(10,2), 
                             IN c DECIMAL(10,2))
BEGIN
    IF (b * b - 4 * a * c) < 0 THEN
        SELECT 'As raízes não existem' AS resultado;
    ELSE
        SELECT 
            (-b + SQRT(b * b - 4 * a * c)) / (2 * a) AS raiz_1,
            (-b - SQRT(b * b - 4 * a * c)) / (2 * a) AS raiz_2;
    END IF;
END //
DELIMITER ;

CALL sp_baskara(25, 5, 2);

/*'A' CALL sp_areaTriangulo(25,5);*/
DELIMITER //

CREATE PROCEDURE sp_areaTriangulo (IN base DECIMAL(10,2), 
								   IN altura DECIMAL(10,2))
BEGIN
    DECLARE area DECIMAL(10,2);
    
    SET area = (base * altura) / 2;
    
    SELECT area AS area_do_triangulo;
END //

DELIMITER ;

CALL sp_areaTriangulo(25, 5);

/*'D' CALL sp_dataNasc(25,5);*/
DELIMITER //

CREATE PROCEDURE sp_dataNasc(IN idade INT, IN mes INT)
BEGIN
    SELECT (YEAR(NOW()) - idade) AS ano, mes AS mes, 25 AS dia;
END //

DELIMITER ;

CALL sp_dataNasc(25, 5);

