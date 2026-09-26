clc;
clear;
close all;

% Fundamental frequency
f0 = 1;

% Angular frequency
w0 = 2*pi*f0;

% Time vector
t = -1:0.001:1;

% Number of harmonics
N = 7;

% Initialize Fourier series
x = zeros(size(t));

% Fourier series
for n = 1:2:N

    x = x + (1/n) * sin(n*w0*t);

end

% Multiply by 4/pi
x = (4/pi) * x;

% Plot
plot(t, x, 'LineWidth', 1.5);
grid on;

xlabel('Time (s)');
ylabel('Amplitude');

title('Fourier Series Approximation of Square Wave');

ylim([-1.5 1.5]);


% More harmonics diye approximation:
% ---------------------- alada block
clc;
clear;
close all;

f0 = 1;
w0 = 2*pi*f0;

t = -1:0.001:1;

% Harmonic numbers
harmonics = [1 3 5 7 9 11 13 15 17 19];

x = zeros(size(t));

for n = harmonics
    x = x + (1/n)*sin(n*w0*t);
end

x = (4/pi)*x;

plot(t, x, 'LineWidth', 1.5);
grid on;

xlabel('Time (s)');
ylabel('Amplitude');
title('Fourier Series Approximation of Square Wave');
ylim([-1.5 1.5]);