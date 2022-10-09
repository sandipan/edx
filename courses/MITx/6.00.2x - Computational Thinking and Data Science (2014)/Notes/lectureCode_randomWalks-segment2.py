

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

class FieldWithFence(Field):
    
    def __init__(self):
        Field.__init__(self)
        self.leftEdge = self.bottomEdge = -50
        self.rightEdge = self.topEdge = 50
       
class FieldWithSW(FieldWithFence):
    
    def __init__(self):
        FieldWithFence.__init__(self)
        
    def moveDrunk(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')
        dx, dy = drunk.takeStep()
        currentLocation = self.drunks[drunk]
        x, y = currentLocation.getX(), currentLocation.getY()
        xn, yn = x, y
        if  x+dx > self.leftEdge and x+dx < self.rightEdge:
            xn += dx
        if  y+dy > self.bottomEdge and y+dy < self.topEdge:
            yn += dy
        #use move method of Location to get new location
        self.drunks[drunk] = currentLocation.move(xn - x, yn - y)

class FieldWithSP(FieldWithFence):
    
    def __init__(self):
        FieldWithFence.__init__(self)
        
    def moveDrunk(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')
        dx, dy = drunk.takeStep()
        currentLocation = self.drunks[drunk]
        x, y = currentLocation.getX(), currentLocation.getY()
        xn, yn = x, y
        if x+dx > self.leftEdge and x+dx < self.rightEdge:
            xn += dx
        elif x+dx > self.rightEdge:
            xn = self.leftEdge + (x+dx - self.rightEdge)
        elif x+dx < self.leftEdge:
            xn = self.rightEdge - (self.leftEdge - (x+dx))
        if  y+dy > self.bottomEdge and y+dy < self.topEdge:
            yn += dy
        elif y+dy > self.topEdge:
            yn = self.bottomEdge + (y+dy - self.topEdge)
        elif y+dy < self.bottomEdge:
            yn = self.topEdge - (self.bottomEdge - (y+dy))
        #use move method of Location to get new location
        self.drunks[drunk] = currentLocation.move(xn - x, yn - y)

class FieldWithBH(FieldWithFence):
    
    def __init__(self):
        FieldWithFence.__init__(self)
        
    def moveDrunk(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')
        dx, dy = drunk.takeStep()
        currentLocation = self.drunks[drunk]
        x, y = currentLocation.getX(), currentLocation.getY()
        xn, yn = x, y
        if x+dx < self.rightEdge and x+dx > self.leftEdge and y+dy < self.topEdge and y+dy > self.bottomEdge:
            xn += dx
            yn += dy
        else:
            xn = self.leftEdge + (self.rightEdge-self.leftEdge)/2
            yn = self.bottomEdge + (self.topEdge-self.bottomEdge)/2
        #use move method of Location to get new location
        self.drunks[drunk] = currentLocation.move(xn - x, yn - y)
        
import random, pylab

class Drunk(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'This drunk is named ' + self.name
    
class UsualDrunk(Drunk):
    def takeStep(self):
        stepChoices = [(-1.0,-1.0),(-1.0,0.0), \
                       (-1.0,1.0),(0.0,1.0),(0.0,-1.0), \
                       (1.0,-1.0), (1.0,0.0),(1.0,1.0)]
        return random.choice(stepChoices)

def walkVector(f, d, numSteps):
    start = f.getLoc(d)
    xs, ys = [start.getX()], [start.getY()]    
    for s in range(numSteps):
        f.moveDrunk(d)
        xs += [f.getLoc(d).getX()]
        ys += [f.getLoc(d).getY()]
    return(xs, ys)
           
def simulationDrunk(drunk, numSteps, field):
    # TODO
    location = Location(0, 0)
    field.addDrunk(drunk, location)
    xs, ys = walkVector(field, drunk, numSteps)
    pylab.plot(xs, ys, 'r.')
    pylab.xlim(-60, 60)
    pylab.ylim(-60, 60)
    pylab.show()

N = 120
simulationDrunk(UsualDrunk("drunk"), N*N, FieldWithSW())
#simulationDrunk(UsualDrunk("drunk"), N*N, FieldWithSP())
#simulationDrunk(UsualDrunk("drunk"), N*N, FieldWithBH())
