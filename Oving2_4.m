k = 0.25;
omega = 1;
A = .4;

options = odeset('AbsTol',1.e-12,'RelTol', 1.e-12);
[t, y] = ode45(@(t,y)[y(2);A*cos(omega*t)-k*y(2)+y(1).*(1-y(1).^2)],[0,100],[0;0],options);

figure(1)
subplot(4,1,1)
plot(t,y)