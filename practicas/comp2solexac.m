function comp2solexact(met,sol)
    datos
    [t1,x1] = met(f,intervalo,x0,N);
    x2 = sol(t1);
    
    colx = size(x1,2); % Numero de columnas de la matriz x
    color=['r' 'g' 'b'];
    figure(1)
    if colx == 1
        %La ecuación diferencial es escalar
        %Pinta las coordenadas de la sol por met1
        plot(t1,x1,color(1)); 
        title("Solución aproximada por el método");
        pause(3);
        figure(2);
        %Dif entre las sols obtenidas por ambos metodos
        plot(t1,x1-x2,color(1));
        s=sprintf("La diferencia maxima es %d", norm(x1-x2,Inf));
        legend(s);
        title("Diferencia entre la sol exacta y la aprox");    
    end
    
    if colx>1
        for i=1:colx 
            subplot(colx,1,i)
            plot(t1,x1(:,i),color(i))
            s=sprintf('Coordenada %d de la solucion aproximada',i);
            title(s);
        end
        pause(3);
        figure(2);
        %Dif entre las sols obtenidas por ambos metodos
        for i=1:colx 
            subplot(colx,1,i)
            plot(t1,x1(:,i)-x2(:,i),color(i))
            s=sprintf("La diferencia maxima es %d", norm(x1(:,i)-x2(:,i),Inf));
            legend(s);
            s=sprintf('Coordenada %d de la diferencia de las soluciones',i);
            title(s);
        end
        pause(3);
        figure(3);
        %Trayectoria de la sol exacta
        if colx==2
          plot(x2(:,1),x2(:,2),color(1));
          %comet(x(:,1),x(:,2))
        else
          %plot3(x(:,1),x(:,2),x(:,3),'r')
          comet3(x2(:,1),x2(:,2),x2(:,3));
        end
        title('Trayectoria de la solucion exacta');
    end