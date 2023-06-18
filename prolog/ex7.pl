% Assume the following predicates are given.
q1(X,Y) :- p(X,Y).                
q1(X,Y) :- p(X,Z), q1(Z,Y).    

% Krok 1:
%   q1
%   |
%   p
%  / \
% X   Y

% Krok 2:
%    q1
%    |
%    p
%   / \
%  X   Z
%       |
%       q1
%       |
%       p
%      / \
%     Z   Y


q2(X,Y) :- p(X,Z), q2(Z,Y).
q2(X,Y) :- p(X,Y).  

% Krok 1:
%    q2
%    |
%    p
%   / \
%  X   Z
%      |
%      q2
%      |
%      p
%     / \
%    Z   Y

% Krok 2:
%    q2
%    |
%    p
%   / \
%  X   Y

q3(X,Y) :- p(X,Y).                
q3(X,Y) :- q3(X,Z), p(Z,Y). 

% Krok 1:
%    q3
%    |
%    p
%   / \
%  X   Y

% Krok 2:
%       q3
%       |
%       q3
%       |
%       p
%      / \
%     X   Z
%          |
%          p
%         / \
%        Z   Y

q4(X,Y) :- q4(X,Z), p(Z,Y).  
q4(X,Y) :- p(X,Y).

% Krok 1:
%    q4
%    |
%    q4
%    |
%    p
%   / \
%  X   Z
%      |
%      p
%     / \
%    Z   Y

% Krok 2:
%    q4
%    |
%    p
%   / \
%  X   Y

p(tom,bob).
p(tom,liz).
p(liz,ann).
p(bob,ann).      
p(bob,pat).     
p(pat,jim).

%          tom
%         /   \
%       bob   liz
%      /   \  / 
%   pat     ann 
%    |
%   jim

% Using answer trees please show how Prolog answers to the following questions: ?-qi(tom,pat). and ?-qi(liz,jim) for i = 1, ... 4.

% ?- q1(tom,pat).
% true
% ?- q2(tom,pat).
% ?- q3(tom,pat).                    
% ?- q4(tom,pat).

% ?- q1(liz,jim).
% false
% ?- q2(liz,jim).
% false
% ?- q3(liz,jim).
% ERROR: Out of local stack
% ?- q4(liz,jim).
% ERROR: Out of local stack
