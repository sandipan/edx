# -*- coding: utf-8 -*-
"""
Created on Tue Nov 25 00:08:00 2014

@author: SANDIPAN DEY
"""

import random, pylab

randomList1 = []
for i in range(1000):
    randomList1.append(int(random.random() * 2))
pylab.hist(randomList1)
pylab.show()

randomList2 = []
for i in range(1000):
    randomList2.append(random.choice((0,1)))
pylab.hist(randomList2)
pylab.show()

xVals = []
yVals = []
wVals = []
for i in range(1000):
    xVals.append(random.random())
    yVals.append(random.random())
    wVals.append(random.random())
xVals = pylab.array(xVals)
yVals = pylab.array(yVals)
wVals = pylab.array(wVals)
xVals = xVals + xVals
zVals = xVals + yVals
tVals = xVals + yVals + wVals

pylab.hist(xVals)
pylab.hist(tVals)

pylab.plot(xVals, yVals)
pylab.plot(xVals, zVals)
pylab.plot(sorted(xVals), yVals)
pylab.plot(xVals, sorted(yVals))
pylab.plot(sorted(xVals), sorted(yVals))

class Location(object):
    def __init__(self, x, y):
        """x and y are floats"""
        self.x = x
        self.y = y
        
    def move(self, deltaX, deltaY):
        """deltaX and deltaY are floats"""
        return Location(self.x + deltaX, self.y + deltaY)
    
    def getX(self):
        return self.x
    
    def getY(self):
        return self.y
    
    def distFrom(self, other):
        ox = other.x
        oy = other.y
        xDist = self.x - ox
        yDist = self.y - oy
        return (xDist**2 + yDist**2)**0.5
    
    def __str__(self):
        return '<' + str(self.x) + ', ' + str(self.y) + '>'

class Field(object):
    def __init__(self):
        self.drunks = {}
        
    def addDrunk(self, drunk, loc):
        if drunk in self.drunks:
            raise ValueError('Duplicate drunk')
        else:
            self.drunks[drunk] = loc
            
    def moveDrunk(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')
        xDist, yDist = drunk.takeStep()
        currentLocation = self.drunks[drunk]
        #use move method of Location to get new location
        self.drunks[drunk] = currentLocation.move(xDist, yDist)
        
    def getLoc(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')
        return self.drunks[drunk]


import random, math

class Drunk(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'This drunk is named ' + self.name


def walkVector(f, d, numSteps):
    start = f.getLoc(d)
    for s in range(numSteps):
        f.moveDrunk(d)
    return(f.getLoc(d).getX() - start.getX(),
           f.getLoc(d).getY() - start.getY())
           
class UsualDrunk(Drunk):
    def takeStep(self):
        stepChoices =\
            [(0.0,1.0), (0.0,-1.0), (1.0, 0.0), (-1.0, 0.0)]
        return random.choice(stepChoices)

class ColdDrunk(Drunk):
    def takeStep(self):
        stepChoices =\
            [(0.0,0.9), (0.0,-1.03), (1.03, 0.0), (-1.03, 0.0)]
        return random.choice(stepChoices)

class EDrunk(Drunk):
    def takeStep(self):
        ang = 2 * math.pi * random.random()
        length = 0.5 + 0.5 * random.random()
        return (length * math.sin(ang), length * math.cos(ang))

class PhotoDrunk(Drunk):
    def takeStep(self):
        stepChoices =\
                    [(0.0, 0.5),(0.0, -0.5),
                     (1.5, 0.0),(-1.5, 0.0)]
        return random.choice(stepChoices)

class DDrunk(Drunk):
    def takeStep(self):
        stepChoices =\
                    [(0.85, 0.85), (-0.85, -0.85),
                     (-0.56, 0.56), (0.56, -0.56)] 
        return random.choice(stepChoices)
        
def simulationDrunk(numTrials, drunk):
    # TODO
    xs, ys = [], []
    for trial in range(numTrials):
        field = Field()
        location = Location(0, 0)
        field.addDrunk(drunk, location)
        x, y = walkVector(field, drunk, 1000)
        xs += [x]
        ys += [y]
    pylab.plot(xs, ys, 'r.')
    pylab.xlim(-100, 100)
    pylab.ylim(-100, 100)
    pylab.show()

simulationDrunk(1000, UsualDrunk("drunk"))
simulationDrunk(1000, ColdDrunk("drunk"))
simulationDrunk(1000, EDrunk("drunk"))
simulationDrunk(1000, PhotoDrunk("drunk"))
simulationDrunk(1000, DDrunk("drunk"))


def sampleQuizzes():
    # Your code here
    numTrials = 10000
    numStudents = 0    
    for trial in range(numTrials):
        midterm1 = random.randint(50, 80)
        midterm2 = random.randint(60, 90)
        finalexam = random.randint(55, 95)
        score = 0.25 * midterm1 + 0.25 * midterm2 + 0.5 * finalexam
        if score >= 70 and score <= 75:
            numStudents += 1
    return (1.0 * numStudents) / numTrials

sampleQuizzes()

def generateScores(numTrials):
    """
    Runs numTrials trials of score-generation for each of
    three exams (Midterm 1, Midterm 2, and Final Exam).
    Generates uniformly distributed scores for each of 
    the three exams, then calculates the final score and
    appends it to a list of scores.
    
    Returns: A list of numTrials scores.
    """
    scores = []    
    for trial in range(numTrials):
        midterm1 = random.randint(50, 80)
        midterm2 = random.randint(60, 90)
        finalexam = random.randint(55, 95)
        score = 0.25 * midterm1 + 0.25 * midterm2 + 0.5 * finalexam
        scores.append(score)
    return scores
    
def plotQuizzes():
    # Your code here
    pylab.hist(generateScores(10000), bins=7)
    pylab.xlabel('Final Score')
    pylab.ylabel('Number of Trials')
    pylab.title('Distribution of Scores')
    pylab.show()
    
plotQuizzes()

def probTest(limit):
    rolls, prob = 1, 1.0 / 6
    while prob >= limit:
        prob *= 5.0 / 6
        rolls += 1
    return rolls           
        
probTest(25.0/216)

def LV():
    tries = 1
    while True:
        if random.random() < 0.5:
            break
        tries += 1
    return tries

#histogram = [ 0 for i in range(1,1000)]  # intialize the list to be all zeros
results = []
for i in range(1000):
    result = LV()
    results.append(result)
    #histogram[ result ] += 1
#pylab.plot(histogram)
pylab.hist(results)

def MC(k):
    found, tries = False, 1
    while tries <= k:
        if random.random() < 0.5:
            found = True
            break
        tries += 1
    return tries if found else 0
    
#histogram = [ 0 for i in range(1,1000)]  # intialize the list to be all zeros
results = []
k = 100
for i in range(1000):
    result = MC(k)
    results.append(result)
    #histogram[ result ] += 1
#pylab.plot(histogram)
pylab.hist(results)
