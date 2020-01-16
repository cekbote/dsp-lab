% Moving Average Filter
a = [1 1 1 1 1 1 1 1];
b = [8 0 0 0 0 0 0 0];

num = conv(a, 1/8);

[h, w] = freqz(num, 1, 5000);
[z,p,k] = tf2zp(a, b);

fvtool(a,b,'polezero');
text(real(z)+.1,imag(z),'Zero');
text(real(p)+.1,imag(p),'Pole');

figure;
plot(w, (abs(h)));
xlabel('Frequency'); ylabel('Magnitude');axis tight;grid on;

figure;
plot(w, angle(h));
xlabel('Frequency'); ylabel('Phase');axis tight;grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Difference Filter
a = [1 -1];
b = [1 0];

num = conv(a, 1);

[h, w] = freqz(num, 1, 5000);
[z,p,k] = tf2zp(a, b);
fvtool(a,b,'polezero');
text(real(z)+.1,imag(z),'Zero');
text(real(p)+.1,imag(p),'Pole');

figure;
plot(w,(abs(h)));
xlabel('Frequency'); ylabel('Magnitude');axis tight;grid on;

figure;
plot(w, angle(h));
xlabel('Frequency'); ylabel('Phase');axis tight;grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3rd order Difference Filter
a = [1 0 -1];
b = [1 0 0];

num = conv(a, 1);

[h, w] = freqz(num, 1, 5000);

[z,p,k] = tf2zp(a, b);
fvtool(a,b,'polezero');
text(real(z)+.1,imag(z),'Zero');
text(real(p)+.1,imag(p),'Pole');

figure;
plot(w,(abs(h)));
xlabel('Frequency'); ylabel('Magnitude');axis tight;grid on;

figure;
plot(w, angle(h));
xlabel('Frequency'); ylabel('Phase');axis tight;grid on;