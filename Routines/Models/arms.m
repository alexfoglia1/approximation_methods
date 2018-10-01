function [xsol,ysol] = arms(a,b,c,d,xi,eta,x0,y0)
    syms x(t) y(t)
    A=[-a, b;
        c, -d];
    Y = [x;y];
    B = [xi;eta];
    odes = diff(Y) == A*Y + B;
    C = Y(0) == [x0;y0];
   [xsol(t),ysol(t)]=dsolve(odes,C);
   xsol(t) = simplify(xsol(t));
   ysol(t) = simplify(ysol(t));
end

