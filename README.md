# Finite-Guarded-Automaton
## Execution of a Finite Guarded Automaton

### Input:

  -a line with the integer n, specifying the set S = {1..n};
  
  
 -a line with the number s0 (cardinality of the initial state set S0);
  
  
  -a line with s0 distinct integers that form the set of initial states;
  
  
  -a line with the number f (cardinality of the end state set F);
  
  
  -a line with distinct f integers that form the set of final states;
  
  
  -a line with the number m of transitions (the cardinality of R));
  
  
  -m lines where each introduces a transition in the form of i c op a b j:
  
  
{i being the integer representing the state of departure of the transition;

{c character in transition label (c can be _);

{op guard comparison operator (one of \ <", \ <=", \ = ", \! =", \> = ", \>");

{a is an integer value (with which x will be compared);

{b is an integer value (with which x will be updated);

{is already the integer representing the arrival state;


In all situations where an epsilon can be expected, the _ character will be used. For example the
transition 4 _ _ _ _ 5 represents the epsilon transition from state 4 to state 5 without
either save or update variable x.

Finally the last line contains a string representing the word t for recognition.

### Output

The output is organized in one line where:

  -the word YES if the automaton recognizes the word;
  
  
  -the word NO otherwise.


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

1 _> 7 2 2

1 _> 7 3 3

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

1 _> 7 2 2

1 _> 7 3 3

2 a = 7 4 4

2 b = 7 1 1

3 _ _ _ 2 2

3 a _ _ 4 4

3 a = 0 _ 5

3 b _ _ 4 4

4 a _ _ 2 2

6 a! = 1 1 6

aa


### Sample Output 3

NO

3
