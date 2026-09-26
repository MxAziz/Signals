import numpy as np
import matplotlib.pyplot as plt

# Time
t = np.linspace(-np.pi, np.pi, 1000)

# Fundamental angular frequency
w0 = 1

# Number of harmonics
N = 10

# Fourier series
x = np.zeros_like(t)

for n in range(1, N + 1, 2):
    x += (1 / n) * np.sin(n * w0 * t)

x = (4 / np.pi) * x


# Plot
plt.figure(figsize=(10, 5))

plt.plot(t, x)

plt.title("Fourier Series Approximation of Square Wave")
plt.xlabel("Time")
plt.ylabel("Amplitude")
plt.grid(True)

plt.show()