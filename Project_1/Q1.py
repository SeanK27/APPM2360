import numpy as np
import matplotlib.pyplot as plt
import math

A_i = 750000
t = np.linspace(0, 30, 301)


def y1(t, A):
    return A * 1.0075 ** (4 * t)


def y2(t, A):
    return A * 1.0025 ** (12 * t)


def y3(t, A):
    return A * np.e ** (0.03 * t)


plt.plot(t, y1(t, y1(t, A_i)))

plt.plot(t, y2(t, y1(t, A_i)))

plt.plot(t, y3(t, y1(t, A_i)))

plt.legend(("Compounded Quarterly", "Compounded Monthly", "Compounded Infinitely"), shadow=True, fancybox=True)

plt.title("Effects of Continuous Compounding Interest")

plt.xlabel("Time (Years)")

plt.ylabel("Dollars ($)")

plt.show()
