happy = 22
if happy > 2:
    print 'hello world'

varA, varB = 11, 11

if  type(varA) == str or type(varB) == str:
    print "string involved"
elif varA > varB:
    print "bigger"
elif varA == varB:
    print "equal"
elif varA < varB:
    print "smaller"

temp = '32'
if temp > 85:
   print "Hot"
elif temp > 62:
   print "Comfortable" 
else:
   print "Cold" 

print 'world'*3
print 'world'[1:3], 'world'[:3], 'world'[-1], 'world'[:-1], 'world'[1:]
print 'helloworld'[1:9], 'helloworld'[1:9:2], 'helloworld'[::-1], 'hellow'[1:]

def a(x):
   return x + 1
print type(a(2))

def f(x, y):
   x + y - 2   
print type(f(2,3))
print f

def a(x, y, z):
     if x:
         return y
     else:
         return z

def b(q, r):
    return a(q>r, q, r)
    
print a > b, b(a, b)

def clip(lo, x, hi):
    '''
    Takes in three numbers and returns a value based on the value of x.
    Returns:
     - lo, when x < lo
     - hi, when x > hi
     - x, otherwise
    '''
    # Your code here
    return min(max(x, lo), hi)
    
def isVowel2(char):
    '''
    char: a single letter of any case

    returns: True if char is a vowel and False otherwise.
    '''
    # Your code here
    return char.lower() in ['a', 'e', 'i', 'o', 'u']

str1 = 'exterminate!' 
str2 = 'number one - the larch'    
str2 = str2.capitalize()
print str2
print str1.index('e')
print str2.index('n')
print str2.find('n')
print str2.find('!')
print str1.count('e')
str1 = str1.replace('e', '*')
print str1
print str2.replace('one', 'seven')

count = 0
for letter in 'Snow!':
    print 'Letter # ' + str(count) + ' is ' + str(letter)
    count += 1
    break
print count 

print "Hello!"
for i in range(10, 0, -2):
    print i
    
iteration = 0
while iteration < 5:
    count = 0
    for letter in "hello, world":
        count += 1
        if iteration % 2 == 0:
            break
    print "Iteration " + str(iteration) + "; count is: " + str(count)
    iteration += 1 

l, h, valid_inputs = 0, 100, ['l', 'h', 'c']
m = (l + h) / 2
print "Please think of a number between " + str(l) + " and " + str(h) + "!"
while True:
    print "Is your secret number " + str(m) + "?"
    print "Enter 'h' to indicate the guess is too high.",
    print "Enter 'l' to indicate the guess is too low.",
    print "Enter 'c' to indicate I guessed correctly.",
    inp = raw_input()
    if inp == 'c':
        print "Game over. Your secret number was:", m
        break
    elif inp == 'l':
        l = m
    elif inp == 'h':
        h = m
    elif not inp in valid_inputs:
       print "Sorry, I did not understand your input."
    m = (l + h) / 2
# Assume s is a string of lower case characters.
# Write a program that counts up the number of vowels contained in the string s. 
# Valid vowels are: 'a', 'e', 'i', 'o', and 'u'. 
s = 'azcbobobegghakl'
print 'Number of vowels:', len([c for c in s if c in ['a', 'e', 'i', 'o', 'u']])

s = 'azcbobobegghakl'
print 'Number of times bob occurs is:', \
len([1 for i in range(len(s)-2) if s[i:i+3] == 'bob'])

s = 'azcbobobegghakl'
n, substr = len(s), ''
i = 0
while i < n:
    k = 1
    while i + k < n and s[i + k - 1] <= s[i + k]:
        k += 1
    if len(substr) < len(s[i : i + k]):
        substr = s[i : i + k]
    i += k
print 'Longest substring in alphabetical order is:', substr

balance = 100 # the outstanding balance on the credit card
annualInterestRate = 2
monthlyPaymentRate = 2

balance = 4213; annualInterestRate = 0.2; monthlyPaymentRate = 0.04

totalPaid = 0
for month in range(1, 13):
    print "Month:", month
    minPayment = balance * monthlyPaymentRate
    print "Minimum monthly payment:", round(minPayment, 2)
    balance -= minPayment
    totalPaid += minPayment
    balance += (annualInterestRate / 12.0) * balance
    print "Remaining balance:", round(balance, 2)
print "Total paid:", round(totalPaid, 2)
print "Remaining balance: ", round(balance, 2)

