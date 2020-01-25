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
