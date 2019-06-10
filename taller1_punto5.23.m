% ------------------------------------------------------------

% Juan Sebastian Dueñas 
% Maria Alejandra Arias

% ------------------------------------------------------------

clc
clear
close("all");






%--- DATOS ---

Xi=[11.5 15 19];         % tiempo [s]
Yi=[19000 15700 11000] ;     % amplitud de oscilacion de pendulo [cm]


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
  

disp ("aproximacion para x= 10 de f(x) sera de   \n")
x=10;
[P,ai]=pol_langrange(x,Xi,Yi);
disp(P)

