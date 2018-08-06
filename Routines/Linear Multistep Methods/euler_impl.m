function [approx_values] = euler_impl(abscisse,x0,step_size,n_steps,fun)
    approx_values = zeros(1,n_steps);
    approx_values(1) = x0;
    for i = 0:n_steps-2
        h = step_size;
		ti = abscisse(i+2);
		yi = approx_values(i+1);
        init_e = one_step_fwd(ti,yi,step_size,fun);
		fi = fun(ti,init_e);
        approx_values(i+2) = yi + h * fi;
    end 
end

function [y] = one_step_fwd(t, y0, h, f)
	y = y0 + h*f(t,y0);
end