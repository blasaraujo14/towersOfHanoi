#program initial.

% number of disks
dim(3).

% defining disks and poles
pole(a;b;c).

disk(1..N) :- dim(N).

% initially, disks are located on pole a in ascending order of size
h(on(N), N+1) :- pole(a), disk(N), disk(N+1).
h(on(N), a) :- pole(a), disk(N), dim(N).

% tops of poles, an empty pole has itself as its top
h(top(a), 1).
h(top(P), P) :- pole(P), P!=a.

#program final.
% biggest disk is on pole c
:- h(on(N), P), _pole(P), _dim(N), P!=c.
% no smaller disk than biggest one is on any pole
:- h(on(N), P), _pole(P), _dim(N'), N<N'.
