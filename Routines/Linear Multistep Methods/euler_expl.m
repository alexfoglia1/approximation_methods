function [approx_values] = euler_expl(abscisse,x0,step_size,n_steps,fun)
	approx_values = zeros(1,n_steps);
	approx_values(1) = x0;
	for i = 0:n_steps-2
		h = step_size;
		ti = abscisse(i+1);
		yi = approx_values(i+1);
		fi = fun(ti,yi);
		approx_values(i+2) = yi + h * fi;
	end 
end