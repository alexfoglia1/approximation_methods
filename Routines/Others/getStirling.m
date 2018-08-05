function [s] = getStirling(n,k) 
		if (k > n)
			s=0;
        elseif (k == 1 || n == k)
			s=1;
        elseif (k == 0 && n >= 1)
			s=0;
        else
		s=k * getStirling(n - 1, k) + getStirling(n - 1, k - 1);
        end
end