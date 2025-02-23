SELECT idMusica, duracao
FROM musica;

SELECT idCD, nmCD, precoVenda
FROM cd;

SELECT nmGravadora, endereco, contatoDireto
FROM gravadora;

SELECT idCD, nroFaixa
FROM faixa;

/*Para músicas com duração da maior para menor*/
SELECT*
FROM musica
ORDER BY duracao DESC, nmMusica ASC;

SELECT*
FROM autor
ORDER BY nmautor ASC;

SELECT*
FROM gravadora
ORDER BY endereco ASC;

SELECT*
FROM musica
ORDER BY idMusica ASC, idAutor DESC;

SELECT*
FROM musica
ORDER BY nmMusica ASC;


SELECT nmMusica, duracao
FROM musica
WHERE duracao >03;

SELECT idCD, idMusica, nroFaixa
FROM faixa
WHERE idCd=2;

SELECT*
FROM gravadora
WHERE idGravadora=3;

SELECT count(*)
FROM gravadora
WHERE idGravadora=3;

SELECT*
FROM musica
WHERE duracao<05;

SELECT count(*)
FROM musica
WHERE duracao<05;

SELECT*
FROM cd
WHERE precoVenda>20;

SELECT count(*)
FROM cd
WHERE precoVenda>20;

SELECT*
FROM cdcategoria
WHERE maiorPreco<=100;

SELECT count(*)
FROM cdcategoria
WHERE maiorPreco<=100;

SELECT*
FROM musicaautor
WHERE idAutor>=2;

SELECT count(*)
FROM musicaautor
WHERE idAutor>=2;

SELECT*
FROM faixa
WHERE nroFaixa!=13;

SELECT count(*)
FROM faixa
WHERE nroFaixa!=13;
nroFaixa!=13;
nroFaixa<>13;


SELECT nmCD, precoVenda, idGravadora
FROM cd
WHERE precoVenda>10 AND idGravadora=2;

SELECT nmCD, precoVenda, idGravadora
FROM cd
WHERE precoVenda>10 AND precoVenda<30;

SELECT nmMusica, duracao, idmusica
FROM musica
WHERE idmusica=10 OR 
idmusica=15 OR
idmusica=18 OR
idmusica=20 OR 
idmusica=38;

SELECT nmCD, precoVenda
FROM cd
WHERE NOT (precoVenda<15);

SELECT nmMusica, duracao
FROM musica
WHERE duracao>=5 and duracao <=9;

SELECT nroFaixa, idCd
FROM faixa
WHERE nroFaixa=11 or
nroFaixa=13 or
nroFaixa=17 or
nroFaixa=33 or
nroFaixa=50;

SELECT*
FROM faixa;

DELETE 
FROM faixa
WHERE idCd<3;

SELECT*
FROM gravadora
ORDER BY nmGravadora ASC;

SELECT idCategoria, menorPreco, maiorPreco
FROM cdcategoria
WHERE menorPreco>20 and maiorPreco>40;

INSERT INTO gravadora (idGravadora, nmGravadora, telefone)
VALUES (6, 'K9 Studio', 11941567423),
(7, 'Comboio Records', 11963517026),
(8, 'Studio Effel', 1144681526);

SELECT*
FROM gravadora;

SELECT nmGravadora, endereco
FROM Gravadora
WHERE endereco IS NULL;

SELECT nmGravadora, endereco
FROM gravadora
WHERE endereco IS NOT NULL;

SELECT nmCD, dtLancto
FROM cd
WHERE dtLancto BETWEEN '01/01/99' AND '31/12/2001';

SELECT nmMusica, duracao
FROM musica
WHERE cdmusica IN (10,15,18,20,38);

SELECT nmCD, precoVenda
FROM cd
WHERE precoVenda LIKE '5%';

use cdSENAIQualifica;
SELECT *
FROM musica
WHERE nmMusica LIKE 'A%';

SELECT *
FROM musica
WHERE nmMusica LIKE '%A';

SELECT *
FROM musica
WHERE nmMusica LIKE '%A%';

SELECT *
FROM musica
WHERE nmMusica LIKE '_I_';

SELECT *
FROM musica
WHERE nmMusica LIKE '__R_';

SELECT *
FROM musica
WHERE nmMusica LIKE '%A_';

SELECT *
FROM musica
WHERE nmMusica LIKE '_A%_';



