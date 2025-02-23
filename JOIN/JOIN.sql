USE cdSenaiQualifica;
/*Quais as musicas que têm gravadora*/
SELECT DISTINCT musica.nmMusica, musica.duracao,
gravadora.nmGravadora, Gravadora.endereco
FROM musica, faixa, cd, gravadora
WHERE musica.idMusica = faixa.idMusica AND
faixa.idCD = cd.idCD AND
cd.idGravadora = gravadora.idGravadora;
/*Quais os autores que têm musica*/
SELECT DISTINCT autor.nmAutor, musica.nmMusica
FROM autor INNER JOIN musicaAutor
ON autor.idAutor = musicaAutor.idAutor
INNER JOIN musica
ON musicaAutor.idMusica = musica.idMusica;
/*Quais os cd´s que têm música*/
SELECT cd.nmCD, musica.nmMusica
FROM cd INNER JOIN faixa
ON cd.idCD = faixa.idCD
INNER JOIN musica
ON faixa.idMusica = musica.idMusica;
/*Quais as gravadoras que têm autor*/
SELECT g.nmGravadora, a.nmAutor
FROM gravadora g INNER JOIN cd c
ON g.idGravadora = c.idGravadora 
INNER JOIN faixa f
ON c.idCD = f.idCD
INNER JOIN musica m
ON f.idMusica = m.idMusica
INNER JOIN musicaAutor ma
ON m.idMusica = ma.idMusica
INNER JOIN autor
ON ma.idAutor = a.idAutor;

/*Quais as faixas que foram mais repetidas*/
SELECT distinct f.nroFaixa, m.nmMusica
FROM faixa f INNER JOIN musica m
ON f.idMusica = m.idMusica
INNER JOIN cd c
ON c.idCD = f.idCD
WHERE c.idCD = 2 and f.nroFaixa in (1,3);

/*Apresentar quais os autores que não têm música */
SELECT distinct a.nmAutor
FROM autor a LEFT JOIN musicaAutor ma
ON a.idAutor = ma.idAutor
LEFT JOIN musica m
ON ma.idMusica=m.idMusica
WHERE ma.idMusica IS NULL;

/*Mostre quais músicas não têm autor*/
SELECT m.nmMusica
FROM musica m LEFT JOIN musicaAutor ma 
ON m.idMusica = ma.idMusica
LEFT JOIN autor a
ON a.idAutor = ma.idAutor
WHERE ma.idAutor IS NULL;
/*Apresente quais gravadoras não têm cd*/
SELECT g.*
FROM gravadora g LEFT JOIN cd c
ON g.idGravadora = c.idGravadora
WHERE c.idCD IS NULL;
/*Apresente quais cd´s não têm música*/
SELECT c.*
FROM cd c left JOIN faixa f
ON c.idCD = f.idCD
WHERE f.idMusica IS NULL;

/*Para união, verificar qual dado está linkado a PK*/
SELECT m.nmMusica, c.nmCD, g.nmGravadora, a.nmAutor
FROM autor a LEFT JOIN musicaAutor ma
ON a.idAutor = ma.idAutor
RIGHT JOIN musica m
ON ma.idMusica = m.idMusica
LEFT JOIN faixa f
ON m.idMusica = f.idMusica
RIGHT JOIN cd c
ON f.idCD = c.idCD
RIGHT JOIN gravadora g
ON c.idGravadora = g.idGravadora;


