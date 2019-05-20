clc
clear
close("all");
% ------- APROXIMACION POLINOMILAL DE NEWTON ------

%--- DATOS ---
x=[40 60 80 100 120 140 160];
y=[0.63 1.36 2.18 3 3.93 6.22 8.59];


function f=fcuadrada(a,b,x,y)
  
  f=(y(b)-y(a))./(x(b)-x(a));
endfunction

for i=1:length(x)-1
fc(i)=fcuadrada(i,i+1,x,y);
endfor
fc

for i=1:length(x)-2
  fc2(i)=(fc(i+1)-fc(i))./(x(i+2)-x(i));
endfor
fc2

for i=1:length(x)-3
  fc3(i)=(fc2(i+1)-fc2(i))./(x(i+3)-x(i));
endfor
fc3

fc=[fc 0];
fc2=[fc2 0 0];

[x' ,y',fc', fc2']
t=90;
p=  y(1) + fc(1).*(t-x(1)) + fc2(1).*(t-x(1)).*(t-x(2))

