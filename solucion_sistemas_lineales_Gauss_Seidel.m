clear 
clc

%-----  SOLUCION SISTEMA DE ECUACIONES GAUSS SEIDEL -----
M=[4,-1,0,0;-1,4,-4,-1;0,0,-1,0;0,-1,-1,4]

b=[1,1,1,1];
X=[0,0,0,0];
aii=diag(M);  % diagonal de la matriz
j=0;        % contador Nuero de iteraciones
E=1;        %error

disp('empezar')
while(j<12&&E>0.0001)
  Xant=X
  for i=1:length(X)
    %Xi elimina la x en la posicion i
    Xi=X;
    Xi(i)=[];
    % coeficientes en la fila i quitando xii
    aij=M(i,:);
    aij(i)=[];
    
    %calcula nuevo x en la posicion i
    X(i)=(b(i)-aij*Xi')/aii(i);
  endfor 
  
  X
  E=max(abs(Xant-X))
  disp('vuelta')
  j=j+1
endwhile


respuesta=M*X'
  