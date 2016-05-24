%This is the main program run this file. The self designed function used 'blackman-tukey' and 'welch_period ' and in 'blackman_tukey.m' and 'welch_period.m'.
%Have them next to this file to successfully run the code.
%Name:Vishal Srivastava
%Id No.:1209824652
fs=64;
samples=128;
N=4096;
t=0:(samples-1);
fm1=10;
fm2=11;
fm3=25;

y1=sin(2*pi*fm1.*t/fs);
y2=sin(2*pi*fm2.*t/fs);
y3=sin(2*pi*fm3.*t/fs);

y1=y1';
y2=y2';
y3=y3';

n1 = wgn(samples,1,0);

yn1=y1+n1;
yn2=y2+n1;
yn3=y3+n1;

lag1=10;
lag2=20;

M=32;
D1=10;
D2=20;

f=(-N/2:N/2-1)*fs/N;


%%
%For Data Set 1 without noise
dft_y1_l1=abs(fftshift(fft(blackman_tukey(y1,lag1),4096)));
dft_y1_l2=abs(fftshift(fft(blackman_tukey(y1,lag2),4096)));

dft_y2_l1=abs(fftshift(fft(blackman_tukey(y2,lag1),4096)));
dft_y2_l2=abs(fftshift(fft(blackman_tukey(y2,lag2),4096)));

dft_y3_l1=abs(fftshift(fft(blackman_tukey(y3,lag1),4096)));
dft_y3_l2=abs(fftshift(fft(blackman_tukey(y3,lag2),4096)));

%For Data Set 2 with noise

ndft_y1_l1=abs(fftshift(fft(blackman_tukey(yn1,lag1),4096)));
ndft_y1_l2=abs(fftshift(fft(blackman_tukey(yn1,lag2),4096)));

ndft_y2_l1=abs(fftshift(fft(blackman_tukey(yn2,lag1),4096)));
ndft_y2_l2=abs(fftshift(fft(blackman_tukey(yn2,lag2),4096)));

ndft_y3_l1=abs(fftshift(fft(blackman_tukey(yn3,lag1),4096)));
ndft_y3_l2=abs(fftshift(fft(blackman_tukey(yn3,lag2),4096)));


figure(1);
subplot(2,2,1)
plot(f,mag2db(dft_y1_l1)),title('Blackman-Tukey PSD (Fm=10Hz Lag=10 Noise=No)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,2)
plot(f,mag2db(dft_y1_l2)),title('Blackman-Tukey PSD (Fm=10Hz Lag=20 Noise=No)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,3)
plot(f,mag2db(ndft_y1_l1)),title('Blackman-Tukey PSD (Fm=10Hz Lag=10 Noise=Yes)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,4)
plot(f,mag2db(ndft_y1_l2)),title('Blackman-Tukey PSD (Fm=10Hz Lag=20 Noise=Yes)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')


figure(2);
subplot(2,2,1)
plot(f,mag2db(dft_y2_l1)),title('Blackman-Tukey PSD (Fm=11Hz Lag=10 Noise=No)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,2)
plot(f,mag2db(dft_y2_l2)),title('Blackman-Tukey PSD (Fm=11Hz Lag=20 Noise=No)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,3)
plot(f,mag2db(ndft_y2_l1)),title('Blackman-Tukey PSD (Fm=11Hz Lag=10 Noise=Yes)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,4)
plot(f,mag2db(ndft_y2_l2)),title('Blackman-Tukey PSD (Fm=11Hz Lag=20 Noise=Yes)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')

figure(3);
subplot(2,2,1)
plot(f,mag2db(dft_y3_l1)),title('Blackman-Tukey PSD (Fm=25Hz Lag=10 Noise=No)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,2)
plot(f,mag2db(dft_y3_l2)),title('Blackman-Tukey PSD (Fm=25Hz Lag=20 Noise=No)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,3)
plot(f,mag2db(ndft_y3_l1)),title('Blackman-Tukey PSD (Fm=25Hz Lag=10 Noise=Yes)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')
subplot(2,2,4)
plot(f,mag2db(ndft_y3_l2)),title('Blackman-Tukey PSD (Fm=25Hz Lag=20 Noise=Yes)'),xlabel('Frequency(Hz)'),ylabel('Power(dB)')

%%

