float data[75] = {-87.17307638,-109.5495333,11.00037444,163.4286511,199.1497693,123.5660003,56.25558579,11.87495703,-18.97729813,-42.98507139,-49.50432452,-44.95819516,-33.93206642,-28.58275615,-31.58109989,-41.0802992,-54.49307368,-68.26273259,-80.63560247,-89.53265601,-97.96825536,-104.8688265,-109.0354357,-55.42792547,102.4289065,215.9352907,173.6592794,95.27713062,38.69934301,2.586699113,-27.11808597,-41.50592056,-38.88116345,-27.52106187,-19.43972127,-21.31888102,-29.19861314,-42.08703327,-57.83191118,-69.53303635,-80.46281953,-88.35226795,-94.97094082,-102.2065852,-97.71319214,4.172319927,174.7275931,221.5697151,147.842936,75.61863429,28.48903346,-4.64088307,-29.76995187,-35.85962812,-27.26819387,-12.26373734,-5.602559446,-9.189517172,-21.48116953,-38.07938735,-52.01784737,-63.35879895,-71.93471855,-79.04261272,-85.4265121,-86.88364206,-9.984335526,167.9810654,251.6113399,182.1367896,108.0062751,59.54909365,24.89964724,-5.472668004,-17.77934267};
float test_data[500];
float working_data[1000];
float average = 0;
float average_1 = 0;
float x =0;
float max_val = 0;
float pre_filtered_zero = 0;
float pre_filter_maxima =0;
float post_filtered_zero =0;
float post_filter_maxima =0;
float auto_corr_pre_moving_average[4][500];
float auto_corr_post_moving_average[4][500];

void setup() 
{
    Serial.begin(9600);
}

void loop() 
{
    average_1 = 0;
    
    for(int p = 0; p < 75; p++)
    {
      average_1 += data[p];   
    }
    
    // FILTERED
    // Moving Average
    for (int i = 0; i< 75; i++)
    { 
    x = 0;
    if (i<8)
      {for(int k=0; k<i; k++)
        {x += data[i-k]; 
          }
        }
    else
    {for(int j=0; j<8; j++)
      {
        x += data[i-j];
        }
      }
    working_data[i] = x/8;
    average+= working_data[i];
    }
    
    // Zero Mean
    for(int p =0; p<75; p++)
    {
      working_data[p] -= (average/75); 
    }

    // Autocorr
    for(int i = 0; i < 75; i++)
    {
    x = 0;
    for(int j = i; j < 75; j++)
    {
      x += working_data[j]*working_data[j-i];
     }
     auto_corr_post_moving_average[0][i] = x;
     }

    // Zero Crossing
    post_filtered_zero = 0;
    for(int i =0; i<75; i++)
    {
      if ((auto_corr_post_moving_average[0][i] * auto_corr_post_moving_average[0][i+1]) <0)
      {
        post_filtered_zero = i+1;
        break;}
      }
    
    
    // 2nd Maxima
    max_val = 0;
    for(int i=post_filtered_zero; i<75; i++)
    {
      if(max_val <auto_corr_post_moving_average[0][i])
      {
        max_val = auto_corr_post_moving_average[0][i];
        post_filter_maxima = i;
       }
     }

    // Printing
    for (int i =0; i< 75; i++)
    {
     Serial.println(auto_corr_post_moving_average[0][i]/auto_corr_post_moving_average[0][0]);
//     Serial.print(',');
//     Serial.print(post_filter_maxima/25.0);
//     Serial.print(',');
//     Serial.println(60/(post_filter_maxima/25.0)); 
     }   
  
}
