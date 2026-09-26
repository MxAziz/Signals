clc;
clear;
close all;

% Original signal
n = -5:5;

x1 = (n >= -2 & n <= 2);
x2 = (n >= 0 & n <= 4);

% Addition
[x_add, n_add] = signalAddition(x1, n, x2, n);

% Folding
[x_fold, n_fold] = signalFolding(x1, n);

% Shifting
shift_value = 2;
[x_shift, n_shift] = signalShift(x1, n, shift_value);

% Plot Original Signals
figure;

subplot(2,2,1);
stem(n, x1, 'filled');
grid on;
xlabel('n');
ylabel('x_1[n]');
title('Signal x_1[n]');

subplot(2,2,2);
stem(n, x2, 'filled');
grid on;
xlabel('n');
ylabel('x_2[n]');
title('Signal x_2[n]');

% Addition
subplot(2,2,3);
stem(n_add, x_add, 'filled');
grid on;
xlabel('n');
ylabel('x_1[n] + x_2[n]');
title('Addition');

% Folding
figure;
stem(n_fold, x_fold, 'filled');
grid on;
xlabel('n');
ylabel('x_1[-n]');
title('Folding of x_1[n]');

% Shifting
figure;
stem(n_shift, x_shift, 'filled');
grid on;
xlabel('n');
ylabel('x_1[n-2]');
title('Right Shift by 2');

% ---------------- FUNCTIONS ----------------

function [y, n] = signalAddition(x1, n1, x2, n2)

    n = min([n1 n2]):max([n1 n2]);

    y1 = zeros(size(n));
    y2 = zeros(size(n));

    [~, index1] = ismember(n1, n);
    [~, index2] = ismember(n2, n);

    y1(index1) = x1;
    y2(index2) = x2;

    y = y1 + y2;
end

function [y, n_new] = signalFolding(x, n)

    y = fliplr(x);
    n_new = -fliplr(n);
end

function [y, n_new] = signalShift(x, n, k)

    n_new = n + k;
    y = x;
end