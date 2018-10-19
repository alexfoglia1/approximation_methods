fun = @(t,y) 10*y-2*y.^2;
FUN = @(t) 5/(1+4*exp(-10*t));
tf = 3;
h = 0.01;
ai = LMMCoefficients.BDF6A;
bi = LMMCoefficients.BDF6B;
leny0 = length(ai)-1;
t0 = zeros(1,leny0);
y0 = zeros(1,leny0);
t0(1)=0;
y0(1)=1;
for i=2:leny0
    t0(i)=t0(i-1)+h;
    y0(i)= FUN(t0(i));
end
[ti,appr]=implexpl(fun,t0,y0,h,tf,ai,bi);
n = length(ti);
real_values = zeros(1,n);
for i=1:n
    real_values(i)=FUN(ti(i));
end
hold on;
plot(ti,appr,'DisplayName','Approximation');
grid on;
plot(ti,real_values,'DisplayName','Exact solution');
legend(gca,'show','Location','best');