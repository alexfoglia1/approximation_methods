function [v] = vandermonde(x0)
n=length(x0);
v=zeros(n,n);
for i=1:n
    for j=1:n
        v(i,j)=x0(j)^i;
    end
end
end

