Lab 2
===========

**Aim:**

To implement and explain the uses of:

1. Moving Average Filter
2. Derivative Filter (First Order Difference)
3. Derivative Filter (Three Point Central Difference) 

By:

1. Using a live PPG Signal
2. Using two different ECG Signals


**Date and Code Links**

1. The Lab Sheet for the experiment can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Lab%20Sheet/DSP-Experiment01.pdf)
2. The Arduino Codes can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/tree/master/Lab-02/Code)
3. The Matlab Codes for the Pole - Zero Plots as well as the Magnitude and Frequency Response can be found [here.](https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Matlab%20Code/Filters.m)
---

PPG (Photoplethysmogram) Sensor
---
A PPG (photoplethysmography) sensor is a high precision light sensor used to detect volume of blood flow to understand the fluctuation in heart rate.

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Images/Working-principle-of-PPG-sensors.png" width=400/>
</p>

A PPG  senosr makes uses of low-intensity infrared green (IR) light. When light travels through biological tissues it is absorbed by bones, skin pigments and both venous and arterial blood. Since light is more strongly absorbed by blood than the surrounding tissues, the changes in blood flow can be detected by PPG sensors as changes in the intensity of light. The voltage signal from the PPG sensor is proportional to the quantity of blood flowing through the blood vessels. Even small changes in blood volume can be detected using this sensor. 

The advantages that a PPG sensor has over an ECG machine is that it is small and portable, wheras the disadvantage is that it is not as precise as an ECG machine. 

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Images/Arduino_PPG.jpg" width = 250/>
</p>

<p align = "left"> <i>To connect the PPG sensor to the Arduino Board, connect the signal pin to one of the analog pins on the board, connect the voltage pin to the 5V output pin on the board, and connect the grounds. To read the signal from the analog pins, use the function: analogRead(pin_number).</i></p>

---

ECG (Electrocardiogram) Machine
---
An ECG is a noninvasive, painless test with quick results. During an ECG, sensors (electrodes) that can detect the electrical activity of your heart are attached to your chest and sometimes your limbs. These sensors are usually left on for just a few minutes.

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Images/ECG.jpg" width=400/>
</p>
An ECG machine is more precise than a PPG sensor however it is more bulky and hence cant be used for portable applications. 

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

&nbsp; &nbsp; &nbsp; _Fig.1_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.2_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.3_ 

If we take any L point moving average of the signal in _Fig.1_ we get the original signal back without any irregularities. However if we take an L point moving average of the signal in _Fig.2_ some components of the signal are lost. If we take an L point moving average of the signal in _Fig.3_ the signal dimishes a lot, even more than the signal in _Fig.2_. This is because the signal in _Fig.3_ is changing very fast as compared to the signal in _Fig.2_. Therefore, we can say that a moving average filter can be used to filter out components of a signal that change very fast (high frequency signals). Hence, a moving average filter is a low pass filter. 

#### Magnitude Response and Phase Response Plots

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Mag_MA.jpg" width = "430"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Freq_MA.jpg" width = "430" /> 
</p>

&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Magnitude Response_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Phase Response_

From the magnitude response we can confirm that a moving average filter is a low pass filter.

#### Arduino Code for live PPG Data
```cpp
int data_num = 1000;
float data[1000];
float bd[1000];
float x = 0;
int analog_pin = A0;
int l_point_low = 8;
int l_point_high = int(0.8*data_num);



void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i=0; i<data_num; i++)
  {
    data[data_num - 1 - i] = analogRead(analog_pin);
    delay(10);
    }

  for (int i = 0; i< data_num; i++)
  { 
    x = 0;
    // Moving Average
    if (i<l_point_low)
      {for(int k=0; k<i; k++)
        {x += data[i-k];
          }
        }
    else
    {for(int j=0; j<l_point_low; j++)
      {
        x += data[i-j];
        }
      }
      
     Serial.print(data[i]);
     Serial.print(',');
     Serial.println(x/8);
     }
}
```


__Plots derived from the Arduino Code for the live PPG Signal__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/ma.gif"/>
</p>

<p align = "center"> <i>Blue colour indicates the Original Signal and Red colour indicates the Processed Signal</i></p>


#### Arduino Code for ECG Data

