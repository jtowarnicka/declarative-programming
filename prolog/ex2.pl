% Suppose predicates parent/2, female/1 i male/1 wth the obvious interpretation are given.
% Please define predicates child/2, mother/2, sister/2, has_a_child/1, grandparent/2 and predecessor/2.

% run: swipl -s ex2.pl

% modern family
female(peggy).
female(claire).
female(haley).
female(alex).
male(jay).
male(phil).
male(luke).
male(mitchell).

parent(peggy, jay). % peggy is parent of jay

parent(jay, claire). % jay is parent of claire
parent(jay, mitchell). % jay is parent of mitchell

parent(claire, luke). % claire is parent of luke
parent(claire, haley).  % claire is parent of haley
parent(claire, alex).  % claire is parent of alex
parent(phil, luke).  % phil is parent of luke
parent(phil, haley).  % phil is parent of haley
parent(phil, alex).  % phil is parent of alex

child(Y, X) :- parent(X, Y). % for all X, X is a child of Y if Y is a parent of X

mother(X, Y) :- parent(X, Y), female(X). % for all X, X is a mother of Y if X is a parent of Y and is a female

sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y. % different(X, Y) is true if X and Y are different

has_a_child(X) :- parent(X,_).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y). % for all X, X is a grandparent of Y if X is a parent of Z and Z is a parent of Y

% For all X and Z.
% X is a predecessor of Z if
% there is a Y such that
% (1) X is a parent of Y and
% (2) Y is a predecessor of. Z.

predecessor(X, Z) :- parent(X, Z).
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).

% test cases
% ?- child(claire, jay).
% true.

% ?- sister(alex, haley).
% true .

% ?- sister(luke, haley).
% false.

% ?- sister(alex, luke).
% true 

% ?- grandparent(jay, alex).
% true .

% ?- grandparent(alex, jay).
% false.

% ?- predecessor(jay, luke).
% true

% ?- predecessor(luke, jay).
% false.

% ?- predecessor(peggy, luke).
% true .

% ?- predecessor(luke, peggy).
% false.

% ?- parent(jay, phil).
% false.

% ?- parent(phil, jay).
% false.
