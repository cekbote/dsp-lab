
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

- The trasnfer function gain is calculated 

#### Arduino code for FFT filteration of the PPG Signal

We take all the samples of the signal and pass them through a low pass (moving average) filter to reduce the high frequency noise in the signal. Next we compute the DFT using the FFT algorithm. Once that is done we can filter out the repiratory signal as well as the PPG signal by removing the appropriate frequency components and then use the inverse FFT algorithm to get the seperate signals back. We also find the dominant frequency in the respiratory signal by finding the index (m_index) corresponding to the maximum value of the different frequencies of the magnitude response. This dominant frequency is then converted into BPM.

__Pulse Rate (PR) is calculated as:__ 60 * Fs * (m_index) / Length of signal

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
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-05/Images/FFT%20of%20all%20the%20Signals.PNG"/>
</p>

<p align = "center"> <i>Plot respresents the Magnitude response of the DFT Spectrum. Blue Corresponds to the DFT of the Original Signal, Red to the DFT of the PPG signal and Green to the DFT of the Repiratory Signal</i></p>

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-05/Images/Recontructed%20Signals.PNG"/>
</p>

<p align = "center"> <i>Plot represents the . Blue Corresponds to the reconstruction of the Original Signal, Red to the reconstruction of the PPG signal and Green to the reconstruction of the Repiratory Signal. The reconstructed signals look weird because they are clumped together and hence the varationns cannot be observed. </i></p>

---


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
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-05/Images/Plots_Matlab.jpg" width="1000"/>
</p>

__Breathing Rate calculated by using both Matlab as well as Arduino__

| Breathing rate in calculated using Matlab  (in BPM)     |  Breathing rate calculated using Arduino  (in BPM)   |
| ----------- | ----------- | 
| 16     | 25.6      |


---





