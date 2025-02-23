USE cdsenaiqualifica;
/*Quais os cd´s com preço maior que a média?*/
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
/*Quais os autores do cd1?*/
SELECT distinct *
FROM autor
WHERE idAutor IN (SELECT idAutor
				FROM musicaAutor
                WHERE idMusica IN (SELECT idMusica
									FROM musica
                                    WHERE idMusica IN (SELECT idMusica
													   FROM faixa
                                                       WHERE idCD = 1)));
/*Quais as músicas do cd 3?*/
SELECT *
FROM musica
WHERE idMusica IN ( SELECT idMusica
					FROM faixa
                    WHERE idCD = 3);
/*Quais os autores que têm música gravada?*/
SELECT *
FROM autor
WHERE idAutor IN (SELECT idAutor
				FROM musicaAutor
                WHERE idMusica IN (SELECT idMusica
									FROM musica
                                    WHERE idMusica IN (SELECT idMusica
														FROM faixa)));
/*Quais os cd´s que que têm música com a palavra "AMOR"*/
SELECT *
FROM cd
WHERE idCD IN ( SELECT idCD
				FROM faixa
                WHERE idMusica IN (SELECT idMusica
									FROM musica
									WHERE UPPER(nmMusica) LIKE '%AMOR%'));
/*Quais as gravadoras que não têm cd gravado?*/
SELECT *
FROM gravadora
WHERE idGravadora NOT IN (SELECT idGravadora
						  FROM cd);
/*Quais os autores que não têm música?*/
SELECT *
FROM autor
WHERE idAutor NOT IN (SELECT idAutor
					  FROM musicaAutor);
/*Quais as músicas que têm a duração menor que a média?*/
SELECT *
FROM musica
WHERE duracao < (SELECT AVG(duracao)
				 FROM musica);
/*Quais as faixas que não se repetem?*/
SELECT *
FROM faixa
WHERE idCD = 3 AND nroFaixa NOT IN (SELECT nroFaixa 
									FROM faixa
									WHERE idCD in(1,2));
/*união tabelas cadastros (dimensão)
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




