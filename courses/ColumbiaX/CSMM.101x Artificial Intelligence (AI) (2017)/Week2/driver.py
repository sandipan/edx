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

def get_board_table(n, bstr):
    nums = str.split(bstr, ',')
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
    
def strToBoard(string, n):
    return np.reshape(map(int, str.split(string, ',')), [n,n])

def boardToStr(board):
    return ','.join(map(str, board.flatten().tolist()))

def goalTest(state, n):
    return state == ','.join(map(str, range(n*n)))

def swap(state, r1, c1, r2, c2):
    nbr = deepcopy(state)
    nbr[r1,c1], nbr[r2,c2] = nbr[r2,c2], nbr[r1,c1]
    return boardToStr(nbr)
    
def neighbors(state, n):
    state = strToBoard(state, n)    
    nbrs = []
    itemindex = np.where(state==0)
    row, col = itemindex[0][0], itemindex[1][0]
    if row > 0: # UP
        nbrs.append(swap(state, row, col, row-1, col))
    if row < n-1: # DOWN
        nbrs.append(swap(state, row, col, row+1, col))
    if col > 0: # LEFT
        nbrs.append(swap(state, row, col, row, col-1))
    if col < n-1: # RIGHT
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
      
        
def bfs(initialState, n):
    
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

        # step 1
        state = frontier.pop(0)
        explored.add(state)
        
        fringe_size = len(frontier)
        
        search_depth = d[state]
        max_search_depth = max(max_search_depth, search_depth)
        
        # step 2
        if goalTest(state, n):
            while state != initialState:
                itemindex = np.where(strToBoard(state, n)==0)                
                row, col = itemindex[0][0], itemindex[1][0]
                itemindex = np.where(strToBoard(parent[state], n)==0)                
                row1, col1 = itemindex[0][0], itemindex[1][0]
                if row1 == row:
                    path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                elif col1 == col:
                    path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                state = parent[state]
                cost_of_path += 1
            done =  datetime.now()
            running_time = (done - start).total_seconds()
            write_output(path_to_goal, cost_of_path, nodes_expanded, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage)
            return state
           
        # step 3
        nodes_expanded += 1
        for nbr in neighbors(state, n):
            if nbr not in frontier and nbr not in explored:
                frontier.append(nbr)
                parent[nbr] = state
                d[nbr] = d[state] + 1
                max_search_depth = max(max_search_depth, d[nbr])
                
    return None           

def dfs(initialState, n):
    
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
        
        # step 1
        state = frontier.pop(0)
        explored.add(state)
        
        fringe_size = len(frontier)
          
        search_depth = d[state]
        max_search_depth = max(max_search_depth, search_depth)
      
        # step 2
        if goalTest(state, n):
            while state != initialState:
                itemindex = np.where(strToBoard(state, n)==0)                
                row, col = itemindex[0][0], itemindex[1][0]
                itemindex = np.where(strToBoard(parent[state], n)==0)                
                row1, col1 = itemindex[0][0], itemindex[1][0]
                if row1 == row:
                    path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                elif col1 == col:
                    path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                state = parent[state]
                cost_of_path += 1
            done =  datetime.now()
            running_time = (done - start).total_seconds()
            write_output(path_to_goal, cost_of_path, nodes_expanded, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage)   
            return state
        
        # step 3
        nodes_expanded += 1
        for nbr in list(reversed(neighbors(state, n))):
            if nbr not in frontier and nbr not in explored:
                frontier.insert(0, nbr)
                parent[nbr] = state
                d[nbr] = d[state] + 1
                max_search_depth = max(max_search_depth, d[nbr])
               
    return None    

