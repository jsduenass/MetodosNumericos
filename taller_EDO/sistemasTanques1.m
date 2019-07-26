
clear
clc

%----- solucion EDO  metodo Runge Kutta-----

function yprima=sistema (t,y)
  % y1'= y2
  % y2'=y3
  % y3'= 2*y1 + y2 -y3 +e^t
  
  % se define el sistema de ecuaciones de manera matricial
  M=[-0.3,0 ,0;  0.3, -0.45, 0.15; 0, 0.45,-0.45];
  
  b=[15;0;0];
  
  yprima=M*y+b;
  
endfunction

y=[30;30;30]  % valores iniciales
h=0.5;
M=[-0.3,0 ,0;  0.3, -0.45, 0.15; 0, 0.45,-0.45]
  
b=[15;0;0]
  
t=0;
n=45;

%      primer sistema
%       t       y1      y2      y3
%     10.000   49.004   44.565   41.840
   
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


