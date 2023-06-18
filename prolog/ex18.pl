% Suppose given are a list of properties, for example [animate, male, canine, feline], and a 
% list of clauses such as

animate(fred).
animate(alice).
male(fred).
canine(alice).
feline(fred).

% Please define a predicate checkprops(P,L), where P is a person and L a list of properties. checkprops(A,L) is fulfilled, 
% if P has all properties from L.
% Examples:

%  ?- checkprops(fred, [animate, male]).
%  yes
%  ?- checkprops(alice, [animate, feline]).
%  no

checkprops(_, []) :- !.
checkprops(X, [Head|Tail]) :-
    call(Head,X),
    checkprops(X, Tail).
