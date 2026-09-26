import numpy as np
import matplotlib.pyplot as plt

# Original signal
n = np.arange(-5, 6)

x = np.array([1, 2, 3, 4, 5, 4, 3, 2, 1, 0, 0])

# Second signal
h = np.array([0, 1, 2, 3, 4, 3, 2, 1, 0, 0, 0])


# -------------------------
# Addition
# -------------------------
addition = x + h


# -------------------------
# Folding
# x[-n]
# -------------------------
folded = x[::-1]


# -------------------------
# Shifting
# x[n-2]
# -------------------------
shift = 2

shifted_n = n + shift
shifted = x


# -------------------------
# Plot
# -------------------------
plt.figure(figsize=(12, 10))

plt.subplot(4, 1, 1)
plt.stem(n, x)
plt.title("Original Signal x[n]")
plt.xlabel("n")
plt.ylabel("x[n]")
plt.grid(True)

plt.subplot(4, 1, 2)
plt.stem(n, addition)
plt.title("Addition: x[n] + h[n]")
plt.xlabel("n")
plt.ylabel("Amplitude")
plt.grid(True)

plt.subplot(4, 1, 3)
plt.stem(n, folded)
plt.title("Folding: x[-n]")
plt.xlabel("n")
plt.ylabel("Amplitude")
plt.grid(True)

plt.subplot(4, 1, 4)
plt.stem(shifted_n, shifted)
plt.title("Shifting: x[n-2]")
plt.xlabel("n")
plt.ylabel("Amplitude")
plt.grid(True)

plt.tight_layout()
plt.show()