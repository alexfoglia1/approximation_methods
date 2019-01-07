function [t,y] = implexpl(f,t0,y0,h,T,ai,bi)
    if T<t0(1)
        error('Last abscissa is less than the first');
    elseif length(t0)~=length(y0)
        error('Length of t0 is different from length of y0');
    elseif length(ai)~=length(bi)
        error('Length of ai is different from length of bi');
    elseif length(ai)~=length(t0)+1
        error('Length of ai and bi is different from length of y0 and t0 +1');
    elseif sum(ai)>0.00001
        warning('Sum of ai is not equal to 0.'+ ...
            'this will lead to an unconsistant result');
    elseif ai(end)==0
        error('last ai cannot be zero');
    end
    implicit = 0;
    if bi(end) ~= 0
        implicit = 1;
    end
    n = ceil((T-t0(1))/h);
    t = NaN*ones(1,n+1);
    y = zeros(1,n+1);
    s1 = length(ai) -1;
    dim = length(t0);
    y(1:s1) = y0;
    t(1:s1) = t0;
    last_t = s1;
    k = 1;
    while t(last_t)<T
        act_t = t(k:last_t);
        act_y = y(k:last_t);
        if implicit == 1
            [next_t,next_y] = impl(f,act_t,act_y,h,ai,bi,s1,dim);
        else
            [next_t,next_y] = expl(f,act_t,act_y,h,ai,bi,s1);
        end
        y(last_t+1) = next_y;
        t(last_t+1) = next_t;
        last_t = last_t+1;
        k = k +1;
    end
end

function [t,y] = expl(f,act_t,act_y,h,ai,bi,steps)
    cl1 = 0;
    for j = 1:steps
        cl1 = cl1 + bi(j)*f(act_t(j),act_y(j));
    end
    cl2 = 0;
    for j = 1:steps
        cl2 = cl2 + ai(j) * act_y(j);
    end
    y = ((h*cl1)-cl2) / ai(end);
    t = act_t(end) + h;
end

function [t,y] = impl(f,act_t,act_y,h,ai,bi,steps,dim)
    cl1 = 0;
    for j = 1:steps
        cl1 = cl1 + bi(j)*f(act_t(j),act_y(j));
    end
    cl2 = 0;
    for j = 1:steps
        cl2 = cl2 + ai(j) * act_y(j);
    end
    cl = ((h*cl1)-cl2)/ai(end);
    w = act_y(end);
    J = numjacobian(f,act_t,act_y);
    lastbi = bi(end);
    lastai = ai(end);
    new_abscissa = act_t(end) + h;
    ed = eye(dim);
    ratio = lastbi/lastai;
    ratio = ratio *J;
    to_subtract = h*ratio;
    mtos = zeros(dim,dim);
    for i=1:length(to_subtract)
      mtos(i,1)=to_subtract(i);
    endfor
    to_subtract = mtos;
    A = ed-to_subtract;
    A = inv(A);
    B = w - h* ( (lastbi)*f( new_abscissa,w ) ) - cl;
    C = -A*B;
    tol = 10^-10;
    itmax = 1000;
    it = 0;
    while norm(C) > tol && it < itmax
        B = w - h* ( (lastbi)*f( new_abscissa,w ) ) - cl;
        C = -A*B;
        w = w + C;
        it = it+1;
    end
    if it == itmax
        warning("Reached max iteration");
    end
    y = w(1,1);
    t = new_abscissa;
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