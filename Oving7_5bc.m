A =  toeplitz([4 -1 0 -1 0 0]);
A(4,3) = 0; A(3,4) = 0;
b = [0; 5; 0; 6; -2; 6];
x0 = zeros(1,6);
omega=1.113;
Nit = 10;

SOR(A, b, omega, x0, Nit)

