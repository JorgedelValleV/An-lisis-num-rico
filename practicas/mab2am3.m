function [t,x]=mab2am3(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

[~,x] = mrk3(f,[t(1),t(4)],x0,3);
x=x.'
y=[f(t(1),x(:,1)),f(t(2),x(:,2)),f(t(3),x(:,3))]
for i=1:N-2
    % Predictor adam bashford 2 pasos
    x(:,i+2)=x(:,i+1)+(h/2)*(3*y(:,2)-y(:,1));
    % orden precision P(EC)^mE min {p,p*+m} necesitamos m = p*-p = orden predictor menos orden corrector=4-2=2
    for j=1:2
        % corrector adam moulton 3 pasos
        x(:,i+3)=x(:,i+2)+(h/24)*(9* f(t(i+3),x(:,i+3))+19*y(:,3)-5*y(:,2)+y(:,1));
    end
    % c,1));reo que esta solo si i distinto de N-2
    y=[y(:,2),y(:,3),f(t(i+3),x(:,i+3))]
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)