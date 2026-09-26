clc;
clear;
close all;

% Input sequence
x = [1 2 3 4];

N = length(x);

% DFT calculation
X = zeros(1, N);

for k = 0:N-1

    for n = 0:N-1

        X(k+1) = X(k+1) + ...
            x(n+1) * exp(-1i * 2*pi*k*n/N);

    end

end

% IDFT calculation
x_idft = zeros(1, N);

for n = 0:N-1

    for k = 0:N-1

        x_idft(n+1) = x_idft(n+1) + ...
            X(k+1) * exp(1i * 2*pi*k*n/N);

    end

    x_idft(n+1) = x_idft(n+1) / N;

end

% Display results
disp('Original sequence:');
disp(x);

disp('DFT:');
disp(X);

disp('IDFT:');
disp(x_idft);

% Plot magnitude spectrum
figure;
stem(0:N-1, abs(X), 'filled');
grid on;
xlabel('Frequency Index k');
ylabel('|X[k]|');
title('Magnitude Spectrum of DFT');