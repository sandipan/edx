#!/usr/bin/python
#    Copyright © 2017 Vincent Gripon (vincent.gripon@imt-atlatique.fr) and IMT Atlantique
#
#    This file is part of PyRat.
#
#    PyRat is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    PyRat is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with PyRat.  If not, see <http://www.gnu.org/licenses/>.

# Imports
from maze import generate_maze, generate_pieces_of_cheese
import random,time
from IPython.core.display import display, HTML

width = 21
height = 15
density = 0.7
pieces = 41
nonsymmetric = True
mud_density = 0.1
mud_range = 10
nonconnected = False
preparation_time = 2000
turn_time = 100
save = True
synchronous = False
max_turns = 2000
maze_file = ""
random_seed = 1
start_random = False
do_display = True

# Convert the decision taken by an AI into an actual new location
def cell_of_decision(location, decision):
    try:
        a, b = location
        if decision == "U":
            return (a,b+1)
        elif decision == "D":
            return (a,b-1)
        elif decision == "L":
            return (a-1,b)
        elif decision == "R":
            return (a+1,b)
        else:
            return (-1,-1)
    except:
        return (-1,-1)


class Game(object):
    def __init__(self,preprocess_1=None, turn_1=None, postprocess_1=None, preprocess_2=None, turn_2=None, postprocess_2=None,save=False,preprocess_1_turn = False, preprocess_2_turn = False, maze_start=None,cheeses_start=None, player1_start=None, player2_start=None):
        self.preprocess_1=preprocess_1 
        self.turn_1=turn_1
        self.postprocess_1=postprocess_1
        self.preprocess_2=preprocess_2
        self.turn_2=turn_2
        self.postprocess_2=postprocess_2
        self.preprocess_1_turn = preprocess_1_turn
        self.preprocess_2_turn = preprocess_2_turn
        self.save = save
        self.height = height
        self.width = width
        self.cheeses_start = cheeses_start
        self.maze_start = maze_start
        self.player1_start = player1_start
        self.player2_start = player2_start
        self.reset()

    def reset(self):
        global width, height,pieces
        self.turn_count = 0
        if self.maze_start is not None:
            self.width, self.height, self.pieces_of_cheese, self.maze = self.maze_start
        else:
            self.width, self.height, self.pieces_of_cheese, self.maze = generate_maze(
                width,height,density,not nonconnected,not nonsymmetric,mud_density,mud_range,maze_file,random_seed)
        if self.player1_start is not None:
            self.player1_location = self.player1_start
        else:
            self.player1_location = (-1,-1)
        if self.player2_start is not None:
            self.player2_location = self.player2_start
        else:
            self.player2_location = (-1,-1)
        if self.cheeses_start is not None:
            pieces = len(self.cheeses_start)
            self.pieces_of_cheese = self.cheeses_start.copy()
        else:
            if self.pieces_of_cheese == []:
                self.pieces_of_cheese, self.player1_location, self.player2_location = generate_pieces_of_cheese(
                    pieces, width, height, not (nonsymmetric), self.player1_location, self.player2_location, start_random)
        if self.turn_1 is None and not self.preprocess_1_turn:
            self.player1_location = (-1,-1)
        if self.turn_2 is None and not self.preprocess_2_turn:
            self.player2_location = (-1,-1)
                
        self.stuck1, self.stuck2, self.moves1, self.moves2, self.miss1, self.miss2, self.score1, self.score2, self.stucks1, self.stucks2 = 0,0,0,0,0,0,0,0,0,0
        self.decision1,self.decision2 = None,None
        if self.preprocess_1 is not None:
            result = self.preprocess_1(
                self.maze,width,height,self.player1_location,self.player2_location,self.pieces_of_cheese,preparation_time)
            if self.preprocess_1_turn:
                self.turn_1 = result
        if self.preprocess_2 is not None:
            result = self.preprocess_2(
                self.maze,width,height,self.player2_location,self.player1_location,self.pieces_of_cheese,preparation_time)
            if self.preprocess_2_turn:
                self.turn_2 = result

        if self.save:
            savefile = open("saves/"+str(int(round(time.time() * 1000))),'w')
            savefile.write("# Random seed\n")
            savefile.write(str(random_seed)+"\n")
            savefile.write("# MazeMap\n")
            savefile.write(str(self.maze)+"\n")
            savefile.write("# Pieces of cheese\n")
            savefile.write(str(self.pieces_of_cheese)+"\n")
            savefile.write("# Rat initial location\n")
            savefile.write(str(self.player1_location)+"\n")
            savefile.write("# Python initial location\n")
            savefile.write(str(self.player2_location)+"\n")
            savefile.write("# Game start\n")
            self.savefile = savefile
        
        self.history = dict(pieces_of_cheese=[self.convert_cheeses()],
                            player1_location=[list(self.player1_location)],
                            player2_location=[list(self.player2_location)])


    def move(self):
        cell1 = cell_of_decision(self.player1_location, self.decision1)
        cell2 = cell_of_decision(self.player2_location, self.decision2)
        if self.turn_1 is not None:
            if self.stuck1 > 0:
                self.stuck1 -= 1
                if self.stuck1 == 0:
                    self.player1_location = cell1
                    self.moves1 += 1
                else:
                    self.stucks1 += 1
            elif cell1 in self.maze[self.player1_location]:
                self.stuck1 = self.maze[self.player1_location][cell1] - 1
                if self.stuck1 == 0:
                    self.player1_location = cell1
                    self.moves1 += 1
                else:
                    self.stucks1 += 1
            else:
                self.miss1 += 1
        if self.turn_2 is not None:
            if self.stuck2 > 0:
                self.stuck2 -= 1
                if self.stuck2 == 0:
                    self.player2_location = cell2
                    self.moves2 += 1
                else:
                    self.stucks2 += 1
            elif cell2 in self.maze[self.player2_location]:
                self.stuck2 = self.maze[self.player2_location][cell2] - 1
                if self.stuck2 == 0:
                    self.player2_location = cell2
                    self.moves2 += 1
                else:
                    self.stucks2 += 1
            else:
                self.miss2 += 1

    def check_eat_cheese(self):
        if self.player1_location in self.pieces_of_cheese:
            self.pieces_of_cheese.remove(self.player1_location)
            if self.player2_location == self.player1_location:
                self.score1 = self.score1 + 0.5
                self.score2 = self.score2 + 0.5
            else:
                self.score1 = self.score1 + 1
        if self.player2_location in self.pieces_of_cheese:
            self.pieces_of_cheese.remove(self.player2_location)
            self.score2 = self.score2 + 1

    def update_turn_variables(self):
        self.turn_count += 1
    
    def is_finished(self):
        if self.turn_count >= max_turns:
            return True
                # Check if one of the players won
        if self.turn_1 is not None and self.turn_2 is not None:
            if self.score1 == self.score2 and self.score1 >= pieces / 2:
                return True
            if self.score1 > pieces / 2:
                return True
            if self.score2 > pieces / 2:
                return True
        else:
            if self.score1 >= pieces:
                return True
            elif self.score2 >= pieces:
                return True
        if len(self.pieces_of_cheese) == 0:
            return True
        return False


    def run_turn(self):
        self.update_turn_variables()
        self.check_eat_cheese()

        if self.is_finished():
            return self.end_game()
        else:

            if self.turn_1 is not None:
                if self.stuck1 == 0:
                    self.decision1 = self.turn_1(
                        self.maze, width, height, self.player1_location, self.player2_location, self.score1, self.score2, self.pieces_of_cheese, turn_time)    
            else:
                self.decision1 = None
            if self.turn_2 is not None:
                if self.stuck2 == 0:
                    self.decision2 = self.turn_2(
                        self.maze, width, height, self.player2_location, self.player1_location, self.score2, self.score1, self.pieces_of_cheese, turn_time)    
            else:
                self.decision2 = None

            self.move()
            if self.save:
                self.savefile.write("# Round {}\n".format(self.turn_count))
                self.savefile.write("{}, {}, {}\n".format(self.convert_cheeses(), str(self.decision1),str(self.decision2)))
            self.history["pieces_of_cheese"].append(self.convert_cheeses())
            self.history["player1_location"].append(list(self.player1_location))
            self.history["player2_location"].append(list(self.player2_location))
            return False

    def get_stats(self):
        win1 = self.score1 > self.score2
        win2 = self.score2 > self.score1
        stats = {
            "win_rat": win1, 
            "win_python": win2, 
            "score_rat": self.score1, 
            "score_python": self.score2, 
            "moves_rat": self.moves1, 
            "moves_python": self.moves2, 
            "miss_rat": self.miss1, 
            "miss_python": self.miss2, 
            "stucks_rat":self.stucks1, 
            "stucks_python":self.stucks2}
        return stats

    def labyrinth_representation(self):
        """
        2^0: Left Wall
        2^1: Up Wall
        2^3: Down Wall
        2^4: Left Mud
        2^5: Right Mud
        2^6: Up Mud
        2^7: Down Mud

        """
        representation = ""
        for i in range(width):
            for j in range(height):
                if j > 0:
                    representation += " "
                position = (i,j)
                graph_node_edges = self.maze[position]
                value = 0
                if not((i-1,j) in graph_node_edges):
                    value += 2**0
                elif graph_node_edges[(i-1,j)] > 1:
                    value += 2**2
                if not((i,j+1) in graph_node_edges):
                    value += 2**1                
                elif graph_node_edges[(i,j+1)] > 1:
                    value += 2**3
                representation += str(value)
            representation += "###"
        return representation 

    def end_game(self):
        if self.save:
            self.savefile.close()
        if self.postprocess_1 is not None:
            self.postprocess_1(
                self.maze, width, height, self.player1_location, self.player2_location, self.score1, self.score2, self.pieces_of_cheese, turn_time)
        if self.postprocess_2 is not None:
            self.postprocess_2(
                self.maze, width, height, self.player2_location, self.player1_location, self.score2, self.score1, self.pieces_of_cheese, turn_time)
        stats = self.get_stats()
        return stats

    def play_match(self):
        result = self.run_turn()
        while not result:
            result = self.run_turn()
        return self.end_game()

    def match_status(self):
        string = "# Random seed\n"
        string += str(random_seed)+"\n"
        string += "# MazeMap\n"
        string += str(self.maze)+"\n"
        string += "# Pieces of cheese\n"
        string += str(self.pieces_of_cheese)+"\n"
        string += "# Rat initial location\n"
        if self.turn_1 is not None:
            string += str(self.player1_location)+"\n"
        else:
            string += "(-1,-1)\n"
        string += "# Python initial location\n"
        if self.turn_2 is not None:
            string = str(self.player2_location)+"\n"
        else:
            string = "(-1,-1)\n"
        string = "# Game start\n"
        return string

    def convert_cheeses(self):
        return str(self.pieces_of_cheese).replace("),",";").replace("[","").replace("(","").replace("]","").replace(")","")
    
