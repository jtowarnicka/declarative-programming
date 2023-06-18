% Assume the following definition of the predicate append is given.
  append([X|L1], L2, [X|L3]) :- append(L1, L2, L3).
  append([], L, L).   
% Using answer trees please show how Prolog answers to the questions
%  ?- append(X, [3,4], [2,3,4]).

% X = 2, L1 = [], L2 = [3,4], L3 = [2|L3].
% append([], L, L).

% [] matches [], so the rule applies.
% Result: X = [2].

% ?- append(X, [3,4], [2,3,4]).

%              append([X|L1], [3,4], [2,3,4])
%              /                           \
% append(L1, [3,4], [3,4])         X = 2, L1 = []

%              append(L1, [3,4], [3,4])
%              /                       \
% append([], [3,4], [3,4])         L1 = []

%              append([], [3,4], [3,4])
%              /                       \
%         [] matches [],              X = 2

