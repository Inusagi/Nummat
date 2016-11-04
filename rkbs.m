function [t, y] = rkbs(f, t0, tend, y0, tol, h, P)

N = (tend-t0)/h;
t = zeros(1,N);
y = zeros(length(y0),N);
t(1) = t0; y(:,1) = y0;

tn = t0; yn = y0;

k1 = f(tn,yn);
n = 2;
while tn < tend
    %last step
    if tn + h > tend
        h = tend-tn;
    end
    %one step
    k2 = f(tn + 1/2*h, yn + 1/2*h*k1); k3 = f(tn + 3/4*h,yn + 3/4*h*k2);
    yplus = yn + h*(2/9*k1+1/3*k2+4/9*k3);
    k4 = f(tn+h, yplus);
    zplus = yn + h*(7/24*k1+1/4*k2+1/3*k3+1/8*k4);
    
    %Local error estimate
    LES = norm(yplus-zplus,2);
    if LES < tol
        yn = yplus; tn = tn + h; k1 = k4;
        t(n) = tn; y(:,n) = yn;
        n = n+1;
    end
    
    %Error per step
    h = P*(tol/LES)^(1/3)*h;
end

%Emptying the empty slots
if n-1 < N
    t(n:end)=[]; y(:,n:end)=[];
end

end