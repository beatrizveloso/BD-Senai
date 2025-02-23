USE cdsenaiqualifica;

/*Trigger
Sub-rotina gerada automaticamente em conjunto com comandos DML(INSERT/UPDATE/DELETE). O gatilho/disparo 
é acionado quando for executada todas queries (INSERT/UPDATE/DELETE) em que a trigger estiver associada

DELIMITER //
	CREATE TRIGGER tr_insereMusica
    BEFORE INSERT/UPDATE/DELETE ON musica
    FOR EACH ROW
    BEGIN
		INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
        VALUES(CURRENT_USER() 'exclui','cadastrou','alterou,'dbo.musica', NOW(), OLD.idMusica
	END;
//
DELIMITER

Criar a tabela auditoria 

ATRIBUTO / TIPO_DADO    / DESCRIÇÃO
usuario  / VARCHAR(100) / usuário ativo
acao     / VARCHAR(50)  / 'CADASTROU', 'ALTEROU', 'EXCLUIU'
tabela   / VARCHAR(25)  / nome tabela que está associada
data     / DATETIME     / data de alteração
codigo   / INT          / idPK => da tabela

criar a tabela auditoria
3 triggers uma pra cada funcionalidade

Desafios:
1) Criar o fluxo completo p/ auditoria do BD_CD
2)  Apresentar o relatório (SELECT) dos dados coletados
*/

CREATE TABLE auditoria(
idAuditoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(100) NOT NULL,
acao  VARCHAR(50) NOT NULL,
tabela  VARCHAR(25) NOT NULL,
data DATETIME NOT NULL,
codigo INT NOT NULL
);

SELECT *
FROM auditoria;

DELIMITER //
CREATE TRIGGER tr_auditaMusicaInsere
BEFORE INSERT ON musica
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
	VALUES(CURRENT_USER(), 'cadastra','dbo.musica', NOW(), NEW.idMusica);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_auditaMusicaUpdate
BEFORE UPDATE ON musica
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
	VALUES(CURRENT_USER(), 'alterou','dbo.musica', NOW(), OLD.idMusica);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_auditaMusicaDelete
BEFORE DELETE ON musica
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
	VALUES(CURRENT_USER(), 'exclui','dbo.musica', NOW(), OLD.idMusica);
END //
DELIMITER ;

DROP TRIGGER IF EXISTS tr_auditaMusicaUpdate; 

DELIMITER // 
CREATE PROCEDURE sp_insereMusica (IN cod INT, IN nome VARCHAR(50), IN tempo DECIMAL(4,2))
BEGIN 
	INSERT INTO musica (idMusica, nmMusica, duracao) 
    VALUES (cod, nome, tempo); 
END // 
DELIMITER ;

CALL sp_insereMusica(36, 'Hino Nacional Brasileiro', 09.10);
CALL sp_insereMusica(37, 'Aquarela', 04.14);
CALL sp_insereMusica(38, 'Lisboa (part. Lenine)', 03.42);
CALL sp_insereMusica(39, 'Salmo 91', 10.00);
CALL sp_insereMusica(40, 'Velha Infância', 04.10);

CALL sp_alteraMusica(36, 'Oceano', 04.43);
CALL sp_alteraMusica(37, 'Trem-Bala', 03.00);
CALL sp_alteraMusica(38, 'Construção', 06.23);
CALL sp_alteraMusica(39, 'A Banda', 07.01);
CALL sp_alteraMusica(40, 'Apesar de Você', 03.55);

CALL sp_excluiMusica(36);
CALL sp_excluiMusica(37);
CALL sp_excluiMusica(38);
CALL sp_excluiMusica(39);
CALL sp_excluiMusica(40);

SELECT *
FROM musica;

DELIMITER //
CREATE PROCEDURE sp_excluiMusica(IN cod INT)
BEGIN
	DELETE FROM musica
	WHERE idMusica = cod;
END //
DELIMITER ;



/*CD*/
DELIMITER //
CREATE TRIGGER tr_auditaCDInsere
BEFORE INSERT ON cd
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
	VALUES(CURRENT_USER(), 'cadastra','dbo.CD', NOW(), NEW.idCD);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_auditaCDUpdate
BEFORE UPDATE ON cd
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
	VALUES(CURRENT_USER(), 'alterou','dbo.CD', NOW(), OLD.idCD);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_auditaCDDelete
