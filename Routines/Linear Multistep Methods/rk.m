comparelmf; %inherit y0, fun, ti and real_values
close;
RK = explrungekutta(y0(1),ti,fun);
hold on;
grid on;
plot(ti,real_values,'DisplayName','Exact Solution');
plot(ti,RK,'DisplayName','Runge Kutta');
legend(gca,'show','Location','southeast');