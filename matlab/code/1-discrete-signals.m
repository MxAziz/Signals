clc;
clear;
close all;

% Time index
n = -10:10;

% Unit Sample Sequence
unit_sample = (n == 0);

% Unit Step Signal
unit_step = (n >= 0);

% Unit Ramp Signal
unit_ramp = n .* (n >= 0);

% Plot Unit Sample
figure;
stem(n, unit_sample, 'filled');
grid on;
xlabel('n');
ylabel('\delta[n]');
title('Unit Sample Sequence');

% Plot Unit Step
figure;
stem(n, unit_step, 'filled');
grid on;
xlabel('n');
ylabel('u[n]');
title('Unit Step Signal');

% Plot Unit Ramp
figure;
stem(n, unit_ramp, 'filled');
grid on;
xlabel('n');
ylabel('r[n]');
title('Unit Ramp Signal');