BEFORE DELETE ON cd
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (usuario, acao, tabela, data, codigo)
	VALUES(CURRENT_USER(), 'exclui','dbo.CD', NOW(), OLD.idCD);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_excluiCD(IN cod INT)
BEGIN
	DELETE FROM cd
	WHERE idCD = cod;
END //
DELIMITER ;


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

CALL sp_insereCD(11, 'Amoroso', 3, 180.00, '1977-01-01', 11);
CALL sp_insereCD(12, 'Lóki?', 5, 45.00, '1974-01-01', 12);
CALL sp_insereCD(13, 'Acabou Chorare', 1, 53.90, '1972-01-01', 13);
CALL sp_insereCD(14, 'Carlos, Erasmo', 2, 195.00, '1971-01-01', 14);
CALL sp_insereCD(15, 'Fruto Proibido', 3, 260.00, '1975-04-01', 15);

CALL sp_alteraCD(11, 'Nervos de Aço', 4, 180.00, '1973-09-01', 11);
CALL sp_alteraCD(12, 'Secos & Molhados', 3, 40.00, '1973-08-01', 12);
CALL sp_alteraCD(13, 'Expresso 2222', 2, 360.00, '1972-01-01', 13);
CALL sp_alteraCD(14, 'Cabeça Dinossauro', 1, 110.00, '1977-02-05', 14);
CALL sp_alteraCD(15, 'Falso Brilhante', 1, 239.00, '1976-01-01', 15);

CALL sp_excluiCD(11);
CALL sp_excluiCD(12);
CALL sp_excluiCD(13);
CALL sp_excluiCD(14);
CALL sp_excluiCD(15);


/*Gravadora*/
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

/- sp_alteraGravadora/
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

DELIMITER //
CREATE PROCEDURE sp_excluiGravadora(IN cod INT)
BEGIN
	DELETE FROM gravadora
	WHERE idGravadora = cod;
END //
DELIMITER ;

CALL sp_alteraGravadora(9, 'Saravá Discos');
CALL sp_alteraGravadora(10, 'ravá Discos');
CALL sp_alteraGravadora(11, 'Saavá Discos');
CALL sp_alteraGravadora(12, 'Savá Discos');
CALL sp_alteraGravadora(13, 'Sará Discos');


CALL sp_insereGravadora(9, 'Saravá Discos', 1193781381);
CALL sp_insereGravadora(10, 'Saravá Discosos', 1193481381);
CALL sp_insereGravadora(11, 'Saravá Discosas', 1193281381);
CALL sp_insereGravadora(12, 'Saravá Discosacao', 1193781581);
CALL sp_insereGravadora(13, 'Saravá Dis', 1191781381);


CALL sp_excluiGravadora(9);
CALL sp_excluiGravadora(10);
CALL sp_excluiGravadora(11);
CALL sp_excluiGravadora(12);
CALL sp_excluiGravadora(13);

SELECT *
FROM gravadora;

/*autor*/
DELIMITER //
create trigger tr_auditaAutorInsere
before insert on autor
for each row
	begin 
          insert into auditoria (usuario,acao,tabela,data,codigo)
     values(current_user(),'cadastra','dbo.autor', now(), new.idAutor);
end;
//
DELIMITER ;

call tr_auditaAutorInsere (11,'MajorRD');
call sp_insereAutor(12,'kyan');
call sp_insereAutor(13,'Djavan');
call sp_insereAutor(14,'Naldo');
call sp_insereAutor(15,'Caetano Veloso');

call sp_updateAutor(11,'Matue');
call sp_updateAutor(12,'Tim Maia');
call sp_updateAutor(13,'Roberto Carlos');
call sp_updateAutor(14,'BK');
call sp_updateAutor(15,'WIU');

call sp_deleteAutor(11);
call sp_deleteAutor(12);
call sp_deleteAutor(13);
call sp_deleteAutor(14);
call sp_deleteAutor(15);

select *
from autor;

DELIMITER //
create trigger tr_auditaAutorUpdate
before update on autor
for each row
	begin 
          insert into auditoria (usuario,acao,tabela,data,codigo)
     values(current_user(),'altera','dbo.autor', now(), old.idAutor);
end;
//
DELIMITER ;


