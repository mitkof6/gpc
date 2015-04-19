%%
%Sin ploting with DC, amplitude, frequency and phase parameters
clear all;
clc;
close all;

%% Parameters

f = 2;
ph = pi / 2;
A = 1;
DC = 0.5;

%% plot

t = -1:0.01:1;

figure;
plot(t, sin(2 * pi * t));
hold on;
plot(t, DC + A .* sin(2 * pi * f .* t + ph), 'r');
title('DC + A * sin(2 * pi * f * t + ph)');
xlabel('t (s)');
ylabel('y');
grid on;