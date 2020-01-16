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

&nbsp; &nbsp; &nbsp; _Fig.1_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.2_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  _Fig.3_ 

If we take any L point moving average of the signal in _Fig.1_ we get the original signal back without any irregularities. However if we take an L point moving average of the signal in _Fig.2_ some components of the signal are lost. If we take an L point moving average of the signal in _Fig.3_ the signal dimishes a lot, even more than the signal in _Fig.2_. This is because the signal in _Fig.3_ is changing very fast as compared to the signal in _Fig.2_. Therefore, we can say that a moving average filter can be used to filter out components of a signal that change very fast (high frequency signals). Hence, a moving average filter is a low pass filter. 

#### Magnitude Response and Phase Response Plots

<p float="left" align = "center">
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Mag_MA.jpg" width = "430"/>
  <img src="https://github.com/Chanakya-Ekbote/DSP-Lab/blob/master/Lab-01/Images/Freq_MA.jpg" width = "430" /> 
</p>

&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Magnitude Response_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; _Phase Response_

From the magnitude response we can confirm that a moving average filter is a low pass filter.

#### Arduino Code

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

#### Arduino Code

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

#### Arduino Code

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








