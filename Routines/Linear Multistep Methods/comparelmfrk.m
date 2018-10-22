f = @(t,y) 10*y-2*y.^2;
FUN = @(t) 5/(1+4*exp(-10*t));
tf = 2;
h = 0.01;
t0 = [0,h,2*h,3*h];
y0 = [FUN(0),FUN(h),FUN(2*h),FUN(3*h)];
[ti,appr1] = implexpl(f,t0,y0,h,tf,LMMCoefficients.AB4A,LMMCoefficients.AB4B);
[ti,appr2] = implexpl(f,t0,y0,h,tf,LMMCoefficients.AM4A,LMMCoefficients.AM4B);
[ti,appr3] = implexpl(f,t0,y0,h,tf,LMMCoefficients.BDF4A,LMMCoefficients.BDF4B);
real_values = zeros(1,length(ti));
for i =1:length(ti)
    real_values(i)=FUN(ti(i));
end
errorlmf1 = abs(real_values-appr1);
errorlmf2 = abs(real_values-appr2);
errorlmf3 = abs(real_values-appr3);
rk = explrungekutta(FUN(0),ti,f);
errorrk = abs(real_values-rk);
hold on;
grid on;
plot(ti,errorlmf1,'DisplayName','Error Adams Bashforth k = 4');
plot(ti,errorlmf2,'DisplayName','Error Adams Moulton k = 4');
plot(ti,errorlmf3,'DisplayName','Error BDF k = 4');
plot(ti,errorrk,'DisplayName','RK Error');
legend(gca,'show','Location','best');