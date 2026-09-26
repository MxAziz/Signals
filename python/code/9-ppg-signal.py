import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import find_peaks

# Sampling frequency
fs = 100

# Duration
duration = 10

# Time
t = np.arange(0, duration, 1 / fs)

# -------------------------
# Generate synthetic PPG signal
# -------------------------
heart_rate = 75
frequency = heart_rate / 60

ppg = (
    1
    + 0.5 * np.sin(2 * np.pi * frequency * t)
    + 0.1 * np.sin(4 * np.pi * frequency * t)
)

# Add small noise
np.random.seed(10)
ppg += 0.03 * np.random.randn(len(t))


# -------------------------
# Find systolic peaks
# -------------------------
peaks, _ = find_peaks(
    ppg,
    distance=int(0.5 * fs),
    prominence=0.1
)


# -------------------------
# Find diastolic points
# -------------------------
inverted_ppg = -ppg

diastolic, _ = find_peaks(
    inverted_ppg,
    distance=int(0.5 * fs),
    prominence=0.05
)


# -------------------------
# Calculate heart rate
# -------------------------
if len(peaks) > 1:
    peak_intervals = np.diff(peaks) / fs
    average_interval = np.mean(peak_intervals)

    calculated_heart_rate = 60 / average_interval
else:
    calculated_heart_rate = 0


print("Number of systolic peaks:", len(peaks))
print("Number of diastolic points:", len(diastolic))
print("Heart Rate:", round(calculated_heart_rate, 2), "BPM")


# -------------------------
# Plot
# -------------------------
plt.figure(figsize=(12, 6))

plt.plot(t, ppg, label="PPG Signal")

plt.plot(
    t[peaks],
    ppg[peaks],
    "ro",
    label="Systolic Peaks"
)

plt.plot(
    t[diastolic],
    ppg[diastolic],
    "go",
    label="Diastolic Points"
)

plt.title("PPG Signal Analysis")
plt.xlabel("Time (s)")
plt.ylabel("Amplitude")
plt.legend()
plt.grid(True)

plt.show()