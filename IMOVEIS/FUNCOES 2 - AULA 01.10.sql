/*SUBQUERY: Encadeamento de SELECT
Regras:
1. A coluna que consta no filtro WHERE deve ser a mesma do SELECT seguinte
Operadores de linha >,>=,<,<=,=,!=
Operadores de grupo: IN, ALL, ANY
SINTAXE:
SELECT *{coluna(s)}
FROM tabela
WHERE col OPER (SELECT col
				FROM tabela
				WHERE condição);
Ex: SELECT *
	FROM cd
    WHERE idGravadora IN (SELECT idGravadora
					  FROM gravadora
					  WHERE idGravadora=3);
*/

SELECT *
FROM cd
WHERE idGravadora IN (SELECT idGravadora FROM gravadora);

/*Quais os cd's que são da gravadora maior que a grav 3*/
SELECT *
FROM cd
WHERE idGravadora > (SELECT idGravadora FROM gravadora
					WHERE idGravadora = 3);
                    
/*DESAFIOS
2) Quais as músicas que têm cd?
  - Quais as músicas que têm cd1?
  - Quais as músicas que têm cd2?
  - Quais as músicas que têm cd3?
  - Quais os autores que têm cd?
  - cd1
  - cd2
  - cd3
3) Quais as gravadoras que têm músicas?
4) Quantos cd's têm músicas?
*/

/* Quais as músicas que têm cd? */
SELECT *
FROM musica
WHERE idMusica IN (SELECT idMusica 
				   FROM faixa);
                   
/* Dados das músicas do cd1*/
SELECT *
FROM musica
WHERE idMusica IN (SELECT idMusica 
				   FROM faixa
				   WHERE idCD = 1);
                   
/* Dados das músicas do cd2*/
SELECT *
FROM musica
WHERE idMusica IN (SELECT idMusica 
				   FROM faixa
				   WHERE idCD = 2);
			
/* Dados das músicas do cd1*/
SELECT *
FROM musica
WHERE idMusica IN (SELECT idMusica 
				   FROM faixa
				   WHERE idCD = 3);
      
/* Autor do cd1*/
SELECT *
FROM autor
WHERE idAutor IN(SELECT idAutor
				FROM musicaautor
                WHERE idMusica IN (SELECT idMusica
									FROM musica
                                    WHERE idMusica IN ( SELECT idMusica
														FROM faixa
														WHERE idCD = 1)));
                                                        
/* Autor do cd2*/
SELECT *
FROM autor
WHERE idAutor IN(SELECT idAutor
				FROM musicaautor
                WHERE idMusica IN (SELECT idMusica
									FROM musica
                                    WHERE idMusica IN ( SELECT idMusica
														FROM faixa
														WHERE idCD = 2)));
                                                        
/* Autor do cd3*/
SELECT *
FROM autor
WHERE idAutor IN(SELECT idAutor
				FROM musicaautor
                WHERE idMusica IN (SELECT idMusica
									FROM musica
                                    WHERE idMusica IN ( SELECT idMusica
														FROM faixa
														WHERE idCD = 3)));

/* Criação de view - a view otimiza a performance do banco, n sendo necessário usar tanto SELECT*/

CREATE VIEW vw_BuscaMusicaCDGravado AS 
SELECT COUNT(*) AS "Quantidade Musica",idCD
FROM faixa
GROUP BY idCD; 

SELECT *
FROM vw_BuscaMusicaCDGravado;

/*DESAFIOS
- Crie as seguintes views:
1) MusicaCD1
2) MusicaInicioM
3) CDSDecada80
4) AutoresCrescente
5) MusicasDecrescente
*/

/*1) MusicaCD1*/
CREATE VIEW MusicaCD1 AS 
SELECT COUNT(*) AS "Musicas do CD1",idCD
FROM faixa
GROUP BY idCD; 

SELECT *
FROM MusicaCD1;

DROP VIEW MusicaCD1;

/*2) MusicaInicioM*/
CREATE VIEW MusicaInicioM AS 
SELECT COUNT(*) AS "Musicas do CD1",idCD
FROM faixa
GROUP BY idCD; 

SELECT *
FROM MusicaInicioM;

/*3) CDSDecada80*/
CREATE VIEW CDSDecada80 AS 
SELECT COUNT(*) AS "Musicas do CD1",idCD
FROM faixa
GROUP BY idCD; 

SELECT *
FROM CDSDecada80;

/*4) AutoresCrescente*/
CREATE VIEW AutoresCrescente AS 
SELECT COUNT(*) AS "Musicas do CD1",idCD
FROM faixa
GROUP BY idCD; 

SELECT *
FROM AutoresCrescente;

/*5) MusicasDecrescente*/
CREATE VIEW MusicasDecrescente AS 
SELECT COUNT(*) AS "Musicas do CD1",idCD
FROM faixa
GROUP BY idCD;

SELECT *
FROM MusicasDecrescente; 
