% ------------------------------------------------------------

% Juan Sebastian Dueñas 
% Maria Alejandra Arias

% ------------------------------------------------------------

clc
clear
close("all");






%--- DATOS ---

tiempo=[0 2.5 5.0];         % tiempo [s]
amplitud=[10 4.97 2.47] ;     % amplitud de oscilacion de pendulo [cm]


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
  

disp ("para una amplitud de oscilacion de 2 cm  \n")
x=2;
[P,ai]=pol_langrange(x,amplitud,tiempo);
disp("El tiempo transcurrido sera de " )
disp(P)

