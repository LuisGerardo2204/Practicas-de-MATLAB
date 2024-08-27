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

# Notebooks con estilo personalizado

Jupyter Book also lets you write text-based notebooks using MyST Markdown.
See [the Notebooks with MyST Markdown documentation](https://jupyterbook.org/file-types/myst-notebooks.html) for more detailed instructions.
This page shows off a notebook written in MyST Markdown.

## An example cell

With MyST Markdown, you can define code cells with a directive like so:

```{code-cell}
:tags: ["hide-cell"]
from __future__ import division, absolute_import, print_function
import matplotlib.pyplot as plt
import csv
import matplotlib.pylab as plb
import array    # una variable arreglo para almacenar los datos recibidos
import numpy as np
import time  
from scipy.signal import find_peaks
from scipy import signal
from scipy.fft import fftshift
from matplotlib import cm # colour map
from scipy.optimize import curve_fit
from scipy.interpolate import interp1d
from scipy.signal import savgol_filter
```
```{code-cell}
plt.rcParams.update({'font.size': 10})

x=[]
y=[]


#with open('Carlos.txt','r') as csvfile:
with open('XILO.txt','r') as csvfile:
#with open('syb.txt','r') as csvfile:    
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        x.append(float(row[0]))
        y.append(float(row[1]))

nSamples = len(x)
NFFT = 2**nSamples  

samplingRate = int(round(1/(x[3]-x[2]),0))        

x1 =np.array(x)       
y1 =np.array(y)

y1=y1-y1.mean()#volts
#y1=(y1-y1.mean())/0.33


fig, (ax1) = plt.subplots(1,sharex=False, sharey=False)
#fig.suptitle('Analisis frecuencial')

ax1.plot(x1,y1)
ax1.set_xlabel('time [s]')
ax1.set_ylabel('V [volts]');
#ax1.set_ylabel('acc [g]')
#ax1.set_xlim(1.11,1.115);

print(2 + 2)
```

When your book is built, the contents of any `{code-cell}` blocks will be
executed with your default Jupyter kernel, and their outputs will be displayed
in-line with the rest of your content.

```{seealso}
Jupyter Book uses [Jupytext](https://jupytext.readthedocs.io/en/latest/) to convert text-based files to notebooks, and can support [many other text-based notebook files](https://jupyterbook.org/file-types/jupytext.html).
```
```{code-cell}
:tags: ["hide-cell"]
plt.rcParams.update({'font.size': 12})
fig5, (ax6) = plt.subplots(nrows=1)
fig2, (tabla) = plt.subplots(nrows=1)


espectro,f,uno=ax6.magnitude_spectrum(y1,Fs=samplingRate, color='C1')

ff = np.linspace(f.min(),f.max(), 2**16)

# interpolate + smooth
itp = interp1d(f,espectro, kind='linear')
window_size, poly_order = 5, 2
spec_sg = savgol_filter(itp(ff), window_size, poly_order)
spec_sg =spec_sg*10

#peaks, _ = find_peaks(espectro, height=0.002,distance=10)
peaks, _ = find_peaks(spec_sg, height=10*0.007,distance=10)

np.diff(peaks)

ax6.clear()

ax6.plot(ff,spec_sg)

ax6.plot(ff[peaks],spec_sg[peaks], "x")
ax6.set_xlim(min(ff[peaks])-0.025*min(ff[peaks]),max(ff[peaks])+0.025*max(ff[peaks]))


columns = ('Frequency [Hz]','Amplitude')
rows=np.empty(peaks.size)
i=0
for i in range(peaks.size-1):
    rows[i] =i+1
    
tabla.axis("off")

datos=np.empty([peaks.size,2])
#print(datos)
a=(ff[peaks])
b=(spec_sg[peaks])
i=0
for i in range(peaks.size):
      datos[i][0] =round(a[i],3)
i=0      
for i in range(peaks.size):
      datos[i][1] =round(b[i],3)    

i=0
for i in range(peaks.size):
      rows[i]=str(i+1)    
#print(datos)

la_tabla = tabla.table(cellText=datos,rowLabels=rows, colLabels=columns,
                      loc='center')
la_tabla.auto_set_font_size(False)
la_tabla.set_fontsize(10)
plt.subplots_adjust(bottom=0.05)

```
```{code-cell}
:tags: ["thebe-init","hide-cell"]

%matplotlib inline
from ipywidgets import interact
import ipywidgets as widgets
from __future__ import division, absolute_import, print_function
import csv
import array    # una variable arreglo para almacenar los datos recibidos
import matplotlib.pyplot as plt
import matplotlib.pylab as plb
import numpy as np
from optparse import OptionParser   # para desempaquetar o armar las opciones
import time   # que permitan armar archivos  sus nombres.


def f(fs,R,C,L):
   

    t=np.arange(0,10000*(1/10000),1/10000)

    i0=0;            #
    v0=0;            # Condiciones iniciales
    A=0;             # 
    U0=A;            # 
    #R = 1600;
    #R = 1570; 
    #L =15.02;
    C =C*(10.0**(-6));  

    h=1/fs;         # Ancho del paso 
    N=int(0.4/h);    # Número total de pasos

    i2=np.empty([N+1],dtype=float);
    v2=np.empty([N+1],dtype=float);

    i3=np.empty([N+1],dtype=float);
    v3=np.empty([N+1],dtype=float);

    i4=np.empty([N+1],dtype=float);
    v4=np.empty([N+1],dtype=float);

    tr=np.empty([N+1],dtype=float);
    U=np.empty([N+1],dtype=float);

    tr[0]=0;         # 
    i2[0]=i0;
    i3[0]=i0;
    i4[0]=i0;
# Condiciones iniciales
    v2[0]=v0;
    v3[0]=v0;
    v4[0]=v0;
# 
    U[0]=U0;


    n=0
    for n in range(N):
        tr[n+1]=n*h;
        U[n]=1.638;
        U[n+1]=1.638;
        #U[n]=1.598;
        #U[n+1]=1.598
        # método RK2 
        k11=-R/L*i2[n]-1/L*v2[n]+1/L*U[n];
        k12=1/C*i2[n];
    
        k21=-R/L*(i2[n]+h*k11)-1/L*(v2[n]+h*k12)+1/L*U[n];
        k22=1/C*(i2[n]+h*k11);
    
        i2[n+1]=i2[n]+h*(0.5*k11+0.5*k21);
        v2[n+1]=v2[n]+h*(0.5*k12+0.5*k22);
        #i2[n+1]=i2[n]+h*((1/3)*k11+(2/3)*k21);
        #v2[n+1]=v2[n]+h*((1/3)*k12+(2/3)*k22);

        # método RK3 
        k11=-R/L*i3[n]-1/L*v3[n]+1/L*U[n];
        k12=1/C*i3[n];

        k21=-R/L*(i3[n]+0.5*h)-1/L*(v3[n]+0.5*h*k11)+1/L*U[n];
        k22=1/C*(i3[n]+0.5*h);

        k31=-R/L*(i3[n]+h)-1/L*(v3[n]-h*k11+2*k21*h)+1/L*U[n];
        k32=1/C*(i3[n]+h);
    
        i3[n+1]=i3[n]+(1/6)*h*(k11+4*k21+k31);
        v3[n+1]=v3[n]+(1/6)*h*(k12+4*k22+k32);

        # método RK4 
        k11=-R/L*i4[n]-1/L*v4[n]+1/L*U[n];
        k12=1/C*i4[n];

        k21=-R/L*(i4[n]+0.5*h)-1/L*(v4[n]+0.5*h*k12)+1/L*U[n];
        k22=1/C*(i4[n]+0.5*h);

        k31=-R/L*(i4[n]+0.5*h)-1/L*(v4[n]+0.5*h*k22)+1/L*U[n];
        k32=1/C*(i4[n]+h*0.5);
    
        k41=-R/L*(i4[n]+h)-1/L*(v4[n]+h*k32)+1/L*U[n];
        k42=1/C*(i4[n]+h);


        i4[n+1]=i4[n]+(1/6)*h*(k11+2*k21+2*k31+k41);
        v4[n+1]=v4[n]+(1/6)*h*(k12+2*k22+2*k32+k42);

        n=n+1;

    plt.plot(tr,v2)
    plt.plot(tr,v3)
    plt.plot(tr,v4)

    plt.title('V(t)')
    plt.xlabel('t [s]')
    plt.ylabel('Voltaje (V)')
    plt.legend(["Runge-Kutta 2","Runge-Kutta 3","Runge-Kutta 4"], numpoints=1,loc=0)

    return(R)



interact(f,fs=widgets.FloatSlider(min=100,max=5000,step=10,value=1000), R=widgets.IntSlider(min=120,max=8000,step=10,value=1500),C=widgets.FloatSlider(min=1,max=100,step=1.1,value=15.0),L=widgets.FloatSlider(min=1,max=30,step=1.1,value=15.0));

```