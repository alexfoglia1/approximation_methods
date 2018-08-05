function [yn] = fibonacci(len,y1,y2)
xn=zeros(1,len);
xn(1)=y1;
xn(2)=y2;
for i=3:len
    xn(i)=xn(i-1)+xn(i-2);
end
yn = log10(abs(xn));
end

