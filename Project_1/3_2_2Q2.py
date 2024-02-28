import numpy as np
import matplotlib.pyplot as plt
import math

# Create an array from 0-30 with step size 0.01
t1 = np.linspace(0, 5, 501)
t2 = np.linspace(5.01, 25, 2001)

# Rate Functions
def dA_dt1(A):
    return 0.03 * A - 12 * 4500

def dA_dt2(t, A):
    return (0.03 + 0.015 * math.sqrt(t - 5)) * A - 12 * 4500

# Solved IVP
def A_func1(t):
    return -850000 * (np.e ** 0.03 * t) + 1600000

# Create arrays to hold y-values
y1 = np.zeros((501))

y2 = np.zeros((2001))

y1zero = np.zeros((501))

y2zero = np.zeros((2001))

# Initial value for first piece of $750000
y1[0] = 750000

# Assign y-values to t-values with Euler's Method formula for Equation 1
for i in range(500):
    y1[i+1] = y1[i] + 0.01 * dA_dt1(y1[i])

# Initial value of the
y2[0] = y1[500]

# Assign y-values to t-values with Euler's Method formula for Equation 2
for i in range(2000):
    y2[i+1] = y2[i] + 0.01 * dA_dt2(t2[i], y2[i])

# Plot solved IVP function
plt.plot(t1, y1)

plt.plot(t2, y2)

plt.plot(t1, y1zero, 'green')
plt.plot(t2, y2zero, 'green')

plt.title("Numerical Approximation for Adjustable Rate Mortgage p = 4500")

plt.legend(("r = 0.03", "r = 0.03 + 0.015*sqrt(t-5)"), shadow=True, fancybox=True)

plt.xlabel("Time (Years)")

plt.ylabel("Dollars ($)")

idx = np.argwhere(np.diff(np.sign(y2 - y2zero))).flatten()
plt.plot(t2[idx], y2[idx], 'ro')
#plt.text(float(t2[idx]) + 0.6, float(y2[idx]) + 30000,"(" + str(round((float(t2[idx])), 3)) + ", " + str(0) + ")")

print(t2[idx], y2[idx])

positive_mask = y2 > 0
areaundercurve1 = np.sum(y1)
areaundercurve2 = np.sum(y2[positive_mask])
interest_paid = areaundercurve1*0.01 + areaundercurve2*0.01 - 750000*25*0.01
print(interest_paid)

plt.show()
