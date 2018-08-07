function [yn] = multistep(ai,bi,init_conds,mesh,f)
    lbi = length(bi);
    if bi(lbi) ~= 0
        disp('last beta_i must be equal to 0');
        return;
    end
    N = length(mesh);
    k = length(init_conds);
    lai = length(ai);
    if lai ~= lbi
        disp('alpha_i and beta_i cannot have different sizes');
        return;
    end
    if lai ~= k+1
        disp('alpha_i and beta_i must have dimension k+1');
        return;
    end
    if N < k
        disp('mesh size is too small for the chosen number of steps');
        return;
    end
    mesh = sort(mesh);
    h = mesh(2)-mesh(1);
    yn = zeros(1,N);
    yn(1:k)=init_conds(1:k);
    n = k;
    while n<N
        known_yn  = yn(n:-1:n-k+1);
        comb_lin1 = comblin(known_yn,ai(2:length(ai)));
        known_yn1 = yn(n+1-k:n+1);
        tn = mesh(n+1-k:n+1);
        fn = zeros(1,length(tn));
        for i=1:length(fn)
            fn(i)=f(tn(i),known_yn1(i));
        end
        comb_lin2 = comblin(fn,bi);
        yn(n+1)  = (comb_lin1 + h * comb_lin2)/-ai(1);
        n = n+1;
    end
end

function [cl] = comblin(v,alpha)
    n = length(v);
    if n ~= length(alpha)
        disp('vector and coefficients must have same sizes');
        return;
    end
    cl = 0;
    for i = 1:n
        cl = cl+v(i)*alpha(i);
    end
end

