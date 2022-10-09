#!/usr/bin/env python
# inference.py
# Base code by George H. Chen (georgehc@mit.edu) -- updated 10/18/2016
import collections
import sys

import graphics
import numpy as np
import robot


# Throughout the code, we use these variables.
# Do NOT change these (but you'll need to use them!):
# - all_possible_hidden_states: a list of possible hidden states
# - all_possible_observed_states: a list of possible observed states
# - prior_distribution: a distribution over states
# - transition_model: a function that takes a hidden state and returns a
#     Distribution for the next state
# - observation_model: a function that takes a hidden state and returns a
#     Distribution for the observation from that hidden state
all_possible_hidden_states = robot.get_all_hidden_states()
all_possible_observed_states = robot.get_all_observed_states()
prior_distribution = robot.initial_distribution()
transition_model = robot.transition_model
observation_model = robot.observation_model


# You may find this function helpful for computing logs without yielding a
# NumPy warning when taking the log of 0.
def careful_log(x):
    # computes the log of a non-negative real number
    if x == 0:
        return -np.inf
    else:
        return np.log(x)


def get_all_valid_states(state):
    states = []    
    x, y, action = state
    for a in ['left', 'right', 'up', 'down', 'stay']:
       states += [(x, y, a)]            
       states += [(x+1, y, a)]            
       states += [(x-1, y, a)]            
       states += [(x, y+1, a)]            
       states += [(x, y-1, a)]            
    return states

GRID_WIDTH = 12
GRID_HEIGHT = 8
    
# -----------------------------------------------------------------------------
# Functions for you to implement
#

