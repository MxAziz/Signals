import numpy as np
import matplotlib.pyplot as plt

# Input sequence
x = np.array([1, 2, 3, 4])

N = len(x)

# -------------------------
# DFT
# -------------------------
X = np.zeros(N, dtype=complex)

for k in range(N):
    for n in range(N):
        X[k] += x[n] * np.exp(-2j * np.pi * k * n / N)


# -------------------------
# IDFT
# -------------------------
x_reconstructed = np.zeros(N, dtype=complex)

for n in range(N):
    for k in range(N):
        x_reconstructed[n] += X[k] * np.exp(2j * np.pi * k * n / N)

x_reconstructed = x_reconstructed / N


# Display
print("Original Sequence:")
print(x)

print("\nDFT:")
print(X)

print("\nIDFT:")
print(np.real_if_close(x_reconstructed))


# Plot
plt.figure(figsize=(10, 7))

plt.subplot(2, 1, 1)
plt.stem(np.arange(N), np.abs(X))
plt.title("Magnitude Spectrum of DFT")
plt.xlabel("k")
plt.ylabel("|X[k]|")
plt.grid(True)

plt.subplot(2, 1, 2)
plt.stem(np.arange(N), np.real(x_reconstructed))
plt.title("Reconstructed Signal using IDFT")
plt.xlabel("n")
plt.ylabel("Amplitude")
plt.grid(True)

plt.tight_layout()
plt.show()