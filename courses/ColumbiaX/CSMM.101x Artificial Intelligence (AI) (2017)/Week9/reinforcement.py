# -*- coding: utf-8 -*-
"""
Created on Sun Mar 19 01:21:16 2017

@author: Sandipan.Dey
"""

import numpy as np
from scipy.linalg import inv
from pandas import *
import ast
import os.path
import matplotlib.pylab as plt
import seaborn as sns
#from copy import copy, deepcopy
#import itertools

def exp_reward(d):
    return sum(map(lambda x: np.prod(x), d.values()))

def policy_iteration(mdp, gamma):
    
    nS, nA = len(mdp['S']), len(mdp['A'])
    policy = {state:mdp['SA'][state][0] for state in mdp['SA']} # starting policy # .items()
    #lsts = [mdp['SA'][x] for x in mdp['S']]
    r_pi = {state:0. for state in mdp['S']}
    P_pi = {}
    epsilon = 10**(-6)
    #all_policies = [{mdp['S'][i]:x[i] for i in range(nS)} for x in list(itertools.product(*lsts))]
    while True:
        #print policy
        for state in mdp['S']:
            d = mdp['PR'][state, policy[state]]
            r_pi[state] = exp_reward(d)
            P_pi[state] = {x: d[x][0] for x in d}
        P_pi_mat = DataFrame(P_pi).T.fillna(0).as_matrix()
        # policy evaluation        
        # bellman equation
        v_pi = np.matmul(inv(np.eye(nS) - gamma*P_pi_mat), [r_pi[x] for x in mdp['S']]) # r_pi.values()) 
        v_pi = {mdp['S'][i]:v_pi[i] for i in range(len(mdp['S']))}
        #print r_pi, P_pi
        #print v_pi
        # policy improvement
        improved = False
        for state in mdp['S']:
            actions = mdp['SA'][state]
            max_reward, max_action = max([(exp_reward(mdp['PR'][state, action]) + \
                    gamma*sum(map(lambda x:x[0],[mdp['PR'][state,action][x] for x in mdp['S']])*np.array([v_pi[x] for x in mdp['S']])), action) for action in actions]) #.values()
            if max_reward - v_pi[state] > epsilon: #max_reward > v_pi[state]:
                improved = True
                policy[state] = max_action
                break
        if not improved:
            break
    #print r_pi, P_pi 
    #print v_pi
    #print policy
    return (v_pi, policy)

def value_iteration(mdp, gamma):

    epsilon = 10**(-6)
    v = {state:0. for state in mdp['S']}
    p = {state:None for state in mdp['S']}
    n = []
    while True:
        #print policy
        v_prev = {state:v[state] for state in mdp['S']}#copy(v)
        for state in mdp['S']:
            actions = mdp['SA'][state]
            v[state], p[state] = max([(exp_reward(mdp['PR'][state, action]) + \
                    gamma*sum(map(lambda x:x[0],[mdp['PR'][state,action][x] for x in mdp['S']])*np.array([v[x] for x in mdp['S']])), action) for action in actions]) #.values()
        v_diff = abs(np.linalg.norm(np.fromiter(iter(v.values()), dtype=float) - np.fromiter(iter(v_prev.values()), dtype=float)))
        #print v, v_prev, p, v_diff
        n.append(v_diff)
        if v_diff < epsilon: 
            break
    return (v, p, n)

def q_learning(mdp, gamma, niter=200, exploration=False, epsilon=0.1):

    S, A, P_R = mdp['S'], mdp['SA'], mdp['PR']
    #Q  = {}
    Q = {(s,a):0 for s in S for a in A[s]}
    Qs = [Q]
    s_t = S[0] #S[np.random.choice(range(len(S)), 1)]
    iter = 0
    tol = 10**(-6)
    diffs = []
    count = 0
    while True:
        pQ = {k:Q[k] for k in sorted(Q)} 
        iter += 1
        #_, a_t = max([(Q.get((s_t, a),0), a) for a in A[s_t]])
        _, a_t = max([(Q[s_t, a], a) for a in A[s_t]])
        if exploration and np.random.rand() <= epsilon:            
            a_t = np.random.choice(A[s_t], 1)[0]
        pr = [P_R[s_t, a_t][s] for s in S]
        p, r = zip(*pr)
        p, r = list(p), list(r)
        index = np.random.choice(range(len(S)), p=p)
        s_t_1, r_t = S[index], r[index]
        print s_t, a_t, s_t_1, r_t, p
        #Q[s_t, a_t] = r_t + gamma* max([Q.get((s_t_1, a),0) for a in A[s_t_1]])
        Q[s_t, a_t] = r_t + gamma* max([Q[s_t_1, a] for a in A[s_t_1]])
        s_t = s_t_1   
        Q = {k:Q[k] for k in sorted(Q)}
        print Q, Q.keys() == pQ.keys()
        Qs.append(Q)
        #if Q.keys() == pQ.keys():
        Q_diff = abs(np.linalg.norm(np.fromiter(list(Q.values()), dtype=float) - np.fromiter(list(pQ.values()), dtype=float)))
        print iter, Q_diff
        diffs.append(Q_diff)
        if Q_diff < tol and iter > niter:
            if count > 20:            
                print 'Final iteration', iter
                break
            else:
                count += 1
        else:
            count = 0
        
    return (Q, diffs, Qs)

