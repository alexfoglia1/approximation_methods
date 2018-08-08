dotv = @(t,v) log(abs(sin(t)))*cos(v); % Electric current function
ti = linspace(10,50,400); % Interval of interest
x0 = 2; % v(10) = 2 V
y1 = euler_impl(ti,x0,0.1,400,dotv);
y2 = explrungekutta(x0,ti,dotv);
plot(ti,y1,'DisplayName','Euler');
hold on;
plot(ti,y2,'DisplayName','Runge Kutta');
legend(gca,'show','location','southeast');
