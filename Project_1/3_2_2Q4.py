import numpy as np
import matplotlib.pyplot as plt
import math

###########################################Code for p = 4000#####################################
# Create an array from 0-30 with step size 0.01
t12 = np.linspace(0, 5, 501)
t22 = np.linspace(5.01, 40, 3501)

# Rate Functions
def dA_dt12(A):
    return 0.03 * A - 12 * 4000

def dA_dt22(t, A):
    return (0.03 + 0.015 * math.sqrt(t - 5)) * A - 12 * 4000

# Solved IVP
def A_func12(t):
    return -850000 * (np.e ** 0.03 * t) + 1600000

# Create arrays to hold y-values
y12 = np.zeros((501))

y22 = np.zeros((3501))

y1zero2 = np.zeros((501))

y2zero1 = np.zeros((2001))

y2zero2 = np.zeros((3501))

# Initial value for first piece of $750000
y12[0] = 750000

# Assign y-values to t-values with Euler's Method formula for Equation 1
for i in range(500):
    y12[i+1] = y12[i] + 0.01 * dA_dt12(y12[i])

# Initial value of the
y22[0] = y12[500]

# Assign y-values to t-values with Euler's Method formula for Equation 2
for i in range(3500):
    y22[i+1] = y22[i] + 0.01 * dA_dt22(t22[i], y22[i])

################################################################################################

###########################################Code for p = 4500####################################

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

y2zero = np.zeros((3501))

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

################################################################################################

############################################Plots###############################################
# Plot solved IVP function
plt.plot(t1, y1, 'orange')

plt.plot(t12, y12, 'blue')

plt.plot(t2, y2, 'orange')

plt.plot(t22, y22, 'blue')

plt.plot(t1, y1zero, 'green')
plt.plot(t22, y2zero, 'green')

plt.title("Adjustable Rate p = 4500 vs. p = 4000")

plt.legend(("p = 4500", "p = 4000"), shadow=True, fancybox=True)

plt.xlabel("Time (Years)")

plt.ylabel("Dollars ($)")

idx = np.argwhere(np.diff(np.sign(y2 - y2zero1))).flatten()
idx2 = np.argwhere(np.diff(np.sign(y22 - y2zero))).flatten()
plt.plot(t2[idx], y2[idx], 'ro')
plt.plot(t22[idx2], y22[idx2], 'ro')
#plt.text(float(t2[idx]) + 0.6, float(y2[idx]) + 30000,"(" + str(round((float(t2[idx])), 3)) + ", " + str(0) + ")")

print(t2[idx], y2[idx])

######################################Interest Calculations######################################
positive_mask = y2 > 0
areaundercurve1 = np.sum(y1)
areaundercurve2 = np.sum(y2[positive_mask])
interest_paid = areaundercurve1*0.01 + areaundercurve2*0.01 - 750000*30*0.01
print(interest_paid/10)

plt.show()
