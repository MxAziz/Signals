clc;
clear;
close all;

% Sampling frequency
Fs = 1000;

% Time vector
t = 0:1/Fs:1;

% Different frequencies
f1 = 5;
f2 = 10;
f3 = 20;

% Generate sinusoidal signals
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);

% Plot 5 Hz
figure;
plot(t, x1);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Sinusoidal Wave - 5 Hz');
xlim([0 1]);

% Plot 10 Hz
figure;
plot(t, x2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Sinusoidal Wave - 10 Hz');
xlim([0 1]);

% Plot 20 Hz
figure;
plot(t, x3);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Sinusoidal Wave - 20 Hz');
xlim([0 1]);