function [yn] = explrungekutta(y0,intval,f)   
    N = length(intval);
    h = intval(2)-intval(1);
    yn = zeros(1,N); 
    yn(1) = y0;                                       
    for i=1:N-1
        Y1 = f(intval(i),yn(i));
        Y2 = f(h/2+intval(i),yn(i)+h/2*Y1);
        Y3 = f(h/2+intval(i),yn(i)+h/2*Y2);
        Y4 = f(intval(i)+h,yn(i)+h*Y3);
        yn(i+1) = yn(i) + (h/6)*(Y1+2*Y2+2*Y3+Y4);
    end
end