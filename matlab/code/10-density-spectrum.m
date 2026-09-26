clc;
clear;
close all;

% Sampling frequency
Fs = 1000;

% Duration
T = 1;

% Time vector
t = 0:1/Fs:T-1/Fs;

% Square wave frequency
f0 = 10;

% Generate square wave
x = square(2*pi*f0*t);

% Number of samples
N = length(x);

% FFT
X = fft(x);

% Power Density Spectrum
P = (abs(X).^2) / (Fs*N);

% Frequency vector
f = (0:N-1) * Fs/N;

% Plot square wave
figure;
plot(t, x);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Square Wave');
xlim([0 0.2]);

% Plot Power Density Spectrum
figure;
plot(f(1:N/2), P(1:N/2));
grid on;
xlabel('Frequency (Hz)');
ylabel('Power Density');
title('Power Density Spectrum of Square Wave');
xlim([0 100]);