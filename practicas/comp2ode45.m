function comp2ode45(met)
    datos
    
    [t,x2] = met(f,intervalo,x0,N);
    [t,x1] = ode45(f,t,x0);
    
    colx = size(x1,2); % Numero de columnas de la matriz x
    color=['r' 'g' 'b'];
    figure(1)
    if colx == 1
        %La ecuación diferencial es escalar
        %Pinta las coordenadas de la sol por met1
        plot(t,x1,color(1)); 
        title("Grafica por el primer metodo");
        pause(3);
        figure(2);
        %Dif entre las sols obtenidas por ambos metodos
        plot(t,x1-x2,color(1));
        s=sprintf("La diferencia maxima es %d", norm(x1-x2,Inf));
        legend(s);
        title("Diferencia entre las sols");    
    end
    
    if colx>1
        for i=1:colx 
            subplot(colx,1,i)
            plot(t,x1(:,i),color(i))
            s=sprintf('Coordenada %d de la solucion por el primer metodo',i);
            title(s);
        end
        pause(3);
        figure(2);
        %Dif entre las sols obtenidas por ambos metodos
        for i=1:colx 
            subplot(colx,1,i)
            plot(t,x1(:,i)-x2(:,i),color(i))
            s=sprintf("La diferencia maxima es %d", norm(x1(:,i)-x2(:,i),Inf));
            legend(s);
            s=sprintf('Coordenada %d de la diferencia de la solucion',i);
            title(s);
        end
        pause(3);
        figure(3);
        %Trayectoria de la sol por el metodo 1
        if colx==2
          plot(x1(:,1),x1(:,2),color(1));
          %comet(x(:,1),x(:,2))
        else
          %plot3(x(:,1),x(:,2),x(:,3),'r')
          comet3(x1(:,1),x1(:,2),x1(:,3));
        end
        title('Trayectoria de la solucion por ode45');
        
    end