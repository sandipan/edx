import copy
import numpy as np
from collections import Counter


# DO NOT MODIFY THIS FUNCTION
def convert_tree_as_set_to_adjacencies(tree):
    """
    This snippet of code converts between two representations we use for
    edges (namely, with Chow-Liu it suffices to just store edges as a set of
    pairs (i, j) with i < j), whereas when we deal with learning tree
    parameters and code Sum-Product it will be convenient to have an
    "adjacency list" representation, where we can query and find out the list
    of neighbors for any node. We store this "adjacency list" as a Python
    dictionary.

    Input
    -----
    - tree: a Python set of edges (where (i, j) being in the set means that we
        don't have to have (j, i) also stored in this set)

    Output
    ------
    - edges: a Python dictionary where `edges[i]` gives you a list of neighbors
        of node `i`
    """
    edges = {}
    for i, j in tree:
        if i not in edges:
            edges[i] = [j]
        else:
            edges[i].append(j)
        if j not in edges:
            edges[j] = [i]
        else:
            edges[j].append(i)
    return edges


# DO NOT MODIFY THIS CLASS
class UnionFind():
    def __init__(self, nodes):
        """
        Union-Find data structure initialization sets each node to be its own
        parent (so that each node is in its own set/connected component), and
        to also have rank 0.

        Input
        -----
        - nodes: list of nodes
        """
        self.parents = {}
        self.ranks = {}

        for node in nodes:
            self.parents[node] = node
            self.ranks[node] = 0

    def find(self, node):
        """
        Finds which set/connected component that a node belongs to by returning
        the root node within that set.

        Technical remark: The code here implements path compression.

        Input
        -----
        - node: the node that we want to figure out which set/connected
            component it belongs to

        Output
        ------
        the root node for the set/connected component that `node` is in
        """
        if self.parents[node] != node:
            # path compression
            self.parents[node] = self.find(self.parents[node])
        return self.parents[node]

    def union(self, node1, node2):
        """
        Merges the connected components of two nodes.

        Inputs
        ------
        - node1: first node
        - node2: second node
        """
        root1 = self.find(node1)
        root2 = self.find(node2)
        if root1 != root2:  # only merge if the connected components differ
            if self.ranks[root1] > self.ranks[root2]:
                self.parents[root2] = root1
            else:
                self.parents[root1] = root2
                if self.ranks[root1] == self.ranks[root2]:
                    self.ranks[root2] += 1


def compute_empirical_distribution(values):
    """
    Given a sequence of values, compute the empirical distribution.

    Input
    -----
    - values: list (or 1D NumPy array or some other iterable) of values

    Output
    ------
    - distribution: a Python dictionary representing the empirical distribution
    """
    distribution = {}

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #
    distribution = dict(Counter(values))
    distribution = {k: (1.0*distribution[k]) / sum(distribution.values()) for k in distribution}
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return distribution


def compute_empirical_mutual_info_nats(var1_values, var2_values):
    """
    Compute the empirical mutual information for two random variables given a
    pair of observed sequences of those two random variables.

    Inputs
    ------
    - var1_values: observed sequence of values for the first random variable
    - var2_values: observed sequence of values for the second random variable
        where it is assumed that the i-th entries of `var1_values` and
        `var2_values` co-occur

    Output
    ------
    The empirical mutual information *in nats* (not bits)
    """

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #

    empirical_mutual_info_nats = 0.0

    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------
    var1_distr = compute_empirical_distribution(var1_values)
    var2_distr = compute_empirical_distribution(var2_values)
    #import itertools
    #joint_distr = compute_empirical_distribution(list(itertools.product(var1_values, var2_values)))
    joint_distr = compute_empirical_distribution(zip(var1_values, var2_values))

    empirical_mutual_info_nats = 0
    for var1_value in np.unique(var1_values):
        for var2_value in np.unique(var2_values):
            empirical_mutual_info_nats += joint_distr[(var1_value, var2_value)] \
                                         * (np.log(joint_distr.get((var1_value, var2_value), 0)) \
                                            - np.log(var1_distr.get(var1_value,0)*var2_distr.get(var2_value, 0)))
    
    return empirical_mutual_info_nats


