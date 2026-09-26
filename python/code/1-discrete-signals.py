import numpy as np
import matplotlib.pyplot as plt

# Discrete time index
n = np.arange(-10, 11)

# Unit Sample Signal: delta[n]
unit_sample = np.where(n == 0, 1, 0)

# Unit Step Signal: u[n]
unit_step = np.where(n >= 0, 1, 0)

# Unit Ramp Signal: r[n] = n*u[n]
unit_ramp = n * unit_step

# Plot
plt.figure(figsize=(10, 8))

plt.subplot(3, 1, 1)
plt.stem(n, unit_sample)
plt.title("Unit Sample Sequence")
plt.xlabel("n")
plt.ylabel("δ[n]")
plt.grid(True)

plt.subplot(3, 1, 2)
plt.stem(n, unit_step)
plt.title("Unit Step Signal")
plt.xlabel("n")
plt.ylabel("u[n]")
plt.grid(True)

plt.subplot(3, 1, 3)
plt.stem(n, unit_ramp)
plt.title("Unit Ramp Signal")
plt.xlabel("n")
plt.ylabel("r[n]")
plt.grid(True)

plt.tight_layout()
plt.show()