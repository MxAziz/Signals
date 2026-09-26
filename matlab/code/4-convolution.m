clc;
clear;
close all;

% First sequence
x = [1 2 3 4];

% Second sequence
h = [1 1 1];

% Convolution using MATLAB built-in function
y = conv(x, h);

% Time indices
nx = 0:length(x)-1;
nh = 0:length(h)-1;
ny = 0:length(y)-1;

% Display results
disp('x[n] = ');
disp(x);

disp('h[n] = ');
disp(h);

disp('Convolution y[n] = x[n] * h[n] = ');
disp(y);

% Plot x[n]
figure;

subplot(3,1,1);
stem(nx, x, 'filled');
grid on;
xlabel('n');
ylabel('x[n]');
title('Input Sequence x[n]');

% Plot h[n]
subplot(3,1,2);
stem(nh, h, 'filled');
grid on;
xlabel('n');
ylabel('h[n]');
title('Impulse Response h[n]');

% Plot convolution
subplot(3,1,3);
stem(ny, y, 'filled');
grid on;
xlabel('n');
ylabel('y[n]');
title('Convolution y[n] = x[n] * h[n]');