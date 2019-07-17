


clear
clc

%----- solucion EDO  metodo euler-----


h=0.5;
y=1;
z=1;
t=0;
n=5;


function yprima=f(t,y,z)
  yprima= z;             %z;
endfunction

function zprima=g(t,y,z)
  zprima= -2*t*z-t*y;                %0.5*z-0.15*y;
endfunction


for i=1:n
  variables=[t,y,z]
  K1=h*f(t,y,z);
  L1=h*g(t,y,z);
  K2=h*f(t+h/2, y+K1/2,z+L1/2);
  L2=h*g(t+h/2, y+K1/2,z+L1/2);
  K3=h*f(t+h, y-K1+2*K2,z-L1+2*L2);
  L3=h*g(t+h, y-K1+2*K2,z-L1+2*L2);
  t=t+h;
  constantes=[K1,L1,K2,L2,K3,L3]
  y=y+(K1+4*K2+K3)/6;
  z=z+(L1+4*L2+L3)/6;
endfor  

