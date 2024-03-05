# Dos simples experimentos en los que participan las ecuaciones diferenciales.

<div align='justify'>
En lo que resta de este libro electrónico tomaremos mediciones de las variables significativas de dos sistemas físicos diferentes. Expresaremos las ecuaciones diferenciales que describen a los fenómenos mencionados y las resolveremos utilizando el método de Runge Kutta.
Compararemos los resultados numéricos (los de simulación o los encontrados usando la computadora) con los obtenidos con las mediciones físicas. Usaremos para tales fines una tarjeta Arduino Due, un circuito eléctrico y un juguete de madera emulando que representa un sistema masa-resorte-amortiguador, en el cual, mediremos la aceleración.

</div>

## Primer ejemplo: Circuito resistencia, bobina y capacitor en serie (circuito RLC serie).

<div align='justify'>
Diagrama y forma física del circuito propuesto.
</div>

```{figure} /images/Imagen8.png
:height: 350px
:width: 800px
:name: figura9

```
La parte experimental consiste en un sistema de adquisición de datos basado en un microcontrolador ARM (Arduino Due), programado por medio de la plataforma Arduino. Se consigue un periodo de muestreo muy preciso de $\frac{1}{10000}[s]$. Los datos se transfieren a una computadora por medio del protocolo VSP (puerto serie virtual) bajo USB.

```{figure} /images/RLC.jpg
:height: 350px
:width: 300px
:name: figura91

```

```{figure} /images/Imagen9.png
:height: 450px
:width: 800px
:name: figura10
```

La parte numérica se realiza por medio de Python.
Finalmente se comparan los resultados obtenidos por medio del método numérico con los datos experimentales.



## Segundo ejemplo: Sistema masa-resorte-amortiguador.

<div align='justify'>
El segundo ejemplo experimental es un juguete de madera que tiene unido un resorte.
</div>

```{figure} /images/Imagen1415.png
:height: 250px
:width: 650px
:name: figura11


```