def chow_liu(observations):
    """
    Run the Chow-Liu algorithm.

    Input
    -----
    - observations: a 2D NumPy array where the i-th row corresponds to the
        i-th training data point

        *IMPORTANT*: it is assumed that the nodes in the graphical model are
        numbered 0, 1, ..., up to the number of variables minus 1, where the
        number of variables in the graph is determined from `observations` by
        looking at `observations.shape[1]`

    Output
    ------
    - best_tree: a Python set consisting of edges that are in a Chow-Liu tree
        (note that if edge (i, j) is in this set, then edge (j, i) should not
        be in the set; also, for grading purposes, please present the edges
        so that for an edge (i, j) in this set, i < j
    """
    best_tree = set()  # we will add in edges to this set
    num_obs, num_vars = observations.shape
    union_find = UnionFind(range(num_vars))

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #
    I = []
    for i in range(num_vars):
        for j in range(i+1, num_vars):
            I.append((compute_empirical_mutual_info_nats(observations[:,i], observations[:,j]), i, j))
    I = sorted(I, reverse=True)
    num_edges = 0
    for mij in I:
        m, i, j = mij
        if union_find.find(i) != union_find.find(j):
            best_tree.add((i, j))
            union_find.union(i, j)         
            num_edges += 1
            if num_edges == num_vars - 1:
                break
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return best_tree


def compute_empirical_conditional_distribution(var1_values, var2_values):
    """
    Given two sequences of values (corresponding to samples from two
    random variables), compute the empirical conditional distribution of
    the first variable conditioned on the second variable.

    Inputs
    ------
    - var1_values: list (or 1D NumPy array or some other iterable) of values
        sampled from, say, $X_1$
    - var2_values: list (or 1D NumPy array or some other iterable) of values
        sampled from, say, $X_2$, where it is assumed that the i-th entries of
        `var1_values` and `var2_values` co-occur
    Output
    ------
    - conditional_distributions: a dictionary consisting of dictionaries;
        `conditional_distributions[x_2]` should be the dictionary that
        represents the conditional distribution $X_1$ given $X_2 = x_2$
    """
    conditional_distributions = {x2: {} for x2 in set(var2_values)}

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #
    for a in var1_values:
        for b in var2_values:
            conditional_distributions[b][a] = (1.0*sum((var1_values == a) & (var2_values == b))) / sum(var2_values == b)    
                   
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return conditional_distributions


def learn_tree_parameters(observations, tree, root_node=0):
    """
    Learn a collection of node and edge potentials from observations that
    corresponds to a maximum likelihood estimate.

    Please use the approach presented in the course video/notes. Remember that
    the only node potential that isn't all 1's is the one corresponding to the
    root node chosen, and the edge potentials are set to be empirical
    conditional probability distributions.

    Inputs
    ------
    - observations: a 2D NumPy array where the i-th row corresponds to the
        i-th training data point

        *IMPORTANT*: it is assumed that the nodes in the graphical model are
        numbered 0, 1, ..., up to the number of variables minus 1, where the
        number of variables in the graph is determined from `observations` by
        looking at `observations.shape[1]`
    - tree: a set consisting of which edges are present (if (i, j) is in the
        set, then you don't have to also include (j, i)); note that the
        nodes must be as stated above
    - root_node: an integer specifying which node to treat as the root node

    Outputs
    -------
    - node_potentials: Python dictionary where `node_potentials[i]` is
        another Python dictionary representing the node potential table for
        node `i`; this means that `node_potentials[i][x_i]` should give the
        potential value for what, in the course notes, we call $\phi_i(x_i)$
    - edge_potentials: Python dictionary where `edge_potentials[(i, j)]` is
        a dictionaries-within-a-dictionary representation for a 2D potential
        table so that `edge_potentials[(i, j)][x_i][x_j]` corresponds to
        what, in the course notes, we call $\psi_{i,j}(x_i, x_j)$

        *IMPORTANT*: For the purposes of this project, please be sure to
        specify both `edge_potentials[(i, j)]` *and* `edge_potentials[(j, i)]`,
        where `edge_potentials[(i, j)][x_i][x_j]` should equal
        `edge_potentials[(j, i)][x_j][x_i]` -- we have provided a helper
        function `transpose_2d_table` below that, given edge potentials
        computed in one "direction" (i, j), computes the edge potential
        for the "other direction" (j, i)
    """
    nodes = set(range(observations.shape[1]))
    edges = convert_tree_as_set_to_adjacencies(tree)
    node_potentials = {}
    edge_potentials = {}

    def transpose_2d_table(dicts_within_dict_table):
        """
        Given a dictionaries-within-dictionary representation of a 2D table
        `dicts_within_dict_table`, computes a new 2D table that's also a
        dictionaries-within-dictionary representation that is the transpose of
        the original 2D table, so that:

            transposed_table[x1][x2] = dicts_within_dict_table[x2][x1]

        Input
        -----
        - dicts_within_dict_table: as described above

        Output
        ------
        - transposed_table: as described above
        """
        transposed_table = {}
        for x2 in dicts_within_dict_table:
            for x1 in dicts_within_dict_table[x2]:
                if x1 not in transposed_table:
                    transposed_table[x1] = \
                        {x2: dicts_within_dict_table[x2][x1]}
                else:
                    transposed_table[x1][x2] = \
                        dicts_within_dict_table[x2][x1]
        return transposed_table
        #edge_potentials[(neighbor, node)] = edge_potential_transposed

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #

    for node in nodes:
        node_potentials[node] = {}
        for a in np.unique(observations[:,node]):
            node_potentials[node][a] = 1
    
    for a in np.unique(observations[:,root_node]):
        node_potentials[root_node][a] = (1.0*sum(observations[:,root_node] == a)) / observations.shape[0]    
    
    fringe = [root_node]  # this is a list of nodes queued up to be visited next
    visited = {node: False for node in nodes}  # track which nodes are visited
    while len(fringe) > 0:
        node = fringe.pop(0)  # removes the 0th element of `fringe` and returns it
        visited[node] = True  # mark `node` as visited
        for neighbor in edges[node]:
            if not visited[neighbor]:
                # do some processing that involves the edge `(neighbor, node)` here
                distr = compute_empirical_conditional_distribution(np.unique(observations[:,neighbor]), np.unique(observations[:,node]))
                edge_potentials[(neighbor, node)] = distr #[(neighbor, node)]
                edge_potentials[(node, neighbor)] = transpose_2d_table(distr) #[(neighbor, node)]
                # finally after you do your processing, add `neighbor` to `fringe`
                fringe.append(neighbor)
                
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return node_potentials, edge_potentials

