import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import square

# Sampling frequency
fs = 1000

# Duration
t = np.arange(0, 1, 1 / fs)

# Frequency of square wave
f = 10

# Generate square wave
x = square(2 * np.pi * f * t)

# FFT
X = np.fft.fft(x)

# Power spectrum
power = np.abs(X) ** 2 / len(X)

# Frequency
freq = np.fft.fftfreq(len(x), 1 / fs)

# Positive frequency
positive = freq >= 0

# Plot
plt.figure(figsize=(10, 5))

plt.plot(
    freq[positive],
    power[positive]
)

plt.title("Power Density Spectrum of a Square Wave")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Power")
plt.grid(True)

plt.show()