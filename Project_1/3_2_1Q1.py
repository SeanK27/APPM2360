import numpy as np
import matplotlib.pyplot as plt

# Create an array from 0-30 with step size 0.5
t = np.linspace(0, 35, 71)

# Rate Function
def dA_dt(A):
    return 0.05 * A - 12 * 4000

# Solved IVP
def A_func(t):
    return -210000 * np.e ** (0.05 * t) + 960000

# Create array to hold y-values
y = np.zeros((71))

#Zero line
yzeros = np.zeros((71))

# Initial value of $750000
y[0] = 750000

# Assign y-values to t-values with Euler's Method formula
for i in range(70):
    y[i+1] = y[i] + 0.5 * dA_dt(y[i])

# Plot function with generated Euler's Method parameters
plt.plot(t, y)

# Plot solved IVP function
plt.plot(t, A_func(t))

# Zero Line
plt.plot(t, yzeros, 'green')

# Intersection Point
idx = np.argwhere(np.diff(np.sign(y - yzeros))).flatten()
plt.plot(t[idx] + 0.3, 0, 'ro')

plt.legend(("Euler's Method", "Actual Function"), shadow=True, fancybox=True)

plt.title("Numerical Approximation of Fixed Rate Mortgage h = 0.5")

plt.xlabel("Time (Years)")

plt.ylabel("Dollars ($)")

print(t[idx], y[idx])

plt.show()
