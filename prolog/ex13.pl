% Please give the answer trees for the following queries. Which answers gives Prolog?

s(X) :- p(X), r(X).
s(X) :- q(X).
p(a).   
q(a).   
r(a).
p(b).  
q(c).   
r(b).                        

% % ?- s(X).
%    Call: (10) s(_11240) ? creep
%    Call: (11) p(_11240) ? creep
%    Exit: (11) p(a) ? creep
%    Call: (11) r(a) ? creep
%    Exit: (11) r(a) ? creep
%    Exit: (10) s(a) ? creep
% X = a ;
%    Redo: (11) p(_11240) ? creep
%    Exit: (11) p(b) ? creep
%    Call: (11) r(b) ? creep
%    Exit: (11) r(b) ? creep
%    Exit: (10) s(b) ? creep
% X = b ;
%    Redo: (10) s(_11240) ? creep
%    Call: (11) q(_11240) ? creep
%    Exit: (11) q(a) ? creep
%    Exit: (10) s(a) ? creep
% X = a ;
%    Redo: (11) q(_11240) ? creep
%    Exit: (11) q(c) ? creep
%    Exit: (10) s(c) ? creep
% X = c.

q(X) :- p(X), r(X).
p(a).
r(a).
r(f(Y)) :- r(Y).                             

% ?- r(Z).  and  ?- q(Z).
%    Call: (11) r(_1232) ? creep
%    Exit: (11) r(a) ? creep
%    Call: (11) q(a) ? creep
%    Call: (12) p(a) ? creep
%    Exit: (12) p(a) ? creep
%    Call: (12) r(a) ? creep
%    Exit: (12) r(a) ? creep
%    Exit: (11) q(a) ? creep
% Z = a .


p(X,Z) :- q(X,Y), p(Y,Z).
p(X,X).
q(a,b).                                      

% % ?- p(X,b). 
%    Call: (10) p(_26732, b) ? creep
%    Call: (11) q(_26732, _27914) ? creep
%    Exit: (11) q(a, b) ? creep
%    Call: (11) p(b, b) ? creep
%    Call: (12) q(b, _30178) ? creep
%    Fail: (12) q(b, _30178) ? creep
%    Redo: (11) p(b, b) ? creep
%    Exit: (11) p(b, b) ? creep
%    Exit: (10) p(a, b) ? creep
% X = a ;
%    Redo: (10) p(_26732, b) ? creep
%    Exit: (10) p(b, b) ? creep
% X = b.
