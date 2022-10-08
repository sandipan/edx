# -*- coding: utf-8 -*-
"""
Created on Fri Mar 24 11:38:49 2017

@author: Sandipan.Dey
"""

import numpy as np
from pandas import *
from itertools import permutations
from copy import deepcopy
import matplotlib.pylab as plt
import seaborn as sns
from graphviz import Digraph

def get_next_state(state, action):
    return action
    
def q_learning(mdp, gamma, start_state=None, get_next_state=get_next_state, n_episodes=100, exploration=False, epsilon=0.1): # 50000

    S, A, R, G = mdp['S'], mdp['SA'], mdp['R'], mdp['G']
    #Q  = {}
    Q = {(s,a):0 for s in S for a in A[s]}
    episode = 0
    tol = 10**(-6)
    count = 0
    Qs = [Q]
    diffs = []
    if start_state == None:
        start_state = mdp['S']
    while True: # run episodes    
        episode += 1
        print episode
        s_t = start_state[np.random.choice(range(len(start_state)), 1)[0]] # 'B'
        pQ = {k:Q[k] for k in sorted(Q)} 
        iter = 0
        while True:
            _, a_t = max([(Q[s_t, a], a) for a in A[s_t]])
            
            # explore
            if exploration and np.random.rand() <= epsilon:            
                a_t = np.random.choice(A[s_t], 1)[0]
                
            s_t_1, r_t = get_next_state(s_t, a_t), R.get((s_t, a_t), 0) #R[s_t, a_t]
            #print s_t, a_t, s_t_1, r_t, gamma*max([Q[s_t_1, a] for a in A[s_t_1]])
            Q[s_t, a_t] = r_t + gamma* max([Q[s_t_1, a] for a in A[s_t_1]])
            s_t = s_t_1   
            Q = {k:Q[k] for k in sorted(Q)}
            #print Q, Q.keys() == pQ.keys()
            #Qs.append(Q)
            iter += 1
            if s_t in G or iter > 100:
                break
            #if Q.keys() == pQ.keys():
        Qs.append(Q)
        Q_diff = abs(np.linalg.norm(np.fromiter(list(Q.values()), dtype=float) - np.fromiter(list(pQ.values()), dtype=float)))
        print episode, Q_diff
        diffs.append(Q_diff)
        
        if Q_diff < tol and episode > n_episodes:
            if count > 50:  #1000          
                print 'Final episode', episode                    
                break
            else:
                count += 1
        else:
            count = 0
    m = max(Q.values())
    Q = {k:Q[k]*(100./m) for k in Q}
                
    #return Q
    return (Q, diffs, Qs)


def get_room_mdp():
    
    mdp = {} # MDP = (S, s1, A, P, R)
    mdp['S'] = ['A', 'B', 'C', 'D', 'E', 'F'] # states
    mdp['G'] = ['F']
    mdp['A'] = ['A', 'B', 'C', 'D', 'E', 'F']
    mdp['R'] = {('A','E'):0,
                ('B','D'):0, ('B','F'):100,
                ('C','D'):0,
                ('D','B'):0, ('D','C'):0, ('D','E'):0,
                ('E','A'):0, ('E','D'):0, ('E','F'):100,
                ('F','B'):0, ('F','E'):0, ('F','F'):100}    
    mdp['SA'] = {'A':['E'], 'B':['D', 'F'], 'C':['D'], 'D':['B', 'C', 'E'], 'E':['A', 'D', 'F'], 'F':['B','E','F']}
    
    return mdp    

def run_q_learning_room():    
    
    mdp = get_room_mdp()     
    gamma = 0.8 #0.9
    Q = q_learning(mdp, gamma, exploration=True, epsilon=1)
    
    '''
    for iter in range(len(Qs)):
        print iter
        Q = Qs[iter]
        Qdf = DataFrame()
        for k in Q:
            Qdf = Qdf.append(DataFrame({'state':k[0], 'action':k[1], 'value':Q[k]}, columns = ['state', 'action', 'value'], index=[0]))
        Qdf = Qdf.pivot("state", "action", "value").fillna(0)
        #Qdf
        ax = sns.heatmap(Qdf, annot=True, fmt="f", linewidths=.5, cmap="YlGnBu")
        ax.set_title('Q-learning (without exploration): iteration ' + str(iter) + ' gamma=' + str(gamma))
        #ax.set_title('Epsilon Q-learning (with exploration): iteration ' + str(iter) + ' epsilon=' + str(epsilon) + ' gamma=' + str(gamma))
        fig = ax.get_figure()
        fig.savefig("rl/q_no_explore_" + str(iter).zfill(2) + ".png")
        #fig.savefig("rl/q_explore_" + str(iter).zfill(2) + ".png")
        sns.plt.close()
    '''
    
    Qdf = DataFrame()
    for k in Q:
        Qdf = Qdf.append(DataFrame({'state':k[0], 'action':k[1], 'value':Q[k]}, columns = ['state', 'action', 'value'], index=[0]))
    Qdf = Qdf.pivot("state", "action", "value").fillna(0)
    ax = sns.heatmap(Qdf, annot=True, fmt=".2f", linewidths=.5, cmap="YlGnBu")
    ax.set_title('Q-learning')
    fig = ax.get_figure()
    fig.savefig("rl/q_room_final.png")
        
