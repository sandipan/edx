# Write your code here!
import string
alphabet = string.ascii_letters

sentence = 'Jim quickly realized that the beautiful gowns are expensive'

count_letters = {}
#write your code here!
for c in sentence:
    if c in alphabet:
        count_letters[c] = count_letters.get(c, 0) + 1

count_letters


sentence = 'Jim quickly realized that the beautiful gowns are expensive'

# Create your function here!
def counter(input_string):
    count_letters = {}
    for c in input_string:
        if c in alphabet:
            count_letters[c] = count_letters.get(c, 0) + 1
    
    return count_letters

counter(sentence)


address_count = counter(address)
print(address_count)

most_frequent_letter = max([(address_count[c], c) for c in address_count])[1] 
print(most_frequent_letter)

import math
print(math.pi/4)

import random

random.seed(1) # This line fixes the value called by your function,
               # and is used for answer-checking.

def rand():
    # define `rand` here!
    random.uniform(-1,1)     
rand()

import math

def distance(x, y):
   # define your function here!
   return math.sqrt((x[0]-y[0])**2+(x[1]-y[1])**2)
   
print(distance((0,0), (1,1)))

import random, math

random.seed(1)

def in_circle(x, origin = [0]*2):
   # Define your function here!
   return distance(x, origin) < 1 

print(in_circle((1,1)))   

R = 10000
x = []
inside = []
for i in range(R):
    point = [rand(), rand()]
    x.append(point)
    # append inside here!
    inside.append(in_circle(point))
    
print(sum(inside) / R)

print(abs(sum(inside) / R - math.pi / 4))

import random

random.seed(1)

def moving_window_average(x, n_neighbors=1):
    n = len(x)
    width = n_neighbors*2 + 1
    x = [x[0]]*n_neighbors + x + [x[-1]]*n_neighbors
    # To complete the function,
    # return a list of the mean of values from i to i+width for all values i from 0 to n-1.   
    y = [0]*n
    for i in range(n_neighbors, n + n_neighbors):
        #print(i, x[i-n_neighbors:i+n_neighbors+1])
        y[i-n_neighbors] = sum(x[i-n_neighbors:i+n_neighbors+1]) / (2.*n_neighbors+1.)
    
    return y    

x=[0,10,5,3,1,5]
print(moving_window_average(x, 1))

import random

random.seed(1) # This line fixes the value called by your function,
               # and is used for answer-checking.
    
# write your code here!
R = 1000
x = [random.uniform(0,1) for _ in range(R)]
Y = [x] #[] + x # x
for n_neighbors in range(1,10):
    Y.append(moving_window_average(x, n_neighbors)) #Y += 
    #print(len(Y))

#Y

# write your code here!
ranges = [max(y) - min(y) for y in Y]
print(ranges)

