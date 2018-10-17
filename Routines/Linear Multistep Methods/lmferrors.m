comparelmf;
close all;
error_euler = abs(real_values(1:length(real_values)-1)'-euler(1:length(real_values)-1));
error_midpoint = abs(real_values'-midpoint);
plot(error_euler,'DisplayName','Euler Error');
hold on;
grid on;
legend(gca,'show','Location','best');