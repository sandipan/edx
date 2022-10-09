'''
@date Jan 17, 2010
@author: mjbommar (c) 2010

Free to use for non-commerical purposes.  Attribution appreciated :)
'''

import igraph
import Image, ImageDraw
import os, os.path
import time

class GraphMovie(object):
    '''
    Graph Movie Object.
    '''

    def __init__(self, graphSequence = [], labelSequence = None):
        '''
        Constructor
        '''

        '''
        This is the number of interpolating frames per sequence element.
        Larger values mean smoother transitions but larger videos.
        '''
        self.interpFrames = 50
        
        '''
        Number of delay frames for start and end of movie.
        '''
        self.delayFrames = 10
        
        '''
        This is the number of frames per second in the resulting video.
        '''
        self.fps = 5

        '''
        Boolean for node labelling.
        '''
        self.labelNodes = False
        
        '''
        Invert colors?
        '''
        self.invertColors = False
        
        '''
        Number of iterations for KK.
        '''
        self.kkIterations = 1000
        
        '''
        Frame counter.
        '''
        self.frame = 0
        
        
        '''
        Movie dimensions and margins.
        '''
        self.pixelsX = 800
        self.pixelsY = 600
        self.margin = self.pixelsY / 10.0
        
        
        '''
        Output path.
        Trailing slash!
        '''
        self.frameDirectory = 'frames/'
        
        if not os.path.exists(self.frameDirectory):
            os.mkdir(self.frameDirectory)
        
        '''
        This is the list of graph objects.
        '''
        self.graphSequence = graphSequence
        
        if labelSequence:
            self.labelSequence = labelSequence
        else:
            self.labelSequence = map(str, range(len(graphSequence)))
        
        if len(self.graphSequence) > 0:
            self.checkGraphSequence()

    def checkGraphSequence(self):
        '''
        Check to make sure that our current graph sequence is OK.
        * Every element must be an igraph object with at least 1 vertex.
        '''
        
        for i, graph in enumerate(self.graphSequence):
            if not isinstance(graph, igraph.Graph):
                raise Exception("GraphMovie::checkGraphSequence: element {0} is not an igraph.Graph object.".format(i))
            
            if graph.vcount() == 0:
                raise Exception("GraphMovie::checkGraphSequence: element {0} has 0 vertices.".format(i))

    def addGraph(self, graph, frameLabel = None):
        '''
        Add a single graph element to the sequence.
        '''
        if not isinstance(graph, igraph.Graph):
            raise Exception("GraphMovie::addGraph: graph is not an igraph.Graph object.")
        
        if graph.vcount() == 0:
            raise Exception("GraphMovie::addGraph: graph has 0 vertices.")
        
        self.graphSequence.append(graph)
        
        if frameLabel:
            self.labelSequence.append(frameLabel)
        else:
            self.labelSequence.append(str(len(self.graphSequence)))

    def interpolateLayout(self, lastLabels, lastLayout, g):
        '''
        Calculate the interpolated layout.
        '''
        labels = [v['label'] for v in g.vs]
        seedLayout = []
        
        meanX = sum([p[0] for p in lastLayout]) / float(len(lastLayout))
        meanY = sum([p[1] for p in lastLayout]) / float(len(lastLayout))

        '''
        This is old code and should be optimized, but oh well.
        Maybe next version...
        '''
        for label in labels:
            if label in lastLabels:
                index = lastLabels.index(label)
                seedLayout.append(lastLayout[index])
            else:
                seedLayout.append([meanX,meanY])
        
        layout = g.layout_kamada_kawai(seed = seedLayout, maxiter = self.kkIterations)
        layoutDiff =[[layout[i][0] - seedLayout[i][0], layout[i][1] - seedLayout[i][1]] for i in range(len(seedLayout))]
        
        interpLayout = []

        '''
        This is just simple linear interpolation.
        I would like to try something else, but for now this works!
        '''
        for i in range(self.interpFrames):
            c = float(i) / (self.interpFrames - 1)
            interpLayout.append([[seedLayout[i][0] + c*layoutDiff[i][0],seedLayout[i][1] + c*layoutDiff[i][1]] for i in range(len(seedLayout))])
        
        return interpLayout
    
    
    def plotFrame(self, g, label, layout):
        '''
        Plot a frame of the movie.
        '''
        frameFile = self.frameDirectory + '%08d.png' % (self.frame)
        
        if not self.labelNodes:
            for v in g.vs:
                v['label_size'] = 0.001

        p = igraph.drawing.plot(g, layout = layout, bbox = (self.pixelsX, self.pixelsY), margin = self.margin)
        p.save(frameFile)
        
        '''
        Now label and possibly invert the frames.
        '''
        try:
            im = Image.open(frameFile)
        except:
            '''
            Sometimes the write hasn't flushed and this Open will fail.  
            Wait a few seconds and try again.
            '''
            time.sleep(5)
            im = Image.open(frameFile)
            
        draw = ImageDraw.Draw(im)
        draw.text((self.margin/2.0, self.margin/2.0), label, fill=(0,0,0))
        im.save(frameFile)

        self.frame += 1

    def doMovieLayout(self):
        '''
        Calculate the graph movie layout.
        '''
        lastLayout = None
        lastLabels = None
        
        for i, graph in enumerate(self.graphSequence):
            label = self.labelSequence[i]
            
            if i == 0:
                '''
                This is the first element in the graph sequence, so we have no meaningful initial conditions.
                '''
                layout = graph.layout_circle()
                layout = graph.layout_kamada_kawai(maxiter = self.kkIterations * 10, seed = layout)
                
                for j in range(self.delayFrames):
                    self.plotFrame(graph, label, layout)
                
                lastLayout = layout
                lastLabels = [v['label'] for v in graph.vs]
            else:
                '''
                We need to use the previous graph element initial conditions so the movie makes sense.
                '''
                interpLayout = self.interpolateLayout(lastLabels, lastLayout, graph)
                
                for layout in interpLayout:
                    self.plotFrame(graph, label, layout)

                lastLayout = interpLayout[-1]
                lastLabels = [v['label'] for v in graph.vs]
        
        for j in range(self.delayFrames):
            self.plotFrame(graph, label, layout)

            
    def renderMovie(self):
        '''
        Render the movie with mencoder.
        '''
        cmdString = 'cd {0} && mencoder -noskip mf://*.png -mf fps={1}:type=png -ovc lavc -lavcopts vcodec=mpeg4 -o output.avi'.format(self.frameDirectory, self.fps)
        os.system(cmdString)
