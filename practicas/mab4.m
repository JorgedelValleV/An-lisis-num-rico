function[t,x] = mab4(f,intervalo,x0,N)
    nPasos=4;
    h = (intervalo(2) - intervalo(1))/N;
    x(1,:) = x0;
    t(1) = intervalo(1);
    faux = zeros(4, size(x,2));
    %mrk3
    for i = 2:nPasos
        t(i) = t(1) + (i-1)*h;
        faux(i-1,:) = f(t(i-1), x(i-1,:)).';
        F1 = faux(i-1).';
        F2 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F1.');
        F3 = f(t(i-1) + 3*h/4, x(i-1,:)+ 3*h/4*F1.');
        x(i,:) = x(i-1,:) + h/9*(4*F3 + 3*F2 + 2*F1).'; 
    end
    
    faux(4,:) = f(t(4),x(4,:)).';
    for i = 1:N-3
        t(i+4) = t(1) + (i+3)*h;
        x(i+4,:) = x(i+3,:) + h/24*(55*faux(4,:)-59*faux(3,:)+37*faux(2,:)-9*faux(1,:));
        faux(1,:) = faux(2,:);
        faux(2,:) = faux(3,:);
        faux(3,:) = faux(4,:);
        faux(4,:) = f(t(i+4),x(i+4,:)).';
    end