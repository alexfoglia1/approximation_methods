fun = @(t,y) 10*y-2*y.^2;
FUN = @(t) 5/(1+4*exp(-10*t));
t0 = 0;
tf = 2.5;
h = 0.005;
N = length(intval);
real_values =zeros(1,length(intval));
y0 = 1;
euler_ai = [-1;1];
euler_bi = [1;0];
midpoint_ai = [-1;0;1];
midpoint_bi = [0;2;0];
[euler,ti]=linear_multistep(fun,t0,y0,h,tf,euler_ai,euler_bi);
for i=1:length(ti)
    real_values(i)=FUN(ti(i));
end
[midpoint,ti]=linear_multistep(fun,[ti(1),ti(2)],...
    [real_values(1),real_values(2)],h,tf,midpoint_ai,midpoint_bi);
hold on;
plot(ti(1:length(ti)-1),euler(1:length(ti)-1),'DisplayName','Euler');
grid on;
plot(ti,midpoint,'DisplayName','Midpoint');
plot(ti,real_values,'DisplayName','Exact solution');
legend(gca,'show','Location','best');