def ida(initialState, n):
    
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

            # step 1
            state = frontier.pop(0)
            explored.add(state)
            
            fringe_size = len(frontier)
              
            search_depth = d[state]
            max_search_depth = max(max_search_depth, search_depth)
          
            # step 2
            if goalTest(state, n):
                while state != initialState:
                    itemindex = np.where(strToBoard(state, n)==0)                
                    row, col = itemindex[0][0], itemindex[1][0]
                    itemindex = np.where(strToBoard(parent[state], n)==0)                
                    row1, col1 = itemindex[0][0], itemindex[1][0]
                    if row1 == row:
                        path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                    elif col1 == col:
                        path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                    state = parent[state]
                    cost_of_path += 1
                done =  datetime.now()
                running_time = (done - start).total_seconds()
                write_output(path_to_goal, cost_of_path, nodes_expanded, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage) 
                return state
           
            # step 3
            nodes_expanded += 1
            #if d[state] < depth: # it's for IDS
            for nbr in list(reversed(neighbors(state, n))):
                if not nbr in frontier and not nbr in explored:
                    if d[state] + 1 + heuristic(nbr, n) <= thres: 
                        frontier.insert(0, nbr)
                        parent[nbr] = state
                        d[nbr] = d[state] + 1
                        max_search_depth = max(max_search_depth, d[nbr])
                    else:
                        next_thres = min(next_thres, d[state] + 1 + heuristic(nbr, n))
        thres = next_thres
        
    return None            

from heapq import heappush, heappop, heapify

def heuristic(state, n):
    #goal, state = map(str, range(9)), str.split(state, ',')
    #return sum([state[i]!=goal[i] for i in range(len(state)) if state[i] != '0']) # hamming
    #return sum([abs(int(state[i])-int(goal[i])) for i in range(len(state))]) # manhattan
    state = map(int, str.split(state, ','))
    #return sum([int(state[i])!=i for i in range(len(state)) if state[i] != 0]) # hamming
    return sum([abs(state[i] / n - i / n) + abs(state[i] % n - i % n) for i in range(n*n) if state[i] != 0]) # manhattan
    
def ast(initialState, n):
    
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

        # step 1
        val, state = heappop(frontier)
        explored.add(state)
        print strToBoard(state, n)
        
        fringe_size = len(frontier)
          
        search_depth = d[state]
        max_search_depth = max(max_search_depth, search_depth)
        
        # step 2
        if goalTest(state, n):
            while state != initialState:
                itemindex = np.where(strToBoard(state, n)==0)                
                row, col = itemindex[0][0], itemindex[1][0]
                itemindex = np.where(strToBoard(parent[state], n)==0)                
                row1, col1 = itemindex[0][0], itemindex[1][0]
                if row1 == row:
                    path_to_goal = ['Left' if col1 > col else 'Right' ] + path_to_goal
                elif col1 == col:
                    path_to_goal = ['Up' if row1 > row else 'Down' ] + path_to_goal                
                state = parent[state]
                cost_of_path += 1
            done =  datetime.now()
            running_time = (done - start).total_seconds()
            write_output(path_to_goal, cost_of_path, nodes_expanded, fringe_size, max_fringe_size, \
                 search_depth, max_search_depth, running_time, max_ram_usage)
            return state
        
        # step 3
        nodes_expanded += 1      
        for nbr in neighbors(state, n):
            nbr_in_forntier, nbr_k = False, None
            d_nbr = d[state] + 1
            nbr_cost, ts = d_nbr+heuristic(nbr, n), (datetime.utcnow()- datetime.utcfromtimestamp(0)).total_seconds()
            for (k, s) in frontier:
                if s == nbr:
                    nbr_in_forntier, nbr_k = True, k
                    break
            if (not nbr_in_forntier) and (not nbr in explored):  
                d[nbr] = d_nbr
                max_search_depth = max(max_search_depth, d[nbr])
                heappush(frontier, ((nbr_cost, ts), nbr))
                parent[nbr] = state
            elif nbr_in_forntier:
                index = frontier.index((nbr_k,nbr))  
                cur_cost, _ = nbr_k
                if nbr_cost < cur_cost:
                    d[nbr] = d_nbr
                    max_search_depth = max(max_search_depth, d[nbr])
                    parent[nbr] = state
                    frontier[index] = ((nbr_cost, ts), nbr)
                    heapify(frontier)
                
    return None           