def forward_backward(observations):
    """
    Input
    -----
    observations: a list of observations, one per hidden state
        (a missing observation is encoded as None)

    Output
    ------
    A list of marginal distributions at each time step; each distribution
    should be encoded as a Distribution (see the Distribution class in
    robot.py and see how it is used in both robot.py and the function
    generate_data() above, and the i-th Distribution should correspond to time
    step i
    """

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE
    #

    num_time_steps = len(observations)
    forward_messages = [None] * num_time_steps
    forward_messages[0] = prior_distribution

    # TODO: Compute the forward messages
    #print 'here', len(observations), num_time_steps, prior_distribution #observation_model((5,4,'stay')) #forward_messages[0]#, transition_model((10,10,'stay'))
    
    for i in range(1, num_time_steps):
       forward_messages[i] = {}
       y_i_1 = observations[i-1]
       for x_i_1 in forward_messages[i-1]:
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           for x_i in trans_probs:
               forward_messages[i][x_i] = forward_messages[i].get(x_i, 0) + (obs_probs[y_i_1] if y_i_1 else 1)*trans_probs[x_i]*forward_messages[i-1][x_i_1]
       forward_messages[i] = robot.Distribution(forward_messages[i])
       forward_messages[i].renormalize()

    #k = 3
    #print observations[k-1], [(key, forward_messages[k][key]) for key in forward_messages[k] if forward_messages[k][key] != 0]  
    
    backward_messages = [None] * num_time_steps
    backward_messages[num_time_steps-1] = robot.Distribution({state:1. for state in all_possible_hidden_states})
    backward_messages[num_time_steps-1].renormalize()
    #print backward_messages[num_time_steps-1]
    # TODO: Compute the backward messages
    for i in range(num_time_steps-2, -1, -1):
       backward_messages[i] = {}
       y_i_1 = observations[i+1]
       for x_i_1 in backward_messages[i+1]:
           obs_probs = observation_model(x_i_1)
           #valid_states = filter(lambda(x): abs(x[0]-x_i_1[0]) + abs(x[1]-x_i_1[1]) <= 1, all_possible_hidden_states)
           #valid_states = get_all_valid_states(x_i_1)
           #valid_states = [(x, y, 'stay'),(x, y, 'left'),(x, y, 'right'),(x, y, 'up'),(x, y, 'down'), (x+1, y, 'left'), (x+1, y, 'stay'), (x-1, y, 'right'), (x-1, y, 'stay'),(x, y+1, 'up'),(x, y+1, 'stay'),(x, y-1, 'down'),(x, y-1, 'stay')]
           x, y, action = x_i_1
           valid_states = [(x, y, 'stay'),(x, y, 'left'),(x, y, 'right'),(x, y, 'up'),(x, y, 'down')]
           if x < GRID_WIDTH - 1:
              valid_states.append((x+1, y, 'left'))
              valid_states.append((x+1, y, 'stay'))
           if x > 0:
              valid_states.append((x-1, y, 'right'))
              valid_states.append((x-1, y, 'stay'))
           if y < GRID_HEIGHT - 1:
              valid_states.append((x, y+1, 'up'))
              valid_states.append((x, y+1, 'stay'))
           if y > 0:
              valid_states.append((x, y-1, 'down'))
              valid_states.append((x, y-1, 'stay'))
           #print x_i_1, valid_states
           for x_i in valid_states:
               trans_probs = transition_model(x_i)
               backward_messages[i][x_i] = backward_messages[i].get(x_i, 0) + (obs_probs[y_i_1] if y_i_1 else 1)*trans_probs[x_i_1]*backward_messages[i+1][x_i_1]
       #print i, backward_messages[i]
       backward_messages[i] = robot.Distribution(backward_messages[i])
       backward_messages[i].renormalize()
       
    #k = 3
    #print observations[k-1], [(key, backward_messages[k][key]) for key in backward_messages[k] if backward_messages[k][key] != 0]  

    marginals = [None] * num_time_steps # remove this
    # TODO: Compute the marginals 
    for i in range(1, len(observations)+1):
        y_i_1 = observations[i-1]
        marginals[i-1] = {}
        for x_i_1 in forward_messages[i-1]:
            marginals[i-1][x_i_1] = forward_messages[i-1][x_i_1] * backward_messages[i-1][x_i_1] * (observation_model(x_i_1)[y_i_1] if y_i_1 else 1)
        marginals[i-1] = robot.Distribution(marginals[i-1])
        marginals[i-1].renormalize()

    #k = 3
    #print observations[k-1], [(key, marginals[k][key]) for key in marginals[k] if marginals[k][key] != 0]  
    
    #k = 99
    #print observations[k-1], [(key, marginals[k][key]) for key in marginals[k] if marginals[k][key] != 0]  
    #print marginals[99].get_mode()
    
    import matplotlib.pyplot as plt
    plt.style.use('ggplot')
    colours = {"stay": [1,0,0,0], "left": [0,1,0,0], "right": [0,0,1,0], "up":[1,1,0,0], "down":[0,1,1,0]}
    #colours = ['b','g','r', 'c', 'k']

    plt.figure(figsize=(8,8))
    
    k = 2
    xs, ys, rgbas, sz = [], [], [], []
    for (key, val) in marginals[k].items():
       if val != 0:
           x, y, rgba = key[0], key[1], colours[key[2]]
           plt.arrow(x, y, 0, 0)    
           rgba[3] = val
           xs, ys, rgbas = xs + [x], ys + [y], rgbas + [rgba]
           sz += [int(200*val)]
    print xs
    print ys
    print rgbas
    #plt.grid(True, color='w', linestyle='-', linewidth=2)
    #plt.gca().patch.set_facecolor('0.8')
    
    #plt.xlim([0, max(xs)+1]) # the xlim value I would like to set
    #plt.ylim([0, max(ys)+1]) # the xlim value I would like to set
    #plt.scatter(xs, ys, color=np.array(rgbas), s=sz, marker='o', edgecolors='k') #, markersize=int(weight/4))
    #plt.legend()
    plt.show()
       
    
    return marginals


