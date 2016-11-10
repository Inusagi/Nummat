function x = gs(A, b, x0, Nit)
% Solve Ax = b by Gauss-Seidel iteration. 
%  x0: starting value for the iterations. 
% Nit: Number of iterations.

n = length(b); 
x = x0;
for k=1:Nit
    for i=1:n
        t = b(i);
        for j=1:i-1
            t = t - A(i, j) * x(j);
        end
        for j=i+1:n
            t = t - A(i, j) * x(j);
        end
        x(i) = t / A(i, i);
    end
    x
    pause
end
end