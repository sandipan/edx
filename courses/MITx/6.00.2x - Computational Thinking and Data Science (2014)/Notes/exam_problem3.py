import random
import pylab

# Global Variables
MAXRABBITPOP = 1000
CURRENTRABBITPOP = 500
CURRENTFOXPOP = 30

MINRABBITPOP = 10
MINFOXPOP = 10

# Enter the code for the functions rabbitGrowth, foxGrowth, and runSimulation
# in this box.

def rabbitGrowth():
    """ 
    rabbitGrowth is called once at the beginning of each time step.

    It makes use of the global variables: CURRENTRABBITPOP and MAXRABBITPOP.

    The global variable CURRENTRABBITPOP is modified by this procedure.

    For each rabbit, based on the probabilities in the problem set write-up, 
      a new rabbit may be born.
    Nothing is returned.
    """
    # you need this line for modifying global variables
    global CURRENTRABBITPOP

    # TO DO
    newborn = 0
    for rabbit in range(CURRENTRABBITPOP):
        p_repro = 1.0 -(1.0 * CURRENTRABBITPOP) / MAXRABBITPOP
        if random.random() < p_repro:
            newborn += 1
    CURRENTRABBITPOP += newborn
    if CURRENTRABBITPOP > MAXRABBITPOP:
        CURRENTRABBITPOP = MAXRABBITPOP
        
def foxGrowth():
    """ 
    foxGrowth is called once at the end of each time step.

    It makes use of the global variables: CURRENTFOXPOP and CURRENTRABBITPOP,
        and both may be modified by this procedure.

    Each fox, based on the probabilities in the problem statement, may eat 
      one rabbit (but only if there are more than 10 rabbits).

    If it eats a rabbit, then with a 1/3 prob it gives birth to a new fox.

    If it does not eat a rabbit, then with a 1/10 prob it dies.

    Nothing is returned.
    """
    # you need these lines for modifying global variables
    global CURRENTRABBITPOP
    global CURRENTFOXPOP

    # TO DO
    curfox = CURRENTFOXPOP
    for fox in range(curfox):
        p_eat = (1.0 * CURRENTRABBITPOP) / MAXRABBITPOP
        if random.random() < p_eat and CURRENTRABBITPOP > MINRABBITPOP:
            CURRENTRABBITPOP -= 1
            if random.random() < 1.0 / 3:
                CURRENTFOXPOP += 1
        else:
            #if random.random() < 1.0 / 10 and CURRENTFOXPOP > MINFOXPOP: # 10%
            if random.random() > 1.0 / 10 and CURRENTFOXPOP > MINFOXPOP:  # 90%
                CURRENTFOXPOP -= 1
           
def runSimulation(numSteps):
    """
    Runs the simulation for `numSteps` time steps.

    Returns a tuple of two lists: (rabbit_populations, fox_populations)
      where rabbit_populations is a record of the rabbit population at the 
      END of each time step, and fox_populations is a record of the fox population
      at the END of each time step.

    Both lists should be `numSteps` items long.
    """

    # TO DO
    rabbit, fox = [], [] 
    for step in range(numSteps):
        rabbitGrowth()
        foxGrowth()
        rabbit += [CURRENTRABBITPOP]
        fox += [CURRENTFOXPOP] 
        #print (CURRENTRABBITPOP, CURRENTFOXPOP)
    pylab.plot(rabbit, 'r.')
    pylab.plot(fox, 'g.')
    pylab.show()
    return (rabbit, fox)

def test():
    
    global MAXRABBITPOP, CURRENTRABBITPOP, CURRENTFOXPOP

    MAXRABBITPOP = 1000
    CURRENTRABBITPOP = 500
    CURRENTFOXPOP = 30
    
    MAXRABBITPOP = 1000 
    CURRENTRABBITPOP = 500
    rabbitGrowth()
    print CURRENTRABBITPOP
    rabbitGrowth()
    print CURRENTRABBITPOP
    
    MAXRABBITPOP = 1000
    CURRENTRABBITPOP = 1000 
    rabbitGrowth()
    print CURRENTRABBITPOP
    rabbitGrowth()
    print CURRENTRABBITPOP
    
    CURRENTRABBITPOP = 1000
    MAXRABBITPOP = 1000
    CURRENTFOXPOP = 50 
    foxGrowth()
    print CURRENTFOXPOP
    foxGrowth()
    print CURRENTFOXPOP
    
    CURRENTRABBITPOP = 1
    MAXRABBITPOP = 1000
    CURRENTFOXPOP = 1
    for i in range(20):
        foxGrowth()
        print CURRENTFOXPOP
    
    results = runSimulation(20)
    len(results[0])
    
    CURRENTRABBITPOP = 10
    CURRENTFOXPOP = 20
    MAXRABBITPOP = 100
    results = runSimulation(100)
    
    CURRENTRABBITPOP = 10
    CURRENTFOXPOP = 20
    MAXRABBITPOP = 100
    results = runSimulation(100)

MAXRABBITPOP = 1000
CURRENTRABBITPOP = 500
CURRENTFOXPOP = 30
numSteps = 200

results = runSimulation(numSteps)

rabbitPopulationOverTime = results[0]
coeff = pylab.polyfit(range(len(rabbitPopulationOverTime)), rabbitPopulationOverTime, 2)
pylab.plot(pylab.polyval(coeff, range(len(rabbitPopulationOverTime))))

foxPopulationOverTime = results[1]
coeff = pylab.polyfit(range(len(foxPopulationOverTime)), foxPopulationOverTime, 2)
pylab.plot(pylab.polyval(coeff, range(len(foxPopulationOverTime))))

MAXRABBITPOP = 1000
CURRENTRABBITPOP = 50
CURRENTFOXPOP = 300
numSteps = 200

results = runSimulation(numSteps)

rabbitPopulationOverTime = results[0]
coeff = pylab.polyfit(range(len(rabbitPopulationOverTime)), rabbitPopulationOverTime, 2)
pylab.plot(pylab.polyval(coeff, range(len(rabbitPopulationOverTime))))

foxPopulationOverTime = results[1]
coeff = pylab.polyfit(range(len(foxPopulationOverTime)), foxPopulationOverTime, 2)
pylab.plot(pylab.polyval(coeff, range(len(foxPopulationOverTime))))