def plot_grid(board, id, n, move=None, col='black'):
    
    fig = plt.figure(figsize=[5,5])
    ax = fig.add_subplot(111)
    fig.patch.set_facecolor((1,1,.8))
    
    # draw the grid
    for x in range(n+1):
        ax.plot([x, x], [0,n], 'k')
    for y in range(n+1):
        ax.plot([0, n], [y,y], 'k')
    # scale the axis area to fill the whole figure
    ax.set_position([0,0,1,1])
    # get rid of axes and everything (the figure background will show through)
    ax.set_axis_off()    
    # scale the plot area conveniently (the board is in 0,0..3,3)
    ax.set_xlim(-1,n+1)
    ax.set_ylim(-1,n+1)
    for i in range(n):
        for j in range(n):
            plt.text(j+.2, n-1-i+.2, str('' if board[i,j]==0 else board[i,j]), fontsize=36, color=col)
       
    if move: plt.title(move)
    plt.savefig('sol/fig' + str(id).zfill(3), facecolor=fig.get_facecolor(), transparent=True)# + '.png', bbox_inches='tight')
    plt.close()

#from matplotlib.pylab import *
from graphviz import Digraph
    
def plot_solution(board, n):
    
    lines = []
    with open('output.txt') as f:
        lines = f.readlines()
    moves = eval(str.strip(str.split(lines[0], ':')[1]))
    board = strToBoard(board, n)
    zero_index = np.where(board==0)
    row, col = zero_index[0][0], zero_index[1][0]
    #ims = []
    #plt.ion()
    #plt.show()
    i = 0
    plot_grid(board, i, n)
    #plt.draw()
    #print row, col
    s = Digraph('board', node_attr={'shape': 'plaintext'}, format='png')
    edges = set([])
    for move in moves:
        print move
        parent, row1, col1 = deepcopy(board), row, col
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
        plot_grid(board, i, n, move)
        
        #s.attr('node', style='filled', color='lightblue2')
        s.attr('node', fontcolor='red')
        s.node(boardToStr(parent), eval(get_board_table(n, boardToStr(parent))))
        s.node(boardToStr(board), eval(get_board_table(n, boardToStr(board))))
        brd, par = boardToStr(board), boardToStr(parent)
        if not (brd, par) in edges and not (par, brd) in edges:
            s.edge(par, brd, label=move)
            edges.add((par, brd)) 
        othermoves = set(['Up', 'Down', 'Left', 'Right']) - set([move])
        s.attr('node', fontcolor='black')
        for omove in othermoves:
            board2, done = deepcopy(parent), False
            if omove == 'Up' and row1 > 0:
                board2[row1-1,col1], board2[row1,col1], done = parent[row1,col1], parent[row1-1,col1], True
            elif omove == 'Down' and row1 < n-1:
                board2[row1+1,col1], board2[row1,col1], done = parent[row1,col1], parent[row1+1,col1], True
            elif omove == 'Left' and col1 > 0:
                board2[row1,col1-1], board2[row1,col1], done = parent[row1,col1], parent[row1,col1-1], True
            elif omove == 'Right' and col1 < n-1:
                board2[row1,col1+1], board2[row1,col1], done = parent[row1,col1], parent[row1,col1+1], True
            if done:
                brd, par = boardToStr(board2), boardToStr(parent)
                s.node(brd, eval(get_board_table(n, brd)))
                if not (brd, par) in edges and not (par, brd) in edges:
                    s.edge(par, brd, label=omove)
                    edges.add((par, brd))        
        #s.view()
        s.render('sol/board' + str(i) + '.gv', view=False)

        #plt.draw()
        #plt.pause(1)
        #plt.ioff()
    plot_grid(board, i, n, None, 'red')
    #plt.show()
        
    # convert -delay 100 -loop 0 *.png sol.gif
    
    #im_ani = animation.ArtistAnimation(fig, ims, interval=100, repeat=False, blit=True)  
    #im_ani.save('pyPLA.gif', writer='imagemagick', fps=30)
    #im_ani.save('pyPLA.mp4', writer='imagemagick', fps=30)
 
        
if len(sys.argv) >= 3:

    method, board = sys.argv[1:3] 
    n = int(np.sqrt(len(str.split(sys.argv[2], ','))))
    print n
    if method == 'bfs':
      bfs(board, n)  
    elif method == 'dfs':
      dfs(board, n)
    elif method == 'ida':
      ida(board, n)
    elif method == 'ast':
      ast(board, n)
      
    plot_solution(board, n)
    
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
# python driver.py ast 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,0,65,67,68,78,69,70,72,73,74,66,75,76,77,79,71,80