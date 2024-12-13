dim(3).

#program initial.

pole(a;b;c).
disk(1..N) :- dim(N).

h(on(N), N+1) :- pole(a), disk(N), disk(N+1).
h(on(N), a) :- pole(a), disk(N), dim(N).

action(move(P,Q)) :- pole(P), pole(Q), P!=Q.

h(top(a), 1).
h(top(P), P) :- pole(P), P!=a.

#program always.
%:- h(on(N,a), M), disk(N), disk(M), N>=M.

#program dynamic.
1 {o(A): _action(A)} 1.

3 {h(on(N),M); h(top(Q), N); h(top(P), L)} 3 :- o(move(P, Q)), 'h(top(P), N), 'h(top(Q), M), 'h(on(N), L), _disk(N), P!=Q. %effect axiom

:- o(move(P, Q)), 'h(top(P), N), 'h(top(Q), M), _disk(N), _disk(M), N>M.
:- o(move(P, R)), 'o(move(Q, P)).

% inertia
h(F,V) :- 'h(F,V), not changed(F).
changed(F) :- h(F,V), 'h(F,W), V!=W.

#program final.
:- h(on(N), P), _pole(P), _dim(N), P!=c.
:- h(on(N), P), _pole(P), _dim(N'), N!=N'.