balance = 3329; annualInterestRate = 0.2
# ub_k = b_0.R^(k-1) - f(R^(k-1) + R^(k-2) + .. + R + 1), R = 1 + r/12.0
# ub_12 = 0
# The monthly payment must be a multiple of $10
R = 1 + annualInterestRate / 12.0
R_11 = R ** 11
R_12 = R_11 * R
f = balance * (R_12 - R_11) / (R_12 - 1)
fint = (int(f) / 10) * 10
if fint < f:
    fint += 10
print "Lowest Payment:", fint

R = 1 + annualInterestRate / 12.0
R_11 = R ** 11
R_12 = R_11 * R
f = balance * (R_12 - R_11) / (R_12 - 1)
print "Lowest Payment:", round(f, 2)

#print balance * R_11 - f * (R_12 - 1) / (R - 1)

def lenRecur(aStr):
    return 0 if aStr == '' else 1 + lenRecur(aStr[1:])
    
def isIn(char, aStr):
    '''
    char: a single character
    aStr: an alphabetized string
    
    returns: True if char is in aStr; False otherwise
    '''
    # Your code here
    if aStr == '':
        return False
    else:
        midChar = aStr[len(aStr) / 2]
        if midChar == char:
            return True
        elif midChar < char:
            return isIn(char, aStr[len(aStr) / 2 + 1:])
        elif midChar > char:
            return isIn(char, aStr[:len(aStr) / 2])    

def semordnilap(str1, str2):
    '''
    str1: a string
    str2: a string
    
    returns: True if str1 and str2 are semordnilap;
             False otherwise.
    '''
    # Your code here
    #print str1, str2
    if len(str1) != len(str2):
        return False
    elif str1 == '' and str2 == '':
        return True
    else:
        return str1[0] == str2[-1] and semordnilap(str1[1:], str2[:-1])

def semordnilapWrapper(str1, str2):
    # A single-length string cannot be semordnilap
    if len(str1) == 1 or len(str2) == 1:
        return False

    # Equal strings cannot be semordnilap
    if str1 == str2:
        return False

    return semordnilap(str1, str2)
    
print semordnilapWrapper('live', 'evil')
print semordnilapWrapper('tact', 'cat')

# global
def fibMetered(x):
    global numCalls
    numCalls += 1
    if x == 0 or x == 1:
        return 1
    else:
        return fibMetered(x-1) + fibMetered(x-2)

def testFib(n):
    global numCalls
    numCalls = 0
    for i in range(n+1):
        #numCalls = 0
        print('fib of ' + str(i) + ' = ' + str(fibMetered(i)))
        print ('fib called ' + str(numCalls) + ' times')

testFib(5)
#testFib(10)

def oddTuples(aTup):
    '''
    aTup: a tuple
    
    returns: tuple, every other element of aTup. 
    '''
    # Your Code Here
    return tuple([aTup[i] for i in range(len(aTup)) if i % 2 == 0])

print oddTuples(('I', 'am', 'a', 'test', 'tuple'))

x = [1, 2, [3, 'John', 4], 'Hi'] 
print x[0:1]    
x[0] = 8
x

x = (1, 2, (3, 'John', 4), 'Hi') 
print x[0:1]    
x[0] = 8   
 
print range(3, 10, 3)
print range(3, 10.5, 0.5)
print range(10, 3)
print range(10, 3, -1)

aList = range(1, 6)
bList = aList
aList[2] = 'hello'
aList == bList
print aList, bList
aList is bList

cList = range(6, 1, -1)
dList = []
for num in cList:
    dList.append(num)
print cList == dList
cList is dList
cList[2] = 20
cList
dList

listA = [1, 4, 3, 0]
listB = ['x', 'z', 't', 'q']
print listA.sort
print listA.sort()
print listA
print listA.insert(0, 100)
print listA.remove(3)
print listA.append(7)
print listA
print listA + listB
print listB.sort()
print listB.pop()
listB.count('a')
listB.remove('a')
print listA.extend([4, 1, 6, 3, 4])
listA.count(4)
listA
print listA.index(1)
print listA.pop(4)
listA
listA.reverse()
listA

def applyToEach(L, f):
    for i in range(len(L)):
        L[i] = f(L[i])
        
def timesFive(a):
    return a * 5

testList = [1, -4, 8, -9]
#applyToEach(testList, timesFive)

def abs(a):
    return a if a >= 0 else -a 

