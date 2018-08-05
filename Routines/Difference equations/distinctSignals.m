function [yn] = distinctSignals(n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if n==1 || n==2
    yn=n;
else
    yn=distinctSignals(n-1)+distinctSignals(n-2);
end 