def get_mdp():
    
    mdp = {} # MDP = (S, s1, A, P, R)
    mdp['S'] = ['Fallen', 'Moving', 'Standing'] # states
    mdp['s1'] = ['Fallen']
    mdp['A'] = ['Slow', 'Fast']
    mdp['PR'] = {('Fallen','Slow'):{'Fallen':(0.6,-1), 'Moving':(0.,0), 'Standing':(0.4,1)},
                ('Standing','Slow'):{'Fallen':(0.,0), 'Moving':(1.,1), 'Standing':(0.,0)},
                ('Standing','Fast'):{'Fallen':(0.4,-1), 'Moving':(0.6,2), 'Standing':(0.,0)},
                ('Moving','Slow'):{'Fallen':(0.,0), 'Moving':(1.,1), 'Standing':(0.,0)},
                ('Moving','Fast'):{'Fallen':(0.2,-1), 'Moving':(0.8,2), 'Standing':(0.,0)}}    
    mdp['SA'] = {'Fallen':['Slow'], 'Moving':['Slow', 'Fast'], 'Standing':['Slow', 'Fast']}
    
    return mdp    

def run_q_learning():    
    
    mdp = get_mdp()     
    gamma = 0.1 #0.9
    #Q, d, Qs = q_learning(mdp, gamma)
    epsilon = 0.9 #0.5 #0.1    
    qdict = {}    
    n = 100
    for i in range(n):
        Q, d, _ = q_learning(mdp, gamma, 20, True, epsilon)
        str_Q = str({k:round(Q[k],1) for k in Q})
        qdict[str_Q] = qdict.get(str_Q, 0) + 1
    print qdict
    i = 0
    for q in qdict:
        print q, type(q)
        Q = ast.literal_eval(q) #eval(q)
        Qdf = DataFrame()
        for k in Q:
            Qdf = Qdf.append(DataFrame({'state':k[0], 'action':k[1], 'value':Q[k]}, columns = ['state', 'action', 'value'], index=[0]))
        Qdf = Qdf.pivot("state", "action", "value").fillna(0)
        #Qdf
        ax = sns.heatmap(Qdf, annot=True, fmt=".1f", linewidths=.5, cmap="YlGnBu")
        #ax.set_title('Q-learning (without exploration): iteration ' + str(iter) + ' gamma=' + str(gamma))
        ax.set_title('Q-learning with exploration: epsilon=' + str(epsilon) + ' gamma=' + str(gamma) + ': # cases=' + str(qdict[q]) + ' (out of ' + str(n) +')')
        fig = ax.get_figure()
        #fig.savefig("rl/q_no_explore_" + str(iter).zfill(2) + ".png")
        fig.savefig("rl/q_explore_" + str(i).zfill(2) + ".png")
        i += 1
        sns.plt.close()
    
    # Combine them with imshows
    #fig, ax = plt.subplots(nrows=4, ncols=3, figsize=(100,100))
    fig, ax = plt.subplots(nrows=7, ncols=7, figsize=(200,200))
    for i, ax in enumerate(fig.axes):
        imfile = "rl/q_explore_" + str(i).zfill(2) + ".png"
        if os.path.isfile(imfile): 
            ax.imshow(plt.imread(imfile))
            ax.axis('off')
    #fig, axs = plt.subplots(nrow, ncol)
    #for a in [1,2,3]: ax[a-1].imshow(plt.imread('/tmp/f%s.png' %a)); ax[a-1].axis('off')
    plt.tight_layout(); plt.savefig('rl/q_explore.png', bbox_inches='tight'); plt.close() # dpi = 200

    '''    
    Q, d, Qs = q_learning(mdp, gamma, 20, True, epsilon)
    for iter in range(len(Qs)):
        print iter
        Q = Qs[iter]
        Qdf = DataFrame()
        for k in Q:
            Qdf = Qdf.append(DataFrame({'state':k[0], 'action':k[1], 'value':Q[k]}, columns = ['state', 'action', 'value'], index=[0]))
        Qdf = Qdf.pivot("state", "action", "value").fillna(0)
        #Qdf
        ax = sns.heatmap(Qdf, annot=True, fmt="f", linewidths=.5, cmap="YlGnBu")
        #ax.set_title('Q-learning (without exploration): iteration ' + str(iter) + ' gamma=' + str(gamma))
        ax.set_title('Epsilon Q-learning (with exploration): iteration ' + str(iter) + ' epsilon=' + str(epsilon) + ' gamma=' + str(gamma))
        fig = ax.get_figure()
        #fig.savefig("rl/q_no_explore_" + str(iter).zfill(2) + ".png")
        fig.savefig("rl/q_explore_" + str(iter).zfill(2) + ".png")
        sns.plt.close()
    '''    
    #ax = sns.heatmap(Qdf, annot=True, fmt="f", linewidths=.5, cmap="YlGnBu")
    #ax.set_title('Q-learning')
    #ax.savefig("rl/q_no_explore_final.png")
        