```cpp
float arr[1000] = {-194.7293734,-228.7205774,-241.1012313, ... ,-144.4504403,-139.3705715,-155.2151228}
float x = 0;
int num_of_data = 1000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 0; i< 1000; i++)
  { 
    x = 0;
    // Moving Average
    if (i<8)
      {for(int k=0; k<i; k++)
        {x += arr[i-k] 
          }
        }
    else
    {for(int j=0; j<8; j++)
      {
        x += arr[i-j];
        }
      }
      
     Serial.print(arr[i]);
     Serial.print(',');
     Serial.println(x/8);
     }
}
```

__Plots derived from the Arduino Code for the ECG Signals__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/103ma.gif" width = 400/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/119ma.gif" width = 400/>
</p>

<p align = "center"> <i>The plot on the left is for ECG Signal 103 and the plot on the right is for ECG Signal 119. The Blue colour indicates the Original Signal and Red colour indicates the Processed Signal.</i></p>

----

Derivative Filter (First Order Difference)
---

The mathematical expression for a erivative Filter (First Order Difference) filter in the time domain is: 

<p align = "center"><a href="https://www.codecogs.com/eqnedit.php?latex=y[n]&space;=&space;x[n]&space;-&space;x[n-1]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?y[n]&space;=&space;x[n]&space;-&space;x[n-1]" title="y[n] = x[n] - x[n-1]" /></a></p>


In the Z domain the equation is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=Y(z)=(1-z^{-1})X(z)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Y(z)=(1-z^{-1})X(z)" title="Y(z)=(1-z^{-1})X(z)" /></a></p>

The Transfer Function is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=H(z)=\frac{Y(z)}{X(z)}=\frac{z-1}{z}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)=\frac{Y(z)}{X(z)}=\frac{z-1}{z}" title="H(z)=\frac{Y(z)}{X(z)}=\frac{z-1}{z}" /></a></p>

The Magnitude and Phase responses are: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=|H(jw)|&space;=&space;2sin(w/2)\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;tan^{-1}(cot(w/2))" target="_blank"><img src="https://latex.codecogs.com/gif.latex?|H(jw)|&space;=&space;2sin(w/2)\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;tan^{-1}(cot(w/2))" title="|H(jw)| = 2sin(w/2)\enspace \enspace \enspace \angle H(jw) = tan^{-1}(cot(w/2))" /></a></p>

The Pole - Zero plot is:


<p align = "center"><img style="float: right;" src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/PZ_DE_1.jpg" >

#### Intuition for the Working of the Filter
------

A erivative Filter (First Order Difference) is a high pass filter. The intuition for this can be obtained via the following thought experiment:

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Constant.PNG" width="280"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Sine_05.PNG" width="280" /> 
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Sine_4.PNG" width="280" />
</p>

&nbsp; &nbsp; &nbsp; _Fig.1_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.2_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.3_ 

If we take a first order difference of the signal in _Fig.1_ we get back a zero value. However if we take a first order difference of the signal in _Fig.2_ we get a definite output. If we take a first order difference of the signal in  _Fig.3_, the  output increases a lot, even more than the first order differnce of the signal in _Fig.2_. This is because the signal in _Fig.3_ is changing very fast as compared to the signal in _Fig.2_, and hence its derivative is much more. Therefore, we can say that a first order difference filter enhances signals with a faster rate of change (higher frequency) as compared to ones of lower frequencies. Therefore, a first order difference filter can be used to filter out components of a signal that change very slowly (low frequency signals). Hence, a moving average filter is a high pass filter. 

#### Magnitude Response and Phase Response Plots

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Mag_DE_1.jpg" width = "430"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Freq_DE_1.jpg" width = "430" /> 
</p>

&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Magnitude Response_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Phase Response_

From the magnitude response we can confirm that a Derivative Filter (First Order Difference) is a high pass filter.

#### Arduino Code for live PPG Data
```cpp
int data_num = 1000;
float arr[1000];
float y = 0;
int analog_pin = A0;
int l_point = 8;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

   for(int i=0; i<data_num; i++)
  {
    arr[data_num - 1 - i] = analogRead(analog_pin);
    delay(10);
    }
  
  for (int i = 0; i< data_num; i++)
  { 
    y = 0;

     // First Order Difference
     if (i == 0)
     {
      y = 0;
      }
      else
      {
        y = arr[i] - arr[i-1];
        }

     Serial.print(arr[i]);
     Serial.print(',');
     Serial.println(y);
     }
}
```


