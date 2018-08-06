function [yn] = multistep(ai,bi,init_conds,mesh,f)
    if bi(length(bi)) ~= 0
        disp('last beta_i must be equal to 0');
        return;
    end
    N = length(mesh);
    k = length(init_conds);
    h = mesh(2)-mesh(1);
    yn = zeros(1,N);
    yn(1:k)=init_conds(1:k);
    n = k;
    while n<=N-k
        s = 1;
        while s <= k
            comb_lin1 = 0;
            for i=s:-1:1
                comb_lin1 = comb_lin1 + ai(i)*yn(n+s-i);
            end
            comb_lin2 = 0;
            current_abs_index = n+s-1;
            for i=1:k
                betai = bi(k-i+1);
                act_mesh=mesh(current_abs_index);
                act_y = yn(current_abs_index);
                next_elem = betai*f(act_mesh,act_y);
                comb_lin2 = comb_lin2+next_elem;
                current_abs_index = current_abs_index -1;
            end
            yn(n+s)  = -comb_lin1 + h * comb_lin2;
            s = s+1;       
        end
        n = n+k;
    end
end