# convert -delay 100 -loop 0 *.png sol.gif

run_q_learning()
    
def run_value_iteration():
    
    mdp = get_mdp()     
    gammas = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95, 0.99, 0.999] #np.logspace(-3, 0, 10, endpoint=False)
    pdf, vdf, ndf = DataFrame(), DataFrame(), DataFrame()
    for gamma in gammas:
        print gamma
        v, p, n = value_iteration(mdp, gamma)
        df = DataFrame(p.items(), columns=['state', 'action'])
        df['gamma'] = gamma
        pdf = pdf.append(df,ignore_index=True)
        df = DataFrame(v.items(), columns=['state', 'value'])
        df['gamma'] = gamma
        vdf = vdf.append(df,ignore_index=True)
        df = DataFrame({'iter':range(len(n)), 'norm_diff':n})
        df['gamma'] = gamma
        ndf = ndf.append(df,ignore_index=True)
    
    pdf.to_csv('state-action-v.csv')
    vdf.to_csv('state-value-v.csv')
    ndf.to_csv('iter-norm-v.csv')

def run_policy_iteration():
    
    gammas = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95, 0.99, 0.999] #np.logspace(-3, 0, 10, endpoint=False)
    pdf, vdf = DataFrame(), DataFrame()
    for gamma in gammas:
        print gamma
        v, p = policy_iteration(mdp, gamma)
        df = DataFrame(p.items(), columns=['state', 'action'])
        df['gamma'] = gamma
        pdf = pdf.append(df,ignore_index=True)
        df = DataFrame(v.items(), columns=['state', 'value'])
        df['gamma'] = gamma
        vdf = vdf.append(df,ignore_index=True)
        
        pdf.to_csv('state-action-p.csv')
        vdf.to_csv('state-value-p.csv')

'''    
fig, ax = plt.subplots()
labels = []
for key, grp in vdf.groupby(['gamma']):
    ax = grp.plot(ax=ax, kind='line', x='state', y='value', c=key)
    labels.append(key)
lines, _ = ax.get_legend_handles_labels()
ax.legend(lines, labels, loc='best')
plt.show()
'''

#sns.lmplot('state', 'value', data=vdf, hue='gamma', fit_reg=False)
#sns.swarmplot(x="state", y="value", hue="gamma", data=vdf)
#sns.pointplot(x="state", y="value", hue="gamma", data=vdf)
#sns.factorplot(x="state", y="value", hue="gamma", data=vdf)
#g = sns.FacetGrid(vdf, col="state")#, hue='value', size=4, aspect=.5)
#g = g.map(sns.pointplot, "gamma", "value", scale=.7)
#g = (g.map(plt.scatter, "gamma", "value", edgecolor="w").add_legend())
#plt.show()


'''
import matplotlib.pyplot as plt
import matplotlib.patches as mpatch

fig, ax = plt.subplots()
rectangles = {'skinny' : mpatch.Rectangle((2,2), 2, 4),
              'square' : mpatch.Rectangle((2,6), 2, 4)}

for r in rectangles:
    ax.add_artist(rectangles[r])
    rx, ry = rectangles[r].get_xy()
    cx = rx + rectangles[r].get_width()/2.0
    cy = ry + rectangles[r].get_height()/2.0

    ax.annotate(r, (cx, cy), color='w', weight='bold', 
                fontsize=6, ha='center', va='center')

ax.set_xlim((0, 15))
ax.set_ylim((0, 15))
ax.set_aspect('equal')
plt.show()

from statsmodels.graphics.mosaicplot import mosaic
plt.rcParams['font.size'] = 16.0
mosaic(pdf, ['state', 'action'])
'''