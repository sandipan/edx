import numpy as np
import pandas as pd
import warnings
warnings.filterwarnings('ignore')

def get_dominating_strategy(player, payoffs_df, other_strategies):
    other_player = 'p2' if player == 'p1' else 'p1'
    all_best_strategies = set([])
    for other_strategy in other_strategies:
        sdf = payoffs_df[payoffs_df[other_player + '_strategy'] == other_strategy]
        cur_strategy = sdf.loc[sdf[player + '_payoff'].idxmax(), player + '_strategy']
        all_best_strategies.add(cur_strategy)
    return list(all_best_strategies)[0] if len(all_best_strategies) == 1 else None

def exists_better_strategy(player, cur_strategy, cur_payoff, other_strategy, payoffs_df, strategies):
    other_player = 'p2' if player == 'p1' else 'p1'
    sdf = payoffs_df[payoffs_df[other_player + '_strategy'] == other_strategy]
    for i in sdf.index:
        if sdf.loc[i, player + '_payoff'] > cur_payoff:
            return True
    return False
            
def get_pure_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies):
    nash_equlibriums = []
    for i in range(len(payoffs_df)):
        cur_state = payoffs_df.loc[i]
        p1_payoff, p2_payoff = cur_state['p1_payoff'], cur_state['p2_payoff']
        p1_strategy, p2_strategy = cur_state['p1_strategy'], cur_state['p2_strategy']
        nash_equlibrium_found = True
        if exists_better_strategy('p1', p1_strategy, p1_payoff, p2_strategy, payoffs_df, p1_strategies):
            nash_equlibrium_found = False
            continue
        if exists_better_strategy('p2', p2_strategy, p2_payoff, p1_strategy, payoffs_df, p2_strategies):
            nash_equlibrium_found = False
            continue
        if nash_equlibrium_found:
            nash_equlibriums.append((p1_strategy, p2_strategy))
    return None if len(nash_equlibriums) == 0 else nash_equlibriums
        
def get_mixed_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies):
    m, n = len(p1_strategies), len(p2_strategies)
    assert(m == n)
    A = np.zeros((m, m))
    b = [1] + [0]*(m-1)
    A[0] = [1]*m  # p_1 + p_2 + ... + p_m = 1
    for j in range(n-1):
        for i in range(m):
            s, s1, s2 = p1_strategies[i], p2_strategies[j], p2_strategies[j+1]
            A[j+1, i] = payoffs_df.loc[(payoffs_df['p1_strategy'] == s) & (payoffs_df['p2_strategy'] == s1), 'p2_payoff']
            A[j+1, i] -= payoffs_df.loc[(payoffs_df['p1_strategy'] == s) & (payoffs_df['p2_strategy'] == s2), 'p2_payoff']
    ps = np.linalg.solve(A, b)
    A = np.zeros((n, n))
    b = [1] + [0]*(n-1)
    A[0] = [1]*n  # q_1 + q_2 + ... + q_n = 1
    for j in range(m-1):
        for i in range(n):
            s, s1, s2 = p2_strategies[i], p1_strategies[j], p1_strategies[j+1]
            A[j+1, i] = payoffs_df.loc[(payoffs_df['p2_strategy'] == s) & (payoffs_df['p1_strategy'] == s1), 'p1_payoff']
            A[j+1, i] -= payoffs_df.loc[(payoffs_df['p2_strategy'] == s) & (payoffs_df['p1_strategy'] == s2), 'p1_payoff']
    qs = np.linalg.solve(A, b)
    return (ps, qs)

'''
p1_strategies = ['confess', 'silent']
p2_strategies = ['confess', 'silent']
payoffs_PD = pd.DataFrame({'p1_strategy': ['confess', 'confess', 'silent', 'silent'],
                           'p2_strategy': ['confess', 'silent', 'confess', 'silent'],
                           'p1_payoff': [0, 3, -1, 1],
                           'p2_payoff': [0, -1, 3, 1]})

print(payoffs_PD)

ds_p1 = get_dominating_strategy('p1', payoffs_PD, p2_strategies)
ds_p2 = get_dominating_strategy('p2', payoffs_PD, p1_strategies)
print(ds_p1, ds_p2)
nes = get_pure_nash_equilibriums(payoffs_PD, p1_strategies, p2_strategies)
print(nes)


p1_strategies = ['T', 'B']
p2_strategies = ['L', 'R']
payoffs_df = pd.DataFrame({'p1_strategy': ['T', 'T', 'B', 'B'],
                           'p2_strategy': ['L', 'R', 'L', 'R'],
                           'p1_payoff': [7, 0, 2, 4],
                           'p2_payoff': [6, 5, 0, 3]})

print(payoffs_df)

ds_p1 = get_dominating_strategy('p1', payoffs_df, p2_strategies)
ds_p2 = get_dominating_strategy('p2', payoffs_df, p1_strategies)
print(ds_p1, ds_p2)
nes = get_pure_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies)
print(nes)
'''

p1_strategies = ['H', 'T']
p2_strategies = ['H', 'T']
payoffs_df = pd.DataFrame({'p1_strategy': ['H', 'H', 'T', 'T'],
                           'p2_strategy': ['H', 'T', 'H', 'T'],
                           'p1_payoff': [1, -1, -1, 1],
                           'p2_payoff': [-1, 1, 1, -1]})
print(payoffs_df)
ds_p1 = get_dominating_strategy('p1', payoffs_df, p2_strategies)
ds_p2 = get_dominating_strategy('p2', payoffs_df, p1_strategies)
print(ds_p1, ds_p2)
nes = get_pure_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies)
print(nes)
ps, qs = get_mixed_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies)
print(ps, qs)

p1_strategies = ['F', 'B']
p2_strategies = ['F', 'B']
payoffs_df = pd.DataFrame({'p1_strategy': ['F', 'F', 'B', 'B'],
                           'p2_strategy': ['F', 'B', 'F', 'B'],
                           'p1_payoff': [90, 20, 30, 60],
                           'p2_payoff': [10, 80, 70, 40]})
print(payoffs_df)

ds_p1 = get_dominating_strategy('p1', payoffs_df, p2_strategies)
ds_p2 = get_dominating_strategy('p2', payoffs_df, p1_strategies)
print(ds_p1, ds_p2)
nes = get_pure_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies)
print(nes)
ps, qs = get_mixed_nash_equilibriums(payoffs_df, p1_strategies, p2_strategies)
print(ps, qs)