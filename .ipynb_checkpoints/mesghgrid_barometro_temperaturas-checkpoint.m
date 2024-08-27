clear 
clc

t=[100:10000:100000];
p=[100:10000:100000];
r=0.2870;

[T,P]=meshgrid(t,p);

v=(r*T)./P

v2=r*t./p(2)
disp("-----------")
disp("Barómetro")
disp("-----------")
presion=[0:500:10000];
densidad=[13.56 1.01];
g=9.81;

[Ds,Ps]=meshgrid(densidad,presion);

h=Ps./(Ds*g)

h2=presion(3)/(densidad(1)*g)