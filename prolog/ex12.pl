% A binary tree T is either empty - represented by the term nil - or consists of an element X (the root element) and 
% two subtrees L and P - represented by the term node(X,L,P).
% Please define the following predicates for binary trees.

% size(T,N), which is fulfilled if N is the number of elements of tree D.

size(nil, 0).
size(node(_, LeftTree, RightTree), Size) :-
    size(LeftTree, LeftSize),
    size(RightTree, RightSize),
    Size is LeftSize + RightSize + 1.

% search(T,X), which is fulfilled if X appears in tree T.

search(node(X, _, _), X) :- !.
search(node(_, LeftTree, RightTree), X) :-
    search(LeftTree, X);
    search(RightTree, X).

% max(T,X), which is fulfilled if X is the largest element of tree T.

max(nil, -inf).
max(node(A, nil, nil), A) :- !.
max(node(A, LeftTree, RightTree), Max) :-
    max(LeftTree, LeftMax),
    max(RightTree, RightMax),
    TmpMax is max(LeftMax, RightMax),
    Max is max(A, TmpMax).

% times(N,T1,T2), which is fulfilled if D2 is the tree D1 in which each element has been multiplied with N.

times(_, nil, nil) :- !.
times(N, node(X, LeftTree, RightTree), node(NewX, NewLeftTree, NewRightTree)) :-
    NewX is X * N,
    times(N, LeftTree, NewLeftTree),
    times(N, RightTree, NewRightTree).

% preorder(T,L), which is fulfilled if L is the list of D's elements in preorder. 

preorder(nil, []).
preorder(node(X, LeftTree, RightTree), Res) :-
    preorder(LeftTree, LeftRes),
    preorder(RightTree, RightRes),
    append([X|LeftRes], RightRes, Res).

% node(1,node(2,node(4, nil, nil),node(5,node(8, nil, nil),nil)),node(3,node(6, nil, nil),node(7,node(9, nil, nil),node(10, nil, nil))))