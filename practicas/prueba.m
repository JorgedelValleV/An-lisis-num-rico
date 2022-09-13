datos
for i=1:100
    tic;
    [~,~]=mab3am3(f,intervalo,x0);
    t1(i)=toc;
    plot(i,t1(i));
end;

for i=1:100
    tic;
    [~,~]=mab2am3(f,intervalo,x0);
    t2(i)=toc;
    plot(i,t2(i));
end;
for i=1:100
    tic;
    [~,~]=mab3am3(f,intervalo,x0);
    t3(i)=toc;
    plot(i,t3(i));
end;