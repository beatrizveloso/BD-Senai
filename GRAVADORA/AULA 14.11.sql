USE cdsenaiqualifica;

/*Musica(IN parâmetros...)- sp_insereMusica(IN parâmetros...)
DELIMITER //
CREATE PROCEDURE sp_insereMusica (IN cod INT,
								  IN nome VARCHAR (50),
                                  IN tempo DECIMAL (4,2));*/
                                  
DELIMITER // 
CREATE PROCEDURE sp_insereMusica (IN cod INT, IN nome VARCHAR(50), IN tempo DECIMAL(4,2))
BEGIN 
	INSERT INTO musica (idMusica, nmMusica, duracao) 
    VALUES (cod, nome, tempo); 
END // 
DELIMITER ;
                                  
/*- sp_alteraMusica(IN parâmetros...)*/
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

/*- sp_buscaSemMusica()*/
CREATE PROCEDURE sp_buscaAutoresSemMusica ()
BEGIN
    SELECT a.idAutor, a.nome
    FROM autor a
    LEFT JOIN musicaAutor ma ON a.idAutor = ma.idAutor
    LEFT JOIN musica m ON m.idMusica = ma.idMusica
    WHERE ma.idMusica IS NULL
    AND a.nome IN ('Tim Maia', 'Marisa Monte', 'Cazuza')
END //

DELIMITER ;

SELECT m.*
	FROM autor m LEFT JOIN musicaAutor ma
    ON m.idAutor = ma.idAutor
    WHERE ma.idAutor IS NULL;

/*CD(IN parâmetros...)
- sp_insereCD(IN parâmetros...)*/         
DELIMITER //
CREATE PROCEDURE sp_insereCD (IN cod INT,
							IN nome VARCHAR (50),
							IN idGravadora INT,
                            IN precoVenda DECIMAL (6,2),
                            IN dtLancto DATE,
                            IN cdIndicado INT)
BEGIN
	INSERT INTO	cd (idCD, nmCD, idGravadora, precoVenda, dtLancto, cdIndicado)
    VALUES (cod, nome, idGravadora, precoVenda, dtLancto, cdIndicado);
END //
DELIMITER ;

CALL sp_insereCD (11, 7,'Caetano Veloso', 49.90, '1968-01-02', 11);
CALL sp_insereCD (12, 4, 'Elis & Tom', 250.00, '1974-03-03', 12);
CALL sp_insereCD (13, 1, 'Dois', 380.00, '1986-07-28', 13);
CALL sp_buscaCD(11);
CALL sp_buscaCD(12);
CALL sp_buscaCD(13);

SELECT *
FROM cd;

/*- sp_alteraCD*/
/UPDATE/
DELIMITER //
CREATE PROCEDURE sp_alteraCD (IN idCD INT,
							IN nmCD VARCHAR (50),
                            IN idGravadora INT,
                            IN precoVenda DECIMAL (6,2),
                            IN dtLancto DATE,
							IN cdIndicado INT)
BEGIN
	UPDATE cd
    SET nmCD = nome, duracao = tempo
    WHERE idCD = cod;
END //
DELIMITER ;

/*(IN parâmetros...)
- sp_buscaCD(IN parâmetros..)*/
/SELECT/
DELIMITER //
CREATE PROCEDURE sp_buscaCD (IN cod INT)
BEGIN
	SELECT*
	FROM cd
    WHERE idCD = cod;
END //
DELIMITER;

/*- sp_buscaSemCD()*/
DELIMITER //
CREATE PROCEDURE sp_buscaSemCD()
BEGIN
	SELECT cd.idCD,cd.nmCD
	FROM cd LEFT JOIN faixa 
    ON cd.idCD = faixa=idCD
    WHERE faixa.idCD IS NULL;
END//
DELIMITER;

