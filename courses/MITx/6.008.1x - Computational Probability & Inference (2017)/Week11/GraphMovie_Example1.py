'''
Created on Jan 17, 2010
@author: mjbommar
'''

from GraphMovie import GraphMovie
import igraph

if __name__ == "__main__":
    '''
    Create the GraphMovie object.
    '''
    m = GraphMovie()
    
    '''
    Create the first graph.
    '''
    edges = [(0,1),(1,2),(1,3)]
    
    g = igraph.Graph(edges)
    for i,v in enumerate(g.vs):
        v['label'] = str(i)
        
    m.addGraph(g)

    '''
    Now add an edge.
    '''
    edges.append((4,1))
    
    g = igraph.Graph(edges)
    for i,v in enumerate(g.vs):
        v['label'] = str(i)

    m.addGraph(g)
    
    '''
    Now add a few edges!
    '''
    edges.extend([(5,2),(6,5),(7,5),(8,5),(8,7),(9,8)])
    
    g = igraph.Graph(edges)
    for i,v in enumerate(g.vs):
        v['label'] = str(i)

    m.addGraph(g)

    '''
    Now process the layouts, render the frames, and generate the movie.
    '''
    m.doMovieLayout()
    m.renderMovie()