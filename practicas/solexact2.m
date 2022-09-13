function [m] = solexact2(t)
    %f2=@(t,x) [x(2);-2*x(1)+cos(3*t)]; intervalo2 = [0,10]; x02 = [1,0];
    x = @(t) [8/7*cos(sqrt(2)*t)-1/7*cos(3*t)];
    xPrima = @(t) [8/7*sqrt(2)*sin(sqrt(2)*t)-3/7*sin(3*t)];
    rowt = size(t,1);
    for i=1:rowt
       m(i,1) = x(t(i));
       m(i,2) = xPrima(t(i));
    end
    
end