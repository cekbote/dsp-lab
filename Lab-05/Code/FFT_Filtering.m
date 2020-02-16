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








