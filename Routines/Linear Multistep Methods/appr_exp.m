function [yn] = appr_exp(y0,intval,coeff,tol)
    yn=zeros(1,length(intval));
    yn(1)=y0;
    for i=2:length(intval)
        yn(i)=getnext(y0,intval(i),coeff,tol);
    end
end

function [y1] = getnext(y0,t,coeff,tol)
    y1 = y0*expsum(coeff,t,tol);
end

function [sum] = expsum(coeff,t,tol)
    last_sum = 1;
    next_sum = 0;
    k = 0;
    while abs(last_sum-next_sum) > tol || k>5000
        last_sum = next_sum;
        next_sum = last_sum + coeff^k*t^k / factorial(k);
        k = k+1;
    end
    sum = next_sum;
end

