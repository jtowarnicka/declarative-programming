% Suppose the following predicate f/2 is given.
 f(1,one).
 f(s(1),two).
 f(s(s(1)),three).
 f(s(s(s(X))),N) :- f(X,N). 
% How does Prolog answer to the following questions?

% f(s(1),A)?
% two

% f(s(s(1)),two)?
% false.

% f(s(s(s(s(s(s(1)))))),C)?
% C = one.

% Prolog matches the rule f(s(s(s(X))), N) :- f(X, N). 
% by recursively applying the rule until it reaches f(1, one). It then binds C to one.
% f(s(s(s(s(s(s(1)))))), C)
% f(s(s(s(X))), C) :- f(X, C)
% X - 1, C = one.

% f(D,three)?
% D = s(s(1))

% f(D, three) -> f(s(s(1)), three), where D is bind with s(s(1)).
% finds match D = s(s(1)), where D is variable in query and s(s(1)) is a value, which is associated with three
% then returns D = s(s(1)) as a result of % f(D, three)?. 
