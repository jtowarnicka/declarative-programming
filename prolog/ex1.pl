% swipl -s ex1.pl

% predykat my_length/2, który przyjmuje listę jako pierwszy argument i zwraca liczbę elementów na liście jako drugi argument

my_length(0, []).
my_length(N, [_|L]) :- my_length(M, L), N is M + 1.

%  długość listy o głowie _ (dowolny  element) i ogonie L jest równa N,
%  jeśli długość ogona L jest M, a N jest o 1 większa od M. Innymi słowy,
%  obliczamy długość listy przez rekurencyjne obliczanie długości jej ogona i dodanie 1

% ?- my_length(0, []).     % Długość pustej listy powinna być 0.
% true.

% ?- my_length(3, [a, b, c]).  % Długość listy [a, b, c] powinna być 3.
% true.

% excercise 1
% A predicate describing the length of a list can be defined as follows.
%   length(0,[]).
%   length(N,[_|L]) :- length(M,L), N is M+1.
% Please define predicates member/2 oraz fac/2, fib/2 i gcd/3 analogous to the above.

member(X, [X|_]).
member(X, [_|L]) :- member(X, L).

factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N - 1, factorial(N1, F1), F is N * F1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- N > 1, N1 is N - 1, N2 is N -2,
 fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.

% greatest common divisor
gcd(X, 0, X).
gcd(0, Y, Y).
gcd(X, Y, R) :- X > 0, Y > 0, X >= Y, X1 is X - Y, gcd(X1, Y, R).
gcd(X, Y, R) :- X > 0, Y > 0, X < Y, Y1 is Y - X, gcd(X, Y1, R).
