function rho = rhoSOR(A, omega)
%  Calculate rho(T_omega) for a given omega,
%  where T_omega is the iteration matrix of SOR. 

D = diag(diag(A));
L = -tril(A, -1);
U = -triu(A, 1);

T = (D - omega * L) \ ((1 - omega) * D + omega * U);

rho = max(abs(eig(T)));

end