function [t,x]=mab4am4(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
[~,x]=mrk4(f,[t(1),t(4)],x0,3);
x=x.';
y=[f(t(1),x(:,1)),f(t(2),x(:,2)),f(t(3),x(:,3)),f(t(4),x(:,4))];
for i=1:N-3
    %Metodo de predicción; Adams Moulton 4
    x(:,i+4)=x(:,i+3)+(h/24)*(55*y(:,4)-59*y(:,3)+37*y(:,2)-9*y(:,1));
    e1=f(t(i+4),x(:,i+4));
    %Corrección: uso la f con el punto que acabo de calcular
    x(:,i+4)=x(:,i+3)+(h/720)*(251*e1+646*y(:,4)-264*y(:,3)+106*y(:,2)-19*y(:,1));
    %actualizo la y
    y=[f(t(i+1),x(:,i+1)),f(t(i+2),x(:,i+2)),f(t(i+3),x(:,i+3)),f(t(i+4),x(:,i+4))];
end
t=t(:); 
x=x.'; 