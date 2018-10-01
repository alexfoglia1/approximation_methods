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
    F0 = numjacobian(f,t0,y0);
    M = inv(eye(s1) -  h*(bi(s1)'*F0));
    y(1)=y0;
    for k=0:n-s1
        G = @(x) ai(s)*x + (ai(1:s1)'*y(k+1:s1+k)) - ...
            h*(bi(1:s1)'*fy) - h*bi(s)*f(t(s+k),x);
        y(s+k) = one_step(y(s+k-1),G,M);
        fy(1:s1-1)=fy(2:s1);
        fy(s1)=f(t(s+k),y(s+k));
    end
end

function [f0] = numjacobian( fun, t0, y0 )
%
%  NUMERICAL JACOBIAN  (slightly adapted from the code BiM/BiMD).
%  2015.02.12
%
m  = length(y0);
Jf = zeros(m);
f0 = reshape( feval( fun, t0, y0 ), m, 1 );
dd = eps^(1/3);
for i = 1:m
  ysafe = y0(i);
  delt  = sqrt( eps*max(dd,abs(ysafe)) );
  y0(i) = ysafe +delt;
  f1    = feval( fun, t0, y0 );
  Jf(:,i) = ( f1(:) -f0 )/delt;
  y0(i) = ysafe;
end
if nargout>1, f0 = f0.'; end
return
end


function [y] = one_step(yn,G,M,tol,maxit)
    if nargin == 3
        tol = 1.e-5;
        maxit = 1000;
    elseif nargin == 4
        maxit = 1000;
    end
    y = yn;
    scal = norm(y)+1;
    Delta = -M*G(y);
    it = 0;
    while norm(Delta)/scal > tol && it < maxit
        Delta = -M*G(y);
        y = y + Delta;
        it = it+1;
    end
    if it == maxit
        warning('Reached max iteration\n');
    end
end