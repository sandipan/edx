################################################################################
# Intro to CSE
# lander.py

import matplotlib.pyplot as plt
import IVP
import numpy as np


################################################################################
## Lander class definition (a subclass of IVP)
################################################################################

class LanderIVP(IVP.IVP):

    def evalf(self, u, t):
        """
        Calculates forcing for a Martian lander given the current state and time.
    
        Args:
            u (float list): current state.
            t (float): current time
    
        Returns:
            f (float list): current forcing. 
    
        """
        
        m_l  = self.get_p('m_l')
    
        A_l  = self.get_p('A_l')
        CD_l = self.get_p('CD_l')
    
        A_p  = self.get_p('A_p')
        CD_p = self.get_p('CD_p')
    
        V = u[0]
        z = u[1]
    
        props = self.atmosphere(z)    
        g    = props['g']
        rhoa = props['rhoa']
        
        if (V > self.get_p('V_p')):
            ACD = A_l*CD_l
            theta = self.get_p('theta_e')*np.pi/180
        else:
            ACD = A_l*CD_l + A_p*CD_p
            theta = self.get_p('theta_p')*np.pi/180
        
        D = 0.5*rhoa*(V**2)*ACD
        f0 = g*np.cos(theta) - D/m_l
      
        f1 = -V*np.cos(theta)
        
        return np.array([f0, f1])

    def atmosphere(self, z):
        """
        Returns properties of the Martian atmosphere at the altitude z (assumed in meters).
        The properties are returned using a dictionary.  Currently, the properties returned
        are:
            'Ta': temperature (K)
            'pa': pressure (kPa)
            'rhoa': density (kg/m^3)
            'g': gravity (m/s^2)
    
        Args:
            z (float): altitude in meters
    
        Returns:
            props (dictionary): property keys and values.  
    
        """
        
        props = {}
        if z>7000:
            Ta = 235 - 0.00108*(z-7000)
        else:
            Ta = 235 - 0.00222*(z-7000)
        props['Ta'] = Ta # K
            
        pa = 0.699*np.exp(-0.00009*z)
        props['pa'] = pa # kPa
         
        rhoa = (1+self.get_p('rhoa_fac'))*pa/(0.1921*Ta) # kg/m^3
        props['rhoa'] = rhoa
        
        G = 6.674e-11 # Gravitational constant (m^3/ kg/s^2)
        Mm = 6.41693e23 # Mass of Mars (kg)
        Rm = 3389.5*1000 # Radius of Mars (m)
        
        g = G*Mm/(Rm+z)**2 # m/s^2
        props['g'] = g
        
        return props
    
    def stopcheck(self, un):
        return un[0] < self.get_p('V_p')
    

################################################################################
## Functions to solve Martian lander trajectory IVP
################################################################################

def lander_run_case(lander_IVP, dt, method):
    """
    Solves the Martian lander problem described in lander_IVP with a timestep dt using method to integrated the IVP.

    Args:
        lander_IVP (IVP object): Describes IVP case to be simulated
        dt (float): timestep
        method (function): numerical method to run on case

    """
    
    t, u = IVP.solve(lander_IVP, dt, method)

    return u[-2,1]/1000


if __name__ == "__main__":
    uI = np.array([5800.0, 125*1000.0]) # Initial velocity (m/s) and altitude (m)
    tI = 0
    tF = 2000.0 # s
    
    p = {}
    p['m_l']     = 3300.0 # kg
    p['V_p']     = 470.0 # parachute deploy velocity (m/s)
    p['A_p']     = 201.0 # m^2
    p['CD_p']    = 1.2
    p['theta_p'] = 70.0 # flight path angle during parachute, in degrees   
    p['A_l']     = 15.9 # m^2
    p['CD_l']    = 1.70
    p['theta_e'] = 83.0 # flight path angle during entry, in degrees
    p['rhoa_fac'] = 0.0 # increment of atmospheric density relative to nominal model 
    p0 = p.copy()
   
    lander_IVP = LanderIVP(uI, tI, tF, p)
    dt = 0.1

    # Simulate nominal case
    zp = lander_run_case(lander_IVP, dt, IVP.step_RK4)
    print(f'Parachute deployed at z = {zp:.2f} km (nominal case)')

    '''
    # Impact of CD variation

    rng = np.random.default_rng()
    
    Nsample = 100
    zps  = np.zeros(Nsample)
    CDls = np.zeros(Nsample)
    
    for n in range(Nsample):
        CDls[n] = rng.uniform(1.5, 1.9)
        lander_IVP.set_p('CD_l', CDls[n])
        zps[n] = lander_run_case(lander_IVP, dt, IVP.step_RK4)
    
    fig, axs = plt.subplots(2,1,sharex=True)
    axs[0].plot(zps,range(len(zps)),'*')
    axs[0].grid(True)
    axs[0].set_ylabel('index')
    
    Nlow = np.count_nonzero(zps < 9.)
    Plow = Nlow/Nsample
    print(f"Nlow = {Nlow}, Nsample = {Nsample} Plow = {Plow:.3f}")
    
    zbins = np.linspace(8.,11.5,8)
    axs[1].hist(zps,bins=zbins)
    axs[1].set_xlabel('$z_p$ (km)')
    axs[1].set_ylabel('count')
    axs[1].grid(True)
    
    plt.subplots()
    plt.scatter(CDls, zps)
    plt.xlabel('${C_D}_l$')
    plt.ylabel('$z_p$ (km)')
    plt.grid(True)
    plt.show()
    '''

    # Impact of CD, thetae, VI, rhofac variation
    
    rng = np.random.default_rng()
    
    Nsample = 10000
    zps  = np.zeros(Nsample)
    CDls    = rng.uniform(1.5, 1.9, Nsample)
    thetaes = rng.uniform(80., 86., Nsample)
    VIs     = rng.uniform(5500., 6100., Nsample)
    rfs     = rng.uniform(-0.1, 0.1, Nsample)
    
    uI0 = lander_IVP.get_uI()
    for n in range(Nsample):
         lander_IVP.set_p('CD_l', CDls[n])       
         lander_IVP.set_p('theta_e', thetaes[n])
         lander_IVP.set_uI(np.array([VIs[n],uI0[1]]))
         lander_IVP.set_p('rhoa_fac', rfs[n])
         zps[n] = lander_run_case(lander_IVP, dt, IVP.step_RK4)

    # plt.subplots()
    # plt.scatter(CDls,thetaes)
    # plt.xlabel('${C_D}_l$')
    # plt.ylabel('$theta_e$')
    
    # fig, axs = plt.subplots(2,1,sharex=True)
    # axs[0].plot(zps,range(len(zps)),'*')
    # axs[0].grid(True)
    # axs[0].set_ylabel('index')
    
    Nlow = np.count_nonzero(zps > 12.) #< 9.)
    Plow = Nlow/Nsample
    print(f"Nlow = {Nlow}, Nsample = {Nsample} Plow = {Plow:.3f}")

    # zbins = np.linspace(4,18,9)
    # axs[1].hist(zps,bins=zbins)
    # axs[1].set_xlabel('$z_p$ (km)')
    # axs[1].set_ylabel('count')
    # axs[1].grid(True)    

    # plt.subplots()
    # plt.scatter(CDls, zps)
    # plt.xlabel('${C_D}_l$')
    # plt.ylabel('$z_p$ (km)')
    # plt.grid(True)
