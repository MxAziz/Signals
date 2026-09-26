clc;
clear;
close all;

% Time index
n = -7:7;

% Unit impulse functions
delta1 = (n == -2);
delta2 = (n == 4);

% Given sequence
x = 2 * delta1 - delta2;

% Plot
stem(n, x, 'filled');
grid on;

xlabel('n');
ylabel('x[n]');
title('x[n] = 2\delta[n+2] - \delta[n-4]');

% Display values
disp('n values:');
disp(n);

disp('x[n] values:');
disp(x);