clc;
clear;
close all;

% Sampling frequency
Fs = 5000;

% Duration
T = 1;

% Time vector
t = 0:1/Fs:T-1/Fs;

% Given multi-frequency signal
x = cos(2*pi*100*t) ...
    + cos(2*pi*500*t) ...
    + cos(2*pi*700*t);

% Number of samples
N = length(x);

% FFT
X = fft(x);

% Frequency vector
f_fft = (0:N-1) * Fs/N;

% Amplitude spectrum
X_mag = abs(X)/N;

% Plot time-domain signal
figure;
plot(t, x);
grid on;

xlabel('Time (s)');
ylabel('Amplitude');
title('Multi-Frequency Signal');

xlim([0 0.05]);

% Plot amplitude spectrum
figure;
plot(f_fft(1:N/2), 2*X_mag(1:N/2));
grid on;

xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum');

xlim([0 900]);

% ------------------------------------------------
% Approximate Fourier Transform Integral
% ------------------------------------------------

% Frequency range
f = 0:1:900;

% Initialize Fourier Transform
X_integral = zeros(size(f));

% Numerical integration
for i = 1:length(f)

    X_integral(i) = trapz( ...
        t, ...
        x .* exp(-1i*2*pi*f(i)*t) ...
        );

end

% Magnitude of Fourier Transform
X_integral_mag = abs(X_integral);

% Plot approximate Fourier transform
figure;
plot(f, X_integral_mag);
grid on;

xlabel('Frequency (Hz)');
ylabel('|X(f)|');

title('Approximate Fourier Transform using Numerical Integration');

xlim([0 900]);