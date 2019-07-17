
clear
clc

%----- solucion EDO  metodo Runge Kutta-----

function yprima=sistema (t,y)
  % y1'= y2
  % y2'=y3
  % y3'= 2*y1 + y2 -y3 +e^t
  
  % se define el sistema de ecuaciones de manera matricial
  M=[0,1,0;0,0,1;2,1,-2];
  
  b=[0;0;e.^t];
  
  yprima=M*y+b;
  
endfunction

y=[1;2;0]  % valores iniciales
h=0.5;

t=0;
n=7;

% se asocian las constantes L a y1 , M a y2 y N a y3

for i=1:n
  disp('       t       y1      y2      y3');
  [t,y']  % muestra la variables t y1, y2, y3
  
   
  K1=h*sistema(t,y);            % define un vector general K1= [L1;M1;N1]
  K2=h*sistema(t+h/2,y+K1./2);  % define un vector general K2= [L2;M2;N2]
  K3=h*sistema(t+h/2,y+K2./2);
  K4=h*sistema(t+h,y+K3);
  
 
  y=y+(K1+2.*K2+2.*K3+K4)./6;
  
  t=t+h;
endfor  


