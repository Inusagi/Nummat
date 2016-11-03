function [t,y] = erk(f,tint,y0,N,met)
% 
%  [t,y] = erk(f,tint,y0,Nstep,met)
%
%  Solve y'=f(t,y) 
%  Input:
%    f : Function handle for the rhs: yp = f(t,y)
%    tint: [t0,tend], the integration interval
%    y0: Initial values
%    Nstep: Number of steps
%    met: method (Euler, RK2 and RK4)
%  Output:
%    t: Solution points 
%    y: Solution
%
m = length(y0); 
t0 = tint(1);
tend = tint(2);
h = (tend-t0)/N;
t = linspace(t0,tend,N+1);  % Vector of solution points
y = zeros(m,N+1);           % Error to store the solution

y(:,1) = y0; 

if strcmpi(met,'Euler')
    for n=1:N
        y(:,n+1) = y(:,n) + h*f(t(n),y(:,n));
    end
elseif strcmpi(met,'RK2')
    for n=1:N
        yn = y(:,n);
        tn = t(n);
        k1 = f(tn,yn);
        k2 = f(tn+h,yn+h*k1);
        y(:,n+1) = yn + h*0.5*(k1+k2); 
    end
elseif strcmpi(met,'exercise2')
    for n=1:N
        yn = y(:,n);
        tn = t(n);
        k1 = f(tn,yn);
        k2 = f(tn+(h/3),yn+(h/3)*k1);
        k3 = f(tn+(2*h/3),yn+(2*h/3)*k2);
        y(:,n+1) = yn + h*(k1+3*k3)/4;
    end

elseif strcmpi(met,'RK4')
    for n=1:N
        yn = y(:,n);
        tn = t(n);
        k1 = f(tn,yn);
        k2 = f(tn+0.5*h,yn+h*0.5*k1);
        k3 = f(tn+0.5*h,yn+h*0.5*k2); 
        k4 = f(tn+h, yn+h*k3);
        y(:,n+1) = yn + h*(k1+2*k2+2*k3+k4)/6;
    end
end