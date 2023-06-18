% Suppose the following definiton of predicate memberc(X,L) is given.

memberc(X,[X|_]) :- !.
memberc(X,[_|L]) :- memberc(X,L).

% Please compare this definition with the ordinary one of member(X,L). 

% ?- member(X, [1,2,3]).
% X = 1 ;
% X = 2 ;
% X = 3.

% ?- memberc(X, [1,2,3]).
% X = 1.
