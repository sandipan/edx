'''
Created on Jan 17, 2010
@author: mjbommar
'''

from GraphMovie import GraphMovie
import igraph, igraph.colors
import copy

if __name__ == "__main__":
    m = GraphMovie()

    '''
    First graph.
    '''
    g1 = igraph.Graph.Preference(200, [0.2, 0.2, 0.5, 0.1], [[0.85, 0.05, 0.05, 0.05], [0.1, 0.7, 0.1, 0.1], [0.15, 0.15, 0.55, 0.15], [0.1, 0.1, 0.1, 0.7]])
    for i,v in enumerate(g1.vs):
        v['label'] = str(i)
        v['color'] = 'black'
    m.addGraph(g1)
    
    '''
    Second graph, after split.
    '''
    g2 = igraph.Graph(g1.get_edgelist())
    c2 = g2.community_leading_eigenvector(clusters = 2).membership
    colors = igraph.colors.GradientPalette("red", "blue", 2)

    for i,v in enumerate(g2.vs):
        color = colors.get(c2[i])
        v['color'] = '#%02x%02x%02x' % (255*color[0], 255*color[1],255*color[2]) 
        v['label'] = str(i)
        
    edgelist = g2.get_edgelist()
    for i,e in enumerate(g2.es):
        if c2[edgelist[i][0]] == c2[edgelist[i][1]]:
            color = colors.get(c2[edgelist[i][0]])
            e['color'] = '#%02x%02x%02x' % (255*color[0], 255*color[1],255*color[2])
        else:
            e['color'] = 'white'
    
    m.addGraph(g2)
    
    '''
    Third graph, after another split.
    '''    
    g3 = igraph.Graph(g2.get_edgelist())
    c3 = g2.community_leading_eigenvector(clusters = 4).membership
    colors = igraph.colors.GradientPalette("red", "blue", 4)
    for i,v in enumerate(g3.vs):
        color = colors.get(c3[i])
        v['color'] = '#%02x%02x%02x' % (255*color[0], 255*color[1],255*color[2]) 
        v['label'] = str(i)

    edgelist = g3.get_edgelist()
    for i,e in enumerate(g3.es):
        if c3[edgelist[i][0]] == c3[edgelist[i][1]]:
            color = colors.get(c3[edgelist[i][0]])
            e['color'] = '#%02x%02x%02x' % (255*color[0], 255*color[1],255*color[2])
        else:
            e['color'] = 'white'
            

    m.addGraph(g3)
    
    '''
    Now process the layouts, render the frames, and generate the movie.
    '''
    m.interpFrames = 10
    m.doMovieLayout()
    m.renderMovie()