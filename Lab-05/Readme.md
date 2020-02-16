Lab 4
===========

**Aim:**

1. To filter out the Repiratory Signal as well as the PPG Signal from a combination of the both of them. 
2. To find the respiration rate using the FFT. 

Via

1. The Arduino Platform
2. MATLAB


**Data and Code Links**

1. The Arduino Codes can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/tree/master/Lab-03/Code)
---

Discrete Fourier Transform
---

The mathematical expression for calculating the individual frequency components of a signal using the FFT algorithm is as follows:

<p float="left" align = "center">
  <img src="https://github.com/JatinKhare/DSP-2020-JK/blob/master/WEEK-%2005/equations/fft.gif" width="300"/>
</p>

This can be recursively written as follows: 

<p float="left" align = "center">
  <img src="https://github.com/JatinKhare/DSP-2020-JK/blob/master/WEEK-%2005/equations/fft2.gif" width="300"/>
</p>


#### Arduino code for FFT filteration of the PPG Signal

We take all the samples of the signal and pass them through a low pass (moving average) filter to reduce the high frequency noise in the signal. Next we compute the DFT using the FFT algorithm. Once that is done we can filter out the repiratory signal as well as the PPG signal by removing the appropriate frequency components and then use the inverse FFT algorithm to get the seperate signals back. We also we 

__Pulse Rate (PR) is calculated as:__ 60 * Fs * (first index) / Length of signal

This is in beats per minute. 

__Arduino Code__
```cpp
#include <arduinoFFT.h>
arduinoFFT FFT = arduinoFFT();
float data[300] = {-372.3628292,50.75906574,499.6210468, ...}; 
float p = 0;
double X[512];
float N = 512;
double average = 0;
double x_mag_resp[512];
float Pi = 3.14159;
float inex;
float peak;
float PR = 0;
const uint16_t samples = 512;
const double samplingFrequency = 10;
double vReal[512];
double vImag[512];
double respReal[512];
double respImag[512];
double resp[512];
double resp_fft_mag[512];
double ppgReal[512];
double ppgImag[512];
double ppg[512];
double ppg_fft_mag[512];
double index_ = 0;
double data_[512];


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

}

void loop() 
{
  // Populating the values of x with zeros
  for (int i = 0; i < N; i++)
  {
    vReal[i] = 0;
    vImag[i] = 0;
    }
  

  // Moving Average
  for (int i = 0; i< 300; i++)
  { 
    p = 0;
    if (i<8)
      {for(int k=0; k<i; k++)
        {p += data[i-k];
          }
        }
    else
    {for(int j=0; j<8; j++)
      {
        p += data[i-j];
        }
      }
    vReal[i] = p;
    average += vReal[i];
  }

  average = average / 512;

  for (int i = 0; i < 512; i++)
  {
    vReal[i] -= average;
    data_[i] = vReal[i];
    }


  // Computing the FFT
  FFT.Windowing(vReal, samples, FFT_WIN_TYP_HAMMING, FFT_FORWARD);  /* Weigh data */
  FFT.Compute(vReal, vImag, samples, FFT_FORWARD); /* Compute FFT */

  
  // Filtering
  index_ = 0.5 * 512 / samplingFrequency;
  for(int n = 0; n <N; n++)
  {
    if (n < index_ + 1 || n > (512 - index_))
    {
      ppgReal[n] = 0;
      ppgImag [n] = 0;
      respReal[n] = vReal[n];
      respImag[n] = vImag[n];
      }

      else
      {
        respReal[n] = 0;
        respImag [n] = 0;
        ppgReal[n] = vReal[n];
        ppgImag[n] = vImag[n];
        }
    }

    // Index

    for (int n = 1; n < index_; n++)
    { if (peak < sqrt(respReal[n] * respReal[n] + respImag[n] * respImag[n]));
      {
        peak = sqrt(respReal[n] * respReal[n] + respImag[n] * respImag[n]);
        inex = n;
        }
      }


//   Printing the Freq Plots
  for (int n = 0; n < N; n++)
  {
    Serial.println(sqrt(vReal[n] * vReal[n] + vImag[n] * vImag[n]));
    Serial.print(',');
    Serial.print(sqrt(ppgReal[n] * ppgReal[n] + ppgImag[n] * ppgImag[n]) );
    Serial.print(',');
    Serial.println(sqrt(respReal[n] * respReal[n] * respImag[n] * respImag[n])/10000.0);
//    Serial.print(',');
//    Serial.println(inex / 512 * 10 * 60);
  }

  // Printing the Time Plots
  FFT.Compute(respReal, respImag, samples, FFT_REVERSE);
  FFT.Compute(ppgReal, ppgImag, samples, FFT_REVERSE);
  FFT.ComplexToMagnitude(respReal, respImag, samples);
  FFT.ComplexToMagnitude(ppgReal, ppgImag, samples);
  FFT.ComplexToMagnitude(vReal, vImag, samples);
    for (int n = 0; n < N; n++)
  {
    
    Serial.print(sqrt(vReal[n] * vReal[n] + vImag[n] * vImag[n])/ 5.0);
    Serial.print(',');
    Serial.print(sqrt(ppgReal[n] * ppgReal[n] + ppgImag[n] * ppgImag[n]) * 10 );
    Serial.print(',');
    Serial.println(sqrt(respReal[n] * respReal[n] * respImag[n] * respImag[n]));
  }
}
```


