function [y,t] = linear_multistep(f,t0,y0,h,tf,ai,bi)
    [n,m] = size(ai);
    [s,t] = size(bi);
    if m~=1 || t~=1
        error('alpha_i and beta_i must be column vectors');
    elseif n~=s
        error('alpha_i and beta_i must be equally length');
    elseif tf<=t0
        temp = tf;
        tf = t0;
        t0 = temp;
    end
    s1 = s-1;
    n = ceil((tf-t0)/h);
    t = linspace(t0,t0+h*n,n+1)';
    y = zeros(n+1,1);
    fy = zeros(s1,1);
    y(1)=y0;
    for k=0:n-s
        G = @(x) ai(s)*x + (ai(1:s1)'*y(k+1:s1+k)) - ...
            h*(bi(1:s1)'*fy) - h*bi(s)*f(t(s+k),x);
        M = inv(eye(s1) -  h*(bi(1:s1)'*fy));
        y(s+k) = one_step(y(s+k-1),G,M);
        fy(1:s1-1)=fy(2:s1);
        fy(s1)=f(t(s+k),y(s+k));
    end
end

function [y] = one_step(yn,G,M,tol)
    if nargin == 3
        tol = 1.e-5;
    end
    y = yn;
    scal = norm(y)+1;
    Delta = -M*G(y);
    while norm(Delta)/scal > tol
        Delta = -M*G(y);
        y = y + Delta;
    end
        
end