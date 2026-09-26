clc;
clear;
close all;

% Given sequence
x = [1 2 3 4 5];

% Time indices
n = 0:4;

% 501 equispaced frequencies from 0 to pi
w = linspace(0, pi, 501);

% Initialize DTFT
X = zeros(size(w));

% Calculate DTFT
for k = 1:length(w)

    X(k) = sum(x .* exp(-1i*w(k)*n));

end

% Magnitude
magnitude = abs(X);

% Phase angle
phase = angle(X);

% Real part
real_part = real(X);

% Imaginary part
imaginary_part = imag(X);

% -----------------------------
% Magnitude
% -----------------------------

figure;
plot(w, magnitude);
grid on;

xlabel('\omega (rad/sample)');
ylabel('|X(e^{j\omega})|');
title('Magnitude of DTFT');

% -----------------------------
% Phase
% -----------------------------

figure;
plot(w, phase);
grid on;

xlabel('\omega (rad/sample)');
ylabel('Phase (radians)');
title('Angle of DTFT');

% -----------------------------
% Real Part
% -----------------------------

figure;
plot(w, real_part);
grid on;

xlabel('\omega (rad/sample)');
ylabel('Real Part');
title('Real Part of DTFT');

% -----------------------------
% Imaginary Part
% -----------------------------

figure;
plot(w, imaginary_part);
grid on;

xlabel('\omega (rad/sample)');
ylabel('Imaginary Part');
title('Imaginary Part of DTFT');