__Plots derived from the Arduino Code__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-04/Images/Magnitude%20Response%20DFT.PNG"/>
</p>

<p align = "center"> <i>Magnitude response of the DFT Spectrum.</i></p>

---


----


__MATLAB Code__
```MATLAB
clc;
clear all;
close all;

% Data
data = load('ppgwithRespiration_10hz_30seconds.mat');
data = data.xppg;

% Properties about the Data
Fs = 10;
filter_start_index = 0.5 * size(data, 2) / Fs;

% Filtering
fft_ = fft(data);

resp_fft = fft_;
resp_fft(filter_start_index + 1: size(fft_, 2) - filter_start_index) = 0;
resp = ifft(resp_fft);

ppg_fft = fft_ - resp_fft;
ppg = ifft(ppg_fft);

% Respiration rate
[~, max_index] = max(abs(resp_fft(2: filter_start_index + 1)));
display('The respiration rate is:');
display(60 * (max_index * Fs / size(data, 2)));

% Graphs
figure;

subplot(6, 1, 1);
plot(data);
xlabel('Time');
ylabel('Magnitude');
title('Original Data');

subplot(6, 1, 2);
plot(abs(fft_));
xlabel('Frequency');
ylabel('Magnitude');
title('FFT of Data');

subplot(6, 1, 3);
plot(abs(ppg));
xlabel('Time');
ylabel('Magnitude');
title('PPG Data');

subplot(6, 1, 4);
plot(abs(ppg_fft));
xlabel('Frequency');
ylabel('Magnitude');
title('FFT of PPG');

subplot(6, 1, 5);
plot(abs(resp));
xlabel('Time');
ylabel('Magnitude');
title('Respiration');

subplot(6, 1, 6);
plot(abs(resp_fft));
xlabel('Time');
ylabel('Magnitude');
title('FFT of Respiration');
```
__Plots derived from the MATLAB Code__
<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-04/Images/Autocorrelation.PNG" width=400""/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-04/Images/Magnitude%20Response.PNG" width="400" /> 
</p>

<p align = "center"> <i>The plot on the left is the autorrelation of the original data. The plot on the right is the Magnitude Spectrum of the DFT of the signal.</i></p>



__Pulse Rate calculated by using both DFT as well as Autocorrelation__

| Pulse rate in calculated using DFT  (in BPM)     |  Pulse rate calculated using Autocorrelation  (in BPM)   |  Error (%) | 
| ----------- | ----------- | ----------- |
| 80      | 68.1818      |  17.33 % |

Hence through the experiment, we can conclude that if the sampling rate is very low (as it was in this experiment) we can see that computing PR using DFT is much worse than calculating PR using Autocorrelation. (Note that the same value is obtained when you use write the code in MATLAB or the C variant used by the Arduino boards. 

---





