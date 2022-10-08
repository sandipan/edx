# -*- coding: utf-8 -*-
"""
Created on Sun Feb 26 01:53:40 2017

@author: Sandipan.Dey
"""

#from collections import deque

import numpy as np
from copy import deepcopy
import sys
import matplotlib.pylab as plt
#import time
from datetime import datetime
#import matplotlib.animation as animation
# np.reshape(str.split(','.join(map(str, range(9))), ','), [3,3])

def strToBoard(string):
    return np.reshape(map(int, list(string)), [9,9])

def Neighbors(i):
    nbrs = []
    row, col = i / 9, i % 9 
    nbrs += list(range(row*9,(row+1)*9,1))  
    nbrs += list(range(col,9*9+col,9))    
    pos = row / 3, col / 3
    start = 27*pos[0] + 3*pos[1]
    for j in range(3):
        nbrs += [start, start+1, start+2]
        start += 9
    return set(nbrs) - set([i])

def REVISE(csp, Xi, Xj):
    X, D, C = csp
    revised = False
    for x in D[Xi]:
        if len(set(D[Xj]) - set([x])) == 0: #if x in D[Xj]:        
            D[Xi] = set(D[Xi]) - set([x])
            revised = True
    csp = (X, D, C)
    return revised, csp        
    
def AC_3(csp):
    X, D, C = csp
    queue = list(C)
    while len(queue) > 0:
        Xi, Xj = queue.pop(0)        
        revised, csp = REVISE(csp, Xi, Xj)
        if revised:
            X, D, C = csp
            if len(D[Xi]) == 0:
                return False
            for Xk in Neighbors(Xi):
                queue.append((Xk,Xi))
                queue.append((Xi,Xk))
    return True

def get_csp_soduku(input):
    
    X = list(range(81))
    #print strToBoard(input)
    D = {Xi:set(range(1,10)) for Xi in range(81)}
    for i in range(len(input)):
        if input[i] != '0':
            D[i] = set([int(input[i])])
    C = set([])
    # row constraints
    for row in range(9):
        start = row*9
        for i in range(start, start+9):
            for j in range(i+1, start+9):
                C.add((i,j))
                C.add((j,i))
    # col constraints
    for col in range(9):
        start = col
        for i in range(start, start+9*9, 9):
            for j in range(i+9, start+9*9, 9):
                C.add((i,j))
                C.add((j,i))
    # box constraints
    for row in range(3):            
        for col in range(3):            
            nbrs = []
            start = 27*row + 3*col
            for j in range(3):
                nbrs += [start, start+1, start+2]
                start += 9
            for i in range(len(nbrs)):
                for j in range(i+1,len(nbrs)):
                    C.add((nbrs[i], nbrs[j]))
                    C.add((nbrs[j], nbrs[i]))
                    
    return (X, D, C)                

def get_output(D):
    output = ''
    for i in range(len(D)):
        output += str(D[i].pop())
    return output    
                    
def write_output(path_to_goal, cost_of_path, nodes_expanded, fringe_size, max_fringe_size,
                 search_depth, max_search_depth, running_time, max_ram_usage):
    with open("output.txt", "w") as f:
        f.write('path_to_goal: ' + str(path_to_goal) + "\n")
        f.write('cost_of_path: ' +  str(cost_of_path) + "\n")
        f.write('nodes_expanded: ' + str(nodes_expanded) + "\n")
        f.write('fringe_size: ' + str(fringe_size) + "\n")
        f.write('max_fringe_size: ' + str(max_fringe_size) + "\n")
        f.write('search_depth: ' + str(search_depth) + "\n")
        f.write('max_search_depth: ' + str(max_search_depth) + "\n")
        f.write('running_time: ' + str(running_time) + "\n")
        f.write('max_ram_usage:' + str(max_ram_usage) + "\n")    

from copy import deepcopy

def min_remaining_value_heursitic(D):
    #minval, minind = float('Inf'), -1
    #for  i in range(len(D)):
    #    if len(D[i]) == 2:
    #        return i
    #    if len(D[i]) > 1 and len(D[i]) < minval:
    #        minval, minind = len(D[i]), i
    #return minind
    return sorted([(len(D[i]), i) for i in range(len(D)) if len(D[i]) > 1])
 
