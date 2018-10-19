comparelmf;
close all;
error_euler = abs(real_values-euler);
error_midpoint = abs(real_values-midpoint);
plot(error_euler,'DisplayName','Euler Error');
hold on;
grid on;
legend(gca,'show','Location','best');