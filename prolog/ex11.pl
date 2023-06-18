% Please define a predicate permutation(L1,L2), which is fulfilled if the list L2 is a permuation of L1.
% (Using ";" it should be possible to enumerate all permutations of L1.)

takeout(Head, [Head|Tail], Tail). %predykat wbudowany select/3  
takeout(X, [Head|Tail], [Head|S]) :- 
	takeout(X, Tail, S).

permutation2([], []).
permutation2([Head|Tail], Z) :- 
	permutation2(Tail, W), 
	takeout(Head, Z, W).  
