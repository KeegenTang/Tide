clear;
ru=load('.\data\ru.dat');
u=ru(1:200);
rv=load('.\data\rv.dat');
v=rv(1:200);
time=zeros(200,1);
for i=1:200
    time(i)=datenum(2005,02,15)+(i-1)/24.0;
end
coef=ut_solv(time, u, v, 37.54, {'O1';'K1';'M2';'S2'}, 'OLS');
for i=1:200
    time(i)=datenum(2005,02,15)+(i+200-1)/24.0;
end
[ypre_u,ypre_v]=ut_reconstr(time,coef);
close all
figure;
plot(ru(201:400))
hold on
plot(ypre_u)
hold off
legend({'Measurement','Forecast'},'location','NorthEast');
title('Comparison between prediction and measurement of u','fontSize',12,'fontweight','bold');
xlabel('Time/h','fontweight','bold');   ylabel('Velocity/ m/s','fontweight','bold');
