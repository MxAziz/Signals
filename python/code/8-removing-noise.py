import numpy as np
import matplotlib.pyplot as plt

# Sampling frequency
fs = 1000

# Duration
duration = 1

# Time
t = np.arange(0, duration, 1 / fs)

# -------------------------
# 1. Generate 440 Hz signal
# -------------------------
f = 440

pure_signal = np.sin(2 * np.pi * f * t)


# -------------------------
# 2. Add random noise
# -------------------------
np.random.seed(10)

noise = 0.5 * np.random.randn(len(t))

noisy_signal = pure_signal + noise


# -------------------------
# 3. DFT
# -------------------------
N = len(noisy_signal)

X = np.fft.fft(noisy_signal)

frequencies = np.fft.fftfreq(N, 1 / fs)


# -------------------------
# 4. High-frequency filtering
# -------------------------
cutoff = 450

X_filtered = X.copy()

X_filtered[np.abs(frequencies) > cutoff] = 0


# -------------------------
# 5. IDFT
# -------------------------
filtered_signal = np.fft.ifft(X_filtered)

filtered_signal = np.real(filtered_signal)


# -------------------------
# Plot
# -------------------------
plt.figure(figsize=(12, 10))

plt.subplot(3, 1, 1)
plt.plot(t, pure_signal)
plt.title("Pure 440 Hz Sine Wave")
plt.xlabel("Time (s)")
plt.ylabel("Amplitude")
plt.grid(True)

plt.subplot(3, 1, 2)
plt.plot(t, noisy_signal)
plt.title("Noisy Signal")
plt.xlabel("Time (s)")
plt.ylabel("Amplitude")
plt.grid(True)

plt.subplot(3, 1, 3)
plt.plot(t, filtered_signal)
plt.title("Filtered Signal")
plt.xlabel("Time (s)")
plt.ylabel("Amplitude")
plt.grid(True)

plt.tight_layout()
plt.show()