%Lager h-vektor:
h = zeros(1,11);
for i = 0:10
    h(i+1)=0.1*2^(-i);
end

%1 (we only use this to make the table)
f=@(x)1/x;
x0 = 1;

dfdx=@(x)-1/x^2;
%1) 
e1=@(h)(f(x0+h)-f(x0))/h-dfdx(x0);
e2=@(h)(f(x0)-f(x0-h))/h-dfdx(x0);
e3=@(h)(f(x0+h)-f(x0-h))/(2*h)-dfdx(x0);

%Making the table with only 1)
Table = zeros(11,6);
for i=1:2:6;
    switch i
        case 1
            for j = 1:11
                Table(j,i)=abs(e1(h(j)));
                Table(j,i+1)=abs(e1(h(j))/e1(h(j)/2));
            end
        case 3
            for j = 1:11
                Table(j,i)=abs(e2(h(j)));
                Table(j,i+1)=abs(e2(h(j))/e2(h(j)/2));
            end
        case 5
            for j = 1:11
                Table(j,i)=abs(e3(h(j)));
                Table(j,i+1)=abs(e3(h(j))/e3(h(j)/2));
            end
    end
end

%Showing the table
Table
    
%Convergence plots

loglog(h,Table(:,1),'o-')
hold on
loglog(h,Table(:,3),'o-')
loglog(h,Table(:,5),'o-')
loglog(h,0.5*h,'-')
loglog(h,h.^2*0.5,'--')
hold off