def Viterbi(observations):
    """
    Input
    -----
    observations: a list of observations, one per hidden state
        (a missing observation is encoded as None)

    Output
    ------
    A list of esimated hidden states, each encoded as a tuple
    (<x>, <y>, <action>)
    """

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE
    #


    num_time_steps = len(observations)
    estimated_hidden_states = [None] * num_time_steps # remove this
    messages = [None] * num_time_steps
    traces = [None] * num_time_steps
    messages[0] = prior_distribution
    for i in range(1, num_time_steps):
       messages[i], traces[i] = {}, {}
       y_i_1 = observations[i-1]
       for x_i_1 in messages[i-1]:
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           for x_i in trans_probs:
               cur_val = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i]) + messages[i-1][x_i_1]
               if messages[i].get(x_i, np.Inf) > cur_val:
                   messages[i][x_i], traces[i][x_i] = cur_val, x_i_1
       #messages[i] = robot.Distribution(messages[i])
       #messages[i].renormalize()
    #print 'here', observations[num_time_steps-1], messages[num_time_steps-1]
    estimated_hidden_states[num_time_steps-1] = min([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + messages[num_time_steps-1][x_n_1], x_n_1) for x_n_1 in messages[num_time_steps-1]])[1]
    for i in range(num_time_steps - 1, 0, -1):
       estimated_hidden_states[i-1] = traces[i][estimated_hidden_states[i]]
       
    return estimated_hidden_states


def second_best(observations):
    """
    Input
    -----
    observations: a list of observations, one per hidden state
        (a missing observation is encoded as None)

    Output
    ------
    A list of esimated hidden states, each encoded as a tuple
    (<x>, <y>, <action>)
    """

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE
    #

    num_time_steps = len(observations)
    messages = [None] * num_time_steps
    messages2 = [None] * num_time_steps
    traces = [None] * num_time_steps
    traces2 = [None] * num_time_steps
    messages[0] = prior_distribution
    messages2[0] = prior_distribution
    for i in range(1, num_time_steps):
       messages[i], messages2[i], traces[i], traces2[i] = {}, {}, {}, {}
       y_i_1 = observations[i-1]
       for x_i_1 in messages[i-1]:
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           for x_i in trans_probs:
               cur_val = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i]) + messages[i-1][x_i_1]
               if messages[i].get(x_i, np.Inf) > cur_val:
                   messages2[i][x_i], messages[i][x_i], traces2[i][x_i], traces[i][x_i] = messages[i].get(x_i, np.inf), cur_val, traces[i].get(x_i, None), x_i_1
       
    best_path = [None] * num_time_steps # remove this
    if len(messages[num_time_steps-1]) > 1:
        (_,best_path[num_time_steps-1]), (_,x_i) = sorted([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + messages[num_time_steps-1][x_n_1], x_n_1) for x_n_1 in messages[num_time_steps-1]])[:2]
    else:
        best_path[num_time_steps-1], x_i = min([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + messages[num_time_steps-1][x_n_1], x_n_1) for x_n_1 in messages[num_time_steps-1]])[1], None
        
    for i in range(num_time_steps - 1, 0, -1):
       best_path[i-1] = traces[i][best_path[i]] 
    
    paths = {}      
        
    if x_i:    
        
        cur_path = [None] * num_time_steps # remove this
        weight = 0.0
        cur_path[num_time_steps-1] = x_i # 1 path with 2nd optimal last state
        for i in range(num_time_steps - 1, 0, -1):
           cur_path[i-1] = traces[i][cur_path[i]]
           #weight += messages[i][cur_path[i]] #- messages[i][best_path[i]]
           x_i, x_i_1, y_i_1 = cur_path[i], cur_path[i-1], observations[i-1]
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           weight +=  -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i])      
           if cur_path[i-1] == best_path[i-1]: # joining the best path
              break
        if i > 0:
            cur_path = best_path[:i-1] + cur_path[i-1:]
        paths[weight] = cur_path #deepcopy(cur_path)
        
    for j in range(num_time_steps-2,0,-1): # n-1 paths   
        
        cur_path = [None] * num_time_steps # remove this
        cur_path[j+1:] = best_path[j+1:]
        cur_path[j] = traces2[j+1][best_path[j+1]]
        if not cur_path[j]:
           continue
        x_i, x_i_1, y_i_1 = cur_path[j+1], cur_path[j], observations[j]
        trans_probs = transition_model(x_i_1)
        obs_probs = observation_model(x_i_1)
        weight = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i])      
        #left = True # whether cur_path left the best path           
        for i in range(j, 0, -1):
           cur_path[i-1] = traces[i][cur_path[i]]
           #weight += messages[i][cur_path[i]] #- messages[i][best_path[i]]
           x_i, x_i_1, y_i_1 = cur_path[i], cur_path[i-1], observations[i-1]
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           weight += -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i])      
           if cur_path[i-1] == best_path[i-1]: # joining the best path
              break
        if i > 0:
            cur_path = best_path[:i-1] + cur_path[i-1:]
        if j - i > 1:
            #print 'here', i, j, weight
            paths[weight] = cur_path #deepcopy(cur_path)
    
    
    for weight in sorted(paths):
        print 'here1', weight, paths[weight]
    
    print best_path
    
    '''
    import matplotlib.pyplot as plt
    plt.style.use('ggplot')
    #colours = {"stay": "b", "left": "g", "right": "r", "up":"c", "down":"k"}
    colours = ['b','g','r', 'c', 'k']

    plt.figure(figsize=(8,8))
    plt.xlim([-1, 12]) # the xlim value I would like to set
    plt.ylim([-1, 8]) # the xlim value I would like to set

    i = 0
    for weight in sorted(paths):
       x, y, state = [], [], []
       for p in paths[weight]:
           #x, y, state = x + [p[0]], y + [p[1]], state + [colours[p[2]]]
           x, y, col = x + [p[0]], y + [p[1]], i
       #print x, y
       print col
       plt.plot(x, y, color=colours[col], marker='o', label=str(weight))#, markersize=int(weight/4))
       plt.legend()
       i += 1
       
    plt.show()
    '''

    import matplotlib.pyplot as plt
    plt.style.use('ggplot')
    #colours = {"stay": "b", "left": "g", "right": "r", "up":"c", "down":"k"}
    colours = ['b','g','r', 'c', 'k']

    plt.figure(figsize=(8,8))
    
    Y = 1

    plt.xlim([-1, len(best_path)])
    plt.ylim([Y-1, Y+8])

    plt.plot(range(len(best_path)), [Y]*len(best_path), color=colours[0], marker='o', label='best')#, markersize=int(weight/4))
    plt.legend()
    
    from random import random
    
    col = 1
    for weight in sorted(paths):
       p = paths[weight] 
       x, y = [], []
       for i in range(len(p)):
          if p[i] == best_path[i] and (i + 1 < len(p) and p[i+1] != best_path[i+1]):
              x = x + [i]
              y = y + [Y]               
          if (i > 0 and p[i-1] != best_path[i-1]) and p[i] == best_path[i]:
              x = x + [i]
              y = y + [Y]               
          if p[i] != best_path[i]:           
              x = x + [i]
              y = y + [1 + (int(p[i][0]) + int(p[i][1])) % 3 + 4*random()]
       plt.plot(x, y, color=colours[col], marker='o', label=str(weight)) #, markersize=int(weight/4))
       plt.legend()
       col += 1
    plt.xlabel('timestep')
    plt.show()
       
    # for weight in sorted(paths):
    #    print weight, paths[weight]
        
    sec_best_path = min([(w,p) for (w,p) in paths.items()])[1] #paths[paths.keys()[i]] #

    return sec_best_path