# convert -delay 100 -loop 0 *.png sol.gif

#run_q_learning_room()


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
    return np.reshape(map(int, list(string)), [2,2])

def boardToStr(board):
    return ''.join(map(str, board.flatten().tolist()))

def get_next_state2(state, action):
    if action == 'STAY':
        return state
    nbr = list(deepcopy(state))
    pos = state.find('0')
    if action == 'UP':
        nbr[pos-2],nbr[pos] = nbr[pos],nbr[pos-2]
    elif action == 'DOWN':
        nbr[pos],nbr[pos+2] = nbr[pos+2],nbr[pos]
    elif action == 'LEFT':
        nbr[pos-1],nbr[pos] = nbr[pos],nbr[pos-1]
    elif action == 'RIGHT':
        nbr[pos],nbr[pos+1] = nbr[pos+1],nbr[pos]
    return ''.join(nbr)
    
def get_action(state):
    actions = []
    if state == '0123':
        actions = ['STAY']
    pos = state.find('0')
    if pos == 0:
        actions += ['RIGHT', 'DOWN']
    elif pos == 1:
        actions += ['LEFT', 'DOWN']
    elif pos == 2:
        actions += ['RIGHT', 'UP']
    else:
        actions += ['LEFT', 'UP']
    return actions
    
def get_4puzzle_mdp():
    
    mdp = {} # MDP = (S, s1, A, P, R)
    mdp['S'] = [''.join(p) for p in permutations('0123')] # states
    mdp['G'] = ['0123']
    mdp['A'] = ['UP', 'DOWN', 'LEFT', 'RIGHT', 'STAY']
    mdp['R'] = {s:100 for s in [('0123', 'STAY'), ('1023', 'LEFT'), ('2103', 'UP')]}    
    mdp['SA'] = {s:get_action(s) for s in mdp['S']}
    
    return mdp    
    
