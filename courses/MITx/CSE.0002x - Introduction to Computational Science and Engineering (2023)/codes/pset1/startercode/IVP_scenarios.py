################################################################################
# CSE.0002x
# Problem Set 1: IVP_scenarios, tests the IVPlib module implementation
# DO NOT MODIFY THIS FILE!
# (except to uncomment methods_to_test in the '__main__' block)

from IVPlib_pset1 import IVP
import IVPlib_pset1 as IVPlib
import math


################################################################################
## test0
##
## Solve du/dt = 2
## from tI = 1 to tF = 2
## with uI = 3 + 1/3
##
## This gives an exact solution:
## u = 1 + 1/3 + 2*t
################################################################################


class Test0(IVP):

    def evalf(self, u, t):
        return [2]


def run_test0(method):
    uI = [3 + 1/3]
    tI = 1
    tF = 2

    test_IVP = Test0(uI, tI, tF)
    t, u = IVPlib.solve(test_IVP, 0.2, method)

    emax = 0
    for i in range(len(t)):
        tt = t[i]
        ut = u[i][0]
        uext = 1 + 1/3 + 2*tt
        emax = max(emax, abs(ut-uext))
    return emax


################################################################################
## test1
##
## Solve du/dt = 1 - t + 6*t**2 - 2/3*t**3
## from tI = 1 to tF = 2
## with uI = 12 + 1/3
##
## This gives an exact solution:
## u = 10 + t - 1/2*t**2 + 2*t**3 - 1/6*t**4
################################################################################


class Test1(IVP):

    def evalf(self, u, t):
        return [1 - t + 6*t**2 - 2/3*t**3]


def run_test1(method):
    uI = [12 + 1/3]
    tI = 1
    tF = 2

    test_IVP = Test1(uI, tI, tF)
    t, u = IVPlib.solve(test_IVP, 0.2, method)

    emax = 0
    for i in range(len(t)):
        tt = t[i]
        ut = u[i][0]
        uext = 10 + tt - 1/2*tt**2 + 2*tt**3 - 1/6*tt**4
        emax = max(emax, abs(ut-uext))
    return emax


################################################################################
## test2
##
## Solve a decoupled system of equations in which u = [u0, u1] and f = [f0, f1], where
## f0 = 2
## f1 = 1 - t + 6*t**2 - 2/3*t**3
##
## from tI = 1 to tF = 2
## with [uI0, uI1] = [3 + 1/3, 12 + 1/3]
##
## This gives an exact solution:
## u0 = 1 + 1/3 + 2*t
## u1 = 10 + t - 1/2*t**2 + 2*t**3 - 1/6*t**4
################################################################################


class Test2(IVP):

    def evalf(self, u, t):
        f0 = 2
        f1 = 1 - t + 6*t**2 - 2/3*t**3
        return [f0, f1]


def run_test2(method):
    uI = [3 + 1/3, 12 + 1/3]
    tI = 1
    tF = 2

    test_IVP = Test2(uI, tI, tF)
    t, u = IVPlib.solve(test_IVP, 0.2, method)

    e0max = 0
    e1max = 0
    for i in range(len(t)):
        tt = t[i]
        [u0t, u1t] = u[i]
        u0ext = 1 + 1/3 + 2*tt
        u1ext = 10 + tt - 1/2*tt**2 + 2*tt**3 - 1/6*tt**4
        e0max = max(e0max, abs(u0t-u0ext))
        e1max = max(e1max, abs(u1t-u1ext))
    return [e0max, e1max]


################################################################################
## test3
##
## Solve a scalar equation in which f(u, t) depends on u linearly
## f(u, t) = -0.1*u + t
##
## from tI = 0 to tF = 4.5
## with uI = 1.0
##
## This gives an exact solution:
## u(t) = 10*t + 101*e**(-0.1 t) - 100
################################################################################


class Test3(IVP):

    def evalf(self, u, t):
        return [-0.1*u[0] + t]


def run_test3(method):
    uI = [1.0]
    tI = 0.0
    tF = 4.5

    test_IVP = Test3(uI, tI, tF)
    t, u = IVPlib.solve(test_IVP, 0.2, method)

    emax = 0
    for i in range(len(t)):
        tt = t[i]
        ut = u[i][0]
        uext = 10*tt + 101*math.exp(-0.1*tt) - 100
        emax = max(emax, abs(ut-uext))
    return emax


################################################################################
## test4
##
## Solve a coupled system of nonlinear equations in which u = [u0, u1]
## and f = [f0, f1], where
## f0 = -u0^2
## f1 = -u1 + 1/u0
##
## from tI = 0 to tF = 1
## with [uI0, uI1] = [2, 1]
##
## This gives an exact solution:
## u0 = 2 / (2*t+1)
## u1 = t + 3/2*e**(-t) - 1/2
################################################################################


class Test4(IVP):

    def evalf(self, u, t):
        f0 = -u[0]**2
        f1 = -u[1] + 1/u[0]
        return [f0, f1]


def run_test4(method):
    uI = [2, 1]
    tI = 0
    tF = 1

    test_IVP = Test4(uI, tI, tF)
    t, u = IVPlib.solve(test_IVP, 0.1, method)

    e0max = 0
    e1max = 0
    for i in range(len(t)):
        tt = t[i]
        [u0t, u1t] = u[i]
        u0ext = 2 / (2*tt+1)
        u1ext = tt + 3/2*math.exp(-tt) - 0.5
        e0max = max(e0max, abs(u0t-u0ext))
        e1max = max(e1max, abs(u1t-u1ext))
    return [e0max, e1max]


################################################################################
## Main script
################################################################################


if __name__ == '__main__':

    # You may change the following list to set the tests you would like to run
    tests_to_run = [run_test0, run_test1, run_test2, run_test3, run_test4]

    # You may change the following list to set the methods you would like to run on each test
    #methods_to_test = [IVPlib.step_FE]
    methods_to_test = [IVPlib.step_FE, IVPlib.step_RK4]

    for test in tests_to_run:
        print()
        print(f"{test.__name__} results:")
        for method in methods_to_test:
            max_error = test(method)
            if type(max_error) == float:
                error_disp = f"{max_error:.3e}"
            elif type(max_error) == list and all(type(e) == float for e in max_error):
                error_disp = "["
                for e in max_error:
                    error_disp += f"{e:.3e}, "
                error_disp = error_disp[:-2] + "]"
            else:
                raise ValueError(f"{max_error} isn't a float or list of floats")
            print(f"    {method.__name__}  : {error_disp}")
