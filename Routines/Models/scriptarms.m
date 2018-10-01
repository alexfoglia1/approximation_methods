a=0.9;
b=2;
c=1;
d=2;
xi=1.6;
eta=1.4;
x0=5;
y0=0.5;
[ySol,xSol]=arms(a,b,c,d,xi,eta,x0,y0);
fplot(ySol,[0 15])
hold on
fplot(xSol,[0 15])
grid on
legend('ySol','xSol','Location','best')