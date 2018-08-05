fun = @(t,y) cos(t)-1/(2*sqrt(t))+0*y;
FUN = @(t) sin(t)+(1-sqrt(t));
a = input('Insert left extreme of the interval\n');
b = input('Insert right extreme of the interval\n');
nmax = input('Insert max step numbers\n');
n = 1;
if a>b
    temp = a;
    a = b;
    b = temp;
end
x0 = FUN(a);
real_abs = linspace(a,b,10000);
pause on;
while n<=nmax
    abscisse = linspace(a,b,n);
    h = (b-a)/n;
    expl = euler_expl(abscisse,x0,h,n,fun);
    impl = euler_impl(abscisse,x0,h,n,fun);
    exact = FUN(real_abs);
    plot(abscisse,expl,'DisplayName','Explicit Euler');
    hold all;
    strm = num2str(n);
    title(['n steps = ' strm]);
    plot(abscisse,impl,'DisplayName','Implicit Euler');
    plot(real_abs,exact,'DisplayName','Exact Function');
    legend(gca,'show','Location','northwest');
    pause(0.5);
    if n<nmax
        clf;
    end
    n = n + 1;
end

