% ------------------------------------------------------------

% Juan Sebastian Dueñas 
% Maria Alejandra Arias

% ------------------------------------------------------------

clc
clear
close("all");

% ------- APROXIMACION POLINOMILAL DIFERENCIAS FINITAS ------

%--- DATOS ---

Xi=[ 50 60 70 80 90 100];
Yi=[24.94  30.11 36.05 42.84 50.57 59.30] ;

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

% para un valor 
x= 84
disp(" aproximacion polinomial diferencias finitas hacia adelante")
% empezamos desde un valor mas cercano xo=80
Xi1=[ 80 90 100]
Yi1=[ 42.84 50.57 59.30] 
polAdelante= aproxPolinomial(x,Xi1,Yi1,3)

disp(" aproximacion polinomial diferencias finitas hacia atras")
% empezamos desde un valor mas cercano xn=90
Xi2=[ 50 60 70 80 90 ]
Yi2=[24.94  30.11 36.05 42.84 50.57 ] 
polAtras= aproxPolinomial(x,flip(Xi2),flip(Yi2),5)


polAdelante




%---  GRAFICAS   ---
x=48:1:101;
%disp(" aproximacion polinomial diferencias finitas hacia adelante")

polAdelante=aproxPolinomial(x,Xi1,Yi1,3);

%disp("aproximacion polinomial diferencias finitas hacia atras")

%dif=diferenciaAdelante(Yi)
polAtras= aproxPolinomial(x,flip(Xi2),flip(Yi2),5);
error=polAdelante-polAtras;

figure()
plot(x,polAdelante,"-;Diferencia hacia adelante;", Xi, Yi, "*;puntos ;");

figure()
plot(x,polAtras,"-;Diferencia hacia atras;", Xi, Yi, "*;puntos ;");



