function  [N,Pole,a,b]= butterdsp(Ap,As,wp,ws,meth,T)
    
    N = ceil(log(10^(0.1*Ap)-1) - log(10^(0.1*As)-1))/(2*log(wp/ws));
    wc = wp/(((10^(0.1*Ap)-1)^(1/N)));
    k = 1:N;
    Pole = wc*exp(1i*pi/2*((2*k-1)/N+1));
    
    s = tf('s'); 
    Den = 1;
    for i=1:N
        Den = Den*(1-s/Pole(i));
    end
    H_s = 1/Den;
    
    Hd = c2d(H_s,T,meth);
    [b,a] = tfdata(Hd,'v');
    
    [M,w]=freqz(b,a,1024);
    figure;
    plot(w/pi,20*log10(abs(M)/max(abs(M))));
    axis tight; grid on;
    xlabel('Frequency');
    ylabel('Magnitude in dB');
    title('Butterworth Magnitude Response');
    
    [P,w]=phasez(b,a,1024);
    figure;
    plot(w/pi,180*P/pi);
    axis tight; grid on;
    xlabel('Frequency');
    ylabel('Phase in Degree');
    title('Butterworth Phase Response');
end