function [q] = boundaryLocus(theta0,steps,method)
    if method<0 || method > 2
        disp('metodo non valido\n');
        return;
    end
    theta=linspace(theta0,2*pi+theta0,100);
    [ro,sigma]=lmf(method,steps);
    q=zeros(1,100);
    for j=1:100
        q(j)=polyval(ro,exp(1i*theta(j)))/polyval(sigma,exp(1i*theta(j)));
    end
end

