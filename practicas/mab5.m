function[t,x] = mab4(f,intervalo,x0,N)
    nPasos=5;
    h = (intervalo(2) - intervalo(1))/N;
    x(1,:) = x0;
    t(1) = intervalo(1);
    faux = zeros(5, size(x,2));
    %mrk4
    for i = 2:nPasos
        t(i) = t(1) + (i-1)*h; 
        faux(i-1,:) = f(t(i-1), x(i-1,:)).';
        F1 = faux(i-1).';
        F2 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F1.');
        F3 = f(t(i-1) + h/2, x(i-1,:)+ h/2*F2.');
        F4 = f(t(i-1) + h, x(i-1,:)+ h*F3.');
        x(i,:) = x(i-1,:) + h/6*(F4 + 2*F3 + 2*F2 + F1).';
    end
    faux(5,:) = f(t(5),x(5,:)).';

    %[~,x]=mrk4(f,[t(1),t(4)],x0,3);
    %x=x.';
    %y=[f(t(1),x(:,1)),f(t(2),x(:,2)),f(t(3),x(:,3)),f(t(4),x(:,4)),f(t(5),x(:,45))]; 

    for i = 1:N-4
        t(i+5) = t(1) + (i+4)*h;
        x(i+5,:) = x(i+4,:) + h/720*(1901*faux(5,:)-2774*faux(4,:)+2616*faux(3,:)-1274*faux(2,:)+251*faux(1,:));
        %actualizar
        %y=[y(:,2),y(:,3),y(:,4),y(:,5),f(t(i+5),x(:,i+5))]
        faux(1,:) = faux(2,:);
        faux(2,:) = faux(3,:);
        faux(3,:) = faux(4,:);
        faux(4,:) = faux(5,:);
        faux(5,:) = f(t(i+5),x(i+5,:)).';
    end