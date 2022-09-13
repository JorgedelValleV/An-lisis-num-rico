function[t,x] = meulerimp(f,intervalo,x0,N)
%Inicializamos con euler explicito
h = (intervalo(2) - intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0;
for i = 1:N
    x(:,i+1) = x(i,:) + h*f(t(i+1), x(:,i) + h*f(t(i), x(:,i)));
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)