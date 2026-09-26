import numpy as np
import matplotlib.pyplot as plt

# Range
n = np.arange(-7, 8)

# Unit impulse function
delta_n_plus_2 = np.where(n == -2, 1, 0)
delta_n_minus_4 = np.where(n == 4, 1, 0)

# x(n) = 2δ(n+2) - δ(n-4)
x = 2 * delta_n_plus_2 - delta_n_minus_4

# Display values
print("n =", n)
print("x(n) =", x)

# Plot
plt.figure(figsize=(10, 5))
plt.stem(n, x)

plt.title(r"$x(n)=2\delta(n+2)-\delta(n-4)$")
plt.xlabel("n")
plt.ylabel("x(n)")
plt.grid(True)

plt.show()