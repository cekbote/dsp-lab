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
