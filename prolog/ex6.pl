% Predicate sil/2 can also be defined as follows:
%   sil(X,N) :- sil(X,N,1).

%   sil(0,A,A).
%   sil(X,N,A) :- X > 0, A1 is A * X, X1 is X - 1, sil(X1,N,A1).
% Please define the predicatess from exercise 5 using this technique. (Note: The variable A of sil/3 is called accumulator.)

sil(X,N) :- sil(X,N,1).
sil(0,A,A).
sil(X,N,A) :- 
	X > 0, A1 is A * X, 
	X1 is X - 1, 
	sil(X1,N,A1).

% ?- sil(4,R).
% R = 24 
	
sumup(X,N) :- sumup(X,N,0).
sumup(0,A,A).
sumup(X,N,A) :- 
	X > 0, A1 is A + X, 
	X1 is X - 1, 
	sumup(X1,N,A1).

	
fib(0, 0).
fib(1, 1).
fib(N,Result) :- fibonacci(N,0,1,Result).


fibonacci(0,N,_,N).
fibonacci(N, Prev1, Prev2, Result):-
   N > 0,
   New_Prev2 is Prev1+Prev2,
   N1 is N-1,
   fibonacci(N1, Prev2, New_Prev2, Result).
   

times2(X,0,0).

times2(X,N,A) :- 
	N > 0, 
	N1 is N-1,
	times2(X,N1,A1),
	A is A1+X.	



% Predicate sil/2 can also be defined as follows:

%   sil(X,N) :- sil(X,N,1).

%   sil(0,A,A).
%   sil(X,N,A) :- X > 0, A1 is A * X, X1 is X - 1, sil(X1,N,A1).

% Please define the predicatess from exercise 5 using this technique. (Note: The variable A of sil/3 is called accumulator.) 

plus(A, B, X) :- plus(A, B, A, X).
plus(_, 0, Acc, Acc) :- !.
plus(A, B, Acc, X) :- 
    B < 0, !,
    B2 is B + 1,
    Acc2 is Acc - 1,
    plus(A, B2, Acc2, X).
plus(A, B, Acc, X) :-
    B > 0, !,
    B2 is B - 1,
    Acc2 is Acc + 1,
    plus(A, B2, Acc2, X).

times(A, B, X) :- times(A, B, 0, X).
times(_, 0, Acc, Acc) :- !.
times(A, B, Acc, X) :-
    B > 0, !,
    B2 is B - 1,
    Acc2 is Acc + A,
    times(A, B2, Acc2, X).
times(A, B, Acc, X) :-
    B < 0, !,
    B2 is B + 1,
    Acc2 is Acc - A,
    times(A, B2, Acc2, X).

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(A, X) :- fib(A, 0, 1, X).
fib(0, Prev1, _, Prev1) :- !.
fib(A, Prev1, Prev2, X) :- 
    A2 is A - 1,
    NewPrev1 is Prev2,
    NewPrev2 is Prev1 + Prev2,
    fib(A2, NewPrev1, NewPrev2, X).


sum-up(N, X) :- sum-up(N, 0, X).
sum-up(0, Acc, Acc) :- !.
sum-up(N, Acc, X) :-
    N2 is N-1,
    Acc2 is Acc + N,
    sum-up(N2, Acc2, X).
