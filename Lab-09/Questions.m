x = load('signal01_ppg_with_powerline01_Fs_200_10seconds.mat');
x = x.y;

%% Question 1_1

Fp = 10; Fs = 30; Ap = 0.5; As = 40;T = 1/200;
N = acosh(sqrt(10^(0.1*As)-1)/sqrt(10^(0.1*Ap)-1))/acosh(Ws/Wp);
N = ceil(N);
Wp = (2/T)*tan(2*Fp*pi*T/2);
Ws = (2/T)*tan(2*Fs*pi*T/2);
Wc = Wp*cosh((acosh(1/e))/N);

e = sqrt(10^(0.1*Ap)-1);

k = 1:N;
alpha = (2*k-1)*pi/(2*N);
beta = asinh(1/e)/N;

Pole = 1i*(cos(alpha)*cosh(beta)+1i*sin(alpha)*sinh(beta));

start=1;
if rem(N,2)==0
    start=1/(1+e^2);
end

s = tf('s');
s = s/Wc;
Cx=1;

for i=1:N
    Cx = Cx*(1-s/Pole(i));
end

H = start/Cx
Hd = c2d(H,T,'tusin')
[b,a] = tfdata(Hd,'v');


[M,W]=freqz(b,a,1024);
figure;
plot(W*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));
axis tight; grid on;
xlabel('Frequency (in Hz)');
ylabel('Magnitude in dB');
title('Magnitude Response');

figure;
[P,W]=phasez(b,a,1024);
plot(W*1/(2*pi*T),180*P/pi);
axis tight; grid on;
xlabel('Frequency (in Hz)');
ylabel('Phase in Degree');
title('Phase Response');

figure;
y = filter(real(b),real(a),x);
plot(y)
hold on;
plot(x)
xlabel('Samples');
ylabel('PPG Amplitude');


figure

auto_y = autocorr(y,1999);
plot(auto_y);

xlabel('Samples');
ylabel('Autocorrelation Values'); 
axis tight; grid on;
title('ACR of Butterworth filtered PPG Signal')

%% Question 1_2

Fp = 10; Fs = 30; Ap = 0.5; As = 40;T = 1/200;

Wp = (2/T)*tan(2*Fp*pi*T/2);
Ws = (2/T)*tan(2*Fs*pi*T/2);

N = (log(10^(0.1*Ap)-1) - log(10^(0.1*As)-1))/(2*log(Wp/Ws));
N = ceil(N);
e = 10^(0.1*Ap)-1;
Wc = Wp/((e^(1/N)));

k = 1:N;
Pole = Wc*exp(1i*pi/2*((2*k-1)/N+1));
s = tf('s'); Bx = 1;
for i=1:N
    Bx = Bx*(1-s/Pole(i));
end
H = 1/Bx

Hd = c2d(H,T,'tustin')
[b,a] = tfdata(Hd,'v');

[M,W]=freqz(b,a,1024);
figure;
plot(W*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));
axis tight; grid on;
xlabel('Frequency (in Hz)');
ylabel('Magnitude in dB');
title('Magnitude Response');

[P,W]=phasez(b,a,1024);
figure;
plot(W*1/(2*pi*T),180*P/pi);
axis tight; grid on;
xlabel('Frequency (in Hz)');
ylabel('Phase in Degree');
title('Phase Response');

figure;
y = filter(real(b),real(a),x);
plot(y,'k')
hold on;
plot(x, 'r')
xlabel('Samples');
ylabel('PPG Amplitude');


%% Question 2

Fc = 3000; Ap = 1; T = 1/8000;

N = 1; 
W = 2*pi*Fc;
Wa = (2/T)*tan(W*T/2);
e = sqrt(10^(0.1*Ap)-1);

k = 1:N;
alpha = (2*k-1)*pi/(2*N);
beta = asinh(1/e)/N;

Pole = 1i*(cos(alpha)*cosh(beta)+1i*sin(alpha)*sinh(beta));

start=1;
if rem(N,2)==0
    start=1/(1+e^2);
end


s = tf('s');
s = Wa/s;
Cx=1;

for i=1:N
    Cx = Cx*(1-s/Pole(i));
end

H = start/Cx;
Hd = c2d(H,T,'tusin');
[b,a] = tfdata(Hd,'v');


[M,W]=freqz(b,a,1024);
figure;
plot(W*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));
axis tight; grid on;
title('Question 2');
xlabel('Frequency');
ylabel('Magnitude in dB');

figure;
[P,W]=phasez(b,a,1024);
plot(W*1/(2*pi*T),180*P/pi);
axis tight; grid on;
title('Question 2');
xlabel('Frequency ');
ylabel('Phase in Degree');

%% Question 3

Fc = 3000; Ap = 1; T = 1/8000;

Wph = 5200*pi; Wpl = 4800*pi; Wsh = 5050*pi; Wsl = 4950*pi;

Ap = 3; As = 10; T = 1/8000; N = 1; 

Wph = (2/T)*tan(5200*pi*T/2); Wpl = (2/T)*tan(4800*pi*T/2);
Wsh = (2/T)*tan(5050*pi*T/2); Wsl = (2/T)*tan(4950*pi*T/2);


N = acosh(sqrt(10^(0.1*As)-1)/sqrt(10^(0.1*Ap)-1))/acosh(4.06);
N = ceil(N);
e = sqrt(10^(0.1*Ap)-1);

k = 1:N;
alpha = (2*k-1)*pi/(2*N);
beta = asinh(1/e)/N;

Pole = 1i*(cos(alpha)*cosh(beta)+1i*sin(alpha)*sinh(beta));

start=1;
if rem(N,2)==0
    start=1/(1+e^2);
end

s = tf('s');
s = s*4149/(s^2+573443962);
Cx=1;

for i=1:N
    Cx = Cx*(1-s/Pole(i));
end

H = start/Cx;
Hd = c2d(H,T,'tusin');
[b,a] = tfdata(Hd,'v');
[M,W]=freqz(b,a,1024);
figure;
plot(W*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));
axis tight; grid on;
title('Question 3');
xlabel('Frequency');
ylabel('Magnitude in dB');
figure;
[P,W]=phasez(b,a,1024);
plot(W*1/(2*pi*T),180*P/pi);
axis tight; grid on;
title('Question 3');
xlabel('Frequency');
ylabel('Phase in Degree');


