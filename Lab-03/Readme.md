Lab 3
===========

**Aim:**

1. To compute the pulse rate (PR) from a PPG signal.
2. To compute the pitch period of a speech signal. 

By:

1. Using an Autocorelation function. 


**Data and Code Links**

1. The Lab Sheet for the experiment can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Lab%20Sheet/DSP-Experiment01.pdf)
2. The Arduino Codes can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/tree/master/Lab-02/Code)
3. The Matlab Codes for the Pole - Zero Plots as well as the Magnitude and Frequency Response can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Matlab%20Code/Filters.m)
---

Autocorelation Function
---

The mathematical expression for a discrete time autocorelation function in the time domain is: 

<p align = "center"><a href="https://www.codecogs.com/eqnedit.php?latex=R_{xx}[k]&space;=&space;\sum_{m=&space;-inf}^{inf}x[m]x[m-k]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_{xx}[k]&space;=&space;\sum_{m=&space;-\infty}^{\infty}x[m]x[m-k]" title="R_{xx}[k] = \sum_{m= -\infty}^{\infty}x[m]x[m-k]" /></a></p>


The normalised autocorelation function is:  

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=R_{xx}[k]&space;=&space;\frac{\sum_{m=&space;-inf}^{inf}x[m]x[m-k]}{R_{xx}[0]}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_{xx}[k]&space;=&space;\frac{\sum_{m=&space;-\infty}^{\infty}x[m]x[m-k]}{R_{xx}[0]}" title="R_{xx}[k] = \frac{\sum_{m= -\infty}^{\infty}x[m]x[m-k]}{R_{xx}[0]}" /></a></p>

__Properties of the autocorelation function:__

1. The autocorelation function is symmetric about the Y axis.

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=R_{xx}[k]&space;=&space;R_{xx}[-k]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_{xx}[k]&space;=&space;R_{xx}[-k]" title="R_{xx}[k] = R_{xx}[-k]" /></a></p>

2. The max value computed by the autocorelation function is at the origin. This value is equal to the energy of the signal.

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=R_{xx}[0]&space;=&space;\sum_{m&space;=&space;-\infty}^{\infty}x[m]x[m]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_{xx}[0]&space;=&space;\sum_{m&space;=&space;-\infty}^{\infty}x[m]x[m]" title="R_{xx}[0] = \sum_{m = -\infty}^{\infty}x[m]x[m]" /></a></p>

3. If the data itself has a period of _T_, then even the autocorelation of the data has a period of _T_. 
---

#### Intuition for why the autocorelation provides the time period
---

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-03/Images/Sin_1.PNG" width="280"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-03/Images/Sin_1.PNG" width="280" /> 
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-03/Images/Sin_1.PNG" width="280" />
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-03/Images/Sin_1.PNG" width="280" />
</p>



