
clear
clc

%----- solucion EDO  metodo Runge Kutta-----

function yprima=sistema (t,y)
  % y1'= y2
  % y2'=y3
  % y3'= 2*y1 + y2 -y3 +e^t
  
  % se define el sistema de ecuaciones de manera matricial
  M=[0];
  
  b=[-(pi*0.02^2*sqrt(2*9.8*y))/(pi*y^2/4)];
  
  yprima=M*y+b;
  
endfunction

y=[0.5]  % valores iniciales
t=0;

yf=1; 

n=30000;
h=0.001;

% se asocian las constantes L a y1 , M a y2 y N a y3

for i=1:n
  
  if(y<0.01 )
    
    %disp('       t       y');
    rta=[t,y'];  % muestra la variables t y1, y2, y3
    break;
  endif
    rta=[t,y'];
  K1=h*sistema(t,y);            % define un vector general K1= [L1;M1;N1]
  K2=h*sistema(t+h/2,y+K1./2);  % define un vector general K2= [L2;M2;N2]
  K3=h*sistema(t+h/2,y+K2./2);
  K4=h*sistema(t+h,y+K3);
  
 
  y=y+(K1+2.*K2+2.*K3+K4)./6;
  
  t=t+h;
endfor  
  rta

