clc
clear
close("all");
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

y=[56.6 78.6 113 144.5 181 205 214.];
x=[1 2 5 10 20 30 40];

% reorganizacion  1 7 4 3 5 2 6
y=[y(1) y(7) y(4) y(3) y(5) y(2) y(6)]
x=[x(1) x(7) x(4) x(3) x(5) x(2) x(6)]
n=7;
t=0:0.5:50;

% creating sequiential variable names
for i = 2:n
        evalstr=sprintf("p%i=f(x,y,i);polsimple%i=polyval(p%i,t);",i,i,i);
        eval(evalstr);
endfor 

p2
p3
p4
p5
p6
p7
 

 
%dibujar
figure()
subplot(2,1,1)
plot(t,polsimple2,"-;titulo;", x, y, "*;titulo;");
subplot(2,1,2)
plot(t,polsimple3,"-;titulo;", x, y, "*;titulo;");

figure()
subplot(2,1,1)
plot(t,polsimple4,"-;titulo;", x, y, "*;titulo;");
subplot(2,1,2)
plot(t,polsimple5,"-;titulo;", x, y, "*;titulo;");

figure()
subplot(2,1,1)
plot(t,polsimple6,"-;titulo;", x, y, "*;titulo;");
subplot(2,1,2)
plot(t,polsimple7,"-;titulo;", x, y, "*;titulo;");


y=[56.6 78.6 113 144.5 181 205 214.];
x=[1 2 5 10 20 30 40];
figure()
plot(x, y);