__Plots derived from the Arduino Code for the live PPG Signal__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/df.gif"/>
</p>

<p align = "center"> <i>Blue colour indicates the Original Signal and Red colour indicates the Processed Signal</i></p>

#### Arduino Code for ECG Data

```cpp
float arr[1000] = {-194.7293734,-228.7205774,-241.1012313, ... ,-144.4504403,-139.3705715,-155.2151228}
float y = 0;
int num_of_data = 1000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 0; i< 1000; i++)
  { 
    y = 0;

     // First Order Difference
     if (i == 0)
     {
      y = 0;
      }
      else
      {
        y = arr[i] - arr[i-1];
        }

     Serial.print(arr[i]);
     Serial.print(',');
     Serial.println(y);
     }
}
```

__Plots derived from the Arduino Code for the ECG Signals__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/103df.gif" width = 400/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/119df.gif" width = 400/>
</p>

<p align = "center"> <i>The plot on the left is for ECG Signal 103 and the plot on the right is for ECG Signal 119. The Blue colour indicates the Original Signal and Red colour indicates the Processed Signal.</i></p>

----

Derivative Filter (Three Point Central Difference)
---

The mathematical expression for a Derivative Filter (Three Point Central Difference) filter in the time domain is: 

<p align = "center"><a href="https://www.codecogs.com/eqnedit.php?latex=y[n]&space;=&space;x[n]&space;-&space;x[n-2]" target="_blank"><img src="https://latex.codecogs.com/gif.latex?y[n]&space;=&space;x[n]&space;-&space;x[n-2]" title="y[n] = x[n] - x[n-2]" /></a></p>


In the Z domain the equation is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=Y(z)&space;=&space;(1&space;-&space;z^{-2})X(z)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Y(z)&space;=&space;(1&space;-&space;z^{-2})X(z)" title="Y(z) = (1 - z^{-2})X(z)" /></a></p>

The Transfer Function is: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=H(z)&space;=&space;\frac{Y(z)}{X(z)}&space;=&space;\frac{z^{2}&space;-&space;1}{z^{2}}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)&space;=&space;\frac{Y(z)}{X(z)}&space;=&space;\frac{z^{2}&space;-&space;1}{z^{2}}" title="H(z) = \frac{Y(z)}{X(z)} = \frac{z^{2} - 1}{z^{2}}" /></a></p>

The Magnitude and Phase responses are: 

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=|H(jw)|&space;=&space;2sin(w)&space;\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;tan^{-1}(cot(w))" target="_blank"><img src="https://latex.codecogs.com/gif.latex?|H(jw)|&space;=&space;2sin(w)&space;\enspace&space;\enspace&space;\enspace&space;\angle&space;H(jw)&space;=&space;tan^{-1}(cot(w))" title="|H(jw)| = 2sin(w) \enspace \enspace \enspace \angle H(jw) = tan^{-1}(cot(w))" /></a></p>

The Pole - Zero plot is:


<p align = "center"><img style="float: right;" src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/PZ_DE_2.jpg" >

#### Intuition for the Working of the Filter
------

A Derivative Filter (Three Point Central Difference) is a band pass filter. The intuition for this can be obtained via the following thought experiment:

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Constant.PNG" width="280"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Sine_05.PNG" width="280" /> 
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Sine_4.PNG" width="280" />
</p>

&nbsp; &nbsp; &nbsp; _Fig.1_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.2_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.3_ 

If we take a first order difference of the signal in _Fig.1_ we get back a zero value. However if we take a first order difference of the signal in _Fig.2_ we get a definite output. If we take a first order difference of the signal in _Fig.3_ output increases a lot, even more than the signal in _Fig.2_. This is because the signal in _Fig.3_ is changing very fast as compared to the signal in _Fig.2_. However, if the frequency of the signal in _Fig.3_ is very high, then it is possible, that a three point central difference outputs a very small value. That can be because the x[n] corresponds a large positive value and the x[n-2] corresponds to the same or a similar value. (If the time period of the signal is such that it is less than 2 units of time {as x[n-2] }). Therefore, we can say that a three point central difference filter is a band pass filter. 

