mu = 50;
f = @(t,x) [-mu*(x(1) - cos(t))];
intervalo = [0, 1];
x0 = [0];
N = [24, 26]; 
sol = @(t) ((mu^2)/(1+mu^2))*(cos(t)-exp(-mu*t)+(1/mu)*sin(t));

% Meuler implicito para esta f
h = (intervalo(2)-intervalo(1))/N(1);
t = intervalo(1):h:intervalo(2);
x(:,1) = x0(:);
for i=1:N(1)
    x(:, i+1) = (x(:, i) + h*mu*cos(t(i+1)))/(1+h*mu);
end
t=t(:); % Convertimos en t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)
        % .' solo transpone, no conjuga
figure();
P1 = plot(t, x, 'red');
hold on; % Despues de pintar, hago hold para seguir pintando encima
P2 = fplot(sol,[0 1], 'green');
legend('Euler implicito N=24','Solución exacta');


