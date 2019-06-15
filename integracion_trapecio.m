clc
clear
function integral=integral(a,b,n)
  x=linspace(-1,1,n);
  h=x(2)-x(1);
  f=e.^(-x.^2/2)/sqrt(2*pi);
  f;
  f_sig=f;
  f_sig(1)=[];
  f(end)=[];
  f;
  f_sig;
  integral=sum(f_sig+f)*h/2;
endfunction

a=-1;   b=1; 
disp("\n");
integral_5=integral(a,b,5)
disp("\n");
integral_10=integral(a,b,10)
disp("\n");
integral_20=integral(a,b,20)

analitica=inline('e.^(-x.^2/2)/sqrt(2*pi)')
integral_analitica=quad(analitica,a,b)
n=2;
error=1;
while(error>0.0001)
error=abs(integral(a,b,n+1)-integral_analitica);
n=n+1;
end
integral(a,b,n+1)
error
n