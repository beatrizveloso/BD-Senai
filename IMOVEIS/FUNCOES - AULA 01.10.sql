use cdsenaiqualifica;
/*Funções de cálculo complexo:
- ABS() -> valor absoluto
- ROUND() -> arredondar
          -> (coluna, qtde, casas decimais -> valores positivos)
          -> ( " , " de números inteiros -> valor neg)
- SQRT() -> raiz quadrada 
- POW()/ POWER -> (base, expoente)
- SIN(), COS(), TAN()
- ASIN(), ACOS(), ATAN ()
- DEGRESS() -> converte novoa radianos p/graus
- RADIANS() -> " " de graus p/ radianos 

Desafios :
1) Calcule x1 e x2 de baskara;
2) Calcule a área do círculo;
3) Arredondar os preços;
4) Tornar preços ABS();
5) Sugerir uma equação que use pelo menos 3 funções.
*/

/*Calcule báskara:
a = 2
b = 12
c = -13
x1=-b+sqrt(delta)/2*a
x2=-b-sqrt(delta)/2*a
delta= b*b-4*a*c -> pow(b,2)-4*a*c
*/

SELECT -12 + ROUND(SQRT(pow(12,2)-4*2*-13),0)/2*2 as x1,
	   -12 - ROUND(SQRT(pow(12,2)-4*2*-13),0)/2*2 as x2;
	
/*Área do círculo A=pi*r*r */
SELECT ROUND(PI(),0)*POW(7,2) as "Área do círculo";

/*ARREDONDAR OS PREÇOS*/
SELECT ROUND(precoVenda,1), precoVenda
FROM cd;

SELECT ROUND(precoVenda,1),ROUND(precoVenda,-1), precoVenda
FROM cd;

/*TORNAR OS VALORES ABSOLUTOS DE PREÇOVENDA*/
SELECT ABS(precoVenda)
FROM cd;

UPDATE cd
SET precoVenda = ABS(precoVenda)
WHERE idCD >= 1;

/*Calculo do trapézio:
B = 24
b = 9
h = 15
A=(B+b)h/2
*/

SELECT ROUND((24+9)*15/2,0) as 'Cálculo da Área do Trápezio';
	   