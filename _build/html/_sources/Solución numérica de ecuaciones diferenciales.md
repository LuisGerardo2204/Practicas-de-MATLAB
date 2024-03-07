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
  display_name: Python 3
  language: python
  name: python3
---

# Solución numérica de ecuaciones diferenciales

<div align='justify'>
Los métodos de Runge-Kutta se utilizan para encontrar  la solución de ecuaciones diferenciales ordinarias de la forma:
</div>

```{math}
:label: diffeq1
\begin{equation}
   \frac{dy}{dx}=f(x,y)
\end{equation}
```
<div align='justify'>
Ó bien:
</div>

```{math}
:label: diffeq2
\begin{equation}
   \dot{y}=f(x,y)
\end{equation}
```
## Métodos numéricos
<div align='justify'>
Los métodos de Runge-Kutta (RK) tienen la forma generalizada de la siguiente  expresión:
</div>

```{math}
:label: diffeq3
\begin{equation}
   𝑦_{(i+1)}=𝑦_{i}+\varphi(x_i,y_i,h)h
\end{equation}
```

Donde $h$ es el paso o incremento y $\varphi(x_i,y_i,h)$ se denomina función de incremento, misma que puede interpretarse como una pendiente que es representativa en el intervalo de análisis, en forma general se escribe:


```{math}
:label: diffeq4
\begin{equation}
   \varphi=a_{1} k_{1}+a_{1} k_{1}+\cdots+a_{n} k_{n}
\end{equation}
```

 Los coeficientes $a_i$ son contantes y los términos $k_i$ se determinan como:

```{math}
:label: diffeq5
\begin{eqnarray}
	&k_{1}=f(x_{i},y_{i})\\
    &k_{2}=f(x_{i}+p_{1}h,y_{i}+q_{11}k_{1}h)\\
    &𝑘_{3}=𝑓(x_{i}+p_{2}h,y_{i}+q_{21}k_{1}h+q_{22}k_{2}h)\\
         &\vdots\\
    k_n&=f(x_i+p_{n-1}h,y_{i}+q_{n-1,1}k_{1}h+q_{n-1,2}k_{2}h+\cdots+q_{n-1,n}k_{n-1}h)
	\label{dos}
	\end{eqnarray}
```
Además sucede que los términos 𝑘 son relaciones de recurrencia. Es decir, 𝑘_𝑖 aparece en la ecuación $k_{i+1}$, la cual aparece en la ecuación $k_{i+2}$, etc.  Esta recurrencia vuelve eficientes a los métodos RK para cálculos utilizando una computadora. Dado que la recurrencia permite el desbordamiento de la pila de memoria y la ruptura automática de los programas, evitando el congelamiento del sistema operativo.

```{figure} /images/Imagen13.png   
:height: 300px
:width: 900px
:name: MN1
```
El más popular de los métodos RK es el de cuarto orden. Como en el caso de los procedimientos de segundo orden, hay un número
infinito de versiones. La siguiente, es la forma comúnmente usada y, por lo tanto, le llamamos método clásico RK de cuarto orden {cite:t}`chapra2006metodos`:


```{math}
:label: diffeq6
\begin{equation}
	y_{i+1}=y_{i}+\frac{1}{6}\left( k_{1}+2k_{2} +2k_{3}+k_{4}\right)h
	\end{equation}
```
con:

```{math}
:label: diffeq7
\begin{eqnarray}
	&k_{1}=f(x_{i},y_{i})\\
    &k_{2}=f\left(x_i+\frac{1}{2}h,y_{i}+\frac{1}{2}k_{1}h\right)\\
    &k_{3}=f\left(x_i+\frac{1}{2}h,y_{i}+\frac{1}{2}k_{2}h\right)\\
    &k_{4}=f\left(x_i+h,y_{i}+k_{3}h\right)
	\end{eqnarray}
```


```{figure} /images/Imagen12.png   
:height: 250px
:width: 900px
:name: MN2
```