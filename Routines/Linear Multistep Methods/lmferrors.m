comparelmf;
close all;
error = abs(real_values-appr);
plot(error,'DisplayName','Error');
hold on;
grid on;
legend(gca,'show','Location','best');