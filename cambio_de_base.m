% script cambio de base 
% Desarrollado por Juan Sebastian Dueñas 
%----------------------------------------
% limpieza de espacio de trabajo
clear, clc ,close 'all'
%----------------------------------------
 

%Funciones ------------------------------
function binario=entero_a_binario(numero,pasoApaso)
  % combierte un numero entero a binario 
  % (bool) pasApaso -> true: imprime el proceso   false: no imprime nada
  binario=[];
  while numero >0
    residuo=mod(numero,2);        % residuo de la division
    binario(end+1)=residuo;       % agrega el residuo a la ultima posición del vector
    numero= floor(numero/2);      
    
    if(pasoApaso)                 % imprime el proceso
      printf("\t %d \t residuo %d \n", numero,residuo);
    end
      
  end
  binario=flip(binario);          %invierte el orden del vector
  
end

% Main -----------------------------------

entero_a_binario(3,false)
entero_a_binario(7,false)
entero_a_binario(35,true)
