function [ro,sigma] = lmf( tipo, k )
%
%  [ro,sigma] = lmf( tipo, k )     Calcola i polinomi ro e sigma del metodo 
%                                  lmf a k passi specificato dal tipo:
%
%                                   0 : BDF
%                                   1 : Adams-Moulton
%                                   2 : Adams-Bashforth
%
if tipo==0     % BDF
    sigma = [1 zeros(1,k)];
    b     = [0:k].*[k.^[0:k]]/k;
    ro    = vsolve(k:-1:0,b);
elseif tipo==1 % Adams-Moulton
    ro    = [1 -1 zeros(1,k-1)];
    j     = [1:k+1];
    b     = (k.^j-(k-1).^j)./j;
    sigma = vsolve( k:-1:0, b );
elseif tipo==2 % Adams-Bashforth
    ro    = [1 -1 zeros(1,k-1)];
    j     = [1:k];
    b     = (k.^j-(k-1).^j)./j;
    sigma = [0 vsolve( k-1:-1:0, b )];
else
    disp('   tipo invalido!'), disp(' '), 
    help lmf, ro=[]; sigma=[];
end
return


function f = vsolve( x, b )
%
%     f = vsolve( x, b )      Risolve il sistema lineare W(x) f = b,
%                             dove  W(x)  e' la Vandermonde definita
%                             dagli elementi del vettore x.
%
f = b;
n = length( x )-1;
for k = 1:n
  for i = n+1:-1:k+1
    f(i) = f(i) - x(k)*f(i-1);
  end
end
for k = n:-1:1
  for i = k+1:n+1
    f(i) = f(i)/( x(i) - x(i-k) );
  end
  for i = k:n
    f(i) = f(i) - f(i+1);
  end
end
return
