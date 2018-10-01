C=0.01;
while C<3
    dotv = @(t,v) log(abs(sin(t)))*cos(v)/C; % Electric current function
    ti = linspace(10,50,400); % Interval of interest
    x0 = 2; % v(10) = 2 V
    y1 = euler_impl(ti,x0,0.1,400,dotv);
    y2 = explrungekutta(x0,ti,dotv);
    plot(ti,y1,'DisplayName','Euler');
    title(['c = ' num2str(C) 'F']);
    hold on;
    plot(ti,y2,'DisplayName','Runge Kutta');
    legend(gca,'show','location','southeast');
    C = C + 0.01;
    pause(0.01);
    hold off;
end
