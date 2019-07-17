clear 
clc

%------ SOLUCION DE SISTEMAS DE ECUACIONES POR FACTORIZACION LU -----


function [L,U,c,x]=factor_LU(A,b)
  n=length(b);
  U=zeros(n,n);
  L=eye(n,n); % define los Lii=1

  U(1,:)=A(1,:);
  L(:,1)= A(:,1)./U(1,1);
  i=1;
  while (i<n)
    i=i+1;
    
    % define fila i
      for(k=i:n)
        suma=L(i,1:i-1)*U(1:i-1,k);
        U(i,k)=(A(i,k)-suma)./L(i,i);
      endfor
     
    % define columna i
      for(k=i+1:n)
        suma=L(k,1:i-1)*U(1:i-1,i);
        L(k,i)=(A(k,i)-suma)./U(i,i);
      endfor    
  endwhile
  
  c=L^-1*b;
  x=U^-1*c; 
  
endfunction

%---- sistema dejado en clase ----
disp("sistema dejado en clase")
%---Datos---
A=[4,-9,2;2,-4,6;1,-1,3]
b=[5;3;4]

[L,U,c,x]=factor_LU(A,b)

verificacion = A^-1*b

%--- sistema aleatorio tamaño n ---
disp("\n sistema aleatorio tamaño n \n")

n=8
M= 10*rand(n,n)
b2= 10*rand(n,1)

[L,U,c,x]=factor_LU(M,b2);
verificacion =M^-1*b2;

table=[x,verificacion];

disp("Resultado: \n")
disp("\n      x,    verifciacion")
disp(table)




