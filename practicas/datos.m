f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;
% f=@funcpvi; intervalo=[0,2*pi]; x0=[0,4]; N=1000;
% k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;

%%% FUNCION 1b %%%
% f = @(t,x) [x(2);-x(1)-(x(1)^2-1)*x(2)]; intervalo = [0,10]; x0 = [1,0]; N = 1000;

%%% OSCILADOR %%%
% k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;

%%% VAN DER POL %%%
% f=@(t,x) [x(2);-x(1)-(x(1)^2-1)*x(2)]; intervalo=[0,10]; x0=[1,0]; N=100;

%%% FUNCION EJEMPLO (OJITOS) %%%
%f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0 = [0,4]; N=1000;

%%% INVENTO R3%%%
% f=@(t,x) [x(3);-x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0 = [0,0,4]; N=1000;

%%% INVENTO R1%%%
% f=@(t,x) [-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0 = [4]; N=1000;

%%% FUNCION DE SOL EXACT 2 %%%
% f=@(t,x) [x(2);-2*x(1)+cos(3*t)]; intervalo = [0,10]; x0 = [1,0]; N = 100;

%%% PENDULO %%%
% F = 0; L = 1; m = 1; g = 9.8; T = 10;
% intervalo = [0,T]; N = 100;
% beta = 0;
% % beta = 0.25
% % beta = 1.5
% f=@(t,x) [x(2);1/(m*L)*(-2*L*beta*x(2)-m*g*sin(x(1))+F)];
% x0 = [1,0];