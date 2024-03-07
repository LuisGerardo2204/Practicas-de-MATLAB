# Circuito RLC serie.
## En este capítulo se pone a prueba el funcionamiento de los archivos markdown y su inclusión en el índice. 
```{figure} /images/Fig1.png
:height: 150px
:name: figure-example

Circuito RLC
```
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

