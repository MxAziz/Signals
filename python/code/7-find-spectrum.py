import numpy as np
import matplotlib.pyplot as plt

# Number of samples
N = 256

# Sample index
k = np.arange(N)

# Given signal
x = (
    0.25
    + 2 * np.sin(2 * np.pi * 5 * k / N)
    + np.sin(2 * np.pi * 12.5 * k / N)
    + 1.5 * np.sin(2 * np.pi * 20 * k / N)
    + 0.5 * np.sin(2 * np.pi * 35 * k / N)
)

# FFT
X = np.fft.fft(x)

# Frequency
freq = np.fft.fftfreq(N)

# Magnitude
magnitude = np.abs(X) / N

# Plot positive frequencies
positive = freq >= 0

plt.figure(figsize=(10, 5))
plt.stem(freq[positive], magnitude[positive])

plt.title("Spectrum of Given Signal")
plt.xlabel("Normalized Frequency")
plt.ylabel("Magnitude")
plt.grid(True)

plt.show()