function yn = distinctSignals2(n)
    z1=(1+sqrt(5))/2;
    z2=(1-sqrt(5))/2;
    c1=z1/(sqrt(5));
    c2=-z2/(sqrt(5));
    yn = c1*z1^n+c2*z2^n;
end
