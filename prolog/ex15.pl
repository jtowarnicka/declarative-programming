% Using answer trees please show, how Prolog answers to the following queries.

p(X) :- a(X).
p(X) :- b(X), c(X), !, d(X).
p(X) :- f(X).                       
a(1).     
b(1).     
c(1).
b(2).     
c(2).     
d(2).
f(3).

% ?- p(x). 
%    Call: (10) p(_11240) ? creep
%    Call: (11) a(_11240) ? creep
%    Exit: (11) a(1) ? creep
%    Exit: (10) p(1) ? creep
% X = 1 ;
%    Redo: (10) p(_11240) ? creep
%    Call: (11) b(_11240) ? creep
%    Exit: (11) b(1) ? creep
%    Call: (11) c(1) ? creep
%    Exit: (11) c(1) ? creep
%    Call: (11) d(1) ? creep
%    Fail: (11) d(1) ? creep
%    Fail: (10) p(_11240) ? creep
% false.


p(1). 
p(2) :- !.
p(3).

% ?- p(x).       
%    Call: (10) p(_17314) ? creep
%    Exit: (10) p(1) ? creep
% X = 1 ;
%    Redo: (10) p(_17314) ? creep
%    Exit: (10) p(2) ? creep
% X = 2.

% ?- p(x), p(y).    
%    Call: (11) p(_30358) ? creep
%    Exit: (11) p(1) ? creep
%    Call: (11) p(_30362) ? creep
%    Exit: (11) p(1) ? creep
% X = Y, Y = 1 ;
%    Redo: (11) p(_30362) ? creep
%    Exit: (11) p(2) ? creep
% X = 1,
% Y = 2 ;
%    Redo: (11) p(_30358) ? creep
%    Exit: (11) p(2) ? creep
%    Call: (11) p(_30362) ? creep
%    Exit: (11) p(1) ? creep
% X = 2,
% Y = 1 ;
%    Redo: (11) p(_30362) ? creep
%    Exit: (11) p(2) ? creep
% X = Y, Y = 2.

% ?- p(x), !, p(y). 
%    Call: (11) p(_17556) ? creep
%    Exit: (11) p(1) ? creep
%    Call: (11) p(_17560) ? creep
%    Exit: (11) p(1) ? creep
% X = Y, Y = 1 ;
%    Redo: (11) p(_17560) ? creep
%    Exit: (11) p(2) ? creep
% X = 1,
% Y = 2.