def preprocessing(mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, piecesOfCheese, timeAllowed):
    return
def turn (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed):
    return
def postprocessing (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed):
    return

def start_display():
    if do_display:
        start = """
        <style type=text/css>
            #gjs-canvas{
                border: 1px solid #ccc;
                width: 800px;
                height: 300px;      
                display: block;
                position: fixed;
                bottom: 0;
                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;
            }
            
            
            
        </style>
        <script src="gamejs-2.0.1.js"></script>
        <script>
        header = parseInt(document.getElementById("header").clientHeight);
        height = document.body.clientHeight;
        new_height = height-300-header;
        window.onresize = function(event) {
                height = document.body.clientHeight;
                header = parseInt(document.getElementById("header").clientHeight);
            if(do_resize)
            {
                new_height = height-300-header;
            }
            else
            {
                new_height = height-header;
            }
                document.getElementById("site").style.height = String(new_height)+"px"
        };
            console.log(height,header,300,new_height)
            document.getElementById("site").style.height = String(new_height)+"px"

                var resize = false;
                var myEle = document.getElementById("gjs-canvas");
                var do_resize = true;
                if(!myEle){
                var squares_height = 15;
                var squares_width = 21;

                var score1 = 0;
                var moves1 = 0;
                var miss1 = 0;
                var stuck1 = 0;
                var p1name = "RatName"

                var score2 = 0;
                var moves2 = 0;
                var miss2 = 0;
                var stuck2 = 0;
                var p2name = "PythonName"

                var labyrinth = "1 3 3 1 1 1 3 3 1 3 1 1 1 9 3###1 0 2 4 1 3 9 0 1 0 2 1 2 2 2###1 0 0 0 2 1 2 1 0 3 2 1 3 2 2###2 1 0 3 0 1 0 3 3 0 1 2 6 2 2###2 0 1 3 3 1 2 3 0 1 2 3 3 2 2###1 2 3 1 0 2 0 2 1 1 3 0 0 0 3###0 1 2 0 1 3 0 1 3 2 0 0 3 0 3###6 3 1 3 0 3 2 2 3 2 8 1 2 2 2###0 0 0 3 0 9 3 0 4 3 1 3 4 1 3###1 2 2 2 2 9 1 1 2 1 3 0 3 0 3###0 1 3 3 2 0 1 3 0 0 3 2 0 2 6###0 0 1 0 3 2 2 1 3 3 0 3 2 1 3###2 1 1 2 2 2 2 0 1 0 3 3 2 0 3###0 1 3 2 3 3 8 0 3 2 0 2 0 2 2###2 2 3 1 2 0 0 1 3 3 2 2 6 2 2###3 0 0 0 1 3 6 2 1 0 2 9 2 0 3###0 0 1 3 2 0 3 1 2 2 2 1 9 3 2###0 3 2 1 3 2 2 2 2 0 3 2 2 0 3###1 0 1 0 3 3 0 3 3 3 0 2 2 2 6###2 0 6 1 3 4 2 0 2 6 3 0 3 1 2###1 9 0 2 8 3 0 3 8 0 8 3 1 2 2###";
                var pieces_of_cheese = ['8, 8; 9, 4'];
                var player1_location = [[0,0]];
                var player2_location = [[-1,-1]];
                var turn = 0;
                var max_turn = 0;

                    require.setModuleRoot('./');
                    require.run('display');
                }



        </script>
        
        """
        return display(HTML(start))

