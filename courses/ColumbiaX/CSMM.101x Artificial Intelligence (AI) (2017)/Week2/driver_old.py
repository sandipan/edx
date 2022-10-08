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
    return np.reshape(map(int, str.split(string, ',')), [3,3])

def boardToStr(board):
    return ','.join(map(str, board.flatten().tolist()))

def goalTest(state):
    return state == ','.join(map(str, range(9)))

def swap(state, r1, c1, r2, c2):
    nbr = deepcopy(state)
    nbr[r1,c1], nbr[r2,c2] = nbr[r2,c2], nbr[r1,c1]
    return boardToStr(nbr)
    
def neighbors(state):
    state = strToBoard(state)    
    nbrs = []
    itemindex = np.where(state==0)
    row, col = itemindex[0][0], itemindex[1][0]
    if row > 0: # UP
        nbrs.append(swap(state, row, col, row-1, col))
    if row < 2: # DOWN
        nbrs.append(swap(state, row, col, row+1, col))
    if col > 0: # LEFT
        nbrs.append(swap(state, row, col, row, col-1))
    if col < 2: # RIGHT
        nbrs.append(swap(state, row, col, row, col+1))
    return nbrs

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
      
        
def bfs(initialState):
    
    start = datetime.now()
    path_to_goal = []
    cost_of_path = 0
    nodes_expanded = 0
    fringe_size = 0
    max_fringe_size = 0
    search_depth = 0
    max_search_depth = 0
    running_time = 0
    max_ram_usage = 0

    frontier, explored = [], set([])
    parent, d = {}, {}
    frontier.append(initialState)
    parent[initialState] = None
    d[initialState] = 0
    
    while len(frontier) > 0:
        
        fringe_size = len(frontier)
        max_fringe_size = max(max_fringe_size, fringe_size)

        state = frontier.pop(0)
        explored.add(state)
        
        fringe_size = len(frontier)
        
        search_depth = d[state]
        max_search_depth = max(max_search_depth, search_depth)
        nodes_expanded += 1
      
        if goalTest(state):
            while state != initialState:
                itemindex = np.where(strToBoard(state)==0)                
                row, col = itemindex[0][0], itemindex[1][0]
                itemindex = np.where(strToBoard(parent[state])==0)                
                row1, col1 = itemindex[0][0], itemindex[1][0]
                if row1 == row:
                    path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                elif col1 == col:
                    path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                state = parent[state]
                cost_of_path += 1
            done =  datetime.now()
            running_time = (done - start).total_seconds()
            write_output(path_to_goal, cost_of_path, nodes_expanded-1, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage)
            return state
           
        for nbr in neighbors(state):
            if nbr not in frontier and nbr not in explored:
                frontier.append(nbr)
                parent[nbr] = state
                d[nbr] = d[state] + 1
                max_search_depth = max(max_search_depth, d[nbr])
                
    return None           

def dfs(initialState):
    
    start = datetime.now()
    path_to_goal = []
    cost_of_path = 0
    nodes_expanded = 0
    fringe_size = 0
    max_fringe_size = 0
    search_depth = 0
    max_search_depth = 0
    running_time = 0
    max_ram_usage = 0

    frontier, explored = [], set([])
    parent, d = {}, {}
    frontier.append(initialState)
    parent[initialState] = None
    d[initialState] = 0
    
    while len(frontier) > 0:
        
        fringe_size = len(frontier)
        max_fringe_size = max(max_fringe_size, fringe_size)

        state = frontier.pop(0)
        explored.add(state)
        
        fringe_size = len(frontier)
          
        search_depth = d[state]
        max_search_depth = max(max_search_depth, search_depth)
        nodes_expanded += 1
      
        if goalTest(state):
            while state != initialState:
                itemindex = np.where(strToBoard(state)==0)                
                row, col = itemindex[0][0], itemindex[1][0]
                itemindex = np.where(strToBoard(parent[state])==0)                
                row1, col1 = itemindex[0][0], itemindex[1][0]
                if row1 == row:
                    path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                elif col1 == col:
                    path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                state = parent[state]
                cost_of_path += 1
            done =  datetime.now()
            running_time = (done - start).total_seconds()
            write_output(path_to_goal, cost_of_path, nodes_expanded-1, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage)   
            return state
           
        for nbr in list(reversed(neighbors(state))):
            if nbr not in frontier and nbr not in explored:
                frontier.insert(0, nbr)
                parent[nbr] = state
                d[nbr] = d[state] + 1
                max_search_depth = max(max_search_depth, d[nbr])
               
    return None    

