%%% OSCILADOR %%%
%%% Cuanto mas grande es el valor inicial, mas grandes son las oscilaciones 

f=@(t,x) [x(2);-x(1)]
[t,x]=ode45(f,[0,10],[1,0]);
[t2,x2]=ode45(f,[0,10],[0,1]);
[t3,x3]=ode45(f,[0,10],[5,5]);
[t4,x4]=ode45(f,[0,10],[10,20]);
figure(1);
subplot(2,1,1);
plot(t,x(:,1),'r')
hold on
plot(t2,x2(:,1),'g')
hold on
plot(t3,x3(:,1),'b')
hold on
plot(t4,x4(:,1),'y')
subplot(2,1,2);
plot(t,x(:,2),'r')
hold on
plot(t2,x2(:,2),'g')
hold on
plot(t3,x3(:,2),'b')
hold on
plot(t4,x4(:,2),'y')
figure(2);
plot(x(:,1),x(:,2),'r')
hold on
plot(x2(:,1),x2(:,2),'g')
hold on
plot(x3(:,1),x3(:,2),'b')
hold on
plot(x4(:,1),x4(:,2),'y')



%%%%%%%%%%%%%%%%%%%
%%% VAN DER POL %%%
%%%%%%%%%%%%%%%%%%%
g=@(t,x) [x(2);-x(1)-(x(1)^2-1)*x(2)]
[t,x]=ode45(g,[0,10],[0.1,0.2]);
[t2,x2]=ode45(g,[0,10],[1,0]);
[t3,x3]=ode45(g,[0,10],[0.5,0.6]);
[t4,x4]=ode45(g,[0,10],[1,1.1]);
figure(3);
subplot(2,1,1);
plot(t,x(:,1),'r')
hold on
plot(t2,x2(:,1),'g')
hold on
plot(t3,x3(:,1),'b')
hold on
plot(t4,x4(:,1),'y')
subplot(2,1,2);
plot(t,x(:,2),'r')
hold on
plot(t2,x2(:,2),'g')
hold on
plot(t3,x3(:,2),'b')
hold on
plot(t4,x4(:,2),'y')
figure(4);
plot(x(:,1),x(:,2),'r')
hold on
plot(x2(:,1),x2(:,2),'g')
hold on
plot(x3(:,1),x3(:,2),'b')
hold on
plot(x4(:,1),x4(:,2),'y')

figure(5);
plot(t,x(:,1),'r')
figure(6);
plot(x(:,1),x(:,2),'r')