---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
    language: es
kernelspec:
  display_name: Octave
  language: Octave
  name: Octave
---
 # Práctica 2

 En esta práctica se presenta el procedimiento para generar funciones personalizadas y programas. MATLAB cuenta con un basto repertorio de funciones y operaciones nativas como las que se utilizaron en la práctica pasada. Cuando re requiere ejecutar un conjunto de instrucciones en particular de manera repetida, que no se encuentre entre las que ofrece MATLAB, se debe crear una función o programa. Las diferencias entre programas y funciones son las siguientes:

## Creación de programas

 <div align='center'>
<video controls autoplay muted="true" loop="true" width="800">
    <source src="./_static/videos/crea_script.mp4 " type="video/mp4">
</video>
</div>

```{code-cell} Octave
:tags: [remove-output]

clear %Limpia todas la variables
clc %Limpia la ventana de comandos
close all %Cierra todas las graficas
C=[-5:0.5:40]; %Tabla de datos C a F
F=(9/5)*C+32; %Convertir C a F
figure
plot (C,F) %Grafica

t=[0:1:5]; %Vector de variable independiente
y=exp(-2.5*t).*cos(11.35*t) %Calculo de una funcion

v=[0:0.01:100]; %Arreglo de prueba
v(30)%Acceso a la localidad 30

A=[0:0.0001:0.1]; %Vector de variable independiente
y=cos(115*A).*sin(30*A)+2; %Calculo de una funcion
figure
plot(A,y) %Grafica

%Solucion de un sistema de ecuaciones usando matrices
A=[3 2 -5; 1 0.5 3; -2 7 -3]
B=[10 5 -2]
X=(A^-1)*B'%Calculo alternativo
X=inv(A)*B'%B' Significa transpuesta

A(1,3)%Acceder a la localidad Fila=1 Columna=3
A(2,3)%Acceder a la localidad Fila=2 Columna=3

```

## Creación de funciones

El procedimiento para generar funciones se presenta en el siguiente video:

 <div align='center'>
<video controls autoplay muted="true" loop="true" width="800">
    <source src="./_static/videos/crea_func.mp4 " type="video/mp4">
</video>
</div>


```{code-cell} Octave
:tags: [remove-output]

function a=area_circulo(radio)
a=pi*(radio^2);
end

```

```{code-cell} Octave
:tags: [remove-stderr]

radio=2;
a=area(radio)

```