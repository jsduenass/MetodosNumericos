clear;
clc;
display("start diferenciaDivida \n");



x=0.5;

function y=y1(x)
  y= -0.1.*x.^4-0.15.*x.^3-0.5.*x.^2-0.25*x+1.2;
endfunction 

function y=error(verdadero,aproximado)
  y= abs((verdadero-aproximado)./verdadero);
  
endfunction

derivada=-0.4*x^3-0.45*x^2-x-0.25;


h=[0.5 0.25]

%diferencia hacia delante
dfront=(y1(x+h)-y1(x))./h
Error=error(derivada,dfront)

%diferencia hacia atras
dback=(y1(x)-y1(x-h))./h
Error=error(derivada,dback)

%diferencia centrada
dcentered=(y1(x+h)-y1(x-h))./(2.*h)
Error=error(derivada,dcentered)

display("\n end diferenciaDivida");