DELIMITER //
create trigger tr_auditaAutorDelete
before delete on autor
for each row
	begin 
          insert into auditoria (usuario,acao,tabela,data,codigo)
     values(current_user(),'altera','dbo.autor', now(), old.idAutor);
end;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deleteAutor(IN cod INT)
BEGIN
    DELETE FROM autor
    where cod=idAutor ;
END //
DELIMITER ;



/* cdCategoria   */
DELIMITER //
create trigger tr_auditacdCategoriaInsere
before insert on cdcategoria
for each row
	begin 
          insert into auditoria (usuario,acao,tabela,data,codigo)
     values(current_user(),'cadastra','dbo.cdCategoria', now(), new.idCategoria);
end;
//
DELIMITER ;

DELIMITER //
create trigger tr_auditacdCategoriaUpdate
before update on cdcategoria
for each row
	begin 
          insert into auditoria (usuario,acao,tabela,data,codigo)
     values(current_user(),'altera','dbo.cdCategoria', now(), old.idCategoria);
end;
//
DELIMITER ;

drop trigger tr_auditacdCategoriaUpdate;
drop trigger tr_auditacdCategoriaDelete;

DELIMITER //
create trigger tr_auditacdCategoriaDelete
before delete on cdcategoria
for each row
	begin 
          insert into auditoria (usuario,acao,tabela,data,codigo)
     values(current_user(),'altera','dbo.cdcategoria', now(), old.idCategoria);
end;
//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_deletecdCategoria(IN cod INT)
BEGIN
    DELETE FROM cdcategoria
    WHERE cod=idCategoria ;
END //

DELIMITER ;

drop procedure  sp_deletecdCategoria ;

call sp_inserecdCategoria(11,09.99,14.99);
call sp_inserecdCategoria(12,05.00,09.99);
call sp_inserecdCategoria(13,07.99,11.00);
call sp_inserecdCategoria(14,05.99,07.00);
call sp_inserecdCategoria(15,11.99,15.99);

call sp_updatecdCategoria(11,10.99,12.00);
call sp_updatecdCategoria(12,04.99,10.00);
call sp_updatecdCategoria(13,08.00,10.99);
call sp_updatecdCategoria(14,10.99,12.99);
call sp_updatecdCategoria(15,12.99,13.99);

call sp_deletecdCategoria(11); 
call sp_deletecdCategoria(12); 
call sp_deletecdCategoria(13); 
call sp_deletecdCategoria(14); 
call sp_deletecdCategoria(15); 

select *
from cdcategoria;

DELIMITER //

CREATE PROCEDURE sp_deletecategoria(IN idCategoria INT)
BEGIN
    DELETE FROM cdcategoria
    WHERE cod=idCategoria ;
END //

DELIMITER ;

CALL sp_spinserecdCategoria(11,09.99,14.99);
CALL sp_updatecdCategoria(11,10.99,12.00);
CALL sp_deletecdCategoria(11); 



/*Faixa*/
DELIMITER //
CREATE PROCEDURE sp_insereFaixa (IN cod INT,
									
									IN nroFaixa INT)
BEGIN
	INSERT INTO	faixa 
    VALUES (idcd, idmusica, nroFaixa);
END //
DELIMITER ;

/- sp_alteraFaixa(IN parâmetros...)/
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

CREATE PROCEDURE sp_deleteFaixa(IN nroFaixa decimal(3,0))
BEGIN
    DELETE FROM faixa
END //
DELIMITER ;

CALL sp_InsereFaixa(12,35,7);
CALL sp_InsereFaixa(13,34,8);
CALL sp_InsereFaixa(14,33,9);
CALL sp_InsereFaixa(15,32,10);
CALL sp_InsereFaixa(16,31,11);

CALL sp_UpdateFaixa(12,24,5);
CALL sp_UpdateFaixa(11,23,4);
CALL sp_UpdateFaixa(10,22,3);
CALL sp_UpdateFaixa(9,21,2);
CALL sp_UpdateFaixa(8,20,1);

CALL sp_DeleteFaixa(12);
CALL sp_DeleteFaixa(11);
CALL sp_DeleteFaixa(10);
CALL sp_DeleteFaixa(9);
CALL sp_DeleteFaixa(8);

DELIMITER //

CREATE PROCEDURE sp_deleteFaixa(IN nroFaixa decimal(3,0))
BEGIN
    DELETE FROM faixa;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_alteraCD; 
