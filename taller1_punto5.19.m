% ------------------------------------------------------------

% Juan Sebastian Dueñas 
% Maria Alejandra Arias

% ------------------------------------------------------------

clc
clear
close("all");

% ------- APROXIMACION POLINOMILAL DIFERENCIAS FINITAS ------

%--- DATOS ---

Xi=[ 0.4 0.6 0.8 1];
Yi=[0.55 0.8 1.1 1.15] ;

%---  MATRIZ DE DIFERENCIAS FINITAS   ---
function dif=diferenciaAdelante(Yi)   
  dif=Yi;
  n=length(Yi);
  for i=1:n-1
    for j=1:n-i
      dif(i+1,j)=dif(i,j+1)-dif(i,j);
    endfor
  endfor
endfunction 

%---  CALCULA EL POLINOMIO P(x)   ---
function pol= aproxPolinomial(x,Xi,Yi,n)

  h=Xi(2)-Xi(1);
  s= (x-Xi(1))./h;

  dif=diferenciaAdelante(Yi);
  a= dif(:,1)';
  pol=0;
  for i=1:n
    productoria=1;
    for j=1:i-1
      productoria=productoria.*(s-j+1)/j; 
    endfor
    productoria;
    pol=pol+a(i).*productoria;
  endfor

endfunction 



%---  DIFERENCIA ENTRE ADELANTE Y ATRAS   ---
disp ("para un tiempo de 0.82 s  \n")
x= 0.82
n=length(Yi);
polAtras= aproxPolinomial(x,flip(Xi),flip(Yi),n);
disp ("La concentracion de la reaccion  sera del % \n")
disp(polAtras)





