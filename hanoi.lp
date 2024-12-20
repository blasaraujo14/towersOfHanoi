#program initial.

% possible actions
action(move(P,Q)) :- pole(P), pole(Q), P!=Q.

#program always.
% this rule was not needed in the end
%:- h(on(N,a), M), disk(N), disk(M), N>=M.

#program dynamic.

% action selection
1 {o(A): _action(A)} 1.

% effect axiom for moving a disk N from the top of a pole P to the top of another pole Q
3 {h(on(N), M); h(top(Q), N); h(top(P), L)} 3 :- o(move(P, Q)), 'h(top(P), N), 'h(top(Q), M), 'h(on(N), L), _disk(N).

% executability axioms
% cannot move a bigger disk N on top of a smaller one M
:- o(move(P, Q)), 'h(top(P), N), 'h(top(Q), M), _disk(N), _disk(M), N>M.
% do not move a disk two consecutive times, for question 4
:- o(move(P, R)), 'o(move(Q, P)).

% inertia
h(F,V) :- 'h(F,V), not changed(F).
changed(F) :- h(F,V), 'h(F,W), V!=W.
