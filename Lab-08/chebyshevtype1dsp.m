function  [N,Pole,a,b]= chebyshevtype1dsp(Ap,As,wp,ws,meth,T)
    
    N = ceil(acosh(sqrt(10^(0.1*As)-1)/sqrt(10^(0.1*Ap)-1))/acosh(ws/wp));
    e = sqrt(10^(0.1*Ap)-1);
    k = 1:N;
    alpha = (2*k-1)*pi/(2*N);
    beta = asinh(1/e)/N;
    Pole = 1i*wp*(cos(alpha)*cosh(beta)+1i*sin(alpha)*sinh(beta));
    
    start=1;
    if rem(N,2)==1
        start=1/(1+e^2);
    end
    
    s = tf('s');
    Den=1;
    for i=1:N
        Den = Den*(1-s/Pole(i));
    end
    
    H_s = start/Den;
    Hd = c2d(H_s,T,meth);
    [b,a] = tfdata(Hd,'v');

    [M,w]=freqz(b,a,1024);
    figure;
    plot(w/pi,20*log10(abs(M)/max(abs(M))));
    axis tight; grid on;
    xlabel('Frequency');
    ylabel('Magnitude in dB');
    title('Chebyshev I Magnitude Response');
    
    figure;
    [P,w]=phasez(b,a,1024);
    plot(w/pi,180*P/pi);
    axis tight; grid on;
    xlabel('Frequency');
    ylabel('Phase in Degree');
    title('Chebyshev I Phase Response');
end