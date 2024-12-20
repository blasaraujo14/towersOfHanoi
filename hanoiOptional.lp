% Authors:
% Juan Blas Araujo Fernández
% Marcos Freire Patiño

power(0, 1).
power(T, P) :- T > 0, T <= N, dim(N), power(T - 1, P1), P = P1 * 2.

:- mustmove(P, Q, T), not &tel{T>o(move(P, Q))}.

3 {moveplan(N-1,P,R,Q,M/2,T); mustmove(P,Q,T+M/2); moveplan(N-1,R,Q,P,M/2,T+M/2+1)} 3 :- moveplan(N,P,Q,R,M,T), N!=1.
mustmove(P,Q,T) :- moveplan(1,P,Q,R,M,T).

moveplan(N,a,c,b,M-1,1) :- dim(N), power(N, M).
