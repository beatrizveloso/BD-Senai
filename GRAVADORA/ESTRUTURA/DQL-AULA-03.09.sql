SELECT idMusica, duracao
FROM musica;

SELECT idCD, nmCD, precoVenda
FROM cd;

SELECT nmGravadora, endereco, contatoDireto
FROM gravadora;

SELECT idCD, nrofaixa
FROM faixa;

/*Para músicas com duração da maior para a menor*/
SELECT *
FROM musica
ORDER BY duracao DESC, nmMusica ASC;

SELECT *
FROM autor
ORDER BY nmAutor ASC;

SELECT *
FROM gravadora
ORDER BY endereco ASC;

SELECT *
FROM musica
ORDER BY nmMusica ASC, idAutor DESC;

SELECT *
FROM musica
ORDER BY nmMusica ASC;



