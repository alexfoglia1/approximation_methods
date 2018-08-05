function [yn] = fatalbit (len)
    xn=zeros(1,len);
    xn(1)=1;
	xn(2)=(1-sqrt(5))/2;
    for i=3:len
         xn(i)=xn(i-1)+xn(i-2);
    end
    yn = zeros(1,len);
    for i=1:len
        yn(i)=log10(abs(xn(i)));
    end
end
