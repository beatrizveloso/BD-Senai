USE cdsenaiqualifica;
/*Quais os cd's com preço maior que a média?*/
SELECT *
FROM cd
WHERE precoVenda > (SELECT AVG(precoVenda)
								FROM cd);

/*Quais as gravadoras do cd1?*/
SELECT *
FROM gravadora
WHERE idGravadora = (SELECT idGravadora
					FROM cd
                    WHERE idCD = 1);
/*Quais os autores do cd1? DISTINCT é quando tem muitos e pode ter repetidos*/
SELECT DISTINCT * 
FROM autor
WHERE idAutor IN (SELECT idAutor
					FROM musicaAutor
                    WHERE idMusica IN (SELECT idMusica
										FROM musica
                                        WHERE idMusica IN (SELECT idMusica
															FROM faixa
                                                            WHERE idCD = 1)));
/*Quais as musicas do cd 3?*/
SELECT idAutor
FROM musicaAutor
WHERE idMusica IN ( SELECT idMusica
					FROM cd 
                    WHERE idCD = 3); 
/*Quais os autores que tem música gravada?*/
SELECT * 
FROM autor
WHERE idAutor IN (SELECT idAutor
					FROM musicaAutor
                    WHERE idMusica IN (SELECT idMusica
										FROM musica
                                        WHERE idMusica IN(SELECT idMusica
														FROM faixa)));
                                        
/*Quais os cd's que têm música com a palavra "AMOR"*/
SELECT *
FROM cd
WHERE idCD IN (SELECT idCD
				FROM faixa
                WHERE idMusica IN (SELECT idMusica
									FROM musica
                                    WHERE UPPER(nmMusica) LIKE '%AMOR%'));
                                    
/*Quais as gravadoras que não tem cd gravado?*/
SELECT *
FROM gravadora
WHERE idGravadora NOT IN (	SELECT idGravadora
							FROM cd);
/*Quais os autores que não têm música?*/
SELECT * 
FROM autor
WHERE idAutor NOT IN (SELECT idAutor
						FROM musicaAutor);

/*Quais as musicas que têm duração menor que a média?*/
SELECT * 
FROM musica
WHERE duracao < (SELECT AVG(duracao)
				FROM musica);
                
/*Quais as faixas que não se repetem?*/
SELECT * 
FROM faixa
WHERE idCD =3 AND nroFaixa NOT IN (	SELECT nrofaixa
									FROM faixa
									WHERE nrofaixa IN(1,2));

/*UNIÃO DE TABELAS - A teoria dos conjuntos é aplicada na extração da base de dados, onde a UNIÃO é a 
soma de dados de 1 ou mais tabelas. INTERSECT é a interseção dos dados que se conectam por meio das
tabelas com (PK e FK) EXCEPT(a exceção) trata dos dados que não pertencem ao primeiro grupo. A UNIÃO
TABELAS têm finalidade de UNIR dados com tabelas que não têm relacionamento. O uso é fundamental em NOSQL.alter
A União de tabelas têm a característica de verticalização, e pode ser criada (OBS: A quantidade de colunas
e o tipo tem que ser iguais):
SELECT coluna, coluna
FROM tabela
/UNION/UNION ALL/INTERSECT/EXCEPT
SELECT coluna, coluna
FROM tabela;

Onde:
	coluna é do tipo INT
    coluna é do tipo VARCHAR*/
    
/*UNIÃO Tabelas Cadastros (DIMENSÃO)
cd, gravadora, musica, autor*/
SELECT idCD as codigo, nmCD as nome
FROM cd 
UNION
SELECT idGravadora, nmGravadora
FROM gravadora
UNION
SELECT idMusica, nmMusica
FROM musica
UNION 
SELECT idAutor, nmAutor
FROM autor; 

INSERT INTO autor
VALUES (8, 'Tim Maia'),
(9, 'Cazuza'),
(10, 'Marisa Monte');

SELECT *
FROM autor;

SELECT *
FROM gravadora;

INSERT INTO musica
VALUES (31, 'Maria Maria', 05.58),
(32, 'CAJU', 04.26),
(33,'Sinto sua falta', 03.20);

SELECT *
FROM musica;

INSERT INTO cd (idCD, idGravadora, nmCD, precoVenda, dtLancto, cdIndicado)
VALUES (8, 2,'Cartola', 495.00, '1974-08-16', 8),
(9, 5, 'Tropicalia ou Panis et Circencis', 72.00, '1968-07-01', 9),
(10, 4, 'Um Sonhador', 67.98, '1998-05-28', 10);

SELECT *
FROM cd;

/*1 - Quais as músicas que não têm autor?*/
SELECT * 
FROM autor
WHERE idAutor NOT IN (SELECT idAutor
						FROM musicaAutor);
/*2 - Quais os autores que não têm música?*/
SELECT * 
FROM autor
WHERE idAutor NOT IN (SELECT idAutor
						FROM musicaAutor);
/*3 - Quais os cd's que não têm faixa*/

/*4 - Quais os as gravadoras que não têm autor?*/
SELECT *
FROM gravadora
WHERE idGravadora NOT IN (	SELECT idGravadora
							FROM cd);
/*5 - Quais os cd's que têm {música
							autor
							gravadora}?*/

/*6 - Quais as músicas que têm autor*/
SELECT * 
FROM autor
WHERE idAutor NOT IN (SELECT idAutor
						FROM musicaAutor);
/*7 - Quais os autores que não têm música?*/

/*8 - Quais os cds, músicas, autores e gravadoras cadastrados?*/