def ida(initialState):
    
    start = datetime.now()
    thres = 0 # depth = 0 #for IDS
    
    while True:
        
        path_to_goal = []
        cost_of_path = 0
        nodes_expanded = 0
        fringe_size = 0
        max_fringe_size = 0
        search_depth = 0
        max_search_depth = 0
        running_time = 0
        max_ram_usage = 0
        
        frontier, explored = [], set([])
        parent, d = {}, {}
        frontier.append(initialState)
        parent[initialState] = None
        d[initialState] = 0
        next_thres = float('inf')
        
        while len(frontier) > 0:
            
            fringe_size = len(frontier)
            max_fringe_size = max(max_fringe_size, fringe_size)

            state = frontier.pop(0)
            explored.add(state)
            
            fringe_size = len(frontier)
              
            search_depth = d[state]
            max_search_depth = max(max_search_depth, search_depth)
            nodes_expanded += 1
          
            if goalTest(state):
                while state != initialState:
                    itemindex = np.where(strToBoard(state)==0)                
                    row, col = itemindex[0][0], itemindex[1][0]
                    itemindex = np.where(strToBoard(parent[state])==0)                
                    row1, col1 = itemindex[0][0], itemindex[1][0]
                    if row1 == row:
                        path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                    elif col1 == col:
                        path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                    state = parent[state]
                    cost_of_path += 1
                done =  datetime.now()
                running_time = (done - start).total_seconds()
                write_output(path_to_goal, cost_of_path, nodes_expanded-1, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage) 
                return state
            
            #if d[state] < depth: # it's for IDS
            for nbr in neighbors(state):
                if nbr not in frontier and nbr not in explored:
                    if d[state] + 1 + heuristic(nbr) <= thres: 
                        frontier.insert(0, nbr)
                        parent[nbr] = state
                        d[nbr] = d[state] + 1
                        max_search_depth = max(max_search_depth, d[nbr])
                    else:
                        next_thres = min(next_thres, d[state] + 1 + heuristic(nbr))
        thres = next_thres
        
    return None            

from heapq import heappush, heappop

def heuristic(state):
    goal, state = map(str, range(9)), str.split(state, ',')
    #return sum([state[i]!=goal[i] for i in range(len(state))]) # hamming
    return sum([abs(int(state[i])-int(goal[i])) for i in range(len(state))]) # manhattan

def ast(initialState):
    
    start =  datetime.now()
    path_to_goal = []
    cost_of_path = 0
    nodes_expanded = 0
    fringe_size = 0
    max_fringe_size = 0
    search_depth = 0
    max_search_depth = 0
    running_time = 0
    max_ram_usage = 0

    frontier, explored = [], set([])
    parent, d = {}, {}
    heappush(frontier, (0, initialState))
    parent[initialState] = None
    d[initialState] = 0

    while len(frontier) > 0:
        
        fringe_size = len(frontier)
        max_fringe_size = max(max_fringe_size, fringe_size)

        val, state = heappop(frontier)
        explored.add(state)
        
        fringe_size = len(frontier)
          
        search_depth = d[state]
        max_search_depth = max(max_search_depth, search_depth)
        nodes_expanded += 1
      
        if goalTest(state):
            while state != initialState:
                itemindex = np.where(strToBoard(state)==0)                
                row, col = itemindex[0][0], itemindex[1][0]
                itemindex = np.where(strToBoard(parent[state])==0)                
                row1, col1 = itemindex[0][0], itemindex[1][0]
                if row1 == row:
                    path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                elif col1 == col:
                    path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                state = parent[state]
                cost_of_path += 1
            done =  datetime.now()
            running_time = (done - start).total_seconds()
            write_output(path_to_goal, cost_of_path, nodes_expanded-1, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage)
            return state
           
        for nbr in neighbors(state):
            nbr_in_forntier = False
            for (_, s) in frontier:
                if s == nbr:
                    nbr_in_forntier = True
                    break
            if not nbr_in_forntier and nbr not in explored:
                d[nbr] = d[state] + 1
                max_search_depth = max(max_search_depth, d[nbr])
                heappush(frontier, (d[nbr]+heuristic(nbr), nbr))
                parent[nbr] = state
                
    return None           

