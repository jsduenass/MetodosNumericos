clear 
clc

Xi=[-6 -2 0 2 6]
Yi=[ 7 5 3 2 0]
n= length(Xi)
function ai=coeficientes(Xi,Yi,n)
  A=0;
  b=0;
  for i=1:n
    for j=1:n
      A(i,j)=sum(Xi.^(i+j-2));
    endfor
    
    b(i)=sum(Yi.*Xi.^(i-1));
    
  endfor
  ai=A^-1*b';
endfunction  

function p=polinomio(x,ai)
  p=0
  for i=1:length(ai)
    p=p+ai(i).*x.^(i-1);
  endfor
  
endfunction

function [Pi,error] = general(Xi,Yi,n)
  Gi=1./Yi
  ai=coeficientes(Xi,Gi,2)
  Pi=1./(ai(1)+ai(2).*Xi)
  error=(sum((Yi-Pi).^2)./length(Xi))^(1/2)
endfunction

% 3.0000000  -0.7708333 0.1388889 0.0052083 -0.0034722
ai=coeficientes(Xi,Yi,n)
Pi=polinomio(Xi,ai')

error=(sum((Yi-Pi).^2)./length(Xi))^(1/2)


##x=Xi;
##potencial=(b./diag(A)')
##for i=1:length(potencial)
##  polinom(i,:)=potencial(i)*x.^i;
##endfor
##
##polinom


disp( "\n---------- aproximacion g(x)=C*e(Ax)----------")
Xi=[ -1 0 1 2 3];
Yi=[6.62 3.94 2.17 1.35 0.89];

Gi=log(Yi)

ai=coeficientes(Xi,Gi,2)

Pi=exp(ai(1)+ai(2).*Xi)

error=(sum((Yi-Pi).^2)./length(Xi))^(1/2)


disp(" \n----------aproximacion g(x)= 1/(Ax+B)----------")
% a0=B    a1=A    y=1/g(x)
Xi=[ -1 0 1 2 3];
Yi=[6.62 3.94 2.17 1.35 0.89];

Gi=1./Yi;
ai=coeficientes(Xi,Gi,2)
Pi=1./(ai(1)+ai(2).*Xi)

error=(sum((Yi-Pi).^2)./length(Xi))^(1/2)


function [Pi,error] = general(Xi,Gi,n,redefinir, devolver)
  eval(redefinir);              %redefine el vector Yi y lo pasa a Xi
  ai=coeficientes(Xi,Yi,2);
  eval(devolver);
  error=(sum((Gi-Pi).^2)./length(Xi))^(1/2);      
endfunction
clc
redefinir="Yi=log(Gi) ;";
devolver="Pi=exp(ai(1)+ai(2).*Xi) ;";
Gi=Yi;
[Pi,error] = general(Xi,Gi,n,redefinir, devolver)


redefinir="Yi=1./Gi ;";
devolver="Pi=1./(ai(1)+ai(2).*Xi) ;";
Gi=Yi;
[Pi,error] = general(Xi,Gi,n,redefinir, devolver)
