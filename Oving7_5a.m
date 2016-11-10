A =  toeplitz([4 -1 0 -1 0 0]);
A(4,3) = 0; A(3,4) = 0;
b = [0; 5; 0; 6; -2; 6];

N = 1000;
omega = linspace(0,2,N);
rhoB = zeros(1,N);
for i=1:N
    rhoB(i) = rhoSOR(A, omega(i));
end

plot(omega,rhoB)
fprintf('Optimal omega = %1.4f\n',omega(find(rhoB==(min(rhoB)))))