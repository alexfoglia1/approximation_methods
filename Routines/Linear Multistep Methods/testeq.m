lambda = -0.1;
h = 0.1;
f = @(t,y) lambda*y;
ai = LMMCoefficients.AB1A;
bi = LMMCoefficients.AB1B;
t0 = 0;
T = 100;
y0 = 5;
[ti,euler] = implexpl(f,t0,y0,h,T,ai,bi); 
[ti,runge] = ode45(f,ti,y0);
plot(ti,euler,'DisplayName',['Explicit Euler q = ' num2str(h*lambda)]);
hold on;
plot(ti,runge,'DisplayName','Built in RK');
legend(gca,'show','Location','northeast');