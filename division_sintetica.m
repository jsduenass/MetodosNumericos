clear 
clc

%-----  DIVISON SINTETICA   -----


a=[1 2 -24]
r=a(1)
t=4;

for i=2:length(a)
  b(i)=r;
  s=a(i)
  r=s+r*t
endfor
disp("\n resultado \n")
r
b(1)=[];
b
