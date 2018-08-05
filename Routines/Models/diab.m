function [G] = diab(opt,A,m1,m2,m3,m4,phi,maxt,measures)
abscissa = linspace(0,maxt,measures);
N=length(abscissa);
beta = sqrt(m1*m4+m2*m3);
alpha = (m1+m4)/2;
omega = sqrt(beta^2-alpha^2);
G=zeros(1,N);
for i=1:N
    G(i)=opt+A*exp(-alpha*abscissa(i))*cos(omega*abscissa(i)+phi);
end
end

