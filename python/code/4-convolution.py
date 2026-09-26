import numpy as np
import matplotlib.pyplot as plt

# Input sequences
x = np.array([1, 2, 3, 4])
h = np.array([1, 1, 1])

# Convolution
y = np.convolve(x, h)

# Index
n = np.arange(len(y))

print("x[n] =", x)
print("h[n] =", h)
print("y[n] = x[n] * h[n] =", y)

# Plot
plt.figure(figsize=(10, 6))

plt.subplot(3, 1, 1)
plt.stem(np.arange(len(x)), x)
plt.title("Input Sequence x[n]")
plt.grid(True)

plt.subplot(3, 1, 2)
plt.stem(np.arange(len(h)), h)
plt.title("Impulse Response h[n]")
plt.grid(True)

plt.subplot(3, 1, 3)
plt.stem(n, y)
plt.title("Convolution y[n] = x[n] * h[n]")
plt.xlabel("n")
plt.grid(True)

plt.tight_layout()
plt.show()