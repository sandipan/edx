import numpy as np
import matplotlib.pyplot as plt    

def calc_xf(V0, th0, g):
    """
    Calculates the impact location (xf) of a projectile given the initial speed, angle, and gravity.
    
    Args:
        V0 (float or numpy array of floats): Initial speed
        th0 (loat or numpy array of floats): Initial angle (degrees)
        g (float): gravity.

    Returns:
        xf as either a float or numpy array (if V0 and th0 are numpy arrays)

    """
    xf = (V0**2)/g*np.sin(2*th0*np.pi/180.)
    return xf


    
def run_xfMC(V0dict, th0dict, g, N):
    """
    Perform a Monte Carlo simulation of sample size N calculating xf the point 
    of impact of a projectile on the ground with  initial speed V0 and initial 
    angle th0 are uniformally distributed.

    Args:
        V0dict (dictionary): dictionary describing V0 distribution
        th0dict (dictionary): dictionary describing th0 distribution
                              Note: th0lim will be in degrees.
        g (float): gravity
        N (integer): size of sample to run Monte Carlo on

    Returns:
        xf (numpy array of floats): point of impact for all instances in sample

    """
    rng = np.random.default_rng()
    
    # Get V0 sample
    if V0dict['type'] == 'uniform':
        V0 = rng.uniform(V0dict['min'], V0dict['max'], N)
    elif V0dict['type'] == 'triangular':
        V0   = rng.triangular( V0dict['min'], V0dict['mpp'], V0dict['max'], N)
    elif V0dict['type'] == 'normal':
        V0   = rng.normal(V0dict['mean'],V0dict['sigma'], N) 
    
    # Get th0 sample
    if th0dict['type'] == 'uniform':
        th0 = rng.uniform(th0dict['min'], th0dict['max'], N)
    elif th0dict['type'] == 'triangular':
        th0   = rng.triangular( th0dict['min'], th0dict['mpp'], th0dict['max'], N)
    elif th0dict['type'] == 'normal':
        th0   = rng.normal(th0dict['mean'],th0dict['sigma'], N) 
    
    # Performance Monte Carlo
    xf = calc_xf(V0,th0,g)
    
    return xf
    


def calc_ptarget(xf, xftarget):
    """
    Calculate probability (fraction) of instances of xf which fell 
    between xftarget[0] < xf <  xftarget[1]

    Args:
        xf (numpy array of floats): impact locations
        xftarget (tuple of floats): gives desired impact location range

    Returns:
        Ptarget (float): estimated probability

    """
    Ntarget = np.count_nonzero(np.logical_and(xf>xftarget[0],xf<xftarget[1]))
    Ptarget = Ntarget/len(xf)
    return Ptarget

# Main routine

"""
Example: 
    Large N sample
    Difference of count vs density histogram
"""

V0dict = {}
V0dict['type'] = 'uniform'
V0dict['min']  = 28
V0dict['max']  = 32.

th0dict = {}
th0dict['type'] = 'uniform'
th0dict['min']  = 25.
th0dict['max']  = 35.

g = 9.81

N   = int(1e8)
xf = run_xfMC(V0dict, th0dict, g, N)

plt.figure()
plt.hist(xf,200)
plt.xlabel('$x_f$ (m)')
plt.ylabel('count')

plt.figure()
plt.hist(xf,200,density=True)
plt.xlabel('$x_f$ (m)')
plt.ylabel('density')

"""
Example: 
    Large N sample
    Using triangular distributions
"""

# V0dict = {}
# V0dict['type'] = 'triangular'
# V0dict['min']  = 28.
# V0dict['mpp']  = 30.
# V0dict['max']  = 32.

# th0dict = {}
# th0dict['type'] = 'triangular'
# th0dict['min']  = 25.
# th0dict['mpp']  = 30.
# th0dict['max']  = 35.

# g = 9.81

# N   = int(1e8)
# xf = run_xfMC(V0dict, th0dict, g, N)

# plt.figure()
# plt.hist(xf,200,density=True)
# plt.xlabel('$x_f$ (m)')
# plt.ylabel('density')

"""
Example: 
    Large N sample
    Using normal distributions
"""

# V0dict = {}
# V0dict['type']  = 'normal'
# V0dict['mean']  = 30.
# V0dict['sigma'] = 2./3.

# th0dict = {}
# th0dict['type']  = 'normal'
# th0dict['mean']  = 30.
# th0dict['sigma'] = 5./3.

# g = 9.81

# N   = int(1e8)
# xf = run_xfMC(V0dict, th0dict, g, N)

# plt.figure()
# plt.hist(xf,200,density=True)
# plt.xlabel('$x_f$ (m)')
# plt.ylabel('density')

"""
Demonstration (part 1): variability of mean and probability estimate
"""

# V0dict = {}
# V0dict['type'] = 'uniform'
# V0dict['min']  = 28.
# V0dict['max']  = 32.

# th0dict = {}
# th0dict['type'] = 'uniform'
# th0dict['min']  = 25.
# th0dict['max']  = 35.

