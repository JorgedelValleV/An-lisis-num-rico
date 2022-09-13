function[t,x] = mab2(f,intervalo,x0,N)
    h = (intervalo(2) - intervalo(1))/N;
    x(1,:) = x0;
    t(1) = intervalo(1);
    faux1 = f(t(1),x(1,:)).';
    t(2) = t(1) + h;
    %euler
    x(2,:) = x(1,:) + h*faux1;
    
    faux = [faux1; f(t(2),x(2,:)).'];
    for i = 1:N-1
        t(i+2) = t(1) + (i+1)*h;
        x(i+2,:) = x(i+1,:) + (h/2)*(3*faux(2,:)-faux(1,:));
        %actualizar las f
        faux(1,:) = faux(2,:);
        faux(2,:) = f(t(i+2),x(i+2,:)).';
    end