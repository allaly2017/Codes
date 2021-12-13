import numpy as np
import math as m
import matplotlib.pyplot as plt

y = [0]*100
x = np.linspace(-10-m.pi,10+m.pi,100)
#z = np.linspace(-1,1,100)

for i in range(0,100):
    y[i] = m.sin(x[i])/x[i]

plt.plot(x,y)
#plt.plot(z,y)
plt.title("Fonction sin(x)/x")
plt.show()
