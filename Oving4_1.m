% set-up: domain: [-a, a, -b, b]
a = 4; b = 4;
[x, y]=meshgrid(linspace(-a,a), linspace(-b,b));
z = x + i*y;

% Stability regions
R1 = abs(1 + z + 1/2*z.^2+1/6*z.^3);
R2 = abs(1 + z + 1/2*z.^2+3/16*z.^3+1/48*z.^4);

%Lager plots:
figure (1)
subplot(2,1,1)
contourf(x,y,R1,[1 1], 'k')
axis equal, axis([-a a -b b]), grid on
hold on
plot([-a, a],[0,0],'k','LineWidth',1);
plot([0,0], [-a,a], 'k', 'LineWidth',1);

subplot(2,1,2)
contourf(x,y,R2,[1,1], 'k')
axis equal, axis([-a a -b b]), grid on
hold on
plot([-a, a],[0,0],'k','LineWidth',1);
plot([0,0], [-a,a], 'k', 'LineWidth',1);