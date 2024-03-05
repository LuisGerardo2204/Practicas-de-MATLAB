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

# Software MATLAB

Para empezar con este cuadernillo de prácticas, empezaremos por definir el software MATLAB usando la definición dada por Moore {cite:t}`Moore2007`: ``MATLAB es una de las muchas sofisticadas herramientas de computación disponibles
en el comercio para resolver problemas de matemáticas, tales como Maple, Mathematica y MathCad... El nombre mismo de MATLAB es una abreviatura de Matrix Laboratory, laboratorio matricial``


La interfaz gráfica o ventana principal del software se muestra en la {numref}`figura1`.
```{figure} /images/figura1.jpg
:height: 450px
:name: figura1
Pantalla principal de MATLAB
```

Las funciones y operaciones básicas, así como los cálculos con fórmulas complejas se llevan a cabo utilizando la ventana de comandos (ver {numref}`figura2`). Esta ventana de comandos recueerda a una calculadora científica, como es posible intuir, la sintaxis para realizar operaciones es muy similar a la que se utiliza en ese tipo de calculadoras. Para realizar una operación básica basta con expresarla con la sintaxis correcta, por ejemplo: 

```{code-cell} Octave
:tags: [remove-stderr]
2^3
area_circulo(2)
area_circulo(8)
```

```{note}
<div align='justify'>
Es posible copiar el código directamente de este cuadernillo y pegarlo en el command window de MATLAB.
</div>
```

<div align='center'>
Las sub-ventanas principales son las mostradas en las Figuras: {numref}`figura2`, {numref}`fig3`, {numref}`figura4` y {numref}`figura5`.
</div>
```{figure} /images/figura2a.jpg
:height: 150px
:name: figura2
Area de la carpeta activa
```
```{figure} /images/figura2b.jpg
:height: 150px
:name: fig3
Area de la carpeta activa
```

```{figure} /images/figura3b.jpg
:height: 100px
:name: figura4
Area de la carpeta activa
```
```{figure} /images/figura3c.jpg
:height: 150px
:name: figura5
Area de la carpeta activa
```
<div align='center'>
<video controls autoplay muted="true" loop="true" width="800">
    <source src="./_static/videos/cambio_dir.mp4 " type="video/mp4">
</video>
</div>
```{math}
:label: eq2
\begin{eqnarray}
2\frac{d^2x}{dt^2}+3.5\frac{dx}{dt}+500x&=1+3sen(100\pi x)\\
x(0)=0.12~~\frac{dx}{dt}(0)=0
\end{eqnarray}
```

```{math}
:label: RLCeq2
\begin{equation}
    L\frac{di}{dt}+Ri+\frac{1}{C}\int_{}^{} i dt= V_{s} 
\end{equation}
```

Circuito RLC

## Las ecuaciones se introducen de la siguiente manera

```{math}
:label: eq1
\begin{eqnarray}
\dot{x}_1&=-\frac{R}{L}x_1-\frac{1}{L}x_2+\frac{1}{L}V_s\\
\dot{x}_2&=\frac{1}{C}x_1-\frac{1}{C}I_{R_L}(x_2)
\end{eqnarray}
```
## Y las tablas así:

```{list-table} Tabla de parámetros
:header-rows: 1
:name: Tabla 1
* - Parameter
  - Value
* - $$I_s$$
  - $$0.0015sin(100\pi t)~[A]$$
* - $$R$$
  - $$220~[\Omega]$$
* - $$L$$  
  - $$11.5~[H]$$ 
* - $$C$$ 
  - $$1~\mu [F]$$
* - $$R_L$$
  - $$1000~[\Omega]$$
```


