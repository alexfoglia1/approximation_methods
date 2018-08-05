function [yn] = loan(C,r,i,N)
yn=zeros(1,N);
yn(1)=C;
for j=2:N
    yn(j)=(1+i)*yn(j-1) - r;
end
end

