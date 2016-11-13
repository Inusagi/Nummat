function lambda = eig_power(A, x, iter)

z = A*x;
for i=1:iter
    x = z/norm(z);
    z = A * x;
end

lambda = dot(x,z);