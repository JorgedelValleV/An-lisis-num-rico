function [t,x]=mmilne4bdf5(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

[~,x] = mrk4(f,[t(1),t(5)],x0,4);
x=x.'
y=[f(t(3),x(:,3)),f(t(4),x(:,4)),f(t(5),x(:,5))]
for i=1:N-5
    x(:,i+5)=x(:,i+1)+(4*h/3)*(2*y(:,3)-y(:,2)+2*y(:,1));
    x(:,i+5)=(300/137)*x(:,i+4)-(300/137)*x(:,i+3)+(200/137)*x(:,i+2)-(75/137)*x(:,i+1)+(12/137)*x(:,i+4)+(60*h/137)*(f(t(i+5),x(:,i+5)));
    y=[y(:,2),y(:,3),f(t(i+5),x(:,i+5))]
end
% i =N-4
x(:, N+1) = x(:,N-3)+(4*h/3)*(2*y(:,3)-y(:,2)+2*y(:,1));
x(:,i+5)=(300/137)*x(:,N)-(300/137)*x(:,N-1)+(200/137)*x(:,N-2)-(75/137)*x(:,N-3)+(12/137)*x(:,N-4)+(60*h/137)*(f(t(N+1),x(:,N+1)));
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)