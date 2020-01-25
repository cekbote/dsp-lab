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
