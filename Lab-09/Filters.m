X = load('signal07_EEG.mat');
X = X.y;

%% Filter for Delta Waves

Fp = 3;Fs = 6;Ap = 1;As = 40;T = 1/200;

Wp = (2/T)*(tan(2*pi*Fp*T/2));
Ws = (2/T)*(tan(2*pi*Fs*T/2));
N = acosh(sqrt(10^(0.1*As)-1)/sqrt(10^(0.1*Ap)-1))/acosh(Ws/Wp);
N = ceil(N); e = sqrt(10^(0.1*Ap)-1);
Wc = Wp*cosh((acosh(1/e))/N);

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

H = start/Cx;
Hd = c2d(H,T,'tustin');
[b_delta,a_delta] = tfdata(Hd,'v');

[M,w]=freqz(b_delta,a_delta,1024);
figure;
plot(w*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));
title('Magnitude Response for Delta Waves');


figure;
[P,w]=phasez(b_delta,a_delta,1024);
plot(w*1/(2*pi*T),180*P/pi);
title('Phase Response for Delta Waves');


figure;
y_delta = filter(real(b_delta),real(a_delta),X);
plot(y_delta);
hold on;
plot(X, 'r');
title('Delta Wave in Blue');

%% Filter for Alpha Waves

Vs = 4.27; Ap = 1;As = 40; T = 1/200;Wc = sqrt(9*13*2*pi*2*pi);Wc = (2/T)*(tan(Wc*T/2));

N = acosh(sqrt(10^(0.1*As)-1)/sqrt(10^(0.1*Ap)-1))/acosh(Vs);
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
Cx=1;
s = (s^2+Wc^2)/(s*10.989);
for i=1:N
    Cx = Cx*(1-s/Pole(i));
end

H = start/Cx;
Hd = c2d(H,T,'tustin');
[b_alpha,a_alpha] = tfdata(Hd,'v');

[M,w]=freqz(b_alpha,a_alpha,1024);
figure;
plot(w*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));

title('Magnitude Response for Alpha');


figure;
[P,w]=phasez(b_alpha,a_alpha,1024);
plot(w*1/(2*pi*T),180*P/pi);
title('Phase Response for Alpha Waves');

figure;
y_alpha = filter(real(b_alpha),real(a_alpha),X);
plot(y_alpha);
hold on;
plot(X, 'r');
title('Alpha Wave in Blue');

%%  Filter for Gamma Waves

Fp = 32;Fs = 29;Ap = 1;As = 40;T = 1/200;

Wp = (2/T)*(tan(2*pi*Fp*T/2));
Ws = (2/T)*(tan(2*pi*Fs*T/2));
N = acosh(sqrt(10^(0.1*As)-1)/sqrt(10^(0.1*Ap)-1))/acosh(Wp/Ws);
N = ceil(N);
e = sqrt(10^(0.1*Ap)-1);
Wc = Wp*cos(acos(1/e)/N);

k = 1:N;
alpha = (2*k-1)*pi/(2*N);
beta = asinh(1/e)/N;

Pole = 1i*(cos(alpha)*cosh(beta)+1i*sin(alpha)*sinh(beta));

start=1;
if rem(N,2)==0
    start=1/(1+e^2);
end

s = tf('s');
s = Wc/s;
Cx=1;
for i=1:N
    Cx = Cx*(1-s/Pole(i));
end

H = start/Cx;
Hd = c2d(H,T,'tustin');
[b_gamma,a_gamma] = tfdata(Hd,'v');


[M,w]=freqz(b_gamma,a_gamma,1024);
figure;
plot(w*1/(2*pi*T),20*log10(abs(M)/max(abs(M))));
title('Magnitude Response for Gamma Waves');


figure;
[P,w]=phasez(b_gamma,a_gamma,1024);
plot(w*1/(2*pi*T),180*P/pi);
title('Phase Response for Gamma Waves');

figure;
y_gamma = filter(real(b_gamma),real(a_gamma),X);
plot(y_gamma);
hold on;
plot(X, 'r');
title('Gamma Wave in Blue');