function [nextgen] = leslie(alphai,betai,actgen)
m = length(alphai);
if m ~= length(betai)+1
    error('beta i must be length as alpha i -1');
end
M = zeros(m,m);
for i=1:m
    M(1,i)=alphai(i);
end
for i=2:m
    for j=1:m
        if(i-1 == j)
            M(i,j) = betai(j);
        end
    end
end
nextgen = linsolve (M,actgen);         
end

