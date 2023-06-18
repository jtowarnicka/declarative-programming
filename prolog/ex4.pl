% Please define a predicate latin/2, which transforms Latin numbers into arabic numbers.
% Latin numbers are supposed to be represented by ordinary lists, for example [x,l,v,i,i] denotes 47.

digit(i, 1).
digit(v, 5).
digit(x, 10).
digit(l, 50).
digit(c, 100).
digit(d, 500).
digit(m, 1000).

latin([], 0).

latin([X], Arabic) :-
    digit(X, Arabic).

latin([X,Y | Rest], Arabic) :-
    digit(X, XVal),
    digit(Y, YVal),
    XVal < YVal,
    latin([Y | Rest], RestArabic),
    Arabic is RestArabic - XVal.

latin([X,Y | Rest], Arabic) :-
    digit(X, XVal),
    digit(Y, YVal),
    XVal >= YVal,
    latin([Y | Rest], RestArabic),
    Arabic is RestArabic + XVal.

% ?- latin([x, l, v, i, i], Arabic).
% Arabic = 47 

% XVal = 10, YVal = 50, RestArabic - 10
% latin ([l, v, i, i], RestArabic - 10)
% XVal = 50, YVal = 5, RestArabic - 10 + 50
% latin ([v, i, i], RestArabic - 10 + 50)
% XVal = 5, YVal = 1, RestArabic - 10 + 50 + 5
% latin ([i, i], RestArabic - 10 + 50 + 5)
% XVal = 1, YVal = 1, RestArabic - 10 + 50 + 5 + 1
% latin ([i], RestArabic - 10 + 50 + 5 + 1)
% XVal = 1, YVal = 1, RestArabic - 10 + 50 + 5 + 1 + 1
% latin ([], RestArabic - 10 + 50 + 5 + 1 + 1)
% RestArabic - 10 + 50 + 5 + 1 + 1 = 0
% RestArabic = 47