def sum_product(nodes, edges, node_potentials, edge_potentials):
    """
    Run the Sum-Product algorithm.

    Inputs
    ------
    - nodes: Python set that consists of the nodes
    - edges: Python dictionary where `edges[i]` is a list saying which nodes
        are neighbors of node `i`
    - node_potentials: Python dictionary where `node_potentials[i]` is
        another Python dictionary representing the node potential table for
        node `i`; this means that `node_potentials[i][x_i]` should give the
        potential value for what, in the course notes, we call $\phi_i(x_i)$

        *IMPORTANT*: For the purposes of this project, the alphabets of each
        random variable should be inferred from the node potentials, so each
        node potential's dictionary's keys should tell you what the alphabet is
        (or at least the subset of the alphabet for which the probability is
        nonzero); this means that you should not use collections.defaultdict
        to produce, for instance, a dictionary with no keys that outputs 1 for
        everything here since we cannot read off what the alphabet is for the
        random variable
    - edge_potentials: Python dictionary where `edge_potentials[(i, j)]` is
        a dictionaries-within-a-dictionary representation for a 2D potential
        table so that `edge_potentials[(i, j)][x_i][x_j]` corresponds to
        what, in the course notes, we call $\psi_{i,j}(x_i, x_j)$

        *IMPORTANT*: For the purposes of this project, please be sure to
        specify both `edge_potentials[(i, j)]` *and* `edge_potentials[(j, i)]`,
        where `edge_potentials[(i, j)][x_i][x_j]` should equal
        `edge_potentials[(j, i)][x_j][x_i]`

    Output
    ------
    - marginals: Python dictionary where `marginals[i]` gives the marginal
        distribution for node `i` represented as a dictionary; you do *not*
        need to store entries that are 0
    """
    marginals = {}
    messages = {}

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #
    root = list(nodes)[0]
    active_list = []
    leaves = [i for i in nodes if len(edges[i]) == 1 and i != root] # leaves 
    
    #print 'here', root, leaves
    #print 'here', node_potentials, 
    #print 'here', edge_potentials
    
    for node in leaves:
        
        parent = edges[node][0]
        messages[node, parent] = {}
        Z = 0.0
        for x_j in node_potentials[parent]:
            messages[node, parent][x_j] = 0
            for x_i in node_potentials[node]:
                messages[node, parent][x_j] += node_potentials[node][x_i] * edge_potentials[(node, parent)][x_i][x_j]
            Z +=  messages[node, parent][x_j]   
        for x_j in node_potentials[parent]:
            messages[node, parent][x_j] /= Z
        
        if parent != root and not parent in active_list: # 
            active_list.append(parent)
        
    #print 'here1', messages            
    #print 'here2', active_list            
                                
    while len(active_list) > 0:
        
        for i in active_list:
            
            nbrs = edges[i]
            num_messages_computed = sum([(j, i) in messages for j in nbrs])
            parent = [j for j in nbrs if not (j, i) in messages][0]
            other_nbrs = [j for j in nbrs if (j, i) in messages]
            #print nbrs, num_messages_computed, parent
            
            if num_messages_computed >= len(nbrs) - 1:
            
                j = parent
                messages[i, j] = {}
                Z = 0.0
                for x_j in node_potentials[j]:
                    messages[i, j][x_j] = 0
                    for x_i in node_potentials[i]:
                        messages[i, j][x_j] += node_potentials[i][x_i] * edge_potentials[(i, j)][x_i][x_j] * np.prod([messages[k, i][x_i] for k in other_nbrs])
                    Z +=  messages[i, j][x_j]   
                for x_j in node_potentials[j]:
                    messages[i, j][x_j] /= Z
                active_list.remove(i)
                
                if j != root and not j in active_list: # 
                    active_list.append(j)
                    
            #print 'hereeee', active_list
    
    #print 'here11', messages            
    #print 'here21', active_list            
    
    Z = 0.0
    marginals[root] = {}
    for x_i in node_potentials[root]:    
        tmp = node_potentials[root][x_i]
        for k in edges[root]:
            tmp *= messages[k, root][x_i]
        if tmp > 0:
            marginals[root][x_i] = tmp
            Z += marginals[root][x_i]
    for x_i in marginals[root]:    
        marginals[root][x_i] /= Z        
    
    fringe = [root]  # this is a list of nodes queued up to be visited next
    visited = {node: False for node in nodes}  # track which nodes are visited
    while len(fringe) > 0:
        
        node = fringe.pop(0)  # removes the 0th element of `fringe` and returns it
        visited[node] = True  # mark `node` as visited
        
        for neighbor in edges[node]:
           
           if not visited[neighbor]:
                # do some processing that involves the edge `(neighbor, node)` here
                i, j = node, neighbor
                messages[i, j] = {}
                other_nbrs = [k for k in edges[node] if k != neighbor]
                Z = 0.0
                for x_j in node_potentials[j]:
                    messages[i, j][x_j] = 0
                    for x_i in node_potentials[i]:
                        messages[i, j][x_j] += node_potentials[i][x_i] * edge_potentials[(i, j)][x_i][x_j] * np.prod([messages[k, i][x_i] for k in other_nbrs])
                    Z +=  messages[i, j][x_j]   
                for x_j in node_potentials[j]:
                    messages[i, j][x_j] /= Z
                  
                Z = 0.0
                marginals[j] = {}
                for x_j in node_potentials[j]:    
                    tmp = node_potentials[j][x_j] * messages[i, j][x_j]
                    if tmp > 0:
                        marginals[j][x_j] = tmp
                        Z += marginals[j][x_j]
                for x_j in marginals[j]:    
                    marginals[j][x_j] /= Z      
                    
                # finally after you do your processing, add `neighbor` to `fringe`
                fringe.append(neighbor)
    
    
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return marginals


