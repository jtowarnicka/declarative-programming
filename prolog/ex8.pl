% last(X,L), which is fulfilled if X is the last element of L.

% last(X,[X]).
% last(X, [_|L]) :- last(X,L).
last(X,L) :- append(_, [X], L).

% delete(X,L1,L2), 
% which is fulfilled if L2 is the list L1 without the element X.

% all occurences
% delete(_, [], []).
% delete(X, [X|T], L2) :- delete(X,T,L2).
% delete(X, [Y|T], [Y|R]) :-
%    delete(X,T,R).

% accumulator
% delete(X,L1,L2) :- delete(X,L1,L2,[]).
% delete(_,[],L,A) :- reverse(A,L).
% delete(X, [X|L1], L2, A) :-
%    delete(X, L1, L2, A).
% delete(X, [Y|L1], L2, A) :-
%    delete(X, L1, L2, [Y|A]).

% remove one occurence
% delete(X,[X|T],T).
% delete(X, [Y|T], [Y|U]) :- delete(X, T, U).

% delete(X,L1,L2) :-
%    append(Left, [X|Rest], L1),
%    append(Left, Rest, L2).

% delete(L1,L2),
% which is fulfilled if L2 is the list L1 without L1's last three elements.

delete([_,_,_], []).
delete([H|T], [H|L]) :- delete(T,L).
% delete(L1,L2) :- append(L2, [_,_,_], L1).

% append([], X, X).
% append([X | Y], Z, [X | W]) :- append( Y, Z, W).
% append([], [_,_,_], [4,5,6]). -> append([], X, X).

% reverse(L1,L2), which is fulfilled if L2 is the list L2 in reversed order.

% reverse(L1,L2) :- reverse(L1,L2,[]).
% reverse([], L2, L2).
% reverse([H|L1], L2, A) :-
%    reverse(L1, L2, [H|A]).

reverse([],[]).
reverse([H|L1],L2) :-
    append(N, [H], L2),
    reverse(L1, N).

% evenlength(L) and oddlength(L), 
% which are fulfilled if the length of L is even and odd, respectively.

evenlength([]).
evenlength([_|L]) :-
    oddlength(L).

oddlength([_]).
oddlength([_|L]) :-
    evenlength(L).

% shift(L1,L2),
% which is fulfilled if L2 the list L1 after one rotation to left.
% Example:
% ?- shift([1,2,3,4,5],L).
% L = [2,3,4,5,1]

% shift left
% shift([H|L1],L2) :- append(L1, [H], L2).

% N times
rotate(right, L, [T|H]) :- append(H, [T], L).
rotate(left, [H|T], L) :- append(T, [H], L).
nshift(0, L, L) :- !.
nshift(N, L1, L2) :-
  N < 0, rotate(right, L1, L), N1 is N+1, nshift(N1, L, L2).
nshift(N, L1, L2) :-
  N > 0, rotate(left, L1, L), N1 is N-1, nshift(N1, L, L2).

shift_right(L1, L2) :-
  reverse(L1, [H|T]), % Reverse the list and separate the head and tail
  reverse(T, R), % Reverse the tail again
  append([H], R, L2). % Append the reversed tail with the head to get the shifted list

% quadrat(L1,L2),
% which is fulfilled if L2 contains the squares of the elements of L1.
% Example:
%  ?- quadrat([1,2,3,4,5],L).
%  L = [1,4,9,16,25] 

quadrat([],[]).
quadrat([H|T], [G|O]) :-
   G is H * H,
   quadrat(T, O).

% combine(L1,L2,L3), 
% which is fulfilled if L3 contains the pairs of the elements of L1 and L2.
% Example:
% ?- combine([1,2,3,4],[a,b,c,d],L).
% L = [[1,a],[2,b],[3,c],[4,d]] 

combine([],[],[]).
combine([H1|L1], [H2|L2], [[H1,H2]|L3]) :-
    combine(L1, L2, L3).

% palindrom(L), which is fulfilled if L contains a palindrom.
% Examples:
% ?- palindrom([a,b,c]).
% no
% ?- palindrom([a,b,c,d,c,b,a]).
% yes 

% palindrom(L) :- reverse(L,L).

% p(X,L,Y,Z), 
% which is fulfilled if Y is the predecessor of X in L 
% and Z is the successor of X in L.
% Example:
%  ?- p(3,[1,2,3,4,5],Y,Z).
%  Y = 2, Z = 4 

p(X,[Y,X,Z|_],Y,Z).
p(X,[_|T],Y,Z) :- p(X,T,Y,Z).

% % q(X,L1,L2), 
% % which is fulfilled if L2 is the beginning of the list L1
% % up to the (first) double occurence of element X.
% % Example:
% % ?- q(3,[1,2,3,3,1,2,4],Z).
% % Z = [1,2,3,3] 

% q(X, [X,X|_], [X,X]).
% q(X, [Y|L1], [Y|L2]) :- q(X, L1, L2).


% % p(X,L,Y,Z), which is fulfilled if Y is the predecessor of X in L and Z is the successor of X in L.
% predecessor(X , [Pred,X|_], Pred ).
% predecessor(X , [_|T], Pred ) :- 
% 	predecessor(X, T, Pred).

% successor(X, [X, Suc|_], Suc ).
% successor(X, [_|T], Suc ) :- 
% 	successor(X, T, Suc).

% p(X, L, Y, Z) :-
% 	predecessor(X, L, Y), 
% 	successor(X, L, Z).

% p2(X, [Pred, X, Suc|_],Pred, Suc).
% p2(X, [_|Tail],Pred, Suc) :-
% 	p2(X, Tail, Pred, Suc).

% % Example:
% %  ?- p(3,[1,2,3,4,5],Y,Z).
% %  Y = 2, Z = 4

% % q(X,L1,L2), which is fulfilled if L2 is the beginning of the list L1 up to the (first) double occurence of element X.
% q(X, L1, L2) :-
% 	qHelper(L1, X, [], L2).
	
% qHelper([], _, S, S).
% qHelper([P, P|_],P,S,S) :- !.
% qHelper([H1|T],P,S,R) :- 
% 	append(S, [H1], S2), 
% 	qHelper(T,P,S2,R).

% % Example:
% %  ?- q(3,[1,2,3,3,1,2,4],Z).
% %  Z = [1,2,3,3] 