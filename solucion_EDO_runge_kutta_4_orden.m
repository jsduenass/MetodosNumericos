


clear
clc

%----- solucion EDO  metodo Runge Kutta-----



h=0.5;

t=0;
n=7;
y1=1;
y2=2;
y3=0;

archivo=fopen("data.txt", 'w')

function yprima1=f1(t,y1,y2,y3)
  yprima1= y2;             %z;
endfunction

function yprima2=f2(t,y1,y2,y3)
  yprima2= y3;             %z;
endfunction

function yprima3=f3(t,y1,y2,y3)
  yprima3= 2*y1 + y2 + 2*y3 + e^(t);             %z;
endfunction

for i=1:n
  variables=[t,y1,y2,y3]
  
   fdisp(archivo," t  ,     y1  ,  y2 ,   y3")
   fdisp(archivo,variables)
  K1=h*f1(t,y1,y2,y3);
  L1=h*f2(t,y1,y2,y3);
  M1=h*f3(t,y1,y2,y3);
  
  K2=h*f1(t+h/2,y1+K1/2,y2+L1/2,y3+M1/2);
  L2=h*f2(t+h/2,y1+K1/2,y2+L1/2,y3+M1/2);
  M2=h*f3(t+h/2,y1+K1/2,y2+L1/2,y3+M1/2);
  
  K3=h*f1(t+h/2,y1+K2/2,y2+L2/2,y3+M2/2);
  L3=h*f2(t+h/2,y1+K2/2,y2+L2/2,y3+M2/2);
  M3=h*f3(t+h/2,y1+K2/2,y2+L2/2,y3+M2/2);
  
  K4=h*f1(t+h,y1+K3,y2+L3,y3+M3);
  L4=h*f2(t+h,y1+K3,y2+L3,y3+M3);
  M4=h*f3(t+h,y1+K3,y2+L3,y3+M3);

  constantes=[K1,L1,M1,K2,L2,M2]
  constantes2=[K3,L3,M3,K4,L4,M4]
  fdisp(archivo," K1 , L1,   M1  , K2  , L2  , M2")
  fdisp(archivo,constantes)
  fdisp(archivo," K3, L3  , M3  , K4  , L4  , M4  ")
  fdisp(archivo,constantes2)
  y1=y1+(K1+2*K2+2*K3+K4)/6;
  y2=y2+(L1+2*L2+2*L3+L4)/6;
  y3=y3+(M1+2*M2+2*M3+M4)/6;
 
  
  t=t+h;
endfor  

fclose(archivo)