# g = 9.81

# xftarget = (78., 81.)

# N = int(1e2)

# xf = run_xfMC(V0dict, th0dict, g, N)
# Ptarget = calc_ptarget(xf, xftarget)
# xfmean = xf.mean()
# print(f"xfmean = {xfmean:.4f}, Ptarget = {Ptarget:.5f}")

"""
Demonstration (part 2): variability of mean and probability estimate
"""

# V0dict = {}
# V0dict['type'] = 'uniform'
# V0dict['min']  = 28.
# V0dict['max']  = 32.

# th0dict = {}
# th0dict['type'] = 'uniform'
# th0dict['min']  = 25.
# th0dict['max']  = 35.

# g = 9.81

# xftarget = (78., 81.)

# M = int(1e4)
# N = int(1e2)
# Ptarget = np.zeros(M)
# xfmean  = np.zeros(M)
# xfstd   = np.zeros(M)
# for m in range(M):
#     xf = run_xfMC(V0dict, th0dict, g, N)
#     Ptarget[m] = calc_ptarget(xf, xftarget)
#     xfmean[m] = xf.mean()
#     xfstd[m] = xf.std(ddof=1)

# fig, axs = plt.subplots(2,sharex=True)
# axs[0].plot(Ptarget,'r*')
# axs[0].set_ylabel('$\hat{p}_{target}$')
# axs[0].grid(True)
# axs[1].plot(xfmean,'b*')
# axs[1].set_ylabel('$\overline{x_f}$  (m)')
# axs[1].set_xlabel('MC simulation number')
# axs[1].grid(True)
# axs[0].set_title(f'{M:.0e} Monte Carlo simulations with sample size {N:.0e}')

# # Calculate mean of Monte Carlo estimates
# MCmean_Ptarget = Ptarget.mean()
# MCmean_xfmean  =  xfmean.mean()
# axs[0].plot([0,M],[MCmean_Ptarget, MCmean_Ptarget],'g',linewidth=3)
# axs[1].plot([0,M],[MCmean_xfmean, MCmean_xfmean],'g',linewidth=3)

# # Calculate standard deviation of MC estimates
# MCstd_Ptarget = Ptarget.std()
# MCstd_xfmean  =  xfmean.std()

# # Calculate 95% range of Monte Carlo estimates (centered at MCmean)
# dP = abs(Ptarget-MCmean_Ptarget)
# dP.sort()
# dP95 = dP[int(0.95*M)]
# axs[0].plot([0,M],[MCmean_Ptarget-dP95, MCmean_Ptarget-dP95],'m',linewidth=3)
# axs[0].plot([0,M],[MCmean_Ptarget+dP95, MCmean_Ptarget+dP95],'m',linewidth=3)

# dxf = abs(xfmean-MCmean_xfmean)
# dxf.sort()
# dxf95 = dxf[int(0.95*M)]
# axs[1].plot([0,M],[MCmean_xfmean-dxf95, MCmean_xfmean-dxf95],'m',linewidth=3)
# axs[1].plot([0,M],[MCmean_xfmean+dxf95, MCmean_xfmean+dxf95],'m',linewidth=3)

# fighMC, axshMC = plt.subplots(2)
# axshMC[0].hist(Ptarget,100, density=True, color='r')
# axshMC[0].set_xlabel('$\hat{p}_{target}$')
# axshMC[0].set_ylabel('Density')
# axshMC[0].set_title(f'{M:.0e} Monte Carlo simulations with sample size {N:.0e}')

# axshMC[1].hist(xfmean,100, density=True, color='b')
# axshMC[1].set_xlabel('$\overline{x_f}$  (m)')
# axshMC[1].set_ylabel('Density')

"""
Example: 
    Confidence interval for mean and probability
"""

# V0dict = {}
# V0dict['type'] = 'uniform'
# V0dict['min']  = 28.
# V0dict['max']  = 32.

# th0dict = {}
# th0dict['type'] = 'uniform'
# th0dict['min']  = 25.
# th0dict['max']  = 35.

# g = 9.81

# N = int(1e2)

# xf = run_xfMC(V0dict, th0dict, g, N)
# xfmean = xf.mean()
# xfstd  = xf.std(ddof=1)
# xfstderr = xfstd/(N**0.5)
# muxf_lo = xfmean - 1.96*xfstderr
# muxf_hi = xfmean + 1.96*xfstderr

# print(f"xfmean = {xfmean:.4f}")
# print(f"95% confidence interval: {muxf_lo:.4f} < mu_xf < {muxf_hi:.4f}")

# xftarget = (78., 81.)
# Phat = calc_ptarget(xf, xftarget)
# Pstderr = (Phat*(1-Phat)/N)**0.5
# Ptarget_lo = Phat - 1.96*Pstderr
# Ptarget_hi = Phat + 1.96*Pstderr

# print()
# print(f"Phat = {Phat:.5f}")
# print(f"95% confidence interval: {Ptarget_lo:.5f} < Ptarget < {Ptarget_hi:.5f}")


