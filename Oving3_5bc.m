[t, y] = rkbs(@(t,y)[y(1)-y(1)*y(2);y(1)*y(2)-2*y(2)],0,20,[1;2],10^(-5),1/20,0.9);

%5b)
figure(1)
subplot(3,1,1)
plot(t,y)
legend('y1','y2')

subplot(3,1,2)
plot(t(2:end),diff(t))

%5c)
TOL = 2.^(-(0:20));
En = zeros(1,length(TOL));

%Solution
options = odeset('AbsTol', 1e-12, 'RelTol',1e-12);
[~,sol] = ode45(@(t,y)[y(1)-y(1)*y(2);y(1)*y(2)-2*y(2)], [0,20], [1;2],options);

for i = 1:length(TOL)
[~,y] = rkbs(@(t,y)[y(1)-y(1)*y(2);y(1)*y(2)-2*y(2)],0,20,[1;2],TOL(i),1/20,0.9);
En(i)=norm(y(:, end)-sol(end, :)',2);

end

subplot(3,1,3)
plot(0:20,En./TOL,'o-')
