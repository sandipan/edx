# -*- coding: utf-8 -*-
"""
Created on Fri Dec 19 19:32:46 2014

@author: SANDIPAN DEY
"""

import random
import pylab

points = []
for i in range(1000):
    points.append(random.gauss( 50,10) + random.gauss( 70, 10 ))
pylab.hist(points)

points = []
for i in range(1000):
    points.append(random.gauss( 5,10))
    points.append(random.gauss( 70, 10 ))
pylab.hist(points)


a = 1.0
b = 2.0
c = 4.0
yVals = []
xVals = range(-20, 20)
for x in xVals:
    yVals.append(a*x**2 + b*x + c)
yVals = 2*pylab.array(yVals)
xVals = pylab.array(xVals)
try:
    a, b, c, d = pylab.polyfit(xVals, yVals, 3)
    print a, b, c, d
except:
    print 'fell to here'
    
A = [0,1,2,3,4,5,6,7,8]
B = [5,10,10,10,15]
C = [0,1,2,4,6,8]
D = [6,7,11,12,13,15]
E = [9,0,0,3,3,3,6,6]

def mean_var(L):
    mean = (sum(L) * 1.0) / len(L)
    print mean, sum([(x - mean)**2 for x in L]) / len(L)
    
mean_var(A)
mean_var(B)
mean_var(C)
mean_var(D)
mean_var(E)

def possible_mean(L):
    return sum(L)/len(L)

def possible_variance(L):
    mu = possible_mean(L)
    temp = 0
    for e in L:
        temp += (e-mu)**2
    return temp / len(L)
    
print possible_mean(A), possible_variance(A)
print possible_mean(B), possible_variance(B)
print possible_mean(C), possible_variance(C)
print possible_mean(D), possible_variance(D)
print possible_mean(E), possible_variance(E)

def mysteryLinkageDist(self, other):
    av_dist = self.averageLinkageDist(other)
    max_dist = self.maxLinkageDist(other)
    min_dist = self.singleLinkageDist(other)
    retDist = 0.0
    if av_dist == max_dist and max_dist == min_dist:
        retDist = av_dist
    elif av_dist == max_dist:
        retDist = av_dist
    elif av_dist == min_dist:
        retDist = av_dist
    elif max_dist == min_dist:
        retDist = min_dist
    else:
        retDist = random.choice([av_dist,min_dist,max_dist])
    return retDist