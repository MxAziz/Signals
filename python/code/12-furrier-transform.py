import numpy as np
import matplotlib.pyplot as plt

# Sampling frequency
fs = 2000

# Time
t = np.arange(0, 1, 1 / fs)

# Given signal
x = (
    np.cos(2 * np.pi * 100 * t)
    + np.cos(2 * np.pi * 500 * t)
    + np.cos(2 * np.pi * 700 * t)
)

# Number of samples
N = len(x)

# FFT
X = np.fft.fft(x)

# Frequency
freq = np.fft.fftfreq(N, 1 / fs)

# Positive frequency
positive = (freq >= 0) & (freq <= 900)

# Amplitude spectrum
amplitude = 2 * np.abs(X) / N

# -------------------------
# Approximate Fourier integral
# -------------------------
f_values = np.linspace(0, 900, 901)

fourier_transform = np.zeros(len(f_values), dtype=complex)

dt = 1 / fs

for i, f in enumerate(f_values):
    fourier_transform[i] = np.sum(
        x * np.exp(-2j * np.pi * f * t)
    ) * dt


# -------------------------
# Plot
# -------------------------
plt.figure(figsize=(12, 8))

plt.subplot(2, 1, 1)

plt.plot(
    freq[positive],
    amplitude[positive]
)

plt.title("Amplitude Spectrum")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Amplitude")
plt.grid(True)


plt.subplot(2, 1, 2)

plt.plot(
    f_values,
    np.abs(fourier_transform)
)

plt.title("Approximate Fourier Transform")
plt.xlabel("Frequency (Hz)")
plt.ylabel("|X(f)|")
plt.grid(True)

plt.tight_layout()
plt.show()