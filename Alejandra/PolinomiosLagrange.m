%%Datos para polinomio de lagrange

x = [1 2 5 10 20 30 40]
fx = [56.5 78.6 113 144.5 181 205 214.5]


%%con esto sacamos los l
function l = lj(a, x, j, k) %%k es el grado del polinomio %%j es el número de l a evaluar %%x es el vector x inicial
  %%a es el valor en el cual se quiere calcular
  l=1;
  for i= 1:k+1
    if(i != j)
      l = l.*(a-x(i))./(x(j)-x(i));
    endif
  endfor
  
endfunction

function p = px(x, fx, a, k) %%valores en y de los datos iniciales, k es el grado del polinomio
  p = 0;  
    for j = 1: k+1       
        p = p + fx(j)*lj(a, x, j, k);      
    endfor
endfunction
x1 = 0:0.1:50;
a = px(x, fx, x1, 6) %%la máxima aproximación que se puede dar es la del polinomio de grado 6 



subplot(221)
plot(x, fx);
hold on;
for i= 1:6
  plot(x(i), fx(i), 'o');
endfor
title("Gráfica de datos iniciales")

subplot(222)
plot(x1, a);
hold on;

for i= 1:6
  plot(x(i), fx(i), 'o');
endfor


title("Gráfica de polinomios lagrange")