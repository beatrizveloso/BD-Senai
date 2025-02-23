USE cdsenaiqualifica;

/*Musica(IN parâmetros...)- sp_insereMusica(IN parâmetros...)*/
DELIMITER //
CREATE PROCEDURE sp_insereMusica (IN cod INT,
								  IN nome VARCHAR (50),
                                  IN tempo DECIMAL (4,2))
BEGIN
	INSERT INTO	musica (idMusica, nmMusica, duracao)
    VALUES (cod, nome, tempo);
END //
DELIMITER ;

/*- sp_alteraMusica(IN parâmetros...)*/
/UPDATE/
DELIMITER //
CREATE PROCEDURE sp_alteraMusica (IN cod INT,
								  IN nome VARCHAR (50),
                                  IN tempo DECIMAL (4,2))
BEGIN
	UPDATE musica 
    SET nmMusica = nome, duracao = tempo
    WHERE idMusica = cod;
END //
DELIMITER ;

/*- sp_buscaMusica(IN parâmetros...)*/
/SELECT/
DELIMITER //
CREATE PROCEDURE sp_buscaMusica (IN cod INT)
BEGIN
	SELECT*
	FROM musica 
    WHERE idMusica = cod;
END //
DELIMITER ;

/*- sp_buscaSemMusica()*/
/SELECT COM JOIN/
DELIMITER //
CREATE PROCEDURE sp_buscaSemMusica ()
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
    SET nmCD = precoVenda , dtLancto = dadosCD
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
CREATE PROCEDURE sp_alteraGravadora (IN idGravadora INT,
									IN nmGravadora VARCHAR (50),
									IN endereco VARCHAR (100),
									IN telefone NUMERIC (11),
									IN contatoDireto NUMERIC (11),
									IN eMail VARCHAR (100))
BEGIN
	UPDATE gravadora
    SET contatoDireto = telefone, eMail = contatoGravadora
    WHERE idGravadora = cod;
END //
DELIMITER ;

/*- sp_buscaGravadora(IN parâmetros...)*/
/SELECT/
DELIMITER //
CREATE PROCEDURE sp_buscaGravadora (IN cod INT)
BEGIN
	SELECT*
	FROM gravadora
    WHERE idGravadora = cod;
END //
DELIMITER ;

/*- sp_buscaSemGravadora()*/
DELIMITER //
CREATE PROCEDURE sp_buscaSemGravadora()
BEGIN
	SELECT gravadora.idGravadora, gravadora.nmGravadora
	FROM gravadora LEFT JOIN cd 
    ON gravadora.idGravadora = cd.idGravadora
    WHERE cd.idGravadora IS NULL;
END //
DELIMITER ;

/*Autor(IN parâmetros...)
- sp_insereAutor(IN parâmetros...)*/
DELIMITER //
CREATE PROCEDURE sp_insereGravadora (IN cod INT,
									IN nome VARCHAR (50))
BEGIN
	INSERT INTO	cd (idAutor, nmAutor)
    VALUES (cod, nome);
END //
DELIMITER ;

/*- sp_alteraAutor (IN parâmetros..)*/
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

/*- sp_buscaSemAutor()*/
DELIMITER //
CREATE PROCEDURE sp_buscaSemAutor()
BEGIN
	SELECT autor.idAutor, autor.nmAutor
	FROM autor LEFT JOIN cd 
    ON autor.idAutor = cd.idAutor
    WHERE cd.idAutor IS NULL;
END //
DELIMITER ;


/*- sp_insereFaixa(IN parâmetros...)*/
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
CREATE PROCEDURE sp_alteraMusica (IN cod INT,
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
	SELECT faixa.idFaixa, faixa.nmFaixa
	FROM faixa LEFT JOIN cd 
    ON faixa.idCD = cd.idCD
    WHERE cd.idCD IS NULL;
END //
DELIMITER ;

/*buscasemautor - autor sem musica
buscasemmusica - musica sem autor
cd sem musica*/