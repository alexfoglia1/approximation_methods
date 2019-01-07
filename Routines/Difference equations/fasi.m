plot(0);
hold all;
lambda_1 = -0.5;
lambda_2 = -0.75;
for i=1:100
  y0 = 1;
  A = [lambda_1,0;
      0,lambda_2];
  k = lambda_1/lambda_2;
  tspan = linspace(-10,10,100);
  f1 = @(t,y) lambda_1*y;
  f2 = @(t,y) lambda_2*y;
  [ti,y1] = ode45(f1,tspan,y0);
  [ti,y2] = ode45(f2,tspan,y0);
  plot(y2,y1);
  inc = 0.1;
  lambda_1 = lambda_1 +inc;
  lambda_2 = lambda_2 +inc;
 end