import numpy as np
import matplotlib.pyplot as plt

# Given sequence
x = np.array([1, 2, 3, 4, 5])

# Sample indices
n = np.arange(len(x))

# 501 frequencies from 0 to pi
w = np.linspace(0, np.pi, 501)

# DTFT
X = np.zeros(len(w), dtype=complex)

for i in range(len(w)):
    X[i] = np.sum(
        x * np.exp(-1j * w[i] * n)
    )


# Magnitude
magnitude = np.abs(X)

# Phase
phase = np.angle(X)

# Real part
real_part = np.real(X)

# Imaginary part
imaginary_part = np.imag(X)

plt.figure(figsize=(12, 12))

plt.subplot(4, 1, 1)
plt.plot(w, magnitude)
plt.title("Magnitude of DTFT")
plt.xlabel("ω")
plt.ylabel("|X(e^jω)|")
plt.grid(True)

plt.subplot(4, 1, 2)
plt.plot(w, phase)
plt.title("Phase / Angle of DTFT")
plt.xlabel("ω")
plt.ylabel("Angle")
plt.grid(True)

plt.subplot(4, 1, 3)
plt.plot(w, real_part)
plt.title("Real Part of DTFT")
plt.xlabel("ω")
plt.ylabel("Real")
plt.grid(True)

plt.subplot(4, 1, 4)
plt.plot(w, imaginary_part)
plt.title("Imaginary Part of DTFT")
plt.xlabel("ω")
plt.ylabel("Imaginary")
plt.grid(True)

plt.tight_layout()
plt.show()