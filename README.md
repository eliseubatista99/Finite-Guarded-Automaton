# Finite-Guarded-Automaton
## Execution of a Finite Guarded Automaton

### Input:
  -uma linha com o inteiro n, especificando o conjunto S = {1..n};
  
  -uma linha com o numero s0 (cardinalidade do conjunto S0 dos estados iniciais);
  
  -uma linha com s0 inteiros distintos que formam o conjunto dos estados iniciais;
  
  -uma linha com o numero f (cardinalidade do conjunto F dos estados finais);
  
  -uma linha com f inteiros distintos que formam o conjunto dos estados finais;
  
  -uma linha com o numero m de transições (a cardinalidade de R));
  
  -m linhas em que cada uma delas introduz uma transição sob a forma de i c op a b j :
  
{ i sendo o inteiro representando o estado de partida da transicão;

{ c o caracter no rótulo da transição (c pode ser _);

{ op o operador de comparação da guarda (um de \<", \<=", \=", \!=", \>=", \>" );

{ a e um valor inteiro (com o qual x será comparado);

{ b e um valor inteiro (com o qual x será actualizado);

{ e j o inteiro que representa o estado de chegada;


Em todas as situações em que se pode esperar um epsilon, usar-se-á o caracter _. Por exemplo a
transicão 4 _ _ _ _ 5 representa a transiçãao epsilon que parte do estado 4 para o estado 5 sem
que se queira nem guardar nem actualizar a variável x.
Finalmente a ultima linha contam uma string representando a palavra t por reconhecer.

### Output

O output é organizado numa só linha onde consta:

  -a palavra YES se o automato reconhece a palavra;
  
  -a palavra NO caso contrario.


### Sample Input 1

6

3

1 2 6

3

3 4 6

10

1 _ _ _ _ 2

1 _ _ _ _ 3

2 a _ _ _ 4

2 b _ _ _ 1

3 _ _ _ _ 2

3 a _ _ _ 4

3 a _ _ _ 5

3 b _ _ _ 4

4 a _ _ _ 2

6 a _ _ _ 6

bbaa

### Sample Output 1

YES

### Sample Input 2

6

3

1 2 6

3

3 4 6

10

1 _ > 7 2 2

1 _ > 7 3 3

2 a = 7 4 4

2 b = 7 1 1

3 _ _ _ 2 2

3 a _ _ 4 4

3 a = 0 _ 5

3 b _ _ 4 4

4 a _ _ 2 2

6 a _ _ _ 6

aa

### Sample Output 2

YES

### Sample Input 3

6

3

1 2 6

3

3 4 6

10

1 _ > 7 2 2

1 _ > 7 3 3

2 a = 7 4 4

2 b = 7 1 1

3 _ _ _ 2 2

3 a _ _ 4 4

3 a = 0 _ 5

3 b _ _ 4 4

4 a _ _ 2 2

6 a != 1 1 6

aa


### Sample Output 3

NO

3