def run_q_learning_4puzzle():    
    
    mdp = get_4puzzle_mdp()   
    
    s = Digraph('board', node_attr={'shape': 'plaintext'}, format='png', engine = 'circo')    
    for (state, actions) in mdp['SA'].items():
        s.node(state, eval(get_board_table(2, state)))
        for action in actions:
            state2 = get_next_state2(state, action) 
            s.node(state2, eval(get_board_table(2, state2)))
            s.edge(state, state2, label=action + ':' + str(mdp['R'].get((state, action), 0)))
    s.render('rl/4puzzle', view=False)

    gamma = 0.8 #0.9
    
    start_state = ['0123', '1023', '1320', '1302', '0312', '3012', '3210', '3201', '0231', '2031', '2130', '2103']
    Q1, d, Qs = q_learning(mdp, gamma, start_state, get_next_state2, exploration=True, epsilon=0.9)
    
    for iter in range(len(Qs)):
        print iter
        Q = Qs[iter]
        Qdf = DataFrame()
        for k in Q:
            Qdf = Qdf.append(DataFrame({'state':k[0], 'action':k[1], 'value':Q[k]}, columns = ['state', 'action', 'value'], index=[0]))
        Qdf = Qdf.pivot("state", "action", "value").fillna(0)
        #Qdf
        ax = sns.heatmap(Qdf, annot=True, fmt=".2f", linewidths=.5) #, cmap="YlGnBu")
        ax.set_title('Q-learning (with exploration): episode ' + str(iter) + ' gamma=' + str(gamma))
        plt.yticks(rotation=0)
        #ax.set_title('Epsilon Q-learning (with exploration): iteration ' + str(iter) + ' epsilon=' + str(epsilon) + ' gamma=' + str(gamma))
        fig = ax.get_figure()
        fig.savefig("rl/q_4_puzzle_" + str(iter).zfill(4) + ".png")
        #fig.savefig("rl/q_explore_" + str(iter).zfill(3) + ".png")
        sns.plt.close()
    
    plt.plot(range(len(d)), d, 'r-')
    plt.xlabel('#e')
    plt.ylabel('norm diff of Q between consecutive episodes')
    plt.savefig('rl/norm.png')    
        
    #Q = q_learning(mdp, gamma, get_next_state2, exploration=True, epsilon=1)
    
    Qdf = DataFrame()
    for k in Q1:
        Qdf = Qdf.append(DataFrame({'state':k[0], 'action':k[1], 'value':Q1[k]}, columns = ['state', 'action', 'value'], index=[0]))
    Qdf = Qdf.pivot("state", "action", "value").fillna(0)
    ax = sns.heatmap(Qdf, annot=True, fmt=".2f", linewidths=.5) #, cmap="YlGnBu")
    ax.set_title('Q-learning')
    plt.yticks(rotation=0) 
    fig = ax.get_figure()
    fig.savefig("rl/q_4_puzzle_final.png")

    s = Digraph('board', node_attr={'shape': 'plaintext'}, format='png', engine = 'circo') #'sfdp') # 'neato') #'circo')    
    for (state, actions) in mdp['SA'].items():
        s.node(state, eval(get_board_table(2, state)))
        for action in actions:
            state2 = get_next_state2(state, action) 
            s.node(state2, eval(get_board_table(2, state2)))
            s.edge(state, state2, label=action + ':' + str(round(Q.get((state, action), 0),2)))
    s.render('rl/4puzzle_final', view=False)
    
    state = '0312' #'2031'
    states = [state]
    edges = []
    while state != '0123':
        _, action = max([(Q[state, action], action) for action in mdp['SA'][state]])
        prev = state        
        state = get_next_state2(state, action)
        states.append(state)
        edges.append((prev, state, action))
    
    for i in range(len(edges)+1):
        s = Digraph('board', node_attr={'shape': 'plaintext'}, format='png', engine = 'circo') #'sfdp') # 'neato') #'circo')    
        for (state, actions) in mdp['SA'].items():
            s.node(state, eval(get_board_table(2, state)))
            for action in actions:
                state2 = get_next_state2(state, action) 
                s.node(state2, eval(get_board_table(2, state2)))
                s.edge(state, state2, label=action + ':' + str(round(Q.get((state, action), 0),2)))
        #for state in states:
        #    s.attr('node', style='filled', color='lightgrey', fontcolor='red')
        #    s.node(state)
        n = 0
        for (state, state2, action) in edges:
            if n == i: break
            s.edge(state, state2, label=action, color='red', fontcolor='red')
            n += 1
            
        s.render('rl/4puzzle_path' + str(i) , view=False)
        
    
# convert -delay 100 -loop 0 *.png sol.gif
        
#run_q_learning_4puzzle()

def get_next_state8(state, action):
    #if action == 'STAY':
    #    return state
    nbr = list(deepcopy(state))
    pos = state.find('0')
    if action == 'UP':
        nbr[pos-3],nbr[pos] = nbr[pos],nbr[pos-3]
    elif action == 'DOWN':
        nbr[pos],nbr[pos+3] = nbr[pos+3],nbr[pos]
    elif action == 'LEFT':
        nbr[pos-1],nbr[pos] = nbr[pos],nbr[pos-1]
    elif action == 'RIGHT':
        nbr[pos],nbr[pos+1] = nbr[pos+1],nbr[pos]
    return ''.join(nbr)
    
def get_action8(state):
    actions = []
    #if state == '012345678':
    #    actions = ['STAY']
    pos = state.find('0')
    row, col = pos / 3, pos % 3
    if row > 0:
        actions += ['UP']
    if row < 2:
        actions += ['DOWN']
    if col > 0:
        actions += ['LEFT']
    if col < 2:
        actions += ['RIGHT']
    return actions
    
def get_8puzzle_mdp():
    
    mdp = {} # MDP = (S, s1, A, P, R)
    mdp['S'] = [''.join(p) for p in permutations('012345678')] # states
    mdp['G'] = ['012345678']
    mdp['A'] = ['UP', 'DOWN', 'LEFT', 'RIGHT'] #, 'STAY']
    #mdp['R'] = {s:100 for s in [('0123', 'STAY'), ('1023', 'LEFT'), ('2103', 'UP')]}    
    mdp['SA'] = {s:get_action8(s) for s in mdp['S']}
    
    return mdp  
        
def draw_8_puzzle_graph():
    
    mdp = get_8puzzle_mdp()   
    
    s = Digraph('board', node_attr={'shape': 'plaintext'}, format='png', engine='sfdp')#, engine = 'circo')  
    i = 0
    print len(mdp['SA'].items())
    for (state, actions) in mdp['SA'].items():
        s.node(state, eval(get_board_table(3, state)))
        for action in actions:
            state2 = get_next_state2(state, action) 
            s.node(state2, eval(get_board_table(3, state2)))
            s.edge(state, state2, label=action)
        if i % 1000 == 0: print i
        i += 1
    s.render('rl/8puzzle', view=False)

#draw_8_puzzle_graph()
