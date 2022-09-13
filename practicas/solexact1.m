function [m] = solexact1(t)
    %f1=@(t,x) [-0.1*x(1)+ 2*x(2);-2*x(1)-0.1*x(2)]; intervalo1=[0,10]; x01 = [0,1];
    x = @(t) [exp(-0.1*t)*sin(2*t)];
    y = @(t) [exp(-0.1*t)*cos(2*t)];
    rowt = size(t,1);
    for i=1:rowt
       m(i,1) = x(t(i));
       m(i,2) = y(t(i));
    end
    
end