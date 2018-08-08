function [y] = one_step_fwd(t, y0, h, f)
	y = y0 + h*f(t,y0);
end