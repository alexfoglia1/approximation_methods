function [res] = arms(a,b,c,d,xi,eta,x0,y0,h,T)
    A=[-a,b;
        c,-d];
    res = [x0,y0];
    f = [xi,eta];
    iter = round(T/h);
    for i = 1:iter
        res = res+h*(A*transpose(res)+f);
    end
    app = res(1,:);
    res(1,:)=res(2,:);
    res(2,:)=app;
end

