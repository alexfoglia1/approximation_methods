fun = @(t,y) 10*y-2*y^2;
FUN = @(t) 5/(1+4*exp(-10*t));
intval = linspace(0,5,250);
real_values =zeros(1,length(intval));
for i=1:length(intval)
    real_values(i)=FUN(intval(i));
end
y0 = 1;
midpoint_ai = [-1, 0, 1];
midpoint_bi = [0, 2,  0];
euler_ai = [-1,1];
euler_bi = [1,0];
euler=multistep(euler_ai,euler_bi,y0,intval,fun);
midpoint=multistep(midpoint_ai,midpoint_bi,[y0,y0],intval,fun);
hold on;
plot(intval,midpoint,'DisplayName','Midpoint');
plot(intval,euler,'DisplayName','Euler');
plot(intval,real_values,'DisplayName','Real values');
legend(gca,'show','Location','southwest');