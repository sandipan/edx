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
# convert -delay 100 -loop 0 *.png sol.gif

def get_board_table(n, bstr):
    nums = list(bstr)
    html = "'''<<table>"
    for i in range(n):
        html += '<tr>'
        for j in range(n):
            html += '<td>'
            html += ' ' if nums[n*i+j] == '0' else nums[n*i+j]
            html += '</td>'            
        html += '</tr>'
    html += "</table>>'''"
    return html

def strToBoard(string):
    return np.reshape(map(int, list(string)), [9,9])

num = 0
def plot_grid(board, title, n=-1, col='black'):
    global num    
    print num
    fig = plt.figure(figsize=[5,5])
    ax = fig.add_subplot(111)
    fig.patch.set_facecolor((1,1,.8))
    
    # draw the grid
    for x in range(10):
        ax.plot([x, x], [0,9], 'k')
        if x % 3 == 0:
            ax.plot([x, x], [0,9], 'k', linewidth=5)
    for y in range(10):
        ax.plot([0, 9], [y,y], 'k')
        if y % 3 == 0:
            ax.plot([0,9], [y,y], 'k', linewidth=5)
    # scale the axis area to fill the whole figure
    ax.set_position([0,0,1,1])
    # get rid of axes and everything (the figure background will show through)
    ax.set_axis_off()    
    # scale the plot area conveniently (the board is in 0,0..9,9)
    ax.set_xlim(0,9)
    ax.set_ylim(0,9)
    for i in range(9):
        for j in range(9):
            plt.text(j+.25, 8-i+.25, str('' if board[i,j]==0 else board[i,j]), fontsize=25, color=col)
       
    plt.title(title)
    plt.savefig('sol/fig' + str(num if n < 0 else n).zfill(3))# + '.png', bbox_inches='tight')
    num += 1
    plt.close()

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

def get_output(assignment):
    return ''.join(map(str, assignment.values()))    
                    
def inference(var, value, D):
    D2 = deepcopy(D)
    for i in Neighbors(var):
        D2[i] -= set([value])
        if len(D2[i]) == 0:
            return None
    return D2

# min_remaining_value_heursitic
def select_unassigned_variable(assignment, D):
    return min([(len(D[i]), i) for i in assignment if assignment[i] == 0])[1]

def complete(assignment):
    return not 0 in assignment.values()

from graphviz import Digraph
num2 = 0
def backtrack(assignment, D, s):
    global num2
    if complete(assignment):
        return True
    var = select_unassigned_variable(assignment, D)
    for value in D[var]:
        
        prev = deepcopy(assignment)
        assignment[var] = value
        prev_str, cur_str = ''.join(map(str,prev.values())), ''.join(map(str, assignment.values()))
        s.node(prev_str, eval(get_board_table(9, prev_str)))
        s.node(cur_str, eval(get_board_table(9, cur_str)))
        s.edge(prev_str, cur_str)
        num2 += 1
        s.render('sol/board' + str(num2) + '.gv', view=False)

        plot_grid(strToBoard(assignment.values()), '')
        D2 = inference(var, value, D)
        if D2 != None:
            if backtrack(assignment, D2, s):
                return True
        assignment[var] = 0 # backtrack
        s.edge(cur_str, prev_str)
        num2 += 1
        s.render('sol/board' + str(num2) + '.gv', view=False)

        plot_grid(strToBoard(assignment.values()), 'Backtracking')

if len(sys.argv) >= 2:

    input = sys.argv[1] 
    #print input
    s = Digraph('board', node_attr={'shape': 'plaintext'}, format='jpg')
    plot_grid(strToBoard(input), 'Input', 0)
    csp = get_csp_soduku(input)    
    X, D, C = csp
    has_solution = AC_3(csp)
    X, D, C = csp
    if has_solution:
        assignment = {i:(0 if len(D[i]) > 1 else list(D[i])[0]) for i in range(len(D))}        
        plot_grid(strToBoard(assignment.values()), 'After AC-3', 1, 'red')
        #print get_output(assignment)
        backtrack(assignment, D, s)        
        #print get_output(assignment)
        output = get_output(assignment)
        with open('output.txt', 'w') as f:
            f.write(output + '\n')
        #print strToBoard(output)
    else:
    
        None

'''
import time

of = open('susokus_out.txt', 'w')
n = 1
times = []
times1, times2 = [], []
for input in open('sudokus_start.txt').read().splitlines(): #.readlines():
    print n    
    n += 1
    start = time.time()
    #print strToBoard(input)
    csp = get_csp_soduku(input)    
    has_solution = AC_3(csp)
    mid = time.time()
    times1.append(mid - start)
    if has_solution:
        X, D, C = csp
        assignment = {i:(0 if len(D[i]) > 1 else list(D[i])[0]) for i in range(len(D))}        
        backtrack(assignment, D)        
        output = get_output(assignment)
        #print strToBoard(output)
        end = time.time()
        times2.append(end - mid)
        times.append(end-start)
        of.write(output + '\r\n')
    else:
        of.write('\r\n')

import seaborn as sns
#sns.distplot(times)
#sns.distplot(times, kde=False, rug=True)
#plt.show()
#sns.distplot(times1, kde=False, rug=True)
#plt.show()
#sns.distplot(times2, kde=False, rug=True)
#plt.show()
times1 = np.array(times1)
times2 = np.array(times2)
with sns.axes_style("white"):
    sns.jointplot(x=times1, y=times2, kind="hex", color="k")
plt.show()
g = sns.jointplot(x=times1, y=times2, kind="kde", color="m")
g.plot_joint(plt.scatter, c="w", s=30, linewidth=1, marker="+")
g.ax_joint.collections[0].set_alpha(0)
g.set_axis_labels("$X$", "$Y$");
plt.show()
'''