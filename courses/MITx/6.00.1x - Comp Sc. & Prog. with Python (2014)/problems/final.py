x = [2,1]
y = [2,1]
z = False
if x == y:
    if sorted(x) == sorted(y):
         if x.sort() == y.sort():
               #print x.sort(), sorted(y)
               z =  x.sort() == sorted(y)
print z

class Frob(object):
    def __init__(self, name):
        self.name = name
        self.before = None
        self.after = None
    def setBefore(self, before):
        # example: a.setBefore(b) sets b before a
        self.before = before
    def setAfter(self, after):
        # example: a.setAfter(b) sets b after a
        self.after = after
    def getBefore(self):
        return self.before
    def getAfter(self):
        return self.after
    def myName(self):
        return self.name

def insert(atMe, newFrob):
    """
    atMe: a Frob that is part of a doubly linked list
    newFrob:  a Frob with no links
    This procedure appropriately inserts newFrob into the linked list that atMe is a part of.    
    """
    prev, cur = None, atMe
    if cur.name < newFrob.name:    
        while cur and cur.name < newFrob.name:
            prev, cur = cur, cur.getAfter()
    else:
        prev, cur = cur, cur.getAfter()        
        while prev and prev.name > newFrob.name:
            cur, prev = prev, prev.getBefore()
    newFrob.setBefore(prev)
    newFrob.setAfter(cur)
    if prev:
        prev.setAfter(newFrob)
    if cur:
        cur.setBefore(newFrob)

'''    
eric = Frob('eric')
andrew = Frob('andrew')
ruth = Frob('ruth')
fred = Frob('fred')
martha = Frob('martha')

insert(eric, andrew)
insert(eric, ruth)
insert(eric, fred)
insert(ruth, martha)
insert(eric, Frob('martha'))

cur = andrew
while cur != None:
    print cur.name
    cur = cur.getAfter()
    
test_list = Frob('zsa zsa')
a = Frob('ashley')
m = Frob('marcella')
v = Frob('victor')
insert(test_list, m)
insert(m, a)
insert(a, v)
cur = a
while cur != None:
    print cur.name
    cur = cur.getAfter()

test_list = Frob('mark')
c = Frob('craig')
insert(test_list, Frob("sam"))
insert(test_list, Frob("nick"))
insert(test_list, c)
insert(c, Frob("xanthi"))
insert(test_list, Frob("jayne"))
insert(c, Frob("martha"))
cur = c
while cur != None:
    print cur.name
    cur = cur.getAfter()
'''

def findFront(start):
    """
    start: a Frob that is part of a doubly linked list
    returns: the Frob at the beginning of the linked list 
    """
    # Your Code Here
    return findFront(start.getBefore()) if start.getBefore() else start

'''        
eric = Frob('eric')
andrew = Frob('andrew')
ruth = Frob('ruth')
fred = Frob('fred')
martha = Frob('martha')
insert(eric, andrew)
insert(eric, ruth)
insert(eric, fred)
insert(ruth, martha)
insert(eric, Frob('martha'))

print findFront(martha).name
print findFront(ruth).name
print findFront(eric).name
'''

def jumpAndBackpedal(isMyNumber):
    '''
    isMyNumber: Procedure that hides a secret number. 
     It takes as a parameter one number and returns:
     *  -1 if the number is less than the secret number
     *  0 if the number is equal to the secret number
     *  1 if the number is greater than the secret number
 
    returns: integer, the secret number
    ''' 
    guess = 1
    if isMyNumber(guess) == 0:
        return guess
    foundNumber = False
    while not foundNumber:
        sign = isMyNumber(guess)
        if sign == 0:
            break
        if sign == -1:
            guess *= 2
        else:
            guess -= 1
    return guess
    
def isMyNumber(guess):
    secret = 25 #-20
    if secret == guess:
        return 0
    elif secret < guess:
        return 1
    else:
        return -1

#print jumpAndBackpedal(isMyNumber)

def sort1(lst):
    swapFlag = True
    iteration = 0
    while swapFlag:
        swapFlag = False
        for i in range(len(lst)-1):
            if lst[i] > lst[i+1]:
                temp = lst[i+1]
                lst[i+1] = lst[i]
                lst[i] = temp
                swapFlag = True

        L = lst[:]  # the next 3 questions assume this line just executed
        iteration += 1
    return lst
    
