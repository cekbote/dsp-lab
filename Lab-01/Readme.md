Lab 1
===========

**Aim:**

To implement and explain:

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

