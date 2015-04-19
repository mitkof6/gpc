%%
% AM-DSB-TC modulation with frequency spectrum analysis
close all;
clc;
clear all;


%% AM parameters

fm = 10;
fc = 100;
Ac = 1;
M = 0.3;

%% ploting parameters

n = 5;
stop_time = n * 1 / fm;
fs = n * fc;
dt = 1 / fs;
t = (0:dt:stop_time-dt)';
N = size(t, 1);

%% AM DSB TC modulation

m = M * (cos(2*pi*fm*t) + sin(4*pi*fm*t));
c = Ac * cos(2*pi*fc*t);
x = (1 + m) .* c;

figure;
plot(t, m);
title('message');
xlabel('time (s)');
grid on;

figure;
plot(t, c);
title('carrier');
xlabel('time (s)');
grid on;

figure;
plot(t, x);
hold on;
plot(t, m + 1, 'g');
title('modulation');
xlabel('time (s)');
legend('x(t)', 'm(t)');
grid on;

%% frequency spectrum

y = fftshift(fft(x));
dF = fs / N;
f = -fs/2:dF:fs/2-dF;

figure;
plot(f, abs(y)/N);
xlabel('Frequency (Hz)');
title('Magnitude Response');
grid on;


