/*FUNÇÕES DE AGRAGAÇÃO 
AVG() - RETORNA A MEDIA
SUM() - RETORNA A SOMATORIA
MIN() - VALOR MINIMO NA AMOSTRAGEM
MAX() - VALOR MAXIMO NA AMOSTRAGEM
COUNT() - QUNATIDADE DE TUPLAS NA AMOSTRAGEM
STDEV() - DESVIO PADRÃO
VARIANCE() - VARIANCIA*/

SELECT AVG (precoVenda) AS "Média de preco",
	   sum(precoVenda) AS "Faturamento de CD ",
	   min(precoVenda) AS "Menor Preco",
       max(precoVenda) AS "Maior Preco",
       COUNT(*) AS "Quantidade de cd's",
       stddev(precoVenda) AS "Desvio Padrão",
       variance(precoVenda) AS "Variancia"
From Cd;

/*
1-Qual a media de duração ?    3.6
2-Elabore o cd 3 com a a menor quantidade de musicas já cadastradas,
 lembrando que um cd tem duração maxima de 77 min
 3-Qual o menor valor de menorPreco, e o maior valor de maiotPreco    5 - 30
 4-Qual a quantidade de musicas do cd1 e do cd2?       cd1=16   cd2=14
 */
 
 use cdsenaiqualifica;
 
 SELECT AVG (duracao)
 from musica;
 
 /*resposta questão 2*/
 select *
 from musica
 where duracao > 3.1; 
 
 SELECT sum(duracao)
 from musica
 where idMusica in (2,4,5,6,8,9,10,11,12,13,14,15,17,22,23,25,28,30);
 
 insert into  faixa (idCD,idMusica,nroFaixa)
 values
 (3,1,2),
 (3,2,4),
 (3,3,5),
 (3,4,6),
 (3,5,8),
 (3,6,9),
 (3,7,10),
 (3,8,11),
 (3,9,12),
 (3,10,13),
 (3,11,14),
 (3,12,15),   
 (3,13,17),
 (3,14,22),
 (3,15,23),
 (3,16,25),
 (3,17,28),
 (3,18,30);
 
 /* resposta da questão 3*/
 
 select min(menorPreco)
 from cdcategoria;
 
 select max(menorPreco)
 from cdcategoria;
 
 /* resposta da questa 4*/
 
 select count(*) AS 'quantidade musica'
 from faixa
 where idCD = 1;
 
select count(*) 
from faixa
where idCD=2;

/* função GROUP BY*/

select count(*) as 'quantidade musica',idAutor
from musicaautor
group by idAutor;

/* quantas musicas tem cada autor
'16', '1'
'11', '2'
'13', '3'
'10', '4'
'9', '5'
'1', '6'
'1', '7'*/

select count(*) as 'quantidade autor',idMusica
from musicaautor
group by idMusica;

/* qauntos autores te em cada musica
'3', '1'
'4', '2'
'1', '3'
'1', '4'
'1', '5'
'1', '6'
'1', '7'
'1', '8'
'2', '9'
'3', '10'
'3', '11'
'3', '12'
'3', '13'
'3', '14'
'3', '15'
'3', '16'
'2', '17'
'2', '18'
'2', '19'
'2', '20'
'2', '21'
'3', '22'
'1', '23'
'2', '24'
'1', '25'
'2', '26'
'1', '27'
'2', '28'
'2', '29'
'1', '30'
*/

select count(*) as 'quantidade de cds',idGravadora
from cd
group by idGravadora;


/* quantos cds tem cada gravadora?
'1', '1'
'1', '2'
'2', '3'
'2', '4'
'1', '5'
*/

/*Função de STRING
Padronização de string
UPPER() = retorna string em maiuscolo
LOWER() = retorna string em minisculo
LEFT() = pega char de esquerda 
right() = pegar char de direta 
substring() = pega parte de string, preferencialmente do meio 
ASCII() = converte a string em codigo ASCII
LEN() LENGTH() = Converte no tamanho/comprimento da string
1) Converter o nome da gravadora e o endereço para maiuscola e o email para minuscula
2) Pegar as 3 primeiras letras de endereço
3) retornar todas as garavadoras que estão localizadas em rodovias 
4) Retornar as gravadoras que tem um dominio br
5) Quais as musicas que tem á partir da 4° letra com 5 letras o valor ...
6) Apresente o codigo ASCII de seu nome e a soma total
7) Qual o comprimento de seu nome?
*/

/*resposta da quetão 1 */

select upper(nmGravadora ) as nome, upper(endereco), lower(eMail) as " eMail"
from gravadora;


/* resposta da questão 2*/

select left(endereco,3)
from gravadora;

/* Resposta da questão 3*/

select*
from gravadora
where upper(left(endereco,3)) = 'ROD';

select*
from gravadora;

/* Resposta da qustão 4*/

select*
from gravadora
where lower(right(eMail,2))= 'br';

/* Resposta da questão 5*/

select*
from musica;

select substring(nmMusica, 4,4)
from musica
where nmMusica like '%rato%';

/* Resposta da questão 6 */

select ASCII('S')S, ASCII('E')E, ASCII('N')N, ASCII('A')A, ASCII('I')I;

select ASCII('B')B, ASCII('E')E, ASCII('A')A, ASCII('T')T, ASCII('R')R, ASCII('I')I, ASCII('Z')Z;
select ASCII('B')+ ASCII('E')+ ASCII('A')+ ASCII('T')+ ASCII('R')+ ASCII('I')+ ASCII('Z') Beatriz;
/* Resposta da questão 7*/

select ASCII('B')+ ASCII('E')+ ASCII('A')+ ASCII('T')+ ASCII('R')+ ASCII('I')+ ASCII('Z') Beatriz; /*529*/ 
select ASCII('b')+ ASCII('e')+ ASCII('a')+ ASCII('t')+ ASCII('r')+ ASCII('i')+ ASCII('z') Beatriz; /*753*/
select ASCII('B')+ ASCII('e')+ ASCII('a')+ ASCII('t')+ ASCII('r')+ ASCII('i')+ ASCII('z') Beatriz; /*741*/


/* Funções de data */

select day(dtLancto) as 'Dia',
	   month(dtLancto) as 'Mês',
       year(dtLancto) as 'Ano',
       quarter(dtLancto) as 'Trimestre',
       week(dtLancto) as 'Semana',
       weekday(dtLancto) as 'Dia da Semana',
       weekofyear(dtLancto) as 'Semana do Ano',
       hour(dtLancto) as 'Hora',
       minute(dtLancto) as 'Minuto',
       second(dtLancto) as 'Segundo',
       microsecond(dtLancto) 
from cd;

select quarter(dtLancto)
from cd;

select day('2006-06-16')'Dia', 
month('2006-06-16')'Mês',
week('2006-06-16')'Semana', 
year('2006-06-16')'Ano', 
quarter('2006-06-16') 'Trimestre',
weekday('2006-06-16') 'Dia da Semana', 
weekofyear('2006-06-16') 'Semana do ano' ;
       
select date_add('1973-05-08', interval 10 day);

select timestampdiff(year,'2006-06-16',now()) ANOS,
timestampdiff(day,'2006-06-16',now()) %30 DIAS,
timestampdiff(month,'2006-06-16',now())%12 MES;