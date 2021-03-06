function x = SOR(A, b, omega, x0, Nit)
% Solve Ax = b by SOR iteration. 
%  x0: starting value for the iterations. 
% Nit: Number of iterations.

n = length(b); 
x = x0;
%D = diag(diag(A));
%L = tril(A,-1);
%U = triu(A,1);

%B = omega*inv(D+omega*L)*b;
err = zeros(1,Nit);
sol = [1,2,1,2,1,2];
for k=1:Nit
    for i=1:n
        t = b(i);
        for j=1:i-1
            t = t - A(i, j) * x(j);
        end
        for j=i+1:n
            t = t - A(i, j) * x(j);
        end
        x(i) = (1-omega)*x(i) + omega* t / A(i, i);
    end
    x
    err(k)=norm(x-sol,2);
    pause
end
err
fprintf('error: \n')
for i=1:10
    fprintf('%d %1.15f\n',i,err(i))
end
end