def display_game(game):
    if do_display:
        middle = """
                <script>
                squares_height = {height};
                squares_width = {width};

                score1 = {score1};
                moves1 = {moves1};
                miss1 = {miss1};
                stuck1 = {stuck1};
                p1name = "RatName"

                score2 = {score2};
                moves2 = {moves2};
                miss2 = {miss2};
                stuck2 = {stuck2};
                p2name = "PythonName"

                labyrinth = "{labyrinth}";
                pieces_of_cheese = {pieces_of_cheese};
                player1_location = {player1_location};
                player2_location = {player2_location};
                turn = 0;
                max_turn = {max_turn};
                resize = true;
                </script>

            """.format(height=game.height,width=game.width,
                labyrinth=game.labyrinth_representation(),score1=game.score1,score2=game.score2,
                moves1=game.moves1,moves2=game.moves2,miss1=game.miss1,miss2=game.miss2,stuck1=game.stuck1,
                stuck2=game.stuck2,pieces_of_cheese=game.history["pieces_of_cheese"],
                player1_location=game.history["player1_location"],player2_location = game.history["player2_location"],max_turn = len(game.history["player1_location"]))
        return display(HTML(middle))

def stop_display():
    script = """<script>
    setTimeout(function () {
        document.getElementById('gjs-canvas').style.display = 'none'; 
        document.getElementById('gjs-canvas').style.position = 'relative'; 
        do_resize = false;
        window.dispatchEvent(new Event('resize'));
    }, 2000);
        document.getElementById('gjs-canvas').style.display = 'none'; 
        document.getElementById('gjs-canvas').style.position = 'relative'; 
        do_resize = false;
        window.dispatchEvent(new Event('resize'));
         

        </script>"""

    return HTML(script)
def redisplay():
    script = """<script>
        document.getElementById('gjs-canvas').style.display = 'block'; 
        document.getElementById('gjs-canvas').style.position = 'fixed'; 
        do_resize = true;
        window.dispatchEvent(new Event('resize'));

        </script>"""

    return HTML(script)