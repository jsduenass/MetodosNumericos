clc
clear
close("all");
% ------- APROXIMACION POLINOMILAL DE NEWTON ------

%--- DATOS ---

x=[40 60 80 100 120 140 160];
y=[0.63 1.36 2.18 3 3.93 6.22 8.59];


function f=fcuadrada(x,y,n)
  for i=1:length(x)-n
    fc(i)=(y(i+1)-y(i))./(x(i+n)-x(i));
  endfor
  f=[fc zeros(1,n)];
endfunction


fc(1,:)=fcuadrada(x,y,1);

for i=2:length(x)-1
  fc(i,:)= fcuadrada(x,fc(i-1,:),i); %fc2= fcuadrada(x,fc1,2)
endfor

fc';


%p=  y(1) + fc(1).*(t-x(1)) + fc2(1).*(t-x(1)).*(t-x(2))

%--- de aqui para abajo no esta bien
function [p,dif]= pol_newton(x,Xi,a)
  dif(1,:)=ones(length(x),1);
  for i=1:length(Xi)-1
      dif(i+1,:)=dif(i,:).*(x-Xi(i)); 
  endfor
  %dif
  a(end)=[];
  disp(Xi)
  disp(a)
  
  p=a*dif;
  %p=dif
endfunction

t=40:10:160;

a=[y(1) fc(1,:)];



[p dif]=pol_newton(t,x,a);
p


figure()
plot(t,p,"-;titulo;", x, y, "*;titulo;");




%dif(2,:).*(t-x(2))