clear;
File_name='.\data\h636a.nc';
data=ncread(File_name,'sea_level');
latitude=ncread(File_name,'lat');
data=data(1:365*24);
data(data==9999)=NaN;
data_aver=mean(data);
[NAME,FREQ,TIDECON,XOUT]=t_tide(data,'interval',1,'latitude',latitude,'start time',[1975,01,01,00],'rayleigh',['M2';'S2';'O1';'K1']);
time=zeros(1,numel(data)+24);
for i=1:numel(data)+24
    time(i)=datenum(1976,01,01)+(i-1)/24.0;
end
ypre=t_predic(time,NAME,FREQ,TIDECON,latitude);