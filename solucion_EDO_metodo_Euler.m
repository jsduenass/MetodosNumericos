clear
clc

%----- solucion EDO  metodo euler-----
f=1;
h=0.5/f;
y=1;
z=1;
t=0;
n= 5*f-1;

function yprima=f(t,y,z)
  yprima= z;             %z;
endfunction

function zprima=g(t,y,z)
  zprima= -2*t*z-t*y;                %0.5*z-0.15*y;
endfunction


for i=2:n+2;
  t(i)=t(i-1)+h;
  z(i)= z(i-1)+h*g(t(i-1),y(i-1),z(i-1));
  y(i)= y(i-1)+h*f(t(i-1),y(i-1),z(i-1));
  
  
endfor

t
y
z
index=find(t==2);

ysol=y(index)
zsol=z(index)


function [y,z,n]=solucion_EDO(t0,y0,z0,zf)
  disp("EDO");
  n=4;
  t=t0;
  y=y0;
  z=z0;
  
  E=1000;
  do 
    h=(zf-z0)./n;
    yf=y(end);
    for i=2:n+2;
      z(i)= z(i-1)+h*g(y(i-1),z(i-1));
      y(i)= y(i-1)+h*f(y(i-1),z(i-1)); 
    endfor
    E= abs(yf-y(end));
    n=n*2;
    [n,E,y(end),h]
  until(E<0.001 || n>1000)
  
endfunction

%[y,x,n]=solucion_EDO(0,1,1.5);
%n
%y(end)