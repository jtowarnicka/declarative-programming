% Prolog

% run with: swipl -s example.pl or in swipl shell consult('example.pl').
% - A fact/rule (statement) ends with “.” and white space ignored
% - read :- after rule head as “if”. Read comma in body as “and”, ";" as “or”
% - Comment a line with % or use /* */ for multi-line comments
% - Use “halt.” to exit Prolog

length([], 0).
length([_|T], N) :- length(T, N1), N is N1 + 1.

:- write('Hello World!'), nl.

