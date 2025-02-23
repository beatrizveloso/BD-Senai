/*FUNÇÕES DE AGREGAÇÃO
AVG() -> retorna a média
SUM() -> retorna a somatória
MIN() -> valor mínimo na amostragem
MAX() -> valor máximo na amostragem
COUNT() -> quantidade de tuplas na amostragem
STDEV() -> desvio padrão
VARIANCE() -> variância*/
use cdsenaiqualifica; 

SELECT *
FROM cd;

SELECT AVG(precoVenda) AS "Média de preço",
		SUM(precoVenda) AS "Faturamento de cd",
		MIN(precoVenda) AS "Menor preço",
        MAX(precoVenda) AS "Maior preço",
		COUNT(*) AS "Quantidade de cd's",
        STDDEV(precoVenda) AS "Desvio padrão",
        VARIANCE(precoVenda) AS "Variância"
FROM cd;

/*DESAFIOS
1- Qual a média de duração?*/
SELECT AVG(duracao) AS "Média de duração"
FROM musica;

/*2- Elabore o cd 3 com a menos quantidade de músicas já cadastradas, lembrando que um cd têm duração máxima de 
77 min*/
SELECT SUM(duracao) AS "Somatória duração"
FROM musica;

/*Hipóteses:
Quais as músicas com maior duração*/
SELECT MAX(duracao) AS "MAIOR duração"
FROM musica;

/*Quais as médio da duração e colocar where*/
SELECT *
FROM musica
WHERE duracao > 3.1;

/*Somatória dessas músicas*/
SELECT *
FROM musica
ORDER BY duracao DESC;

SELECT SUM(duracao)
FROM musica
WHERE idMusica IN (2,4,5,6,8,9,10,11,12,13,14,15,17,22,23,25,28,30);

/*3- Qual o menor valor do menorPreco, e o maior valor do maiorPreco*/


4- Qual a qtde de músicas do cd 1 e do cd 2?