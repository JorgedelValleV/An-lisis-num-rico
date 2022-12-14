function [t,x]=mab2am2(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

[~,x] = mrk3(f,[t(1),t(2)],x0,1);
x=x.';
y=[f(t(1),x(:,1)),f(t(2),x(:,2))]
for i=1:N-1
    x(:,i+2)=x(:,i+1)+(h/2)*(3*y(:,2)-y(:,1));
    x(:,i+2)=x(:,i+1)+(h/12)*(5* f(t(i+2),x(:,i+2))+8*y(:,2)-y(:,1));
    y=[y(:,2),f(t(i+2),x(:,i+2))]
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)