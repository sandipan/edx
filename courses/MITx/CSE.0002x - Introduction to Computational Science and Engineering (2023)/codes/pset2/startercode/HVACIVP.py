################################################################################
# CSE.0002x
# Problem Set 2: HVACIVP
# DO NOT MODIFY THIS FILE!

import numpy as np
import matplotlib.pyplot as plt
from LinSysIVP import LinSysIVP


class HVACIVP(LinSysIVP):

    def __init__(self, fname, uI, tI, tF, p={}):
        """
        Constructs an HVACIVP object. In addition to the standard
        data attributes coming from the parent class, HVAC will have
        the following two HVACIVP specific data attributes:

        _SideList:
            * list of lists
            * length is number of sides in the problem
            * side = _SideList[i] is then a list for the ith side which contains
            * side[0]: string giving the index to room on "left" side of side
            * side[1]: string giving info about "right" side of side
                * if "right" side is another room, then the side[1] will convert
                  to an integer using int(side[1])
                * otherwise, side[1] will be a string giving a key in
                  the p dictionary and then get_p(side[1]) will be return a function
                  reference that calculates the temperature given the time.
            * side[2]: a key in the p dictionary such that get_p(side[2]) returns
                the heat transfer coefficient for the side
            * side[3]: a key in the p dictionary such that get_p(side[3]) returns
                the area of the side

        _RoomInfo:
            * dictionary giving the references to data for the rooms
            * _RoomInfo['m']  = list of keys to get air mass in each room
            * _RoomInfo['Q']  = list of keys to get heat source in each room
            * There are other things in _RoomInfo but you do not need to
              use them for this pset (the plotting is using them)

        Args:
            fname (string): name of file with building data
            uI (NumPy ndarray): initial condition of state.
            tI (float): initial time.
            tF (float): final time.
            p (dictionary): set of fixed parameters.
        """
        # Read data file
        self._SideList, self._RoomInfo = self._ReadFile(fname)

        # Set plotting data to an empty list
        self._plotdata = []

        # Call constructor from super class
        super().__init__(uI, tI, tF, p)

    ############ hidden methods ############

    def _ReadFile(self, fname):
        with open(fname, 'r', encoding='utf-8-sig') as f:
            cols = (f.readline()).split(',')
            if cols[0] != 'sides':
                raise ValueError(f"Incorrect file format: expecting first line to = sides but = {cols[0]}")
            cols = (f.readline()).split(',')
            SideList = []
            while cols[0] != 'rooms':
                SideList.append(cols[0:4])
                cols = (f.readline()).split(',')
            m = []
            Q = []
            x = []
            y = []
            dx = []
            dy = []
            i = 0 # room counter
            for line in f:
                cols = (line.strip()).split(',')
                if (int(cols[0]) != i):
                    raise ValueError(f"Incorrect file format: room number={cols[0]} mismatches place in room list={i}")
                m.append(cols[1])
                Q.append(cols[2])
                x.append(float(cols[3]))
                y.append(float(cols[4]))
                dx.append(float(cols[5]))
                dy.append(float(cols[6]))
                i = i+1
            RoomInfo = {}
            RoomInfo['m']  = m
            RoomInfo['Q']  = Q
            RoomInfo['x']  = np.array(x)
            RoomInfo['y']  = np.array(y)
            RoomInfo['dx'] = np.array(dx)
            RoomInfo['dy'] = np.array(dy)

        return SideList, RoomInfo

    ############ getter methods ############

    def get_SideList(self):
        """
        Returns:
            list: SideList
        """
        return self._SideList

    def get_RoomInfo(self):
         """
         Returns:
             list: RoomList
         """
         return self._RoomInfo

    ############ plotting methods ############

    def plotstate(self, u, plotdict, t=None):
        """
        Used for plotting the state.

        Args:
            u (NumPy ndarray): current solution
            plotdict (dictionary): contains info needed for plotstate
            t (float): current time

        Returns: Nothing
        """
        fig = plotdict['fig']
        ax = plotdict['ax']
        mapper = plotdict['mapper']

        if len(self._plotdata) == 0:
            plt.ion()
            x = self._RoomInfo['x']
            y = self._RoomInfo['y']
            dx = self._RoomInfo['dx']
            dy = self._RoomInfo['dy']
            for i in range(len(u)):
                col = mapper.to_rgba(u[i])
                rect = plt.Rectangle([x[i], y[i]], dx[i], dy[i], color=col)
                patch = ax.add_patch(rect)
                self._plotdata.append(patch)
        else:
            for i in range(len(u)):
                col = mapper.to_rgba(u[i])
                self._plotdata[i].set_color(col)

        if t is None:
            ax.set_title('equilibrium temperature')
        else:
            ax.set_title(f'temperature at t={t/60} min')

        fig.canvas.draw()
        fig.canvas.flush_events()

        plt.pause(0.5)

    ############ methods you need to implement ############

    def calcA(self):
        """
        Calculate the A matrix for the HVACIVP (this is only called at construction of
        the IVP object).

        Returns:
            NumPy ndarray: A
        """

        # Determine number of rooms from _RoomInfo
        Mrooms = len(self._RoomInfo['m'])

        # Determine number of states from IVP object
        M = len(self)

        # Check equality
        assert Mrooms == M, f"Number of rooms={Mrooms} does not equal number of states {M}"

        # Set-up A with zeros initially.
        A = np.zeros((M,M))

        # Some useful information
        cc = self.get_p('cc')
        mkey = self._RoomInfo['m']

        # Note: mkey[i] gives a key (in p) which has the air mass for room i
        # So, the air mass in room i = self.get_p(mkey[i])

        # Loop over each side and increment the A matrix
        for side in self._SideList:

            # Get the index of room0 for this side
            try:
                loc0 = int(side[0])
            except ValueError:
                raise ValueError(f"Could not convert first location into room index: {side[0]}")

            # Calculate increment to A[loc0, loc0]
            hkey = side[2]
            Akey = side[3]
            hA = self.get_p(hkey)*self.get_p(Akey)

            m0 = self.get_p(mkey[loc0])
            m0cc = m0*cc

            A[loc0, loc0] -= hA/m0cc

            # Check if loc1 is another room, or some specificed temperature
            # Then, if it is another room, increment:
            # A[loc0, loc1], A[loc1, loc1], A[loc1, loc0]
            #
            # Hint: suggest using a try/except/else block in which the
            # try attempts to convert side[1] to an int. If it is successful,
            # then loc1 is another room.

            try:
                loc1 = int(side[1])
            except ValueError:
                pass
            else:
                m1 = self.get_p(mkey[loc1])
                m1cc = m1*cc

                A[loc0, loc1] += hA/m0cc
                A[loc1, loc1] -= hA/m1cc
                A[loc1, loc0] += hA/m1cc

        return A

    def evalb(self, t=None):
        """
        Calculates the external forcing.

        If t=None then evalb should evaluate the external forcing for the
        equilibrium condition. For this HVACIVP, this is done in the functions
        provided to calculate and provide temperatures. So, this evalb method
        does not need to do anything special to set the equilibrium condition.

        Args:
            t (float): current time

        Returns:
            NumPy ndarray: b(t) or b_eq
        """

        # Determine number of states from IVP object
        M = len(self)

        # Set-up B with zeros initially.
        b = np.zeros(M)

        # Increment b due to influence of heat transfer through the sides.
        # This will be similar to the loop over sides in the calcA method.

        cc = self.get_p('cc')
        mkey = self._RoomInfo['m']

        for side in self._SideList:
            try:
                loc0 = int(side[0])
            except ValueError:
                raise ValueError(f"Could not convert first location into room index: {side[0]}")

            hkey = side[2]
            Akey = side[3]
            hA = self.get_p(hkey)*self.get_p(Akey)

            m0 = self.get_p(mkey[loc0])
            m0cc = m0*cc

            try:
                loc1 = int(side[1])
            except ValueError:
                u1 = self.get_p(side[1])(t)
                b[loc0] += hA/m0cc*u1

        # Increment b due to any heat sources in a room
        # This will require a loop over the rooms
        Qkey = self._RoomInfo['Q']

        # Note: Qkey[i] gives a key (in p) which has a function reference that
        # calculates the heat source in room i as a function of time t.
        # So, the heat source in room i = self.get_p(Qkey[i])(t)

        for i in range(M):
            m = self.get_p(mkey[i])
            mcc = m*cc
            Qfunc = self.get_p(Qkey[i])
            b[i] += Qfunc(t)/mcc

        return b
