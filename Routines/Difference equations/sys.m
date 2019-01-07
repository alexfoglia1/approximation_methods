A = [0.5,0;
     0,0.75]
disp('Eigenvalues of A');
disp(eig(A));
b = [1;1];
equil = (eye(2)-A)^-1*b;
plot(equil(1),equil(2),'o','MarkerFaceColor','r','DisplayName','Discrete Equilibrium Point');
hold on;
yn1 = zeros(1,100);
yn2 = zeros(1,100);
yn1(1)=0;
yn2(1)=0;
for i = 2:length(yn1)
  yn1(i) = A(1,1)*yn1(i-1) + A(1,2)*yn2(i-1) + b(1);
  yn2(i) = A(2,1)*yn1(i-1) + A(2,2)*yn2(i-1) + b(2);
endfor
plot(yn1,'DisplayName','1 Discrete Solution');
plot(yn2,'DisplayName','2 Discrete Solution');
legend(gca,'show','Location','northeast');
