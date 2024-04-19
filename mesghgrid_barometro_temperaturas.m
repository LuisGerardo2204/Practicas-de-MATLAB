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
densidad=[13560 1001];
g=9.81;

[Ds,Ps]=meshgrid(densidad,presion);

h=Ps./(Ds*g)

h2=presion(3)/(densidad(1)*g)

% Tabla de conversión de centímetros a pulgadas, pies y yardas
tabla=[presion;h']; % Se agrupan los datos convertidos 
%en una matriz que será la tabla de datos

% Finalmente, se imprime en la pantalla la tabla de equivalencias
disp("  Tabla de equivalencias de distancias ")
disp("Presión [Pa]   mercurio   agua")
fprintf("   %6.3f     %6.3f    %6.3f  \n",tabla)