def BT_RVH(D, empties, positions, index, val_index):
    '''
      Solves a mini-Sudoku
      brd is the board
      empty is the number of empty cells
    '''

    #Base case
    if empties == 0:
        print 'here'
        return D
    
    #D_vals = min_remaining_value_heursitic(D)    
    print positions #D_vals
    #for (_,i) in D_vals:
    #for i in range(len(D)):
        #if len(D[i]) == 1: continue
        #print i, D
    _, i = positions[index] 
    empty = False
    #for val in D[i]:
    val = D[i][val_index]
    print i, val
    D2 = deepcopy(D)
    D2[i] = set([val])
    for j in Neighbors(i):
        D2[j] -= D2[i]
        if len(D2[j]) == 0:
            empty = True
            break
    if not empty:
        return BT_RVH(D2, empties-1, min_remaining_value_heursitic(D2), 0, 0)
    elif val_index + 1 < len(D[i]):
        return BT_RVH(D, empties, positions, index, val_index+1)        
    else: # backtrack
        return BT_RVH(D, empties, positions, index, val_index+1)        
    #BackTrack
    print 'backtrack', i 
    #D2 = D
    #D2[i], D2[j] = D[i], D[j]
    print empty, index
    
    return D    

def BT(D, i):
    
    print i
    
    # base case: 
    if (i >= len(D)):
        return True
    
    if len(D[i]) == 1:
        if BT(D, i + 1):
            return True
    
    for val in D[i]:
        
        print i, val
        D2 = deepcopy(D)
        D2[i] = set([val])
        empty = False        
        for j in Neighbors(i):
            D2[j] -= D2[i]
            if len(D2[j]) == 0:
                empty = True
                break
    
        if not empty:
            
            tmp, D = D, D2
            
            if BT(D, i + 1):
                return True
                
            # backtrack
            D = tmp
 
    return False
    
def BT_RVH2(Dvals, j, D, empties):
    
    #print j
    
    # base case: 
    if empties == 0:
        return True
   
    if len(Dvals) > 0:
        
        _, i = Dvals[j]
        
        for val in D[i]:
            
            #print i, val
            D2 = deepcopy(D)
            D2[i] = set([val])
            empty = False        
            for j in Neighbors(i):
                D2[j] -= D2[i]
                if len(D2[j]) == 0:
                    empty = True
                    break
        
            if not empty:
                
                tmp, D = deepcopy(D), D2
                
                if BT_RVH2(min_remaining_value_heursitic(D), 0, D, empties-1):
                    return True
                    
                # backtrack
                D = tmp
 
    return False

if len(sys.argv) >= 2:

    input = sys.argv[1] 
    csp = get_csp_soduku(input)    
    X, D, C = csp
    print X
    #print D
    #print sorted(C), len(C)
    has_solution = AC_3(csp)
    X, D, C = csp
    #print has_solution, D
    if has_solution:
        #D = BT_RVH(D, sum([1 for i in range(len(D)) if len(D[i]) > 1]), min_remaining_value_heursitic(D), 0)
        #BT(D, 0)        
        BT_RVH2(min_remaining_value_heursitic(D), 0, D, sum([1 for i in range(len(D)) if len(D[i]) > 1]))        
        #print D
        output = get_output(D)
        #print strToBoard(output)
else:

    None

'''
of = open('susokus_out.txt', 'w')
n = 1
for input in open('sudokus_start.txt').read().splitlines(): #.readlines():
    print n    
    n += 1
    if n < 200: continue
    #print strToBoard(input)
    csp = get_csp_soduku(input)    
    has_solution = AC_3(csp)
    if has_solution:
        X, D, C = csp
        #D = BT_RVH(D, sum([1 for i in range(len(D)) if len(D[i]) > 1]))
        BT_RVH2(min_remaining_value_heursitic(D), 0, D, sum([1 for i in range(len(D)) if len(D[i]) > 1]))        
        output = get_output(D)
        #print strToBoard(output)
        of.write(output + '\r\n')
    else:
        of.write('\r\n')
'''

