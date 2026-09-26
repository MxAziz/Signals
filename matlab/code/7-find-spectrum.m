clc;
clear;
close all;

% Number of samples
N = 1000;

% Time/sample variable
k = (0:N-1) / N;

% Given signal
x = 0.25 ...
    + 2*sin(2*pi*5*k) ...
    + sin(2*pi*12.5*k) ...
    + 1.5*sin(2*pi*20*k) ...
    + 0.5*sin(2*pi*35*k);

% FFT
X = fft(x);

% Magnitude
X_mag = abs(X) / N;

% Frequency axis
f = (0:N-1);

% Plot signal
figure;
plot(k, x);
grid on;
xlabel('k');
ylabel('Amplitude');
title('Given Signal');

% Plot spectrum
figure;
plot(f(1:N/2), 2*X_mag(1:N/2));
grid on;
xlabel('Frequency');
ylabel('Magnitude');
title('Spectrum of the Given Signal');
xlim([0 50]);