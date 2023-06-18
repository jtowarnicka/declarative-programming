% Suppose the following definiton of a predicate maximum is given.

% maximum(X,Y,X) :- X >= Y, !.
% maximum(X,Y,Y).

% Then Prolog answers "incorrectly" to the question

%  ?- maximum(5,2,2).
%  yes

% Why does Prolog answer "yes" and how this error can be fixed (nor eliminating the cut or modifying the the fact)? 

maximum(X, Y, X) :- X >= Y, !.
maximum(X, Y, Y) :- X < Y, !.
maximum(X, X, X).
