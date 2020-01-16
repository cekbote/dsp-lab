Lab 1
===========

**Aim:**

To implement and explain the uses of:

1. Moving Average Filter
2. Derivative Filter (First Order Difference)
3. Derivative Filter (Three Point Central Difference) 

---

Moving Average Filter
---

The mathematical expression for a moving average filter in the time domain is: 

<p align = "center"><a href="https://www.codecogs.com/eqnedit.php?latex=y[n]&space;=&space;1/L&space;*&space;\sum_{i&space;=&space;0}^{L&space;-1}&space;x[n-i]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?y[n]&space;=&space;1/L&space;*&space;\sum_{i&space;=&space;0}^{L&space;-1}&space;x[n-i]" title="y[n] = 1/L * \sum_{i = 0}^{L -1} x[n-i]" /></a></p>


In the Z domain the equation is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=Y(z)&space;=&space;1/L&space;*&space;\sum_{i=0}^{L-1}z^{-i}X(z)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Y(z)&space;=&space;1/L&space;*&space;\sum_{i=0}^{L-1}z^{-i}X(z)" title="Y(z) = 1/L * \sum_{i=0}^{L-1}z^{-i}X(z)" /></a></p>

The Transfer Function is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=H(z)&space;=&space;\frac{Y(z)}{X(z)}&space;=&space;1/8&space;*&space;\frac{z^{8}&space;-1}{z^{7}(z-1)}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)&space;=&space;\frac{Y(z)}{X(z)}&space;=&space;1/8&space;*&space;\frac{z^{8}&space;-1}{z^{7}(z-1)}" title="H(z) = \frac{Y(z)}{X(z)} = 1/8 * \frac{z^{8} -1}{z^{7}(z-1)}" /></a></p>

The Magnitude and Phase responses are: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=|H(jw)|&space;=&space;1/8&space;*&space;\frac{sin(8w/2)}{w/2}\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;e^{-7/2jw}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?|H(jw)|&space;=&space;1/8&space;*&space;\frac{sin(8w/2)}{w/2}\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;e^{-7/2jw}" title="|H(jw)| = 1/8 * \frac{sin(8w/2)}{w/2}\enspace \enspace \enspace \angle H(jw) = e^{-7/2jw}" /></a></a></p>

The Pole - Zero plot is:


<p align = "center"><img style="float: right;" src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/PZ_MA.jpg" >

#### Intuition for the Working of the Filter
------

A moving average filter is a low pass filter. The intuition for this can be obtained via the following thought experiment:

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Constant.PNG" width="280"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Sine_05.PNG" width="280" /> 
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Sine_4.PNG" width="280" />
</p>

&nbsp; _Fig.1_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.2_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.3_ 

If we take any L point moving average of the signal in _Fig.1_ we get the original signal back without any irregularities. However if we take an L point moving average of the signal in _Fig,2_ some components of the signal are lost. If we take an L point moving average of the signal in _Fig.3_ the signal dimishes a lot, even more than the signal in _Fig.2_. This is because the signal in _Fig.3_ is changing very fast as compared to the signal in _Fig.2_. Therefore, we can say that a moving average filter can be used to filter out components of a signal that change very fast (high frequency signals). Hence, a moving average filter is a low pass filter. 

#### Magnitude Response and Phase Response Plots

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Mag_MA.jpg" width = "430"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Freq_MA.jpg" width = "430" /> 
</p>
