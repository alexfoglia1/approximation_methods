a=0.9;
b=2;
c=1;
d=2;
xi=1.6;
eta=1.4;
x0=5;
y0=2.5;
[ySol,xSol,tsol]=arms(a,b,c,d,xi,eta,x0,y0,0,15,0.01);
plot(tsol,ySol);
hold on;
plot(tsol,xSol);
grid on;
legend('ySol','xSol','Location','best')