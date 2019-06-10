% ------------------------------------------------------------

% Juan Sebastian Dueñas 
% Maria Alejandra Arias

% ------------------------------------------------------------

clc
clear
close("all");

% ------- APROXIMACION POLINOMILAL DIFERENCIAS FINITAS ------

%--- DATOS ---

esfuerzo=[12800 7500 5000 3800];         % tiempo [s]
razon=[140 180 220 240 ] ;     % amplitud de oscilacion de pendulo [cm]



%a)
% aproximacion polinomial simple 

function a=f(x,y,n)
  x=x(1:n);       %recorta x a tamaño n 
  b=y(1:n)';      %recorta 'y' a tamaño n y lo vuelve vector a vertical
  
  %crea matriz [1, x1 , ...x1^n ; 1 , x2 ... x2^n ;...; 1 , xn]
  for i=1:n
    A(i,:)=x.^(i-1); 
  endfor
  A=A';
  
  a=A^-1*b;      % vector constantes [ a0, a1, a2 ... an]
  a=flip(a);      % invierte : [an, an-1 ... a1 ,a0]
endfunction


a=f(esfuerzo,razon,4)


%b)

% ------- APROXIMACION POLINOMILAL DE LAGRANGE ------

% productoria (x-Xi)   para x!= Xi

function L= productoria(x,Xi)
  L=1;
  [miembro,pos]=ismember(x,Xi); % pos es la posicion donde x= Xi(pos)
  for i=1:length(Xi)
    
      L=L.*((pos==i)  + (x-Xi(i))) ;
      %disp ([i y]);
      
  endfor
endfunction

function [P,ai]= pol_langrange(x,Xi,Yi)
  Li=productoria(Xi,Xi);
  ai=Yi./Li;      % coeficientes
  
  Lx=productoria(x,Xi);

  for i=1:length(x)
    [miembro,pos]=ismember(x(i),Xi);
    %[miembro pos x(i)]
    if(miembro)
      P(i)=ai(pos).*Lx(i);
    else
      P(i)=sum(ai./(x(i)-Xi)).*Lx(i);
    endif
    
  endfor  
endfunction



% ------- APROXIMACION POLINOMILAL DE LAGRANGE ------

% productoria (x-Xi)   para x!= Xi

function L= productoria(x,Xi)
  L=1;
  [miembro,pos]=ismember(x,Xi); % pos es la posicion donde x= Xi(pos)
  for i=1:length(Xi)
    
      L=L.*((pos==i)  + (x-Xi(i))) ;
      %disp ([i y]);
      
  endfor
endfunction


Li=productoria(Xi,Xi);
  ai=Yi./Li;      % coeficientes

x=10;
[P,ai]=pol_langrange(x,esfuerzo,razon);
