P = [4 0 0; 0 6 0; 0 0 -4];
N = [-1 -1 1; 2 1 -1; -1 1 -1];
b = [2 -1 4]';

B = inv(P)*N;

linsolve(P-N,b)