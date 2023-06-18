% Please define the following predicates for lists.

% nth(N,L,X), which is fulfilled if X is the N-th element in the list L.

% ordered(L), which is fulfilled if list L is ordered.

% mergesort(L1,L2), which is fulfilled if L2 is the ordered version of the list L1. The predicate should simulate algorithm mergesort.

nth(1,[X|_],X).
nth(N,[_|T],X) :- N1 is N-1, nth(N1,T,X).

ordered( []      ) .
ordered( [_]     ) .
ordered( [X,Y|Z] ) :- X =< Y , ordered( [Y|Z] ) .

% divide([],[],[]).
% divide([X],[X],[]).
% divide([X,Y|T],[X|L1],[Y|L2]):-divide(T,L1,L2).

% merge_sort([],[]).     % empty list is already sorted
% merge_sort([X],[X]).   % single element list is already sorted
% merge_sort(List,Sorted):-
%     List=[_,_|_],divide(List,L1,L2),     % list with at least two elements is divided into two parts
% 	merge_sort(L1,Sorted1),merge_sort(L2,Sorted2),  % then each part is sorted
% 	merge(Sorted1,Sorted2,Sorted).                  % and sorted parts are merged
% merge([],L,L).
% merge(L,[],L):-L\=[].
% merge([X|T1],[Y|T2],[X|T]):-X=<Y,merge(T1,[Y|T2],T).
% merge([X|T1],[Y|T2],[Y|T]):-X>Y,merge([X|T1],T2,T).

mergesort([],[]).    /* covers special case */
mergesort([A],[A]).
mergesort([A,B|R],S) :-  
   split([A,B|R],L1,L2),
   mergesort(L1,S1),
   mergesort(L2,S2),
   mymerge(S1,S2,S).
 
split([],[],[]).
split([A],[A],[]).
split([A,B|R],[A|Ra],[B|Rb]) :-  split(R,Ra,Rb).
 
mymerge(A,[],A).
mymerge([],B,B).
mymerge([A|Ra],[B|Rb],[A|M]) :-  A =< B, mymerge(Ra,[B|Rb],M).
mymerge([A|Ra],[B|Rb],[B|M]) :-  A > B,  mymerge([A|Ra],Rb,M).


% 
%a 

% nth(0, [H|_], H) :-
%     !.
% nth(N, [_|T], H) :-
%     N > 0,
%     N1 is N-1,
%     nth(N1, T, H).
	
% %b

% ordered([]).
% ordered([_]).
% ordered([X, Y|Z]) :- X =< Y, ordered([Y|Z]).

% %c
	
% merge(L, [], L).
% merge(L, L, []).
% merge([L1Head|TailMerged], [L1Head|L1Tail], [L2Head|L2Tail]) :-
%   L1Head =< L2Head,
%   merge(TailMerged,L1Tail,[L2Head|L2Tail]).
% merge([L2Head|TailMerged], [L1Head|L1Tail], [L2Head|L2Tail]) :-
%   L2Head =< L1Head,
%   merge(TailMerged,[L1Head|L1Tail],L2Tail).
  
% mergeSort([], []).
% mergeSort([A|[]], [A]).
% mergeSort(List, Sorted) :-
%     length(List, N),
%     FirstLength is //(N, 2),
%     SecondLength is N - FirstLength,
%     length(FirstUnsorted, FirstLength),
%     length(SecondUnsorted, SecondLength),
%     append(FirstUnsorted, SecondUnsorted, List),
%     mergeSort(FirstUnsorted, FirstSorted),
%     mergeSort(SecondUnsorted, SecondSorted),
%     merge(Sorted, FirstSorted, SecondSorted).