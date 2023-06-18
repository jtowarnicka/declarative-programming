% Please define a predicate filter(P,L1,L2), which is fulfilled if list L2 contains all elements from list L1 fulfilling predicate P.
% Example:

pos(X) :- X > 0.
neg(X) :- X < 0.

%  ?- filter(pos,[1,2,0,5,-5,-6,8],L).
%  L = [1,2,5,8]
%  ?- filter(neg,[1,2,0,5,-5,-6,8],L).
%  L = [-5,-6]

filter(_, [], []) :- !.
filter(Pred, [Head|Tail], Res) :-
    call(Pred, Head), !,
    filter(Pred, Tail, ResTail),
    append([Head], ResTail, Res).
filter(Pred, [_|Tail], Res) :-
    filter(Pred, Tail, ResTail),
    append([], ResTail, Res).