def test_sum_product1():
    """
    Below is the example from
    "Exercise: The Sum-Product Algorithm - A Numerical Calculation"
    where we have conditioned on $X_1 = 0$ (conditioning can be done by setting
    the node potential to be all 0's except for at the observed value -- see
    below in the code for how this is done with `node_potentials[1]`)
    """
    nodes = {1, 2, 3}
    edges = {1: [2], 2: [1, 3], 3: [2]}

    node_potentials = {1: {0: 1, 1: 0}, 2: {0: 1, 1: 1}, 3: {0: 1, 1: 1}}
    edge_potentials = {(1, 2): {0: {0: 5, 1: 1}, 1: {0: 1, 1: 5}},
                       (2, 1): {0: {0: 5, 1: 1}, 1: {0: 1, 1: 5}},
                       (2, 3): {0: {0: 0, 1: 1}, 1: {0: 1, 1: 0}},
                       (3, 2): {0: {0: 0, 1: 1}, 1: {0: 1, 1: 0}}}

    marginals = sum_product(nodes, edges, node_potentials, edge_potentials)
    print('Your output:', marginals)
    print('Expected output:',
          {1: {0: 1.0},
           2: {0: 0.8333333333333334, 1: 0.16666666666666666},
           3: {0: 0.16666666666666666, 1: 0.8333333333333334}})

    node_potentials = {1: {0: 1, 1: 1}, 2: {0: 1, 1: 1}, 3: {0: 1, 1: 1}}
    print(compute_marginals_given_observations(nodes, edges,
                                               node_potentials,
                                               edge_potentials,
                                               observations={1: 0}))


