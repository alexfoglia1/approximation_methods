optimalg = diab(80,30,0.1,1.2,3.3,1.1,-20,10,1000);
badg = diab(140,30,0.1,2,0.125,0.1,-40,10,1000);
plot(optimalg,'DisplayName','Normal glycemic level');
hold on;
grid on;
plot(badg,'DisplayName','Pathologic glycemic level');
legend(gca,'show','Location','best');