#### Magnitude Response and Phase Response Plots

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Mag_DE_2.jpg" width = "430"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Freq_DE_2.jpg" width = "430" /> 
</p>

&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Magnitude Response_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Phase Response_

From the magnitude response we can confirm that a Derivative Filter (Three Point Central Difference) is a band pass filter.

#### Arduino Code for live PPG Data
```cpp
int data_num = 1000;
float arr[1000];
float z = 0;
int analog_pin = A0;
int l_point = 8;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

   for(int i=0; i<data_num; i++)
  {
    arr[data_num - 1 - i] = analogRead(analog_pin);
    delay(10);
    }

     for (int i = 0; i< data_num; i++)
    { 
      z = 0;

      // Second Order Difference
        if (i < 2)
      {
          z = arr[i]; 
      }
        else
        {
         z = arr[i] - arr[i-2];
        }

     Serial.print(arr[i]);
     Serial.print(',');
     Serial.print(z);
     }
}
```


__Plots derived from the Arduino Code from the live PPG Signal__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/ma.gif"/>
</p>

<p align = "center"> <i>Blue colour indicates the Original Signal and Red colour indicates the Processed Signal</i></p>

#### Arduino Code for ECG Data

```cpp
float arr[1000] = {-194.7293734,-228.7205774,-241.1012313, ... ,-144.4504403,-139.3705715,-155.2151228}
float z = 0;
int num_of_data = 1000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 0; i< 1000; i++)
  { 
    z = 0;

      // Second Order Difference
        if (i < 2)
      {
          z = arr[i]; 
      }
        else
        {
         z = arr[i] - arr[i-2];
        }

     Serial.print(arr[i]);
     Serial.print(',');
     Serial.print(z);
     }
}
```

__Plots derived from the Arduino Code from the ECG Signals__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/103ma.gif" width = 400/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-02/Gifs/119ma.gif" width = 400/>
</p>

<p align = "center"> <i>The plot on the left is for ECG Signal and the plot on the right is for ECG Signal 119. The Blue colour indicates the Original Signal and Red colour indicates the Processed Signal.</i></p>

----

Practical Uses of the Filters
---

The Data we have used is from a PPG sensor. Now this data represents an addition of the following:

1. __Noise Free Signal (NFS)__ This is a Noise Free Signal that we have to obtain.
2. __Baseline Drift (BD) :__ Usually a biological signal's mean amplitude (over a large period of time) remains constant. However, in our experiment, the mean varies. This can be because of multiple factors such as motion of the person, or even due to the heartbeat. This has to be eleminated to garner a proper understanding of the original signal.  
3. __Noise (N):__ Noise consists of high freqeuency components and these have to be filtered out.

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=Data&space;=&space;NFS&space;&plus;&space;BD&space;&plus;&space;N" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Data&space;=&space;NFS&space;&plus;&space;BD&space;&plus;&space;N" title="Data = NFS + BD + N" /></a></p>

_Baseline Drift_ can be obtained by using an L point Moving Average Filter, where the L is very large. _Noise_ can be obtained by passing the signal through a Derivative Filter (First Order Difference). Once these two are obtained, we can get the _NFS_ by subtracting the _BD_ and _N_ from the data.

<p align = "center" ><a href="https://www.codecogs.com/eqnedit.php?latex=NFS&space;=&space;Data&space;-&space;BD&space;-&space;N" target="_blank"><img src="https://latex.codecogs.com/gif.latex?NFS&space;=&space;Data&space;-&space;BD&space;-&space;N" title="NFS = Data - BD - N" /></a></p>

Another method to obtain the _NFS_ is first obtain the _BD_ and subtract the _BD_ from the _Data_. Next we pass the _Data - BD_ to a moving average filter. This would reduce the high frequency components. However, even after this some, medium to high frequency components may remain. So we pass this _Data - BD_ through a Derivative Filter to obtain some of the remaining medium to high frequency components. This is done by taking a First Order Difference or a Three Point Central Difference depending on the application and the accuracy you desire. Then again subtract these medium to high frequency components from the _Data - BD_ to obtain the _NFS_.  

