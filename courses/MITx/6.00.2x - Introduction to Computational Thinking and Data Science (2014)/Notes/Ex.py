def isAlphabeticalWord(word, wordList = None):
    if (len(word) > 0):
        curr = word[0]
    for letter in word:
        if (curr > letter):
            return False
        else:
            curr = letter
    if wordList is None:
        return True
    return word in wordList
    
isAlphabeticalWord('abcd')
isAlphabeticalWord('zoo')

def lotsOfParameters1(a,b,c,d,e):
    print a
    print b
    print c
    print d
    print e
    
lotsOfParameters1() 
lotsOfParameters1(1, 2) 
lotsOfParameters1(1,e=5,d=4,c=3,b=2) 
lotsOfParameters1(e=5,a=1,d=4,b=2,c=3) 
lotsOfParameters1(a=5,b=1,c=4,d=2,3)

def lotsOfParameters2(a=1,b=2,c=3,d=4,e=5):
    print a
    print b
    print c
    print d
    print e
    
lotsOfParameters2() 
lotsOfParameters2(1, 2) 
lotsOfParameters2(1, c=2) 
lotsOfParameters2(1, c=2, 3) 
lotsOfParameters2(1, e=20, b=3) 
lotsOfParameters2(1, e=20, b=3, a=10)

import string

inFile = open('julyTemps.txt', 'r', 0)
line = inFile.readline()
fields = string.split(line)
print fields
print '-' == fields[0] or 'Boston' == fields[0] or 'Day' == fields[0] or ' ' == fields[0]
print len(fields) < 3 or not fields[0].isdigit()

import matplotlib.pylab as pylab
pylab.plot(range(1,32), range(21,52))
pylab.title('Day by Day Ranges in Temperature in Boston in July 2012')
pylab.xlabel('Days')
pylab.ylabel('Temperature Ranges')
	
def noReplacementSimulation(numTrials):
    '''
    Runs numTrials trials of a Monte Carlo simulation
    of drawing 3 balls out of a bucket containing
    3 red and 3 green balls. Balls are not replaced once
    drawn. Returns the a decimal - the fraction of times 3 
    balls of the same color were drawn.
    '''
    # Your code here
    def drawBall(n):
        """returns a random int between 0 and n-1"""
        return random.choice(range(n))
    
    yes = 0.0
    for i in range(numTrials):
        bucket = ['R']*3 + ['G']*3
        balls = []
        for j in range(3):
            index = drawBall(len(bucket))
            balls, bucket = balls + [bucket[index]], bucket[:index] + bucket[index+1:]
        if balls[0] == balls[1] and balls[1] == balls[2]:
            yes += 1
        #print balls
    return yes/numTrials
    
print 'Probability of same color =',\
noReplacementSimulation(1000)

0.6247 * 0.2538

0.15 * 9.81 / 0.1015 # mg/x

# generate all combinations of N items
def powerSet(items):
    N = len(items)
    # enumerate the 2**N possible combinations
    for i in xrange(2**N):
        combo = []
        for j in xrange(N):
            # test bit jth of integer i
            if (i >> j) % 2 == 1:
                combo.append(items[j])
        yield combo
        
[i for i in powerSet([1,2,3])]

def yieldAllCombos(items):
    """
        Generates all combinations of N items into two bags, whereby each 
        item is in one or zero bags.

        Yields a tuple, (bag1, bag2), where each bag is represented as a list 
        of which item(s) are in each bag.
    """
    # Your code here

    N = len(items)
    # enumerate the 2**N possible combinations
    for i in xrange(2**N):
        bag1 = []
        for j in xrange(N):
            # test bit jth of integer i
            if (i >> j) % 2 == 1:
                bag1.append(items[j])
            #else: bag2.append(items[j])
        rem = list(set(items) - set(bag1))
        n = len(rem)
        for k in xrange(2**n):
            bag2 = []
            for j in xrange(n):
                # test bit jth of integer k
                if (k >> j) % 2 == 1:
                    bag2.append(rem[j])
            yield (bag1, bag2)
        
[i for i in yieldAllCombos([1,2,3])]

# generate all combinations of N items
def yieldAllCombos(items):
    N = len(items)
    # enumerate the 3**N possible combinations
    def base10toN(num,n):
        return ((num == 0) and  "0" ) or ( base10toN(num // n, n).lstrip("0") + "0123456789abcdefghijklmnopqrstuvwxyz"[:n][num % n])
    for i in xrange(3**N):
        bag1, bag2 = [], []
        i3 = base10toN(i, 3).zfill(N)
        for j in range(len(i3)):
            # test bit jth of integer i
            d = int(i3[j])
            if int(d) % 3 == 1:
                bag1.append(items[j])
            elif d % 3 == 2:
                bag2.append(items[j])
        yield (bag1, bag2)
        
#print base10toN(9,3)
[i for i in yieldAllCombos([1,2,3])]

from graph import *

nodes = []
nodes.append(Node("ABC")) # nodes[0]
nodes.append(Node("ACB")) # nodes[1]
nodes.append(Node("BAC")) # nodes[2]
nodes.append(Node("BCA")) # nodes[3]
nodes.append(Node("CAB")) # nodes[4]
nodes.append(Node("CBA")) # nodes[5]

g = Graph()
for n in nodes:
    g.addNode(n)

adj_mat = {0:[1,2], 1:[4], 2:[3], 3:[5], 4:[5], 5:[]}
    
for nid in adj_mat:     
    for nbrid in adj_mat[nid]: 
        g.addEdge(Edge(nodes[nid], nodes[nbrid]))

edges = g.childrenOf(nodes[1])
print edges

x = [-6, -6, -4, -4, 2, 2, 2]
C1 = [2, 2, -6, -6]
C2 = [-4, -4, 2]
C1_mean = (sum(C1) * 1.0) / len(C1)
C1_var = sum([(x - C1_mean)**2 for x in C1])
C2_mean = (sum(C2) * 1.0) / len(C2)
C2_var = sum([(x - C2_mean)**2 for x in C2])
C1_C2_badness = C1_var + C2_var
C1 = [2, 2, 2]
C2 = [-6, -6, -4, -4]
C1_mean = (sum(C1) * 1.0) / len(C1)
C1_var = sum([(x - C1_mean)**2 for x in C1])
C2_mean = (sum(C2) * 1.0) / len(C2)
C2_var = sum([(x - C2_mean)**2 for x in C2])
C1_C2_badness = C1_var + C2_var
