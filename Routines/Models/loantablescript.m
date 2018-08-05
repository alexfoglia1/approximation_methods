[resDebt,intQuote,capQuote] = loantable(10000,0.05,1406.9,10);
N = 11;
table = zeros(N,3);
table(1,1)=10000;
for j=2:N
    table(j,1)=resDebt(j-1);
end
for i=1:N
    table(i,2)=intQuote(i);
    table(i,3)=capQuote(i);
end