#applyToEach(testList, abs)

def plusOne(a):
    return a + 1 

#applyToEach(testList, plusOne)

def square(a):
    return a * a 

applyToEach(testList, square)

print testList

def applyEachTo(L, x):
    result = []
    for i in range(len(L)):
        result.append(L[i](x))
    return result
    
def square(a):
    return a*a

def halve(a):
    return a/2

def inc(a):
    return a+1

print applyEachTo([inc, square, halve, abs], -3)
print applyEachTo([inc, square, halve, abs], 3.0)
print applyEachTo([inc, max, int], -3)

animals = {'a': 'aardvark', 'b': 'baboon', 'c': 'coati'}
animals['d'] = 'donkey'
animals
animals['c']
animals['donkey']
len(animals)
animals['a'] = 'anteater'
animals['a']
len(animals['a'])
animals.has_key('baboon')
'donkey' in animals.values()
animals.has_key('b')
animals.keys()
del animals['b']
len(animals)
animals.values()

def howMany(aDict):
    return sum([len(l) for l in aDict.values()])
animals = { 'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}
animals['d'] = ['donkey']
animals['d'].append('dog')
animals['d'].append('dingo')
print howMany(animals)

def biggest(aDict):
    return None if len(aDict) == 0 else max([(len(aDict[a]), a) for a in aDict.keys()])[1]
print biggest(animals)
  
def radiationExposure(start, stop, step):
    time, total = start, 0
    while time < stop:
        total += f(time) * step
        time += step
    return total

def FancyDivide(numbers, index):
    try:
        denom = numbers[index]
        for i in range(len(numbers)):
            numbers[i] /= denom
    except IndexError, e:
        FancyDivide(numbers, len(numbers) - 1)
    except ZeroDivisionError, e:
        print "-2"
    else:
        print "1"
    finally:
        print "0"

FancyDivide([0, 2, 4], 1)
FancyDivide([0, 2, 4], 4)
FancyDivide([0, 2, 4], 0)

def FancyDivide(numbers, index):
    try:
        try:
            denom = numbers[index]
            for i in range(len(numbers)):
                numbers[i] /= denom
        except IndexError, e:
            FancyDivide(numbers, len(numbers) - 1)
        else:
            print "1"
        finally:
            print "0"
    except ZeroDivisionError, e:
        print "-2"


def FancyDivide(numbers,index):
    try:
        denom = numbers[index]
        for i in range(len(numbers)):
            numbers[i] /= denom
    except IndexError, e:
        print "-1"
    else:
        print "1"
    finally:
        print "0"
FancyDivide([0, 2, 4], 0)
 
 
 def FancyDivide(list_of_numbers, index):
    try:
        try:
            raise Exception("0")
        finally:
            denom = list_of_numbers[index]
            for i in range(len(list_of_numbers)):
                list_of_numbers[i] /= denom
    except Exception, e:
        print e
        
def FancyDivide(list_of_numbers, index):
    try:
        try:
            denom = list_of_numbers[index]
            for i in range(len(list_of_numbers)):
                list_of_numbers[i] /= denom
        finally:
            raise Exception("0")
    except Exception, e:
        print e
        
FancyDivide([0, 2, 4], 0)

#define the SimpleDivide function here
def SimpleDivide(item, denom):
    try:
       return item / denom
    except ZeroDivisionError, e:
       return 0

SimpleDivide(10, 2)

def myLog(x, b):
    '''
    x: a positive integer
    b: a positive integer; b >= 2

    returns: log_b(x), or, the logarithm of x relative to a base b.
    '''
    # Your Code Here
    y, i = b, 0
    while y <= x:
        y *= b
        i += 1
    return i
    
#print myLog(30, 2)

def laceStrings(s1, s2):
    """
    s1 and s2 are strings.

    Returns a new str with elements of s1 and s2 interlaced,
    beginning with s1. If strings are not of same length, 
    then the extra elements should appear at the end.
    """
    # Your Code Here
    i, j, m, n, s = 0, 0, len(s1), len(s2), ""
    while i < m and j < n:
        s += s1[i] + s2[j]
        i, j = i + 1, j + 1
    while i < m:
        s += s1[i]
        i = i + 1
    while j < n:
        s += s2[j]
        j = j + 1
    
    return s
        
laceStrings("abcdxyz", "efghi")

def laceStringsRecur(s1, s2):
    """
    s1 and s2 are strings.

    Returns a new str with elements of s1 and s2 interlaced,
    beginning with s1. If strings are not of same length, 
    then the extra elements should appear at the end.
    """
    def helpLaceStrings(s1, s2, out):
        if s1 == '':
            return out + s2
        if s2 == '':
            return out + s1
        else:
            return out + s1[0] + s2[0] + helpLaceStrings(s1[1:], s2[1:], out)
    return helpLaceStrings(s1, s2, '')    
   
print laceStringsRecur("abcdxyz", "efghi")
print laceStringsRecur("abc", "xyz")

def McNuggets(n):
    """
    n is an int

    Returns True if some integer combination of 6, 9 and 20 equals n
    Otherwise returns False.
    """
    # Your Code Here
    for a in range(n / 6 + 1):
        for b in range(n / 9 + 1):
            for c in range(n / 20 + 1):
                if a * 6 + b * 9 + c * 20 == n:
                    return True
    return False

for n in range(20):
    print n, McNuggets(n)
    
import math
    
def fixedPoint(f, epsilon):
    """
    f: a function of one argument that returns a float
    epsilon: a small float
  
    returns the best guess when that guess is less than epsilon 
    away from f(guess) or after 100 trials, whichever comes first.
    """
    guess = 1.0
    for i in range(100):
        #print guess, f(guess)
        if abs(f(guess) - guess) < epsilon:
            return guess
        else:
            guess = f(guess)
    return guess
    
fixedPoint(math.cos, 0.0001)    

def sqrt(a):
    def tryit(x):
        return 0.5 * (a/x + x)
    return fixedPoint(tryit, 0.0001)

print sqrt(5)

def babylon(a):
    def test(x):
        return 0.5 * ((a / x) + x)
    return test

def sqrt(a):
    return fixedPoint(babylon(a), 0.0001)
    
print sqrt(5)

stuff = ["iBoy", "iGirl", "iQ", "iC","iPaid","iPad"] 
stuff = ("iBoy", "iGirl", "iQ", "iC","iPaid","iPad") 
stuff = [ ( "iBoy", "iGirl", "iQ", "iC","iPaid","iPad") ] 
stuff = ( [ "iBoy", "iGirl", "iQ", "iC","iPaid","iPad" ], ) 
stuff = "iPad" #'iPad'
for thing in stuff:
    if thing == 'iPad':
        print "Found it"
        
def Square(x):
    return SquareHelper(abs(x), abs(x))

def SquareHelper(n, x):
    if n == 0:
        return 0
    return SquareHelper(n-1, x) + x
    
print Square(5)
print Square(-5)

class Clock(object):
    def __init__(self, time):
	self.time = time
    def print_time(self):
	time = '6:30'
	print self.time

clock = Clock('5:30')
clock.print_time()

class Clock(object):
    def __init__(self, time):
	self.time = time
    def print_time(self, time):
	print time

clock = Clock('5:30')
clock.print_time('10:30')

class Clock(object):
    def __init__(self, time):
	self.time = time
    def print_time(self):
	print self.time

boston_clock = Clock('5:30')
paris_clock = boston_clock
paris_clock.time = '10:30'
boston_clock.print_time()

class Weird(object):
    def __init__(self, x, y): 
        self.y = y
        self.x = x
    def getX(self):
        return x 
    def getY(self):
        return y

class Wild(object):
    def __init__(self, x, y): 
        self.y = y
        self.x = x
    def getX(self):
        return self.x 
    def getY(self):
        return self.y

X = 7
Y = 8

w1 = Weird(X, Y)
print w1.getX()
print w1.getY()

w2 = Wild(X, Y)
print w2.getX()
print w2.getY()

w3 = Wild(17, 18)
print w3.getX()
print w3.getY()

w4 = Wild(X, 18)
print w4.getX()
print w4.getY()

X = w4.getX() + w3.getX() + w2.getX()
print X
print w4.getX()

Y = w4.getY() + w3.getY()
Y = Y + w2.getY()
print Y
print w2.getY()

class Coordinate(object):
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def getX(self):
        # Getter method for a Coordinate object's x coordinate.
        # Getter methods are better practice than just accessing an attribute directly
        return self.x

    def getY(self):
        # Getter method for a Coordinate object's y coordinate
        return self.y

    def __str__(self):
        return '<' + str(self.getX()) + ',' + str(self.getY()) + '>'
        
    def __eq__(self, other):
        return self.x == other.getX() and self.y == other.getY()
    
    def __repr__(self):
        return "Coordinate(%d, %d)" % (self.x, self.y)

c = Coordinate(10, 12)
print c.__repr__()
c.__repr__()
print eval(_)
print eval(repr(c)) == c

class intSet(object):
    """An intSet is a set of integers
    The value is represented by a list of ints, self.vals.
    Each int in the set occurs in self.vals exactly once."""

    def __init__(self):
        """Create an empty set of integers"""
        self.vals = []

    def insert(self, e):
        """Assumes e is an integer and inserts e into self""" 
        if not e in self.vals:
            self.vals.append(e)

    def member(self, e):
        """Assumes e is an integer
           Returns True if e is in self, and False otherwise"""
        return e in self.vals

    def remove(self, e):
        """Assumes e is an integer and removes e from self
           Raises ValueError if e is not in self"""
        try:
            self.vals.remove(e)
        except:
            raise ValueError(str(e) + ' not found')

    def __str__(self):
        """Returns a string representation of self"""
        self.vals.sort()
        return '{' + ','.join([str(e) for e in self.vals]) + '}'
        
class intSet(object):
    """An intSet is a set of integers
    The value is represented by a list of ints, self.vals.
    Each int in the set occurs in self.vals exactly once."""

    def __init__(self):
        """Create an empty set of integers"""
        self.vals = []

    def insert(self, e):
        """Assumes e is an integer and inserts e into self""" 
        if not e in self.vals:
            self.vals.append(e)

    def member(self, e):
        """Assumes e is an integer
           Returns True if e is in self, and False otherwise"""
        return e in self.vals

    def remove(self, e):
        """Assumes e is an integer and removes e from self
           Raises ValueError if e is not in self"""
        try:
            self.vals.remove(e)
        except:
            raise ValueError(str(e) + ' not found')

    def __str__(self):
        """Returns a string representation of self"""
        self.vals.sort()
        return '{' + ','.join([str(e) for e in self.vals]) + '}'
        
    def intersect(self, other):
        """returns a new intSet containing elements that appear in both sets."""
        newSet = intSet()
        for e in self.vals:
            if other.member(e):
                newSet.insert(e)
        return newSet
        
    def __len__(self):
        return len(self.vals)

A = intSet()
A.insert(1)
A.insert(2)    

B = intSet()
B.insert(2)
B.insert(3)
B.insert(4)

print A.intersect(B)
print len(A), len(B)    

class Queue(object):
    """ Queues are a fundamental computer science data structure. 
    A queue is basically like a line at Disneyland - you can add 
    elements to a queue, and they maintain a specific order. 
    When you want to get something off the end of a queue, 
    you get the item that has been in there the longest (this is 
    known as 'first-in-first-out', or FIFO). """

    def __init__(self):
        """Create an empty queue of integers"""
        self.vals = []

    def insert(self, e):
        """Assumes e is an integer and inserts e into self""" 
        if not e in self.vals:
            self.vals.append(e)

    def remove(self):
        """Pops an element from self
           Raises ValueError if queue is empty"""
        if len(self.vals) > 0:
            return self.vals.pop(0)
        else:
            raise ValueError()

queue = Queue()
queue.insert(5)
queue.insert(6)
queue.remove()
queue.insert(7)
queue.remove()
queue.remove()
queue.remove()

class Spell(object):
    def __init__(self, incantation, name):
        self.name = name
        self.incantation = incantation

    def __str__(self):
        return self.name + ' ' + self.incantation + '\n' + self.getDescription()
              
    def getDescription(self):
        return 'No description'
    
    def execute(self):
        print self.incantation    


class Accio(Spell):
    def __init__(self):
        Spell.__init__(self, 'Accio', 'Summoning Charm')

class Confundo(Spell):
    def __init__(self):
        Spell.__init__(self, 'Confundo', 'Confundus Charm')

    def getDescription(self):
        return 'Causes the victim to become confused and befuddled.'

def studySpell(spell):
    print spell

spell = Accio()
spell.execute()
studySpell(spell)
studySpell(Confundo())

class A(object):
    def __init__(self):
        self.a = 1
    def x(self):
        print "A.x"
    def y(self):
        print "A.y"
    def z(self):
        print "A.z"

class B(A):
    def __init__(self):
        A.__init__(self)
        self.a = 2
        self.b = 3
    def y(self):
        print "B.y"
    def z(self):
        print "B.z"

class C(object):
    def __init__(self):
        self.a = 4
        self.c = 5
    def y(self):
        print "C.y"
    def z(self):
        print "C.z"

class D(C, B):
    def __init__(self):
        C.__init__(self)
        B.__init__(self)
        self.d = 6
    def z(self):
        print "D.z"

obj = D()
print obj.a
print obj.b
print obj.c
print obj.d
obj.x()        
obj.y()
obj.z()

class genPrimes(object):
    def __init__(self):
        self.primes = [2]
    def next(self):
        last_prime = self.primes[len(self.primes) - 1]
        x = last_prime + 1
        while True:
            x_is_prime = True
            for prime in self.primes:
                if x % prime == 0:
                    x_is_prime = False
                    break
            if x_is_prime:
                self.primes.append(x)
                return last_prime
            x += 1

P = genPrimes()
for n in range(10):
    print P.next()

# generator
def genPrimes():
    primes, next = [], 2
    while True:
        next_is_prime = True
        for prime in primes:
            if next % prime == 0:
               next_is_prime = False
               break
        if next_is_prime:
            primes.append(next)
            yield next
            last_prime = next
        next += 1
        
P = genPrimes()
P.next()
P.next()
P.next()

def generator1():
    if True:
        yield 1 

def generator2():
    if False:   
        yield 1

g1 = generator1()
g2 = generator2()

print type(g1)
print type(g2)
print g1.next()
print g2.next()

# puzzle
def tspDyn():

    inf = float("inf")
    w = [[inf,42,50,23,46,54],
         [42,inf,54,26,50,60],
         [50,54,inf,41,21,59],
         [23,26,41,inf,37,42],
         [46,50,21,37,inf,55],
         [54,60,59,42,55,inf]]
         
    #w = [[0, 2, 9, 10], [1,0,6,4],[15,7,0,8],[6,3,12,0]]
    n = len(w)
    C = {}
    C[str([0]),0] = 0
    S = [[0]]
    #parent = {}
    cities = ["Athens", "Columbus", "Daltan", "Macon", "Rome", "Savannah"]

    for s in range(1, n):
        
        nS = []    
        for sub in S:
            for j in range(1, n):
                if not j in sub:
                    nsub = sorted(sub + [j])
                    if not nsub in nS:
                        nS +=  [nsub]
        #print s
        #print nS
        S = nS    
        #for all subsets S ⊆ {1,2,...,n} of size s and containing 1: 
        for sub in S:
            #print sub
            C[str(sub), 0] = inf
            for j in sub: 
                if j == 0: continue
                minval, minindex = inf, -1
                for i in sub:
                    if i != j:
                        newval = C[str(sorted(list(set(sub)-set([j])))), i] + w[i][j]
                        if newval < minval:
                            minval, minindex = newval, i
                C[str(sub), j] = minval
                #parent[str(sub), j] = minindex
        
    lastnode, mincost = -1, inf
    #print C
    #print parent
    for j in range(1, n):    
        if C[str(S[0]), j] + w[j][0] < mincost:
            mincost, lastnode = C[str(S[0]), j] + w[j][0], j
    
    print mincost, cities[lastnode]
    
    s, j = S[0], lastnode
    while len(s) > 0:    
        print cities[j], "<-", 
        s = sorted(list(set(s) - set([j])))    
        minval, minindex = inf, -1
        for i in s:      
            if i != j:
                val = C.get((str(s), i), inf)
                if minval > val:
                    minval, minindex = val, i
        #print s, minval, minindex
        j = minindex
    #return min_{j} C (\{1,...,n\}, j) + d_{j1}

tspDyn()

import itertools

def tsp():
    inf = float("inf")
    w = [[inf,42,50,23,46,54],
         [42,inf,54,26,50,60],
         [50,54,inf,41,21,59],
         [23,26,41,inf,37,42],
         [46,50,21,37,inf,55],
         [54,60,59,42,55,inf]]
    cities = ["Athens", "Columbus", "Daltan", "Macon", "Rome", "Savannah"]
    n = len(cities)
    for path in itertools.permutations(range(n)):
        pathlen, pathstr = 0, ""        
        for i in range(n):
            pathlen += w[path[i]][path[(i+1)%n]]
            pathstr += cities[path[i]] + "->"
        pathstr += cities[path[0]]
        print pathstr, pathlen
tsp()