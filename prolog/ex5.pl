% Please define predicates plus/3, times/3, fib/2 oraz sum-up/2 (using recursion).
% Predicate sum-up(N,X) is fulfilled, if X is the sum from 0 to N.
 
% ?- succ(0,X).
% X = 1.
% ?- succ(1,X).
% X = 2.

plus(0, X, X).

plus(succ(X), Y, succ(Z)) :- plus(X, Y, Z).

% ?- plus(0, 5, Result).
% Result = 5.

% times(0, _, 0).
% times(succ(X), Y, Z) :-
%     times(X, Y, Z1),
%     plus(Z1, Y, Z).

times(0,_,0).

times(X, Y, Z) :- 
    X > 0,
    X1 is X - 1,
    times(X1, Y, Z1),
    Z is Z1 + Y.

% ?- times(3, 5, Result).
% Result = 15.

% 1 2 3 4 5 6 7
% 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610
fib(0, 0).
fib(1, 1).
fib(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, Fn1),
    fib(N2, Fn2),
    Result is Fn1 + Fn2.

% ?- fib(6, Result).
% Result = 8.
% fib(6, Result).
% fib(5, Fn1), fib(4, Fn2), Result is Fn1 + Fn2 = 5 + 3 = 8
% fib(4, Fn1), fib(3, Fn2), Result is Fn1 + Fn2 = 3 + 2 = 5
% fib(3, Fn1), fib(2, Fn2), Result is Fn1 + Fn2 = 2 + 1 = 3
% fib(2, Fn1), fib(1, Fn2), Result is Fn1 + Fn2 = 1 + 1 = 2
% fib(1, Fn1), fib(0, Fn2), Result is Fn1 + Fn2 = 1

% Fn1 i Fn2 są zmiennymi, które zostaną związane z wartościami, gdy zostaną obliczone rekurencyjnie

sum-up(0, 0).
sum-up(N, Result) :-
    N > 0,
    N1 is N - 1,
    sum-up(N1, Result1),
    Result is Result1 + N.

% ?- sum-up(3, Result).
% Result = 6.
