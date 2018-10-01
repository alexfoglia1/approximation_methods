fun = @(t,y) 10*y-2*y^2;
FUN = @(t) 5/(1+4*exp(-10*t));
intval = linspace(0,2.5,125/2);
t0 = 0;
tf = 2.5;
h = intval(2)-intval(1);
N = length(intval);
real_values =zeros(1,length(intval));
for i=1:length(intval)
    real_values(i)=FUN(intval(i));
end
y0 = 1;
euler_ai = [-1;1];
euler_bi = [1;0];
[euler,ti]=linear_multistep(fun,t0,y0,h,tf,euler_ai,euler_bi);
hold on;
plot(ti,euler,'DisplayName','Euler');
plot(intval,real_values,'DisplayName','Exact solution');
legend(gca,'show','Location','southwest');