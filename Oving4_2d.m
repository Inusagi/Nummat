% Set-up
M = [-10 -10; 40 -10];
timeint = [0,10];
f=@(t,y) M*y + g(t);
g=@(t) [sin(t); cos(t)];
y0 = [5210/249401; 20259/249401];

%changeable set-ups
N = 100;
h = diff(timeint)/N;
t = linspace(timeint(1),timeint(2),N+1);
y = zeros(2, N+1);
y(:, 1) = y0;

%Making y-vector
for n = 1:N
    y(:, n+1) = (eye(2)-h*M)^(-1)*(y(:,n)+h*g(t(n+1)));
end

%plots
plot(t,y)
legend('y1','y2')