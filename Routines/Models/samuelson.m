function [Y,C,I] = samuelson(alpha,rho,g,y0,y1,nmax)
Y=zeros(1,nmax);
Y(1)=y0;
Y(2)=y1;
C=zeros(1,nmax);
C(1)=alpha*y0;
C(2)=C(1);
I = zeros(1,nmax);
I(1)=0;
I(2)=rho*(C(2)-C(1));
for i=3:nmax
    C(i)=alpha*Y(i-1);
    I(i)=rho*(C(i)-C(i-1));
    Y(i)=C(i)+I(i)+g;
end
end

