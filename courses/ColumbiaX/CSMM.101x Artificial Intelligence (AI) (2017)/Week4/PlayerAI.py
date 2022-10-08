# -*- coding: utf-8 -*-
"""
Created on Sun Mar 05 00:17:06 2017

@author: Sandipan.Dey
"""

from random import randint
from BaseAI import BaseAI
from graphviz import Digraph

MOVES = ['UP', 'DOWN', 'LEFT', 'RIGHT']

class Node:
    
    def __init__(self, grid, type, dir=None):
        self.grid = grid
        self.type = type
        self.dir = dir
        
    def getChildren(self):
        children = []
        if self.type == 'MAX':
            for mov in range(4):
                if self.grid.canMove([mov]):
                    child = Node(self.grid.clone(), 'MIN', mov) #'MAX' if type == 'MIN' else 'MIN')                    
                    child.grid.move(mov)
                    children.append(child)
        else:
            cells = self.grid.getAvailableCells()
            for cell in cells:
                for tileValue in [2,4]:
                    child = Node(self.grid.clone(), 'MAX')    
                    child.grid.setCellValue(cell, tileValue)
                    children.append(child)
        return children
    
    def toStr(self):
        return ','.join(map(str, sum(self.grid.map, [])))

    def get_board_table(self, n=4):
        html = "'''<<table>"
        for i in range(n):
            html += '<tr>'
            for j in range(n):
                html += '<td>'
                html += str(self.grid.map[i][j])
                html += '</td>'            
            html += '</tr>'
        html += "</table>>'''"
        return html
 
class PlayerAI(BaseAI):
    
    def __init__(self, id=0):
        self.id = id
        self.edges = set([])

    '''
    def get_game_tree(grid, depth):
        frontier = []
        d = {}
        frontier.append(initialState)
        d[initialState] = 0
            
        while len(frontier) > 0:
        	state = frontier.pop(0)
        	for nbr in neighbors(state):
        		frontier.append(nbr)
        		d[nbr] = d[state] + 1
    '''
       
    def isLeaf(self, node):
       return not node.grid.canMove()

    def evaluate(self, node): # heuristic
       monotonicity = 0
       sidewise = 0
       grid = node.grid
       size = len(grid.map)
       value_weights = {}
       start_weight = 64 #256.
       value_weights[0] = 0
       for i in [1 << i for i in range(12,0,-1)]:
           value_weights[i] = start_weight
           start_weight /= 2.
       #corner_max, el_max, set_max = 0, max(max(grid.map)), set([])
       freq = {(1<<i): 0 for i in range(12,0,-1)}
       freq[0] = 0
       for i in range(size):
           s_inc, s_dec = 0, 0
           sidewise1 = False
           #s_inc_dec = 0
           freq[grid.map[i][0]] +=  1
           for j in range(1,size):
               #s_inc_dec += (grid.map[i][j-1] >= grid.map[i][j]) if i % 2 == 0 else  (grid.map[i][j-1] <= grid.map[i][j])
               s_inc += (grid.map[i][j-1] >= grid.map[i][j])
               s_dec += (grid.map[i][j-1] <= grid.map[i][j])
               sidewise1 |= (grid.map[i][j-1] == grid.map[i][j])
               freq[grid.map[i][j]] +=  1
               #if (grid.map[i][j-1]==el_max):
               #    set_max.add((i,j-1))
               #if (grid.map[i][j]==el_max):
               #    set_max.add((i,j))
           #monotonicity += (s_inc_dec == size - 1)
           #monotonicity += (s_inc == size - 1)
           monotonicity += (s_inc == size - 1 or s_dec == size - 1)
           sidewise += sidewise1
       #corner_max = (len(set_max - set([(0,0),(0,size-1),(size-1,0),(size-1,size-1)])) == 0)
       for j in range(size):
           s_inc, s_dec = 0, 0
           sidewise1 = False
           #s_inc_dec = 0
           for i in range(1,size):
               #s_inc_dec += (grid.map[i-1][j] >= grid.map[i][j]) if j % 2 == 0 else (grid.map[i-1][j] <= grid.map[i][j]) 
               s_inc += (grid.map[i-1][j] >= grid.map[i][j])
               s_dec += (grid.map[i-1][j] <= grid.map[i][j])
               sidewise1 |= (grid.map[i-1][j] == grid.map[i][j])
           #monotonicity += (s_inc_dec == size - 1)
           #monotonicity += (s_inc == size - 1)
           monotonicity += (s_inc == size - 1 or s_dec == size - 1)
           sidewise += sidewise1
       free_cells = len(grid.getAvailableCells())
       weighted_value = sum([value_weights[i]*freq[i] for i in freq])
       return monotonicity + 2*free_cells + sidewise + 2*weighted_value # corner_max
    
    def minimaxWithAlphaBetaPruning(self, node, depth, alpha, beta, path, s): 
        
       if self.isLeaf(node) or depth==0:
           return (self.evaluate(node), path)
           
       children = node.getChildren()            
       
       if node.type == 'MAX': # node is a max node
       
           alpha = float('-inf')
           dir = None           
           for child in children: #each child of node
             nstr, cstr = node.toStr(), child.toStr()
             s.node(nstr, eval(node.get_board_table()))
             s.node(cstr, eval(child.get_board_table()))
             if not (nstr, cstr) in self.edges:
                 s.edge(nstr, cstr, label='Player: ' + MOVES[child.dir])
             s.render('sol/board' + str(self.id), view=False)
             self.id += 1
             self.edges.add((nstr, cstr))

             cur_alpha, path = self.minimaxWithAlphaBetaPruning(child, depth - 1, alpha, beta, path, s)
             if cur_alpha > alpha:
                alpha, dir = cur_alpha, child.dir 
             if beta <= alpha:
                break # beta cut-off 
           path[depth-1] = dir      
           return (alpha, path)
           
       else: #if node.type == 'MIN': #node is a min node
       
          beta = float('inf')
          for child in children: #each child of node
          
             nstr, cstr = node.toStr(), child.toStr()
             s.node(nstr, eval(node.get_board_table()))
             s.node(cstr, eval(child.get_board_table()))
             if not (nstr, cstr) in self.edges:
                 s.edge(nstr, cstr, label='Computer')
             s.render('sol/board' + str(self.id), view=False)
             self.id += 1
 
             cur_beta, path = self.minimaxWithAlphaBetaPruning(child, depth - 1, alpha, beta, path, s)
             beta = min(cur_beta, beta) 
             if beta <= alpha:
                break # alppha cut-off                 
          return (beta, path)
              
    def getMove(self, grid):

        #moves = grid.getAvailableMoves()
        #print 'here:', self.minimaxWithAlphaBetaPruning(Node(grid, 'MAX'), 3, float('-inf'), float('inf'), [None]*3)
        #return moves[randint(0, len(moves) - 1)] if moves else None
        s = Digraph('board', node_attr={'shape': 'plaintext'}, format='jpg')
        max_depth = 3
        value, path = self.minimaxWithAlphaBetaPruning(Node(grid, 'MAX'), max_depth, float('-inf'), float('inf'), [None]*max_depth, s)
        #print 'here', dir
        return path[max_depth-1]