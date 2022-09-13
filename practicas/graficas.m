colx=size(x,2); % Numero de columnas de la matriz x
color=['r','g','b'];
figure(1)
for i=1:colx
    subplot(colx,1,i);
    plot(t,x(:,i),color(i));
    s=sprintf('Coordenada %d de la solucion',i);
    title(s)
end
if colx>1
    pause(3)
    figure(2)
    if colx==2
        plot(x(:,1),x(:,2),'r')
    else
        plot3(x(:,1),x(:,2),x(:,3),'r')
    end
    title('Trayectoria de la solucion')
end