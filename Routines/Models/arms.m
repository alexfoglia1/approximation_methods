function [xsol,ysol,tsol] = arms(a,b,c,d,xi,eta,x0,y0,t0,tf,h)
   xt = @(t,x,yt) -a*x+ + b*yt + xi;
   yt = @(t,y,xt) c*xt - d*y + eta;
   [xsol,ysol,tsol] = expliciteuler(xt,yt,h,x0,y0,t0,tf);
end

function [xn,yn,tn] = expliciteuler(f,g,h,x0,y0,t0,tf)
    N = 1+((tf-t0)/h);
    tn = linspace(t0,tf,N);
    xn = zeros(1,N);
    yn = zeros(1,N);
    xn(1) = x0;
    yn(1) = y0;
    for i=2:N
        xn(i) = xn(i-1) + h*f(tn(i-1),xn(i-1),yn(i-1));
        yn(i) = yn(i-1) + h*g(tn(i-1),yn(i-1),xn(i-1));
    end
end
