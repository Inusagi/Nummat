function T = eig_qr(A, iter, Q)
if (nargin == 3)
    T = Q' * A * Q;
end
for n = 1:iter
    [Q R] = qr(T);
    T = R * Q;

%adding som comments
t = 3;

end
end

