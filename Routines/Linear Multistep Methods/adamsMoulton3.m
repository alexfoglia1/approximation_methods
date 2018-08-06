function adamsMoulton3(a, b, alpha, h, f)
    N = (b - a)/h;
    t = @(i) a + (i-1)*h;
    g = @(wFixPoint,w,f,i) w(i) + (h/24)*(9*f(t(i + 1), wFixPoint)...
                    + 19*f(t(i), w(i)) - 5*f(t(i - 1), w(i - 1))...
                    + f(t(i - 2), w(i - 2)));
   
    w = zeros(1, N);
    w(1, 1:3) = alpha; 
    for i = 3:N-1
        wFixPoint = w(i);
        while (abs(wFixPoint-g(wFixPoint,w,f,i))> 1e-10)
                wFixPoint = g(wFixPoint,w,f,i);
                fprintf('\t doing a fixpointiteration... w =%.10f\n',wFixPoint)
        end
        w(i+1) = wFixPoint;    
        fprintf('t = %.2f; w = %.10f\n', t(i+1), w(i+1));
    end
end