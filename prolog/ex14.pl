% Please give the answer trees for the following queries

append1([],L,L).
append1([H|L1],L2,[H|L3]) :- append1(L1,L2,L3).

append2([H|L1],L2,[H|L3]) :- append2(L1,L2,L3).
append2([],L,L).                                   
     
% ?- append1(X,[3,4],[2,3,4]).
%    Call: (10) append1(_18168, [3, 4], [2, 3, 4]) ? creep
%    Call: (11) append1(_19444, [3, 4], [3, 4]) ? creep
%    Exit: (11) append1([], [3, 4], [3, 4]) ? creep
%    Exit: (10) append1([2], [3, 4], [2, 3, 4]) ? creep
% X = [2] ;
%    Redo: (11) append1(_19444, [3, 4], [3, 4]) ? creep
%    Call: (12) append1(_23826, [3, 4], [4]) ? creep
%    Call: (13) append1(_24590, [3, 4], []) ? creep
%    Fail: (13) append1(_24590, [3, 4], []) ? creep
%    Fail: (12) append1(_23826, [3, 4], [4]) ? creep
%    Fail: (11) append1(_19444, [3, 4], [3, 4]) ? creep
%    Fail: (10) append1(_18168, [3, 4], [2, 3, 4]) ? creep
% false.

% ?- append1(X,[3,4],[2,3,4]).
%    Call: (10) append2(_29804, [3, 4], [2, 3, 4]) ? creep
%    Call: (11) append2(_31086, [3, 4], [3, 4]) ? creep
%    Call: (12) append2(_31850, [3, 4], [4]) ? creep
%    Call: (13) append2(_32614, [3, 4], []) ? creep
%    Fail: (13) append2(_32614, [3, 4], []) ? creep
%    Redo: (12) append2(_31850, [3, 4], [4]) ? creep
%    Fail: (12) append2(_31850, [3, 4], [4]) ? creep
%    Redo: (11) append2(_31086, [3, 4], [3, 4]) ? creep
%    Exit: (11) append2([], [3, 4], [3, 4]) ? creep
%    Exit: (10) append2([2], [3, 4], [2, 3, 4]) ? creep
% X = [2] ;
%    Redo: (10) append2(_29804, [3, 4], [2, 3, 4]) ? creep
%    Fail: (10) append2(_29804, [3, 4], [2, 3, 4]) ? creep
% false.

is_list([]).
is_list([X|L]) :- is_list(L).                      

% ?- is_list(L).
%    Call: (10) is_list(_42458) ? creep
%    Exit: (10) is_list([]) ? creep
% L = [] ;
%    Redo: (10) is_list(_42458) ? creep
%    Call: (11) is_list(_46490) ? creep
%    Exit: (11) is_list([]) ? creep
%    Exit: (10) is_list([_46488]) ? creep
% L = [_] ;
%    Redo: (11) is_list(_46490) ? creep
%    Call: (12) is_list(_50850) ? creep
%    Exit: (12) is_list([]) ? creep
%    Exit: (11) is_list([_50848]) ? creep
%    Exit: (10) is_list([_46488, _50848]) ? creep
% L = [_, _] ;
%    Redo: (12) is_list(_50850) ? creep
%    Call: (13) is_list(_55970) ? creep
%    Exit: (13) is_list([]) ? creep
%    Exit: (12) is_list([_55968]) ? creep
%    Exit: (11) is_list([_50848, _55968]) ? creep
%    Exit: (10) is_list([_46488, _50848, _55968]) ? creep
% L = [_, _, _] .

