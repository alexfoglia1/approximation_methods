function [pn,sn,dn,sfun,dfun] = coweb(d0,a,s0,b,p0,nmax)
    pn = zeros(1,nmax);
    sn = zeros(1,nmax);
    dn = zeros(1,nmax);
    sfun = @(x) b*x+s0;
    dfun = @(x) -a*x+d0;
    diff = (d0-s0);
    pn(1)= p0;
    sn(1)= s0;
    dn(1)= -a*p0+d0;
    for i = 2:nmax
        pn(i) = diff -b*pn(i-1)/a;
        sn(i) = sfun(pn(i-1));
        dn(i) = dfun(pn(i));
    end
end


