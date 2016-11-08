x1 = 1986:4:2010;
x2 = 0:4:24;
y = [48.771 94.542 146.282 168.744 173.649 136.577 104.354]

c1 = polyfit(x1,y,6);
c2 = polyfit(x2,y,6);

f1 = 0;
f2 = 0;

for i = 1:7
    f1 = f1 + t^(7-i)*c1(i);
    f2 = f2 + t^(7-i)*c2(i);
end

g1 = matlabFunction(f1);
g2 = matlabFunction(f2);

t1 = linspace(1986,2010);
t2 = linspace(0,24);

figure(1)
hold on
plot(t1,g1(t1))
plot(1986+t2,g2(t2))
legend('start at 1986','start at 0')
hold off

%{
condition number
cond(vander(x1))
cond(vander(x2))
%}