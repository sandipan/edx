import numpy as np

with open('dTdata.npy','rb') as f:
    dT = np.load(f)
    #print(dT.shape)
    #print(dT[:10])
    n, m, s = len(dT), dT.mean(), np.std(dT, ddof=1)
    se = s / np.sqrt(n)
    low, high = m - 1.96*se, m + 1.96*se
    print(n, m, s, se, low, high)