def plot_grid(board, n, col='black'):
    
    fig = plt.figure(figsize=[5,5])
    ax = fig.add_subplot(111)
    fig.patch.set_facecolor((1,1,.8))
    
    # draw the grid
    for x in range(4):
        ax.plot([x, x], [0,3], 'k')
    for y in range(4):
        ax.plot([0, 3], [y,y], 'k')
    # scale the axis area to fill the whole figure
    ax.set_position([0,0,1,1])
    # get rid of axes and everything (the figure background will show through)
    ax.set_axis_off()    
    # scale the plot area conveniently (the board is in 0,0..3,3)
    ax.set_xlim(-1,4)
    ax.set_ylim(-1,4)
    # draw Go stones at (10,10) and (13,16)
    for i in range(3):
        for j in range(3):
            plt.text(j+.25, 2-i+.25, str('' if board[i,j]==0 else board[i,j]), fontsize=48, color=col)
    
    plt.savefig('sol/fig' + str(n).zfill(3))# + '.png', bbox_inches='tight')
    plt.close()

#from matplotlib.pylab import *

def plot_solution(board):
    
    lines = []
    with open('output.txt') as f:
        lines = f.readlines()
    moves = eval(str.strip(str.split(lines[0], ':')[1]))
    board = strToBoard(board)
    zero_index = np.where(board==0)
    row, col = zero_index[0][0], zero_index[1][0]
    #ims = []
    #plt.ion()
    #plt.show()
    i = 0
    plot_grid(board, i)
    #plt.draw()
    #print row, col
    for move in moves:
        print move
        if move == 'Up':
            board[row-1,col], board[row,col] = board[row,col], board[row-1,col]
            row -= 1
        elif move == 'Down':
            board[row+1,col], board[row,col] = board[row,col], board[row+1,col]
            row += 1
        elif move == 'Left':
            board[row,col-1], board[row,col] = board[row,col], board[row,col-1]
            col -= 1
        else:
            board[row,col+1], board[row,col] = board[row,col], board[row,col+1]
            col += 1
        i += 1    
        plot_grid(board, i)
        #plt.draw()
        #plt.pause(1)
        #plt.ioff()
    plot_grid(board, i, 'red')
    plt.show()
        
    # convert -delay 30 -loop 0 *.png sol.gif
    
    plt.show()
    #im_ani = animation.ArtistAnimation(fig, ims, interval=100, repeat=False, blit=True)  
    #im_ani.save('pyPLA.gif', writer='imagemagick', fps=30)
    #im_ani.save('pyPLA.mp4', writer='imagemagick', fps=30)
 
        
if len(sys.argv) >= 3:

    method, board = sys.argv[1:3] 
    if method == 'bfs':
      bfs(board)  
    elif method == 'dfs':
      dfs(board)
    elif method == 'ida':
      ida(board)
    elif method == 'ast':
      ast(board)
      
    plot_solution(board)
    
else:

    None
    
#import os
#import psutil
#process = psutil.Process(os.getpid())
#print(process.memory_info().rss)
    
# python driver.py ast 6,0,5,8,7,4,3,2,1
# python driver.py ast 8,6,7,2,5,4,3,0,1
# python driver.py ast 5,2,3,4,7,0,8,6,1 
# python driver.py ast 1,0,2,7,5,4,8,6,3
