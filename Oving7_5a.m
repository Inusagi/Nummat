A =  toeplitz([4 -1 0 -1 0 0]);
A(4,3) = 0; A(3,4) = 0;
b = [0; 5; 0; 6; -2; 6];

omega = linspace(0,2);
rhoB = zeros(1,100);
for i=1:100
    rhoB = rhoSOR(A, omega(i));
end

plot(omega,rhoB)