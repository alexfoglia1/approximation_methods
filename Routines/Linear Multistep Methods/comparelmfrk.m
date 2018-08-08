comparelmf; %inherit interval and real_values
close;
rk = explrungekutta(y0,intval,fun);
hold on;
plot(intval,real_values,'DisplayName','Exact Solution');
plot(intval,rk,'DisplayName','Runge Kutta');
legend(gca,'show','Location','southeast');