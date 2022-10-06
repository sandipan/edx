"""
Tic Tac Toe Player
"""

import math
import numpy as np
from copy import deepcopy

X = "X"
O = "O"
EMPTY = None

U = {X:+1, O:-1, None:0}

def initial_state():
    """
    Returns starting state of the board.
    """
    return [[EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY]]


def player(board):
    """
    Returns player who has the next turn on a board.
    """
    return X if np.sum(np.ravel(board) == EMPTY) % 2 else O
    #raise NotImplementedError


def actions(board):
    """
    Returns set of all possible actions (i, j) available on the board.
    """
    return set(zip(*np.where(np.array(board) == EMPTY)))
    #raise NotImplementedError


def result(board, action):
    """
    Returns the board that results from making move (i, j) on the board.
    """
    i, j = action
    if i < 0 or i > 2 or j < 0 or j > 2 or board[i][j] != EMPTY:
       raise
    new_board = deepcopy(board) #board.copy()
    new_board[i][j] = player(new_board)
    return new_board	
    #raise NotImplementedError


def winner(board):
    """
    Returns the winner of the game, if there is one.
    """
    for i in range(3):
        if board[i][2] != EMPTY and board[i][0] == board[i][1] and board[i][1] == board[i][2]:
           return board[i][2]
        if board[2][i] != EMPTY and board[0][i] == board[1][i] and board[1][i] == board[2][i]:
           return board[2][i]
    if board[2][2] != EMPTY and board[0][0] == board[1][1] and board[1][1] == board[2][2]:
        return board[1][1]
    if board[0][2] != EMPTY and board[0][2] == board[1][1] and board[1][1] == board[2][0]:
        return board[1][1]
    return None
    #raise NotImplementedError


def terminal(board):
    """
    Returns True if game is over, False otherwise.
    """
    return winner(board) != None or len(actions(board)) == 0
    #raise NotImplementedError


def utility(board):
    """
    Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
    """
    return U[winner(board)]
    #raise NotImplementedError

def max_value(board):
    if terminal(board):
       return utility(board), None
    v, a = -np.inf, None
    for action in actions(board):
        m, _ = min_value(result(board, action))
        if m > v:
           v, a = m, action        
    return (v, a)       
	
def min_value(board):
    if terminal(board):
       return utility(board), None
    v, a = np.inf, None
    for action in actions(board):
        m, _ = max_value(result(board, action))
        if m < v:
           v, a = m, action         
    return (v, a)       
	
def max_value_alpha_beta(board, alpha, beta):
    if terminal(board):
       return utility(board), None
    v, a = -np.inf, None
    for action in actions(board):
        m, _ = min_value_alpha_beta(result(board, action), alpha, beta)
        if m > v:
           v, a = m, action   
        alpha = max(alpha, v)
        if alpha >= beta:
           break		   
    return (v, a)       
	
def min_value_alpha_beta(board, alpha, beta):
    if terminal(board):
       return utility(board), None
    v, a = np.inf, None
    for action in actions(board):
        m, _ = max_value_alpha_beta(result(board, action), alpha, beta)
        if m < v:
           v, a = m, action 
        beta = min(beta, v)
        if alpha >= beta:
           break
    return (v, a)       
	
def minimax(board):
    """
    Returns the optimal action for the current player on the board.
    """
    if terminal(board):
       return None
    cur_player = player(board)
    if cur_player == X:
       #_, a = max_value(board)  
       _, a = max_value_alpha_beta(board, -np.inf, np.inf)  
    elif cur_player == O:
       #_, a = min_value(board)
       _, a = min_value_alpha_beta(board, -np.inf, np.inf)
    return a	   
    #raise NotImplementedError