/*Gravadora(IN parâmetros...)
- sp_insereGravadora(IN parâmetros...)*/
DELIMITER //
CREATE PROCEDURE sp_insereGravadora (IN cod INT,
									IN nome VARCHAR (50),
									IN endereco VARCHAR (100),
									IN telefone NUMERIC (11),
									IN contatoDireto NUMERIC (11),
									IN eMail VARCHAR (100))
BEGIN
	INSERT INTO	cd (idGravadora, nmGravadora, endereco, telefone, contatoDireto, eMail)
    VALUES (cod, nome, endereco, telefone, contatoDireto, eMail);
END //
DELIMITER ;

SELECT*
FROM gravadora;
/*- sp_alteraGravadora*/
/UPDATE/
DELIMITER //
CREATE PROCEDURE sp_alteraGravadora (IN cod INT,
									IN nome VARCHAR (50),
									IN endereco VARCHAR (100),
									IN telefone NUMERIC (11),
									IN contatoDireto NUMERIC (11),
									IN eMail VARCHAR (100))
BEGIN
     UPDATE gravadora
     SET cod=idGravadora
     WHERE idGravadora;
END//
DELIMITER ;  

/*(IN parâmetros..)
- sp_buscaGravadora(IN parâmetros...)
- sp_buscaSemGravadora()

Autor(IN parâmetros...)*/

- sp_insereAutor(IN parâmetros...)
DELIMITER //
CREATE PROCEDURE sp_insereGravadora (IN cod INT,
									IN nome VARCHAR (50))
BEGIN
	INSERT INTO	cd (idAutor, nmAutor)
    VALUES (cod, nome);
END //
DELIMITER ;

- sp_alteraAutor (IN parâmetros..)*/
/UPDATE/
DELIMITER //
CREATE PROCEDURE sp_alteraAutor (IN cod INT,
								  IN nome VARCHAR (50))
BEGIN
	UPDATE autor 
    SET nmAutor = cod, nome = infos
    WHERE idAutor = cod;
END //
DELIMITER ;

/*- sp_buscaAutor(IN parâmetros..)*/
/SELECT/
DELIMITER //
CREATE PROCEDURE sp_buscaAutor (IN cod INT)
BEGIN
	SELECT*
	FROM autor 
    WHERE idAutor = cod;
END //
DELIMITER ;

/*- sp_buscaSemAutor()
FAIXA(IN parâmetros...)
- sp_insereFaixa(IN parâmetros...)*/
DELIMITER //
CREATE PROCEDURE sp_insereFaixa (IN idCD INT,
									IN idMusica INT,
									IN nroFaixa INT)
BEGIN
	INSERT INTO	faixa (idCD, idMusica, nroFaixa)
    VALUES (cod, cod, nroFaixa);
END //
DELIMITER ;

/*- sp_alteraFaixa(IN parâmetros...)*/
/UPDATE/
DELIMITER //
CREATE PROCEDURE sp_alteraFaixa (IN cod INT,
								  IN nome VARCHAR (50),
                                  IN tempo DECIMAL (4,2))
BEGIN
	UPDATE faixa
    SET nroFaixa = nome, duracao = tempo
    WHERE idCD = cod;
END //
DELIMITER ;

/*- sp_buscaFaixa(IN codCD INT)*/
/SELECT/
DELIMITER //
CREATE PROCEDURE sp_buscaFaixa (IN cod INT)
BEGIN
	SELECT*
	FROM faixa
    WHERE idCD = cod;
END //
DELIMITER ;

/*- sp_buscaSemFaixa()*/
DELIMITER //
CREATE PROCEDURE sp_buscaSemFaixa()
BEGIN
	SELECT cd.idCD,cd.nmCD
	FROM cd LEFT JOIN faixa 
    ON cd.idCD = faixa=idCD
    WHERE faixa.idCD IS NULL;
END //
DELIMITER ;

/*buscasemautor - autor sem musica
buscasemmusica - musica sem autor
cd sem musica*/