'''
def second_best(observations):
    """
    Input
    -----
    observations: a list of observations, one per hidden state
        (a missing observation is encoded as None)

    Output
    ------
    A list of esimated hidden states, each encoded as a tuple
    (<x>, <y>, <action>)
    """

    # -------------------------------------------------------------------------
    # YOUR CODE GOES HERE
    #

    num_time_steps = len(observations)
    messages = [None] * num_time_steps
    messages2 = [None] * num_time_steps
    traces = [None] * num_time_steps
    traces2 = [None] * num_time_steps
    messages[0] = prior_distribution
    messages2[0] = prior_distribution
    for i in range(1, num_time_steps):
       messages[i], messages2[i], traces[i], traces2[i] = {}, {}, {}, {}
       y_i_1 = observations[i-1]
       for x_i_1 in messages[i-1]:
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           for x_i in trans_probs:
               cur_val = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i]) + messages[i-1][x_i_1]
               if messages[i].get(x_i, np.Inf) > cur_val:
                   messages2[i][x_i], messages[i][x_i], traces2[i][x_i], traces[i][x_i] = messages[i].get(x_i, np.inf), cur_val, traces[i].get(x_i, None), x_i_1
       #messages[i] = robot.Distribution(messages[i])
       #messages[i].renormalize()
       #messages2[i] = robot.Distribution(messages2[i])
       #messages2[i].renormalize()
       
    #print 'here', observations[num_time_steps-1], messages[num_time_steps-1]
    best_path = [None] * num_time_steps # remove this
    if len(messages[num_time_steps-1]) > 1:
        (_,best_path[num_time_steps-1]), (_,x_i) = sorted([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + messages[num_time_steps-1][x_n_1], x_n_1) for x_n_1 in messages[num_time_steps-1]])[:2]
    else:
        best_path[num_time_steps-1], x_i = min([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + messages[num_time_steps-1][x_n_1], x_n_1) for x_n_1 in messages[num_time_steps-1]])[1], None
        
    for i in range(num_time_steps - 1, 0, -1):
       best_path[i-1] = traces[i][best_path[i]] 
    
    #from copy import deepcopy
    paths = {}      
        
    if x_i:    
        
        #print 'here', x_i         
        cur_path = [None] * num_time_steps # remove this
        weight = 0.0
        cur_path[num_time_steps-1] = x_i # 1 path with 2nd optimal last state
        #indicator = ['no'] * num_time_steps # indicate whether cur_path on the best path
        for i in range(num_time_steps - 1, 0, -1):
           cur_path[i-1] = traces[i][cur_path[i]]
           #weight += messages[i][cur_path[i]] #- messages[i][best_path[i]]
           x_i, x_i_1, y_i_1 = cur_path[i], cur_path[i-1], observations[i-1]
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           weight +=  -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i])      
           if cur_path[i-1] == best_path[i-1]: # joining the best path
              break
        if i > 0:
            cur_path = best_path[:i-1] + cur_path[i-1:]
        #print 'here', i, weight
        paths[weight] = cur_path #deepcopy(cur_path)
        
    for j in range(num_time_steps-2,0,-1): # n-1 paths   
        
        cur_path = [None] * num_time_steps # remove this
        cur_path[j+1:] = best_path[j+1:]
        cur_path[j] = traces2[j+1][best_path[j+1]]
        if not cur_path[j]:
           continue
        #weight = messages2[j+1][best_path[j+1]] #- messages[j+1][best_path[j+1]]
        x_i, x_i_1, y_i_1 = cur_path[j+1], cur_path[j], observations[j]
        trans_probs = transition_model(x_i_1)
        obs_probs = observation_model(x_i_1)
        weight = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i])      
        #left = True # whether cur_path left the best path           
        for i in range(j, 0, -1):
           cur_path[i-1] = traces[i][cur_path[i]]
           #weight += messages[i][cur_path[i]] #- messages[i][best_path[i]]
           x_i, x_i_1, y_i_1 = cur_path[i], cur_path[i-1], observations[i-1]
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           weight += -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i])      
           if cur_path[i-1] == best_path[i-1]: # joining the best path
              break
        if i > 0:
            cur_path = best_path[:i-1] + cur_path[i-1:]
        if j - i > 1:
            #print 'here', i, j, weight
            paths[weight] = cur_path #deepcopy(cur_path)
    
        #for i in range(num_time_steps - 1, 0, -1):
        #   if messages2[i][best_path[i]] <= messages[i][cur_path[i]]: # (re-)joining the best path
        #       cur_path[i], cur_path[i-1] = best_path[i], traces2[i][best_path[i]]
        #       if left:                  
        #          break
        #   else:
        #       cur_path[i-1] = traces[i][cur_path[i]]
        #       if not left:
        #           left = True
        #   if left:            
        #       weight += messages[i][cur_path[i]]

        
        #print indicator
    
    for weight in sorted(paths):
        print weight, paths[weight]

    #print best_path
    #print(max([(w,p) for (w,p) in paths.items()])[0])
    #i = 5
    #print paths.keys()[i]
    #sec_best_path = [None] * num_time_steps # remove this
    sec_best_path = min([(w,p) for (w,p) in paths.items()])[1] #paths[paths.keys()[i]] #
    #print sec_best_path

    #print [i for i in range(len(best_path)) if estimated_states[i] != sec_best_path[i]]    

    return sec_best_path
        
    #second_best_procedure
    #A_trellis - ordinary Vitterbi
    #B_trellis - for second_best
    num_time_steps = len(observations)
    A_trellis = [None] * num_time_steps # ordinary viterbi
    B_trellis = [None] * num_time_steps # 2nd best
    A_trellis[0] = {x_i:[(prior_distribution[x_i], None),(prior_distribution[x_i], None)] for x_i in prior_distribution}
    for i in range(1, num_time_steps):
       A_trellis[i] = {}
       y_i_1 = observations[i-1]
       for x_i_1 in A_trellis[i-1]:
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           for x_i in trans_probs:
               cur_val = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i]) + A_trellis[i-1][x_i_1][0][0]
               if A_trellis[i].get(x_i, [(np.Inf, None),(np.Inf, None)])[0][0] > cur_val:
                   A_trellis[i][x_i] = [(cur_val, x_i_1), (A_trellis[i].get(x_i, [(None,None), (cur_val, x_i_1)])[1])]
    #A_trellis[num_time_steps-1] = sorted([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + messages[num_time_steps-1][x_n_1], x_n_1) for x_n_1 in messages[num_time_steps-1]])[:2]
    print A_trellis[1]
    
    # function second best returns for all_possible_states second_best_message and backpointers for it.
    #B_trellis[0] = {x_i:A_trellis[0][x_i][1] for x_i in A_trellis[0]}
    merge_points = []
    B_trellis[0] = {x_i:(prior_distribution[x_i], None) for x_i in prior_distribution}
    # main loop
    for i in range(1, num_time_steps):
       B_trellis[i] =  {}
       y_i_1 = observations[i-1]
       for x_i_1 in B_trellis[i-1]:
           trans_probs = transition_model(x_i_1)
           obs_probs = observation_model(x_i_1)
           for x_i in trans_probs:
               cur_val = -careful_log(obs_probs[y_i_1] if y_i_1 else 1) - careful_log(trans_probs[x_i]) + B_trellis[i-1][x_i_1][0]
               if B_trellis[i].get(x_i, (np.Inf, None))[0] > cur_val:
                   B_trellis[i][x_i] = (cur_val, x_i_1)
               if (A_trellis[i].get(x_i, None) != None) and (A_trellis[i][x_i][1][0] < B_trellis[i][x_i][0]):
                   B_trellis[i][x_i] = A_trellis[i][x_i][1] 
                   #record merge point
                   merge_points += [i] 
                 
    print B_trellis[1]
    #B_trellis[num_time_steps-1] = sorted([(-careful_log(observation_model(x_n_1)[observations[num_time_steps-1]]) + B_trellis[num_time_steps-1][x_n_1][0], x_n_1) for x_n_1 in B_trellis[num_time_steps-1]])

    print merge_points    

    for i in range(num_time_steps-1, -1, -1):
        if A_trellis[i][] < min(B_trellis[num_time_steps-1]):
            last_state = argmin(A_trellis[last_node].second_best())
            return by A_backpointers
        else
            last_state = argmin(B_trellis[last_node])
            return by B_backpointers, at first merge with A_trellis continue on it.       
    '''
    


