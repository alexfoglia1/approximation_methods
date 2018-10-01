function [yn] = multistep(ai,bi,init_conds,intval,f)
    lbi = length(bi);
    impl = false;
    if bi(lbi) ~= 0
        impl = true;
    end
    N = length(intval);
    k = length(init_conds);
    lai = length(ai);
    if lai ~= lbi
        disp('alpha_i and beta_i cannot have different sizes');
        return;
    end
    if lai ~= k+1
        disp('alpha_i and beta_i must have dimension k+1\n');
        disp('where k is the length of initial conditions\n');
        return;
    end
    if N < k
        disp('mesh size is too small for the chosen number of steps');
        return;
    end
    intval = sort(intval);
    h = intval(2)-intval(1);
    yn = zeros(1,N);
    yn(1:k)=init_conds(1:k);
    n = k;
    while n<N
        known_yn  = yn(n:-1:n-k+1);
        comb_lin1 = comblin(known_yn,ai(2:length(ai)));
        known_yn1 = yn(n+1-k:n+1);
        tn = intval(n+1-k:n+1);
        fn = zeros(1,k+1);
        for i=1:k+1
            fn(i)=f(tn(i),known_yn1(i));
        end
        if impl
            fn(k+1) = impl_step(tn(k+1),yn(n),h,f);
        end
        comb_lin2 = comblin(fn,bi);
        yn(n+1)  = (comb_lin1 + h * comb_lin2)/-ai(1);
        n = n+1;
    end
end

function [

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

