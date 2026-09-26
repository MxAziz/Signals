clc;
clear;
close all;

% Sampling frequency
Fs = 8000;

% Duration
duration = 2;

% Time vector
t = 0:1/Fs:duration-1/Fs;

% Generate 440 Hz audio signal
f0 = 440;
clean_signal = sin(2*pi*f0*t);

% Generate random noise
noise = 0.5 * randn(size(t));

% Noisy signal
noisy_signal = clean_signal + noise;

% DFT
N = length(noisy_signal);
X = fft(noisy_signal);

% Frequency vector
f = (0:N-1) * Fs/N;

% High frequency filtering
cutoff_frequency = 1000;

X_filtered = X;

% Remove frequencies above cutoff
X_filtered(f > cutoff_frequency) = 0;

% Also remove corresponding negative frequencies
X_filtered(f > Fs-cutoff_frequency) = 0;

% IDFT
cleaned_signal = real(ifft(X_filtered));

% Plot clean signal
figure;
plot(t, clean_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Original 440 Hz Signal');
xlim([0 0.02]);

% Plot noisy signal
figure;
plot(t, noisy_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Signal');
xlim([0 0.02]);

% Plot cleaned signal
figure;
plot(t, cleaned_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Cleaned Signal');
xlim([0 0.02]);

% Frequency spectrum
figure;
plot(f(1:floor(N/2)), abs(X(1:floor(N/2)))/N);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Noisy Signal');
xlim([0 2000]);