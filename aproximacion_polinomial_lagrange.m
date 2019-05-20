clc
clear
close("all");

% ------- APROXIMACION POLINOMILAL DE LAGRANGE ------

%--- DATOS ---
Xi = [1 2 5 10 20 30 40]; 
Yi = [56.5 78.6 113 144.5 181 205 214.5];

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
  


x=0:0.1:40;
[P,ai]=pol_langrange(x,Xi,Yi);



figure()
plot(x,P,"-;titulo;", Xi, Yi, "*;titulo;");







