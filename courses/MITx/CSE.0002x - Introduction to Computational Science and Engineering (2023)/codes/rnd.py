import numpy as np
from time import time

s = time()
#rng = np.random.default_rng()
for i in range(4): #0000):
    rng = np.random.default_rng()
    v = rng.uniform(1,2)
    print("{:.8f}".format(v))
print(time() - s)


for i in range(4):
    rng = np.random.default_rng(0)
    v = rng.uniform(1,2)
    print("{:.8f}".format(v))


rng = np.random.default_rng(0)
for i in range(4):
    v = rng.uniform(1,2)
    print("{:.8f}".format(v))