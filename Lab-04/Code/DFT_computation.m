clc;
clear all;
close all;

data = load('Exp03_PPG_25hz_75samples.mat');
data = data.x3;
filter_window = 8;
filtered_data = zeros(size(data));
F = 25;

% Moving Average
for i = 1:size(data,2)
    x = 0;
    if i <= filter_window
        x = sum(data(1:i));
    else
        x = sum(data(i-filter_window:i));
    end
    filtered_data(i) = x / filter_window;
end

% DFT and DFT Matrix
dft = fft(filtered_data);
dft_matrix = dftmtx(size(filtered_data,2));
[~, index] = max(abs(dft));


figure;
plot(abs(dft));
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Response');

% Pulse Rate
display(60 * index * F/size(filtered_data,2));


% Autocorrelation
corr = xcorr(filtered_data - mean(filtered_data));
corr = corr(76:end);
figure;
plot(corr);
xlabel('Time');
ylabel('Magnitude');
title('Autocorrelation');

% Zero Crossing 
zero_crossing_index = 0;
for i=1:size(corr, 2)
    if corr(i+1) * corr(i) < 0
        zero_crossing_index = i + 1;
        break
    end
end

% Pulse Rate using Autocorrelation
[~, index_corr] = max(corr(zero_crossing_index:end));
index_corr = zero_crossing_index + index_corr;
display(60/(index_corr/25));







