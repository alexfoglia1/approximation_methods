Capital = 70000;
Interest = 0.002;
N = 25*12;
Import = Capital*(Interest)/(1-(1+Interest)^-N);
[resDebt,intQuote,capQuote] = loantable(Capital,Interest,Import,N);
table = zeros(N+1,3);
for j=1:N+1
    if j<=N
        table(j,1)=resDebt(j);
    end
    table(j,2)=intQuote(j);
    table(j,3)=capQuote(j);
end

x = linspace(0, 25*12, 1 + 25*12);
figure();
plot(x, table(:, 2), 'DisplayName', 'Interest quote')
hold on;
plot(x, table(:, 3), 'DisplayName', 'Capital quote');
plot(x, table(:, 2) + table(:, 3), 'DisplayName', 'Installment');

legend(gca, 'show');

figure();
yy = (table(:, 2) + table(:, 3))
y = zeros(1, N + 1);
for i = 1:length(y)
  y(i) = x(i) * yy(i);
endfor
plot(x, table(:, 1), 'DisplayName', 'Residual debt');
hold on;
plot(x, y, 'DisplayName', 'Cumulative spending');
legend(gca, 'show');
