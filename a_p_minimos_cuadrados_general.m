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

function [Pi,error] = general(Xi,Gi,n,redefinir, devolver)
  eval(redefinir);              %redefine el vector Yi y lo pasa a Xi
  ai=coeficientes(Xi,Yi,2);
  eval(devolver);
  error=(sum((Gi-Pi).^2)./length(Xi))^(1/2);      
endfunction
clc

Xi=[ -1 0 1 2 3];
Fi=[6.62 3.94 2.17 1.35 0.89];
redefinir="Yi=log(Gi) ;";
devolver="Pi=exp(ai(1)+ai(2).*Xi) ;";
Gi=Yi;
[Pi,error] = general(Xi,Gi,n,redefinir, devolver)


