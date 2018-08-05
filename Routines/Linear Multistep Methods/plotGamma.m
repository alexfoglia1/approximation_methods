method=input('insert method to use\n');
if method<0 || method > 2
    disp ('unvalid method');
    return;
end
steps=input('insert max number of steps\n');
theta0=input('insert theta initial value\n');
hold all;
for j=1:steps
    q=boundaryLocus(theta0,j,method);
    plot(q,'DisplayName',['number of steps = ' num2str(j)]);
    if method==0
        strm="BDF";
    elseif method==1
        strm="Adams Moulton";
        axis([-6 1 -5 5]);
    else
        strm="Adams Bashforth";
    end
    title(['Boundary Locus for LMF method ' strm]);
end
legend(gca,'show','Location','southeast');

