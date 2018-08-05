function [v] = distinctArray(v1)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    n=length(v1);
    v=zeros(n);
    for i=1:n
        v(i)=distinctSignals2(v1(i));
    end
end

