function [S] = stirling(n)
S=zeros(n);
for i=1:n
    for j=1:i
        S(i,j) = getStirling(i,j);
    end
end
end

