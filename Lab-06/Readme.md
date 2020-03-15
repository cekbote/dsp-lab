
Lab 6
===========

**Aim:**

1. To remove the synthetic baseline signals using a filter designed using the Pole-Zero placement method. The baseline signals are sin signals with frequencies 0.1 Hz, 0.2 Hz and 0.25 Hz.  
2. The Pole-Zero Plots as well as Magnitude and Phase Plots of the transfer function are to be plotted in MATLAB.

Via

1. The Arduino Platform
2. MATLAB


**Data and Code Links**

1. The Codes can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/tree/master/Lab-05/Code)
2. The Data can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/tree/master/Lab-05/Data)
---

Pole-Zero Method for Filter Design
---

The Pole-Zero Method is a very basic method for filter design, where poles and zero are placed on the Z plane. Depending on the placement of poles and zeros, the transfer function is found out. Now, the placement of poles and zeros are changed based on trial and error to get the desired Magnitude and Phase Response of the transfer function. Since this is a method based on trial and error, it is not recomended for complex filter designs, however, it can act as a primer for creating those complex filters. 

<p float="left" align = "center">
  <img src="https://www.dsprelated.com/josimages_new/filters/img1015.png" width="300"/>
</p>

The Transfer Function can be written as: 

<p float="left" align = "center">
  <img src="https://www.dsprelated.com/josimages_new/filters/img986.png" width="400"/>
</p>



#### Steps for designing the filter

To remove low frequency baseline components upto a certain frequency (say 0.4 Hz for tolerance), we follow the following steps.

- Place a zero at |z|=1, for the frequency 0 Hz.

- Place a pole for the frequency 0 Hz with |z| = r, where r = 1 - 2 * pi * Fc / Fs

- The transfer function gain is calculated by making the magnitude response of the transfer function at the cut-off frequency.

- By taking the inverse Z transform, the time domain equation is found out as a finite difference relation. Then the relation is manupulated to make the relation caual and work for time > 0.

### Arduino code for baseline filteration of the PPG Signal

```cpp
float x[]={-0.875693857,-0.919727917,-0.953165283, ...};

const int n = sizeof(x)/sizeof(float);
float e[n];
float k;
float g;
float RMSE;
float SNR;
float sum_e=0;
float x_sq=0;

void setup() 
{
  Serial.begin(9600);
}

void loop() {
  
  float y[n]={0};
  
  for(int i=0;i<n;i++)
  {
    x[i]+=0.1*sin(2*PI*(0.1/80)*i)+0.2*sin(2*PI*(0.2/80)*i)+0.15*sin(2*PI*(0.25/80)*i);
  }
  
  k = 2*cos(PI/100);
  g = 0.3564;
  sum_e = 0;
  x_sq = 0;
  
  for(int i=3;i<n;i++)
  {
    y[i]= 0.9686*y[i-1]+0.9843*x[i]-0.9843*x[i-1];
    e[i] = y[i]-x[i];
    sum_e += e[i]*e[i];
    x_sq += x[i]*x[i];
  }
  
  RMSE = sqrt(sum_e/sizeof(x));
  SNR = 10*log(x_sq/sum_e);
  
  for(int i=0;i<n;i++)
  {
    Serial.print(5*x[i]);
    Serial.print(",");
    Serial.println(5*y[i]+5);
    Serial.print("Root Mean Squared Error:");
    Serial.print(",");
    Serial.println(RMSE);
    Serial.print("Mean Squared Error:");
    Serial.print(",");
    Serial.println(RMSE*RMSE);
    Serial.print("Signal to Noise Error:");
    Serial.print(",");
    Serial.println(SNR);
    Serial.println("");
  }
}
```


__Plots derived from the Arduino Code__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-06/Images/Waveform.PNG"/>
</p>

<p align = "center"> <i>Blue corresponds to the unfiltered PPG signals, Red to the filtered PPG signals.</i></p>

__Statistical Inferences__

| Root Mean Squared Error |  Mean Sqaured Error | Signal to Noise Error |
| ----------- | ----------- | ----------- | 
| 0.28 | 0.08 | 2.15 |



---


__MATLAB Code__
```MATLAB
clc;
clear all;
close all;

r = 0.9686;  
zer = [1]'; 
pol = [r*exp(-1i*pi/100)];
[b,a] = zp2tf(zer,pol,1);
fvtool(b,a);
fvtool(b,a,'Analysis','polezero');
```
__Plots derived from the MATLAB Code__
<p float="left" align = "center">
  <img src="https://github.com/JatinKhare/DSP-2020-JK/blob/master/WEEK-%2006/gifs/pole_zero.png" width = "430"/>
  <img src="https://github.com/JatinKhare/DSP-2020-JK/blob/master/WEEK-%2006/gifs/magnitude.png" width = "430" /> 
  <img src="https://github.com/JatinKhare/DSP-2020-JK/blob/master/WEEK-%2006/gifs/phase.png" width = "430" /> 
</p>






