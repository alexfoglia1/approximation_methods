function [xn] = fatalbit (len)
    xn=zeros(1,len);
    xn(1)=1;
	xn(2)=single((1-sqrt(5))/2);
    for i=3:len
         xn(i)=xn(i-1)+xn(i-2);
    end
end
