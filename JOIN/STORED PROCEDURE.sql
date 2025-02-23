use cdsenaiqualifica;
/*Stored Procedure: subrotina trata de comando que irão
otimizar o funcionamento do banco
CREATE PROCEDURE sp_nome (INT variavel, INT var OUTPUT) AS
sentença
--onde na sentença pode-se:
declarar variáveis
DECLARE variavel INT
--Para estrutura de decisão:
IF...IF/ELSE... IF/ELSE IF/ELSE...
Caso haja mais de uma instrução: 
BEGIN... END
--Looping:
WHILE
--Atribuir valores constantes ou realizar cálculos
SET
--Comando de saída:
SELECT()
*/
DELIMITER //
CREATE PROCEDURE sp_saudacao() 
BEGIN
	DECLARE msg VARCHAR(20);
	SET msg = 'Hello world';
	SELECT msg;
END //
DELIMITER ;

call sp_saudacao();

DROP PROCEDURE IF exists sp_saudacao;

DELIMITER //
CREATE PROCEDURE sp_soma()
BEGIN
	DECLARE n1 INT;
    DECLARE n2 INT;
    DECLARE res INT;
    SET n1 = 49;
    SET n2 = 7;
    SET res := n1 + n2;
    SELECT res;
END //
DELIMITER ;
/*passagem de parâmetros de entrada*/
CALL sp_soma();

DROP PROCEDURE IF exists sp_soma;
DELIMITER //
CREATE PROCEDURE sp_soma(IN n1 INT, n2 INT)
BEGIN
	DECLARE res INT;
    SET res = n1 + n2;
    SELECT res;
END //
DELIMITER ;

CALL sp_soma(11,75);

DROP PROCEDURE IF exists sp_soma;
DELIMITER //
CREATE PROCEDURE sp_soma(IN n1 INT, n2 INT, OUT res INT)
BEGIN
	SET res := n1 + n2;
END //
DELIMITER ;

SET @res = 0;
CALL sp_soma(12,11,@res);
SELECT @res;

/*MANIPULAÇÃO DE DADOS COM PROCEDURES
VAMOS INSERIR DADOS:
*/
DELIMITER //
CREATE PROCEDURE sp_insereMusica (IN cod INT, 
								  IN nome VARCHAR(50), 
								  IN tempo DECIMAL(4,2))
BEGIN
	INSERT INTO  musica (idMusica, nmMusica, duracao)
	VALUES (cod, nome, tempo);
END //
DELIMITER ;

/*update*/
DELIMITER //
CREATE PROCEDURE sp_alteraMusica (IN cod INT, 
								  IN nome VARCHAR(50), 
								  IN tempo DECIMAL(4,2))
BEGIN
	UPDATE musica 
    SET nmMusica = nome, duracao = tempo
	WHERE idMusica = cod;
END //
DELIMITER ;
/*select*/
DELIMITER //
CREATE PROCEDURE sp_buscaMusica (IN cod INT)
BEGIN
	SELECT *
    FROM musica 
    WHERE idMusica = cod;
END //
DELIMITER ;

CALL sp_insereMusica(34, 'La La La La La', 02.34);
CALL sp_insereMusica(35, '333', 05.20);
CALL sp_insereMusica(36, '400K', 02.41);
CALL sp_buscaMusica(34);
CALL sp_buscaMusica(35);
CALL sp_buscaMusica(36);

CALL sp_alteraMusica(35, '333', 05.20);

/*select com join*/
DELIMITER //
CREATE PROCEDURE sp_buscaMusicaSemAutor ()
BEGIN
	SELECT m.*
    FROM musica m LEFT JOIN musicaAutor ma
    ON m.idMusica = ma.idMusica
    WHERE ma.idAutor IS NULL;
END //
DELIMITER ;

SELECT m.*
FROM musica m LEFT JOIN musicaAutor ma
ON m.idMusica = ma.idMusica
WHERE ma.idAutor IS NULL;