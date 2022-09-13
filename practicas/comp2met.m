function comp2met(met1,met2)
datos
[t1,x1] = met1(f,intervalo,x0,N);
[t2,x2] = met2(f,intervalo,x0,N);
m = size(x1,2);% Numero de columnas de la matriz x
color = ['r','g','b'];
x = [x1,x2];
figure(1)
if m==1
    %La ecuación diferencial es escalar
    %Pinta las coordenadas de la sol por met1
    plot(t1,x1,color(1));
    hold on;
    plot(t2,x2(:,1),color(2));
    title("Grafica por el primer metodo");

    pause(3);

    figure(2);
    %Dif entre las sols obtenidas por ambos metodos
    plot(t1,x1-x2,color(1));
    s=sprintf("La diferencia maxima es %d", norm(x1-x2,Inf));
    legend(s);
    title("Diferencia entre las sols");    
end

if m>1
    figure(2);
    for i=1:m 
        subplot(m,1,i);
        plot(t1,x1(:,i),color(1));
        hold on;
        plot(t2,x2(:,1),color(2));
        s=sprintf('Coordenada %d de la solucion ',i);
        title(s);
    end

    pause(3);

    figure(3);
   
    %Dif entre las sols obtenidas por ambos metodos
    for i=1:m 
        subplot(m,1,i);
        plot(t1,x1(:,i)-x2(:,i),color(i));
        s=sprintf("La diferencia maxima es %d", norm(x1(:,i)-x2(:,i),Inf));
        legend(s);
        s=sprintf('Coordenada %d de la diferencia de la solucion',i);
        title(s);
    end
    
    pause(3);

    figure(4);
    if m==2
        plot(x1(:,1),x1(:,2),color(1));
        hold on;
        plot(x2(:,1),x2(:,2),color(2));
    else
        plot3(x1(:,1),x1(:,2),x1(:,3),'r');
        hold on;
        plot3(x2(:,1),x2(:,2),x2(:,3),'r');
        %comet3(x1(:,1),x1(:,2),x1(:,3));
    end
    title('Trayectoria de la solucion');
    
end