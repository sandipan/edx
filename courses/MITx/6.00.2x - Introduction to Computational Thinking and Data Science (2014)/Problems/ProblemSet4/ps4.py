# 6.00.2x Problem Set 4

import numpy
import random
import pylab
from ps3b import *
#import ps3b

def simulationWithDrugHist(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials, initialSteps=150, totalSteps=300):
    """
    Runs simulations and plots graphs for problem 5.

    For each of numTrials trials, instantiates a patient, runs a simulation for
    150 timesteps, adds guttagonol, and runs the simulation for an additional
    150 timesteps.  At the end plots the average virus population size
    (for both the total virus population and the guttagonol-resistant virus
    population) as a function of time.

    numViruses: number of ResistantVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: maximum clearance probability (a float between 0-1)
    resistances: a dictionary of drugs that each ResistantVirus is resistant to
                 (e.g., {'guttagonol': False})
    mutProb: mutation probability for each ResistantVirus particle
             (a float between 0-1). 
    numTrials: number of simulation runs to execute (an integer)
    
    """
    # TODO
    popSize = [0]*numTrials
    for trial in range(numTrials):
        #print trial
        viruses = [ResistantVirus(maxBirthProb, clearProb, resistances, mutProb) for i in range(numViruses)]
        patient = TreatedPatient(viruses, maxPop)
        for timeStep in range(initialSteps):        
            patient.update()
        patient.addPrescription('guttagonol')
        for timeStep in range(initialSteps, totalSteps):        
            patient.update()
        popSize[trial] = patient.getResistPop(['guttagonol'])
    
    print sum([1.0 for p in popSize if p <= 50]) / len(popSize)
    pylab.hist(popSize)
    pylab.xlabel('Final Population Size')
    pylab.ylabel('# trials')
    pylab.title('ResistantVirus simulation')
    pylab.legend('pop avg', 'blue')
    pylab.show()
#
# PROBLEM 1
#        
def simulationDelayedTreatment(nTrials, iSteps, tSteps, \
                               p1=100, p2=1000, p3=0.1, p4=0.05, p5=0.005):
    """
    Runs simulations and make histograms for problem 1.

    Runs numTrials simulations to show the relationship between delayed
    treatment and patient outcome using a histogram.

    Histograms of final total virus populations are displayed for delays of 300,
    150, 75, 0 timesteps (followed by an additional 150 timesteps of
    simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    
    # TODO
    simulationWithDrugHist(numViruses=p1, maxPop=p2, maxBirthProb=p3, clearProb=p4, \
                       resistances={'guttagonol': False}, mutProb=p5, \
                       numTrials=nTrials, initialSteps=iSteps, totalSteps=tSteps)
    
simulationDelayedTreatment(nTrials=100, iSteps=300, tSteps=300+150)
simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150)
simulationDelayedTreatment(nTrials=100, iSteps=75, tSteps=75+150)
simulationDelayedTreatment(nTrials=100, iSteps=0, tSteps=150)

simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p1=100)
simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p1=500)

simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p2=1000)
simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p2=2000)

simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p3=0.05)
simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p3=0.1)

simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p4=0.05)
simulationDelayedTreatment(nTrials=100, iSteps=150, tSteps=150+150, p4=0.1)

def simulationWith2DrugsHist(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials, initialSteps=150, betweenSteps=150, finalSteps=150):
    """
    Runs simulations and plots graphs for problem 5.

    For each of numTrials trials, instantiates a patient, runs a simulation for
    150 timesteps, adds guttagonol, and runs the simulation for an additional
    150 timesteps.  At the end plots the average virus population size
    (for both the total virus population and the guttagonol-resistant virus
    population) as a function of time.

    numViruses: number of ResistantVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: maximum clearance probability (a float between 0-1)
    resistances: a dictionary of drugs that each ResistantVirus is resistant to
                 (e.g., {'guttagonol': False})
    mutProb: mutation probability for each ResistantVirus particle
             (a float between 0-1). 
    numTrials: number of simulation runs to execute (an integer)
    
    """
    # TODO
    popSize = [0]*numTrials
    for trial in range(numTrials):
        #print trial
        viruses = [ResistantVirus(maxBirthProb, clearProb, resistances, mutProb) for i in range(numViruses)]
        patient = TreatedPatient(viruses, maxPop)
        for timeStep in range(initialSteps):        
            patient.update()
        patient.addPrescription('guttagonol')
        for timeStep in range(initialSteps, initialSteps + betweenSteps):        
            patient.update()
        patient.addPrescription('grimpex')
        for timeStep in range(initialSteps + betweenSteps, initialSteps + betweenSteps + finalSteps):        
            patient.update()
        popSize[trial] = patient.getResistPop(['guttagonol', 'grimpex'])
    
    print sum([1.0 for p in popSize if p <= 50]) / len(popSize)
    pylab.hist(popSize)
    pylab.xlabel('Final Population Size')
    pylab.ylabel('# trials')
    pylab.title('ResistantVirus simulation')
    pylab.legend('pop avg', 'blue')
    pylab.show()
#
# PROBLEM 2
#
def simulationTwoDrugsDelayedTreatment(nTrials, iSteps=150, bSteps=150, fSteps=150, \
                               p1=100, p2=1000, p3=0.1, p4=0.05, p5=0.005):
    """
    Runs simulations and make histograms for problem 2.

    Runs numTrials simulations to show the relationship between administration
    of multiple drugs and patient outcome.

    Histograms of final total virus populations are displayed for lag times of
    300, 150, 75, 0 timesteps between adding drugs (followed by an additional
    150 timesteps of simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    # TODO
    simulationWith2DrugsHist(numViruses=p1, maxPop=p2, maxBirthProb=p3, clearProb=p4, \
                       resistances={'guttagonol': False, 'grimpex': False}, mutProb=p5, \
                       numTrials=nTrials, initialSteps=iSteps, betweenSteps=bSteps, finalSteps=fSteps)
                       
simulationTwoDrugsDelayedTreatment(nTrials=100, bSteps=300)
simulationTwoDrugsDelayedTreatment(nTrials=100, bSteps=150)
simulationTwoDrugsDelayedTreatment(nTrials=100, bSteps=75)
simulationTwoDrugsDelayedTreatment(nTrials=100, bSteps=0)

simulationTwoDrugsDelayedTreatment(nTrials=100, p5=0.005)
simulationTwoDrugsDelayedTreatment(nTrials=100, p5=0.01)
