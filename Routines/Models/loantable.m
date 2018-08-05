function [resDebt,intQuote,capQuote] = loantable(C,interest,singleimport,n)
    resDebt = loan(C,singleimport,interest,n);
    intQuote = zeros(1,n+1);
    intQuote(1) = 0;
    intQuote(2) = C*interest;
    for i = 3:n+1
        intQuote(i)=resDebt(i-1)*interest;
    end
    capQuote = zeros(1,n+1);
    capQuote(1) = 0;
    for i = 2:n+1
        capQuote(i) = singleimport-intQuote(i);
    end
end
