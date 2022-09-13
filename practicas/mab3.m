function[t,x] = mab3(f,intervalo,x0,N)
    nPasos=3;
    h = (intervalo(2) - intervalo(1))/N;
    x(1,:) = x0;
    t(1) = intervalo(1);
    faux = zeros(3, size(x,2));
    %meulermej
    for i = 2:nPasos
        t(i) = t(1) + (i-1)*h;
        faux(i-1,:) = f(t(i-1), x(i-1,:)).';
        F1 = faux(i-1,:);
        F2 = f(t(i), x(i-1,:)+ h*F1).';
        x(i,:) = x(i-1,:) + h/2*(F2 + F1);
    end
    
    faux(3,:) = f(t(3),x(3,:)).';
    for i = 1:N-2
        t(i+3) = t(1) + (i+2)*h;
        x(i+3,:) = x(i+2,:) + (h/12)*(23*faux(3,:)-16*faux(2,:)+5*faux(1,:));
        %actualizar
        faux(1,:) = faux(2,:);
        faux(2,:) = faux(3,:);
        faux(3,:) = f(t(i+3),x(i+3,:)).';
    end