#### Arduino Code for obtaining the baseline drift for live PPG Data
```cpp
int data_num = 1000;
float data[1000];
float x = 0;
int analog_pin = A0;
int l_point = int(0.8 * data_num);



void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i=0; i<data_num; i++)
  {
    data[data_num - 1 - i] = analogRead(analog_pin);
    delay(10);
    }

  for (int i = 0; i< data_num; i++)
  { 
    x = 0;
    // Moving Average
    if (i<l_point)
      {for(int k=0; k<i; k++)
        {x += data[i-k];
          }
        }
    else
    {for(int j=0; j<l_point; j++)
      {
        x += data[i-j];
        }
      }
      
     Serial.print(data[i]);
     Serial.print(',');
     Serial.println(x/8);
     }
}
```

#### Arduino Code for obtaining the baseline drift for ECG Data

```cpp
float arr[1000] = {-194.7293734,-228.7205774,-241.1012313, ... ,-144.4504403,-139.3705715,-155.2151228}
float x = 0;
int num_of_data = 1000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 0; i< 1000; i++)
  { 
    x = 0;
    
    // Moving Average
    if (i< 800)
      {
        for (int p = 0; p < i; p ++)
        {
          x += arr[p];
          }
        }
    else
    {for(int j=0; j<800; j++)
      {
        x += arr[i-j];
        }
      }
      
     Serial.print(arr[i]);
     Serial.print(',');
     Serial.println(x/800);
     }
}
```

__Plots derived from the Arduino Code__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Gifs/ma800.gif"/>
</p>

<p align = "center"> <i>Blue colour indicates the Original Signal and Red colour indicates the Processed Signal</i></p>

#### Arduino Code for obtaining the remaining medium to high frequency commponents of the Noise Signal for live PPG Data
```cpp
int data_num = 1000;
float data[1000];
float bd[1000];
float x = 0;
int analog_pin = A0;
int l_point_low = 8;
int l_point_high = int(0.8*data_num);



void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i=0; i<data_num; i++)
  {
    data[data_num - 1 - i] = analogRead(analog_pin);
    delay(10);
    }

   for (int i = 0; i< data_num; i++)
  { 
    // Baseline Drift
    if (i<l_point_high)
      {for(int k=0; k<i; k++)
        {bd[i] += data[i-k];
          }
         bd[i] = bd[i]/l_point_high;
        }
    else
    {for(int j=0; j<l_point_high; j++)
      {
        bd[i] += data[i-j];
        }
        bd[i] = bd[i]/l_point_high;
      }
  }

   for(int i =0; i<data_num; i++)
   {
    data[i] = data[i] - bd[i];
    }

  for (int i = 0; i< data_num; i++)
  { 
    x = 0;
    // Moving Average
    if (i<l_point_low)
      {for(int k=0; k<i; k++)
        {x += data[i-k];
          }
        }
    else
    {for(int j=0; j<l_point_low; j++)
      {
        x += data[i-j];
        }
      }
      
     Serial.print(data[i]);
     Serial.print(',');
     Serial.print(bd[i]);
     Serial.print(',');
     Serial.println(x/8);
     }
}
```

#### Arduino Code for obtaining the remaining medium to high frequency commponents of the Noise Signal for ECG Data

```cpp
float arr[1000] = {-194.7293734,-228.7205774,-241.1012313, ... ,-144.4504403,-139.3705715,-155.2151228}
float x = 0;
float z[1000]; 
int num_of_data = 1000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 0; i< 1000; i++)
  { 
    x = 0;

      // Second Order Difference
        if (i < 2)
      {
          z[i] = 0; 
      }
        else
        {
         z[i] = arr[i] - arr[i-2];
        }

      // Averaging the Difference

          // Moving Average
    // Moving Average
    if (i< 8)
      {
        for (int p = 0; p < i; p ++)
        {
          x += arr[p];
          }
        }
    else
    {for(int j=0; j<8; j++)
      {
        x += arr[i-j];
        }
      }

     Serial.print(arr[i]);
     Serial.print(',');
     Serial.println(z[i]/8);
     }
}
```

__Plots derived from the Arduino Code__

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Gifs/dfma.gif"/>
</p>

<p align = "center"> <i>Blue colour indicates the Original Signal and Red colour indicates Processed Signal</i></p>




