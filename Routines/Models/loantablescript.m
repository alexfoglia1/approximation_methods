Capital = 100000;
Interest = 0.05;
N = 10;
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
