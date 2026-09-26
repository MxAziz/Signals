clc;
clear;
close all;

% Sampling frequency
Fs = 100;

% Duration
duration = 20;

% Time vector
t = 0:1/Fs:duration-1/Fs;

% Heart rate
heart_rate = 75;

% Heart frequency
f_hr = heart_rate / 60;

% Generate synthetic PPG signal
ppg = 0.8 * sin(2*pi*f_hr*t) ...
    + 0.2 * sin(4*pi*f_hr*t) ...
    + 0.05 * randn(size(t));

% Shift signal upward
ppg = ppg + 1;

% Find systolic peaks
min_peak_distance = round(0.5 * Fs);
min_peak_height = 1.3;

[systolic_peaks, systolic_locations] = findpeaks( ...
    ppg, ...
    'MinPeakDistance', min_peak_distance, ...
    'MinPeakHeight', min_peak_height);

% Find diastolic points
[diastolic_values, diastolic_locations] = findpeaks( ...
    -ppg, ...
    'MinPeakDistance', min_peak_distance);

% Convert negative values back
diastolic_values = -diastolic_values;

% Calculate heart rate
number_of_beats = length(systolic_locations);

measured_hr = ...
    number_of_beats / duration * 60;

% Plot PPG
figure;

plot(t, ppg, 'LineWidth', 1);
hold on;

% Systolic peaks
plot( ...
    t(systolic_locations), ...
    systolic_peaks, ...
    'ro', ...
    'MarkerFaceColor', 'r');

% Diastolic points
plot( ...
    t(diastolic_locations), ...
    diastolic_values, ...
    'go', ...
    'MarkerFaceColor', 'g');

grid on;

xlabel('Time (s)');
ylabel('Amplitude');

title('PPG Signal with Systolic and Diastolic Points');

legend( ...
    'PPG Signal', ...
    'Systolic Peaks', ...
    'Diastolic Points');

hold off;

% Display heart rate
fprintf('Detected Beats = %d\n', number_of_beats);
fprintf('Estimated Heart Rate = %.2f BPM\n', measured_hr);