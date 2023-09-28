import numpy as np
import time

N=int(1E6)
xfl = [x/N for x in range(0,N+1)]
xnp = np.linspace(0,1,N+1)

yfl = [x**2 for x in xfl]
ynp = xnp**2

zfl = [0]*(N+1)
znp = np.zeros(ynp.shape)

#------------------------------------- 
# Add vectors comparisons
print("Test: z = x+y")
tic = time.perf_counter()
#---
for i in range(len(xfl)):
    zfl[i] = xfl[i] + yfl[i]
#---
toc = time.perf_counter()
print(f"list loop: {toc - tic:0.4e} sec")
time_ll = toc-tic


tic = time.perf_counter()
#---
for i in range(len(xnp)):
    znp[i] = xnp[i] + ynp[i]
#---
toc = time.perf_counter()
time_npl = toc-tic
print(f"np loop  : {toc - tic:0.4e} sec",
      f"({100*time_npl/time_ll:0.2f}% of list)")


tic = time.perf_counter()
#---
znp1 = xnp + ynp
#---
toc = time.perf_counter()
time_npv = toc-tic
print(f"np vect  : {toc - tic:0.4e} sec",
      f" ({100*time_npv/time_ll:0.2f}% of list)")


tic = time.perf_counter()
#---
znp2 = np.add(xnp,ynp)
#---
toc = time.perf_counter()
time_npd = toc-tic
print(f"np add   : {toc - tic:0.4e} sec",
      f" ({100*time_npd/time_ll:0.2f}% of list)")   

#------------------------------------- 
# Dot product comparisons
print()
print("Test: dot product")
tic = time.perf_counter()
#---
tmp = 0.
for i in range(len(xfl)):
    tmp += xfl[i]*yfl[i]
#---
toc = time.perf_counter()
print(f"list loop: {toc - tic:0.4e} sec")
time_ll = toc-tic


tic = time.perf_counter()
#---
tmp = 0.
for i in range(len(xnp)):
    tmp += xnp[i]*ynp[i]
#---
toc = time.perf_counter()
time_npl = toc-tic
print(f"np loop  : {toc - tic:0.4e} sec",
      f" ({100*time_npl/time_ll:0.2f}% of list)")


tic = time.perf_counter()
#---
tmp = (xnp*ynp).sum()
#---
toc = time.perf_counter()
time_npv = toc-tic
print(f"np vect  : {toc - tic:0.4e} sec",
      f" ({100*time_npv/time_ll:0.2f}% of list)")


tic = time.perf_counter()
#---
tmp = np.dot(xnp,ynp)
#---
toc = time.perf_counter()
time_npd = toc-tic
print(f"np dot   : {toc - tic:0.4e} sec",
      f" ({100*time_npd/time_ll:0.2f}% of list)")   
    