# -----------------------------------------------------------------------------
# Generating data from the hidden Markov model
#

def generate_data(num_time_steps, make_some_observations_missing=False,
                  random_seed=None):
    # generate samples from this project's hidden Markov model
    hidden_states = []
    observations = []

    # if the random seed is not None, then this makes the randomness
    # deterministic, which may be helpful for debug purposes
    np.random.seed(random_seed)

    # draw initial state and emit an observation
    initial_state = prior_distribution.sample()
    initial_observation = observation_model(initial_state).sample()

    hidden_states.append(initial_state)
    observations.append(initial_observation)

    for time_step in range(1, num_time_steps):
        # move the robot
        prev_state = hidden_states[-1]
        new_state = transition_model(prev_state).sample()

        # maybe emit an observation
        if not make_some_observations_missing:
            new_observation = observation_model(new_state).sample()
        else:
            if np.random.rand() < .1:  # 0.1 prob. of observation being missing
                new_observation = None
            else:
                new_observation = observation_model(new_state).sample()

        hidden_states.append(new_state)
        observations.append(new_observation)

    return hidden_states, observations


# -----------------------------------------------------------------------------
# Main
#

def main():
    # flags
    make_some_observations_missing = False
    use_graphics = True
    need_to_generate_data = True

    # parse command line arguments
    for arg in sys.argv[1:]:
        if arg == '--missing':
            make_some_observations_missing = True
        elif arg == '--nographics':
            use_graphics = False
        elif arg.startswith('--load='):
            filename = arg[7:]
            hidden_states, observations = robot.load_data(filename)
            need_to_generate_data = False
            num_time_steps = len(hidden_states)

    # if no data is loaded, then generate new data
    if need_to_generate_data:
        num_time_steps = 100
        hidden_states, observations = \
            generate_data(num_time_steps,
                          make_some_observations_missing)

    print('Running forward-backward...')
    marginals = forward_backward(observations)
    print("\n")

    timestep = 2
    print("Most likely parts of marginal at time %d:" % (timestep))
    if marginals[timestep] is not None:
        print(sorted(marginals[timestep].items(),
                     key=lambda x: x[1],
                     reverse=True)[:10])
    else:
        print('*No marginal computed*')
    print("\n")

    print('Running Viterbi...')
    estimated_states = Viterbi(observations)
    print("\n")

    print("Last 10 hidden states in the MAP estimate:")
    for time_step in range(num_time_steps - 10 - 1, num_time_steps):
        if estimated_states[time_step] is None:
            print('Missing')
        else:
            print(estimated_states[time_step])
    print("\n")
    
    '''
    print('Finding second-best MAP estimate...')
    estimated_states2 = second_best(observations)
    print("\n")

    print("Last 10 hidden states in the second-best MAP estimate:")
    for time_step in range(num_time_steps - 10 - 1, num_time_steps):
        if estimated_states2[time_step] is None:
            print('Missing')
        else:
            print(estimated_states2[time_step])
    print("\n")

    difference = 0
    difference_time_steps = []
    for time_step in range(num_time_steps):
        if estimated_states[time_step] != hidden_states[time_step]:
            difference += 1
            difference_time_steps.append(time_step)
    print("Number of differences between MAP estimate and true hidden " +
          "states:", difference)
    if difference > 0:
        print("Differences are at the following time steps: " +
              ", ".join(["%d" % time_step
                         for time_step in difference_time_steps]))
    print("\n")

    difference = 0
    difference_time_steps = []
    for time_step in range(num_time_steps):
        if estimated_states2[time_step] != hidden_states[time_step]:
            difference += 1
            difference_time_steps.append(time_step)
    print("Number of differences between second-best MAP estimate and " +
          "true hidden states:", difference)
    if difference > 0:
        print("Differences are at the following time steps: " +
              ", ".join(["%d" % time_step
                         for time_step in difference_time_steps]))
    print("\n")

    difference = 0
    difference_time_steps = []
    for time_step in range(num_time_steps):
        if estimated_states[time_step] != estimated_states2[time_step]:
            difference += 1
            difference_time_steps.append(time_step)
    print("Number of differences between MAP and second-best MAP " +
          "estimates:", difference)
    if difference > 0:
        print("Differences are at the following time steps: " +
              ", ".join(["%d" % time_step
                         for time_step in difference_time_steps]))
    print("\n")
    '''
    #print 'here', second_best([(8, 2), (8, 1), (10, 0), (10, 0), (10, 1), (11, 0), (11, 0), (11, 1), (11, 2), (11, 2)])
    print 'here', second_best([(1, 4), (1, 5), (1, 5), (1, 6), (0, 7), (1, 7), (3, 7), (4, 7), (4, 7), (4, 7)])
    
    # display
    if use_graphics:
        app = graphics.playback_positions(hidden_states,
                                          observations,
                                          estimated_states,
                                          marginals)
        app.mainloop()


if __name__ == '__main__':
    main()
