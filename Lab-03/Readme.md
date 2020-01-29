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

<p align = "center"><a href="https://www.codecogs.com/eqnedit.php?latex=R_{xx}[k]&space;=&space;\sum_{m=&space;-inf}^{inf}x[m]x[m-k]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_{xx}[k]&space;=&space;\sum_{m=&space;-inf}^{inf}x[m]x[m-k]" title="R_{xx}[k] = \sum_{m= -inf}^{inf}x[m]x[m-k]" /></a></p>


The normalised autocoraltion function is:  

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=R_{xx}[k]&space;=&space;\frac{\sum_{m=&space;-inf}^{inf}x[m]x[m-k]}{R_{xx}[0]}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_{xx}[k]&space;=&space;\frac{\sum_{m=&space;-inf}^{inf}x[m]x[m-k]}{R_{xx}[0]}" title="R_{xx}[k] = \frac{\sum_{m= -inf}^{inf}x[m]x[m-k]}{R_{xx}[0]}" /></a></p>

The Transfer Function is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=H(z)&space;=&space;\frac{Y(z)}{X(z)}&space;=&space;1/8&space;*&space;\frac{z^{8}&space;-1}{z^{7}(z-1)}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)&space;=&space;\frac{Y(z)}{X(z)}&space;=&space;1/8&space;*&space;\frac{z^{8}&space;-1}{z^{7}(z-1)}" title="H(z) = \frac{Y(z)}{X(z)} = 1/8 * \frac{z^{8} -1}{z^{7}(z-1)}" /></a></p>

The Magnitude and Phase responses are: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=|H(jw)|&space;=&space;1/8&space;*&space;\frac{sin(8w/2)}{w/2}\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;e^{-7/2jw}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?|H(jw)|&space;=&space;1/8&space;*&space;\frac{sin(8w/2)}{w/2}\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;e^{-7/2jw}" title="|H(jw)| = 1/8 * \frac{sin(8w/2)}{w/2}\enspace \enspace \enspace \angle H(jw) = e^{-7/2jw}" /></a></a></p>

