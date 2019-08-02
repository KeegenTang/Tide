File_name='.\data\h636a.nc';
data=ncread(File_name,'sea_level');
latitude=ncread(File_name,'lat');
data=data(365*24+1:(365+366)*24);
data(data==9999)=NaN;
figure;
close all;
plot(data);
hold on
plot(ypre+data_aver);
hold off
xlim([1,366*24]);
ylim([0,5500]);
legend({'Measurement','Forecast'},'location','NorthEast');
title('Contrast chart of measurement and forecast for the whole year','fontSize',12,'fontweight','bold');
xlabel('Time/h','fontweight','bold');   ylabel('Tidal height/mm','fontweight','bold');
%%
figure;
close all;
plot(data(1:24*31));
hold on
plot(ypre(1:24*31)+data_aver);
hold off
xlim([1,24*31]);
legend({'Measurement','Forecast'},'location','NorthEast');
title('Contrast chart of measurement and forecast for a month','fontSize',12,'fontweight','bold');
xlabel('Time/h','fontweight','bold');   ylabel('Tidal height/mm','fontweight','bold');
