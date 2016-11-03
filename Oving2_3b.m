%Number of steps:
N = 10*2.^(0:10);

%Scalar problem {f,interval,initial value(s), exact solution}:
ex1 = {@(t,y)-2*t*y,[0,1],1,@(t)exp(-t.^2)};

%System problem {f,interval,initial value(s), exact solution}:
ex2 = {@(t,y)[-y(2);y(1)],[0,2*pi],[1,0],@(t)[cos(t);sin(t)]};

ex = {ex1,ex2};

%Vector with the methods
met = {'Euler','RK2','exercise2','RK4'};

%Finding the errors:
errors = zeros(length(ex),length(met),length(N));
for i = 1:length(ex)
    for j = 1:length(met)
        for k = 1:length(N)
            [t,y] = erk(ex{i}{1},ex{i}{2},ex{i}{3},N(k),met(j));
            errors(i,j,k) = norm(ex{i}{4}(t(end))-y(:,end),2);
        end
    end
end

%plots:
figure(1)
h = (ex1{2}(2)-ex1{2}(1))./N;
subplot(1,2,1)
hold off
loglog(h,squeeze(errors(1,:,:)),'o-')
hold on
loglog(h,0.5*h,'--')
loglog(h,0.5*h.^2,'--')
loglog(h,0.05*h.^3,'--')
loglog(h,0.005*h.^4,'--')
legend('Euler','RK2','RK3','RK4','h','h^2','h^3','h^4')

h = (ex2{2}(2)-ex2{2}(1))./N;
subplot(1,2,2)
hold off
loglog(h,squeeze(errors(2,:,:)),'o-')
hold on
loglog(h,0.5*h,'--')
loglog(h,0.5*h.^2,'--')
loglog(h,0.05*h.^3,'--')
loglog(h,0.005*h.^4,'--')
legend('Euler','RK2','RK3','RK4','h','h^2','h^3','h^4')