def test_sum_product2():
    """
    Below is the example from
    "Homework Problem: Blue Green Tree" and
    "Homework Problem: Blue Green Tree, Continued"
    """
    nodes = {1, 2, 3, 4, 5}
    edges = {1: [2, 3], 2: [1, 4, 5], 3: [1], 4: [2], 5: [2]}

    node_potentials = {1: {'blue': 0.5, 'green': 0.5},
                       2: {'blue': 0.5, 'green': 0.5},
                       3: {'blue': 0.6, 'green': 0.4},
                       4: {'blue': 0.8, 'green': 0.2},
                       5: {'blue': 0.8, 'green': 0.2}}
    edge_potentials = {(1, 2): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (2, 1): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (1, 3): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (3, 1): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (2, 4): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (4, 2): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (2, 5): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}},
                       (5, 2): {'blue': {'blue': 0, 'green': 1},
                                'green': {'blue': 1, 'green': 0}}}

    marginals = sum_product(nodes, edges, node_potentials, edge_potentials)
    print('Your output:', marginals)
    print('Expected output:',
          {1: {'blue': 0.9142857142857144, 'green': 0.08571428571428572},
           2: {'blue': 0.08571428571428569, 'green': 0.9142857142857143},
           3: {'blue': 0.08571428571428572, 'green': 0.9142857142857144},
           4: {'blue': 0.9142857142857143, 'green': 0.0857142857142857},
           5: {'blue': 0.9142857142857143, 'green': 0.0857142857142857}})


def compute_marginals_given_observations(nodes, edges, node_potentials,
                                         edge_potentials, observations):
    """
    For a given choice of nodes, edges, node potentials, and edge potentials,
    and also observed values for specific nodes, we can compute marginals
    given the observations. This can actually be done by just modifying the
    node potentials and then calling the Sum-Product algorithm.

    Inputs
    ------
    - nodes, edges, node_potentials, edge_potentials: see documentation for
        sum_product()
    - observations: a dictionary where each key is a node and the value for
        the key is what the observed value for that node is (for example,
        `{1: 0}` means that node 1 was observed to have value 0)

    Output
    ------
    marginals, given the observations (see documentation for the output of
    sum_product())
    """
    new_node_potentials = node_potentials

    # -------------------------------------------------------------------------
    # YOUR CODE HERE
    #
    
    for node in observations:
        a = observations[node]
        new_node_potentials[node][a] = 1
        for b in new_node_potentials[node]:
            if b != a:
                new_node_potentials[node][b] = 0
    #
    # END OF YOUR CODE
    # -------------------------------------------------------------------------

    return sum_product(nodes,
                       edges,
                       new_node_potentials,
                       edge_potentials)


def main():
    
    import time
    start = time.time()

    # get coconut oil data
    observations = []
    with open('coconut.csv', 'r') as f:
        for line in f.readlines():
            pieces = line.split(',')
            if len(pieces) == 5:
                observations.append([int(pieces[1]),
                                     int(pieces[2]),
                                     int(pieces[3]),
                                     int(pieces[4])])
    observations = np.array(observations)

    best_tree = chow_liu(observations)
    print(best_tree)
    
    #done = time.time()
    
    #print done - start

    node_potentials, edge_potentials = learn_tree_parameters(observations,
                                                             best_tree)
    print(node_potentials)
    print(edge_potentials)

    marginals = compute_marginals_given_observations(
        {0, 1, 2, 3},
        convert_tree_as_set_to_adjacencies(best_tree),
        node_potentials,
        edge_potentials,
        observations={1: +1, 2: +1})
    print(marginals)
    print()
        
    print('[Sum-Product tests based on earlier course material]')
    test_sum_product1()
    test_sum_product2()
    
    #print learn_tree_parameters(array([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 1],  [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 0, 1]]), {(0, 1), (0, 3), (0, 2)}, 0)
    
    done = time.time()
    print done - start

if __name__ == '__main__':
    main()
