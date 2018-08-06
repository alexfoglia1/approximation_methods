C = 10000;
interest=0.05;
N=100;
hold all;
for i=1:5
    ratei=loan(C,460+(i-1)*20,interest,N);
    plot(ratei,'DisplayName',['installment amount = ' num2str(460+(i-1)*20)]);
end
legend(gca,'show','Location','northwest');