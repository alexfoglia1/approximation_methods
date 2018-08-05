[pnStable,snStable,dnStable,sfun,dfun] = coweb(100,0.15,10,0.10,400,10);
hold all;
x = 280:440;
sx = sfun(x);
dx = dfun(x);
plot(sx,'DisplayName','S');
plot(dx,'DisplayName','D');
legend(gca,'show','Location','southeast');


