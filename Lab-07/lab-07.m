clc;
clear all;
close all;

a = [0, 0, 1,-0.6141;0, 0, 1, -0.533; 0, 0, 1, -0.52189 ;0,  1,-1.4155,0.48899; 0, 1,-0.762242,0.73944];
b = [0, 0, 0.3859, 0 ;0,  0, 125.66,  0;0,  0, 0.23905, 0.23905; 0,  0.1825, 0, -0.1825; 1.6678,-3.3356,0,1.6678];

for i = 1:1:size(a,1)
    w=0:pi/100: pi;
    num = b(i,:);
    den = a(i,:);
    h=freqz(num,den,w);
    h=abs(h)./max(abs(h));
    h=20*log(h)/log(10);
    figure;
    plot(w,h);
    axis tight;
    grid on;
    xlabel('Digital Frequency (rad/s)');
    ylabel('Magnitude Response (Db)');
end