
# coding: utf-8

# Welcome to the last lab session of the Advanced algorithmics and graph theory with Python course. In this session you will learn how to simulate games against a defined opponent and use combinatorial game theory to play "perfect games" against those opponents.
# 
# The main objectives of this exercise are to:
# * Write functions to ensure winning in a combinatorial game
# 
# The first thing we have to do is to use the functions we coded in the last exercise to simulate the move of the opponent. We are going to be controlling all the variables of the game.

# To ensure a win in a combinatorial game the simplest approach is to simulate all the possible playouts of the game. As this is too computationally expensive in this laboratory we are going to exploit all the possible playouts against a deterministic adversary. A deterministic adversary is an adversary that given a game state will always execute the same move. This simplification greatly reduces the amount of playouts to simulate.
# 
# One example of deterministic adversary is the greedy agent you programmed in Lab 5. To avoid recoding we will give you the greedy turn function which will be available as greedy.turn or turn_greedy.
# 
# The first thing we will do is create the game. To create a game we need to define the game state variables, including height, width, the maze, the pieces of cheese, etc. We will also set pyrat to use the same values as the ones we will use for our simulations.
# 
# PS: In this lab session we will consider games without mud in order to reduce the complexity of the solution. 

# In[1]:


# Import definitions
from imports import maze
import utils
import greedy
import pyrat

# Define the game variables
width = 9
height = 9 
density = 0.95
pieces = 7
nonconnected = False
nonsymmetric = False
mud_density = 0.0
mud_range = 2
maze_file = "" 
random_seed = 20
player1_location,player2_location = (0,0),(8,8)
player1_score,player2_score = 0,0
time_allowed = 100000
new_player1_location,new_player2_location = None,None
start_random = False
turn_greedy = greedy.turn

# Copy those variables to pyrat
pyrat.width = width
pyrat.height = height
pyrat.density = density
pyrat.nonconnected = nonconnected
pyrat.nonsymmetric = nonsymmetric
pyrat.mud_density = mud_density
pyrat.mud_range = mud_range
pyrat.maze_file = maze_file
pyrat.random_seed = random_seed
pyrat.pieces = pieces
pyrat.time_allowed = time_allowed
pyrat.start_random = start_random


# Generate the maze and pieces of cheese that are going to be used in this section
width, height, pieces_of_cheese, maze_graph = maze.generate_maze(
    width, height, density, not nonconnected, not nonsymmetric, mud_density, mud_range, maze_file, random_seed
)



pieces_of_cheese, player1_location,player2_location = maze.generate_pieces_of_cheese(
    pieces, width, height, not nonsymmetric, player1_location, player2_location, start_random
)

maze_start = 9, 9, [(1, 0), (7, 8), (4, 4), (2, 4), (6, 4), (4, 3), (4, 5)], {(0, 0): {(1, 0): 1, (0, 1): 1}, (0, 1): {(0, 0): 1}, (0, 2): {(1, 2): 1, (0, 3): 1}, (0, 3): {(1, 3): 1, (0, 2): 1}, (0, 4): {(1, 4): 1}, (0, 5): {(0, 6): 1, (1, 5): 1}, (0, 6): {(0, 5): 1, (0, 7): 1}, (0, 7): {(0, 6): 1, (1, 7): 1}, (0, 8): {(1, 8): 1}, (1, 0): {(0, 0): 1, (2, 0): 1, (1, 1): 1}, (1, 1): {(1, 0): 1}, (1, 2): {(0, 2): 1}, (1, 3): {(0, 3): 1, (2, 3): 1, (1, 4): 1}, (1, 4): {(0, 4): 1, (1, 3): 1}, (1, 5): {(0, 5): 1}, (1, 6): {(1, 7): 1, (2, 6): 1}, (1, 7): {(1, 8): 1, (1, 6): 1, (0, 7): 1}, (1, 8): {(0, 8): 1, (1, 7): 1, (2, 8): 1}, (2, 0): {(3, 0): 1, (1, 0): 1}, (2, 1): {(3, 1): 1}, (2, 2): {(3, 2): 1}, (2, 3): {(3, 3): 1, (1, 3): 1}, (2, 4): {(2, 5): 1}, (2, 5): {(2, 6): 1, (2, 4): 1}, (2, 6): {(1, 6): 1, (3, 6): 1, (2, 5): 1}, (2, 7): {(2, 8): 1}, (2, 8): {(3, 8): 1, (1, 8): 1, (2, 7): 1}, (3, 0): {(2, 0): 1, (4, 0): 1}, (3, 1): {(4, 1): 1, (2, 1): 1}, (3, 2): {(4, 2): 1, (2, 2): 1}, (3, 3): {(4, 3): 1, (3, 4): 1, (2, 3): 1}, (3, 4): {(3, 3): 1, (3, 5): 1, (4, 4): 1}, (3, 5): {(3, 6): 1, (4, 5): 1, (3, 4): 1}, (3, 6): {(3, 5): 1, (2, 6): 1}, (3, 7): {(3, 8): 1}, (3, 8): {(2, 8): 1, (4, 8): 1, (3, 7): 1}, (4, 0): {(5, 0): 1, (4, 1): 1, (3, 0): 1}, (4, 1): {(4, 0): 1, (3, 1): 1}, (4, 2): {(3, 2): 1, (4, 3): 1}, (4, 3): {(5, 3): 1, (4, 2): 1, (3, 3): 1}, (4, 4): {(5, 4): 1, (3, 4): 1}, (4, 5): {(3, 5): 1, (4, 6): 1, (5, 5): 1}, (4, 6): {(5, 6): 1, (4, 5): 1}, (4, 7): {(4, 8): 1, (5, 7): 1}, (4, 8): {(3, 8): 1, (4, 7): 1, (5, 8): 1}, (5, 0): {(6, 0): 1, (4, 0): 1, (5, 1): 1}, (5, 1): {(5, 0): 1}, (5, 2): {(5, 3): 1, (6, 2): 1}, (5, 3): {(5, 2): 1, (4, 3): 1, (5, 4): 1}, (5, 4): {(5, 5): 1, (5, 3): 1, (4, 4): 1}, (5, 5): {(4, 5): 1, (5, 4): 1, (6, 5): 1}, (5, 6): {(4, 6): 1, (6, 6): 1}, (5, 7): {(4, 7): 1, (6, 7): 1}, (5, 8): {(6, 8): 1, (4, 8): 1}, (6, 0): {(5, 0): 1, (7, 0): 1, (6, 1): 1}, (6, 1): {(6, 0): 1}, (6, 2): {(7, 2): 1, (5, 2): 1, (6, 3): 1}, (6, 3): {(6, 2): 1, (6, 4): 1}, (6, 4): {(6, 3): 1}, (6, 5): {(5, 5): 1, (7, 5): 1}, (6, 6): {(5, 6): 1}, (6, 7): {(5, 7): 1}, (6, 8): {(5, 8): 1, (7, 8): 1}, (7, 0): {(8, 0): 1, (7, 1): 1, (6, 0): 1}, (7, 1): {(7, 0): 1, (7, 2): 1, (8, 1): 1}, (7, 2): {(7, 1): 1, (6, 2): 1}, (7, 3): {(8, 3): 1}, (7, 4): {(8, 4): 1, (7, 5): 1}, (7, 5): {(8, 5): 1, (6, 5): 1, (7, 4): 1}, (7, 6): {(8, 6): 1}, (7, 7): {(7, 8): 1}, (7, 8): {(8, 8): 1, (6, 8): 1, (7, 7): 1}, (8, 0): {(7, 0): 1}, (8, 1): {(8, 2): 1, (7, 1): 1}, (8, 2): {(8, 3): 1, (8, 1): 1}, (8, 3): {(8, 2): 1, (7, 3): 1}, (8, 4): {(7, 4): 1}, (8, 5): {(7, 5): 1, (8, 6): 1}, (8, 6): {(7, 6): 1, (8, 5): 1}, (8, 7): {(8, 8): 1}, (8, 8): {(7, 8): 1, (8, 7): 1}}
width, height, pieces_of_cheese, maze_graph = maze_start


# # Exercise A (1pt)
# 
# Your first exercise is to create a control function that will determine if a piece of cheese has been eaten and update the state of the game accordingly. To do this you will define the check_eat_cheese function. This function receives the location of both players, the score of both players and a list containing the location of the pieces of cheese
# 
# It will then check if one or more players have collected a piece of cheese. The rules are as follow:
# 
# - If both players are at the same location and there is a piece of cheese in that location, add 0.5 points to each player's score and remove the location from the list of pieces of cheese locations.
# - If the first condition is false and the player is on the same location as a piece of cheese, add 1 point to the player's score and remove the player location from the list of pieces of cheese locations.
# - If the first condition is false and the opponent is on the same location as a piece of cheese, add 1 point to the opponent's score and remove the opponent location from the list of pieces of cheese locations.
# 
# It returns the updated scores of both players. The list should be modified in place.
# 
# Tip: You can use the method pieces_of_cheese.remove(location) to remove a location from the list of pieces of cheese
# 

# In[8]:


def check_eat_cheese(player_location,opponent_location,player_score,opponent_score,pieces_of_cheese):
    if player_location in pieces_of_cheese and player_location == opponent_location:
        # Add 0.5 to each player score
        # Remove the piece of cheese of the player location from the pieces_of_cheese list 
        player_score += 0.5
        opponent_score += 0.5
        pieces_of_cheese.remove(player_location)
    else:
        if player_location in pieces_of_cheese:
            # Add 1.0 to the player score
            # Remove the piece of cheese of the player location from the pieces_of_cheese list 
            player_score += 1
            pieces_of_cheese.remove(player_location)
        if opponent_location in pieces_of_cheese:
            # Add 1.0 to the opponent score
            # Remove the piece of cheese of the opponent location from the pieces_of_cheese list 
            opponent_score += 1
            pieces_of_cheese.remove(opponent_location)
    return player_score,opponent_score


# In[9]:


#
# AUTOGRADER TEST - DO NOT REMOVE
#


local_pieces_of_cheese = [(0,0),(1,0)]
local_player_location, local_opponent_location = [(0,0),(0,0)]
local_player_score, local_opponent_score = 3,4

print("Player and opponent are at positions {} and {} respectively. While their scores are {} and {} respectively".format(local_player_location,local_opponent_location,local_player_score,local_opponent_score))
print("The list of pieces of cheese locations has {} cheeses in positions {}".format(len(local_pieces_of_cheese),local_pieces_of_cheese))
local_player_score,local_opponent_score = check_eat_cheese(local_player_location,local_opponent_location,local_player_score,local_opponent_score,local_pieces_of_cheese)
print("After the function execution the scores are {} and {} and the list of pieces of cheese locations has {} cheeses in positions {}".format(local_player_score,local_opponent_score,len(local_pieces_of_cheese),local_pieces_of_cheese))
local_player_score,local_opponent_score = check_eat_cheese(local_player_location,local_opponent_location,local_player_score,local_opponent_score,local_pieces_of_cheese)
print("After another function execution the scores are {} and {} and the list of pieces of cheese locations has {} cheeses in positions {}".format(local_player_score,local_opponent_score,len(local_pieces_of_cheese),local_pieces_of_cheese))

print()

local_pieces_of_cheese = [(1,0),(0,0)]
local_player_location, local_opponent_location = [(1,0),(0,0)]
local_player_score, local_opponent_score = 3,2

print("Player and opponent are at positions {} and {} respectively. While their scores are {} and {} respectively".format(local_player_location,local_opponent_location,local_player_score,local_opponent_score))
print("The list of pieces of cheese locations has {} cheeses in positions {}".format(len(local_pieces_of_cheese),local_pieces_of_cheese))
local_player_score,local_opponent_score = check_eat_cheese(local_player_location,local_opponent_location,local_player_score,local_opponent_score,local_pieces_of_cheese)
print("After the function execution the scores are {} and {} and the list of pieces of cheese locations has {} cheeses in positions {}".format(local_player_score,local_opponent_score,len(local_pieces_of_cheese),local_pieces_of_cheese))

print()


local_pieces_of_cheese = [(8,8),(1,2)]
local_player_location, local_opponent_location = [(4,3),(1,2)]
local_player_score, local_opponent_score = 3,3

print("Player and opponent are at positions {} and {} respectively. While their scores are {} and {} respectively".format(local_player_location,local_opponent_location,local_player_score,local_opponent_score))
print("The list of pieces of cheese locations has {} cheeses in positions {}".format(len(local_pieces_of_cheese),local_pieces_of_cheese))
local_player_score,local_opponent_score = check_eat_cheese(local_player_location,local_opponent_location,local_player_score,local_opponent_score,local_pieces_of_cheese)
print("After the function execution the scores are {} and {} and the list of pieces of cheese locations has {} cheeses in positions {}".format(local_player_score,local_opponent_score,len(local_pieces_of_cheese),local_pieces_of_cheese))


# After correctly adding your code, and executing the cells you should see
# 
# ```
# Player and opponent are at positions (0, 0) and (0, 0) respectively. While their scores are 3 and 4 respectively
# The list of pieces of cheese locations has 2 cheeses in positions [(0, 0), (1, 0)]
# After the function execution the scores are 3.5 and 4.5 and the list of pieces of cheese locations has 1 cheeses in positions [(1, 0)]
# After another function execution the scores are 3.5 and 4.5 and the list of pieces of cheese locations has 1 cheeses in positions [(1, 0)]
# 
# Player and opponent are at positions (1, 0) and (0, 0) respectively. While their scores are 3 and 2 respectively
# The list of pieces of cheese locations has 2 cheeses in positions [(1, 0), (0, 0)]
# After the function execution the scores are 4 and 3 and the list of pieces of cheese locations has 0 cheeses in positions []
# 
# Player and opponent are at positions (4, 3) and (1, 2) respectively. While their scores are 3 and 3 respectively
# The list of pieces of cheese locations has 2 cheeses in positions [(8, 8), (1, 2)]
# After the function execution the scores are 3 and 4 and the list of pieces of cheese locations has 1 cheeses in positions [(8, 8)]
# ```

# # Exercise B (1pt)
# 
# Your second exercise is going to be to simulate a move in a pyrat game. To do this you will define the simulate_move function. This function needs the full state of the game (maze_graph,width,height,player1_location,player2_location,player1_score,player2_score,pieces_of_cheese,time_allowed) and also the turn functions for both players.
# 
# It will get the decisions of both players by calling their turn functions with the full state of the game and will then use the move function from the utils module to get the new position of the player. It should then update the respective player_location variable
# 
# Finally it should verify if a cheese has been eaten and update the scores accordingly using the check_eat_cheese function and return the new state of the game (player1_location,player2_location,player1_score,player2_score,pieces_of_cheese)

# In[10]:


def move(maze,player_location,decision):
    new_location = utils.get_new_location(player_location,decision)
    if new_location in maze[player_location]:
        return new_location
    else:
        return player_location
    
def simulate_move(
    maze_graph,width,height,player1_location,player2_location,
    player1_score,player2_score,pieces_of_cheese,
    turn_player1,turn_player2,time_allowed):    
    pieces_of_cheese = pieces_of_cheese.copy()
    # Get the decision of both players using the turn functions
    # Use the decisions to move the players using the move function
    # Update the player1_location and player2_location variable after the move
    decision1 = turn_player1(maze_graph, width, height, player1_location, player2_location, player1_score, player2_score, pieces_of_cheese, time_allowed)
    decision2 = turn_player2(maze_graph, width, height, player2_location, player1_location, player2_score, player1_score, pieces_of_cheese, time_allowed)
    player1_location = move(maze_graph,player1_location,decision1)
    player2_location = move(maze_graph,player2_location,decision2)
    player1_score,player2_score = check_eat_cheese(
        player1_location,player2_location,player1_score,player2_score,pieces_of_cheese
    )
    return player1_location,player2_location,player1_score,player2_score,pieces_of_cheese


# In[11]:


#
# AUTOGRADER TEST - DO NOT REMOVE
#

print("Start of the game:")
print("Player 1 location and score: {}, {}".format(player1_location,player1_score))
print("Player 2 location and score: {}, {}".format(player2_location,player2_score))
print("Amount of cheeses left is {} and their locations are {}".format(len(pieces_of_cheese),pieces_of_cheese))
newplayer1_location,newplayer2_location,newplayer1_score,newplayer2_score,newpieces_of_cheese = simulate_move(maze_graph,width,height,player1_location,player2_location,player1_score,player2_score,pieces_of_cheese,turn_greedy,turn_greedy,time_allowed)

print("After first move:")
print("Player 1 location and score: {}, {}".format(newplayer1_location,newplayer1_score))
print("Player 2 location and score: {}, {}".format(newplayer2_location,newplayer2_score))
print("Amount of cheeses left is {} and their locations are {}".format(len(newpieces_of_cheese),newpieces_of_cheese))

newplayer1_location,newplayer2_location,newplayer1_score,newplayer2_score,newpieces_of_cheese = simulate_move(maze_graph,width,height,newplayer1_location,newplayer2_location,newplayer1_score,newplayer2_score,newpieces_of_cheese,turn_greedy,turn_greedy,time_allowed)
print("After second move:")
print("Player 1 location and score: {}, {}".format(newplayer1_location,newplayer1_score))
print("Player 2 location and score: {}, {}".format(newplayer2_location,newplayer2_score))
print("Amount of cheeses left is {} and their locations are {}".format(len(newpieces_of_cheese),newpieces_of_cheese))


# After correctly adding your code, and executing the cells you should see
# 
# ```
# Start of the game:
# Player 1 location and score: (0, 0), 0
# Player 2 location and score: (8, 8), 0
# Amount of cheeses left is 7 and their locations are [(1, 0), (7, 8), (4, 4), (2, 4), (6, 4), (4, 3), (4, 5)]
# After first move:
# Player 1 location and score: (1, 0), 1
# Player 2 location and score: (7, 8), 1
# Amount of cheeses left is 5 and their locations are [(4, 4), (2, 4), (6, 4), (4, 3), (4, 5)]
# After second move:
# Player 1 location and score: (2, 0), 1
# Player 2 location and score: (6, 8), 1
# Amount of cheeses left is 5 and their locations are [(4, 4), (2, 4), (6, 4), (4, 3), (4, 5)]
# ```

# # Exercise C (1pt)
# 
# Now that you have a function that allows you to simulate one move for two deterministic players it is now possible to simulate entire games. Complete the simulate_game using the simulate_move function from exercise B and end_game function to verify if the game is already over.

# In[16]:


def end_game(pieces_of_cheese,player1_score,player2_score,rounds,max_rounds = 1000):
    totalPieces = len(pieces_of_cheese) + player1_score + player2_score
    if rounds > max_rounds or player1_score > totalPieces / 2 or player2_score > totalPieces / 2 or len(pieces_of_cheese) == 0:
        return True
    else:
        return False

def simulate_game(maze_graph,width,height,player1_location,player2_location,
    player1_score,player2_score,pieces_of_cheese,
    turn_player1,turn_player2,time_allowed):
    
    pieces_of_cheese = pieces_of_cheese.copy()
    rounds = 0
    
    while not end_game(pieces_of_cheese,player1_score,player2_score,rounds):
        
        rounds += 1
        player1_location,player2_location,player1_score,player2_score,pieces_of_cheese = simulate_move(maze_graph,width,height,player1_location,player2_location, player1_score,player2_score,
                      pieces_of_cheese, turn_player1,turn_player2,time_allowed)
    
    rounds += 1
    return player1_location,player2_location,player1_score,player2_score,pieces_of_cheese,rounds


# In[17]:


#
# AUTOGRADER TEST - DO NOT REMOVE
#

newplayer1_location,newplayer2_location,newplayer1_score,newplayer2_score,newpieces_of_cheese,new_rounds = simulate_game(maze_graph,width,height,player1_location,player2_location,
    player1_score,player2_score,pieces_of_cheese,
    turn_greedy,turn_greedy,time_allowed)
print("At the end of the game:")
print("Player 1 location and score: {}, {}".format(newplayer1_location,newplayer1_score))
print("Player 2 location and score: {}, {}".format(newplayer2_location,newplayer2_score))
print("Cheeses left {}".format(len(newpieces_of_cheese)))
print("Number of rounds {}".format(new_rounds))


# After correctly adding your code, and executing the cells you should see
# 
# ```
# At the end of the game:
# Player 1 location and score: (4, 4), 3.5
# Player 2 location and score: (4, 4), 3.5
# Cheeses left 0
# Number of rounds 21
# ```
# 
# Since the maze is symmetric and the players use the same function, the game is a tie.

# # Exercise D (1pt)
# 
# Given that now we can simulate deterministic games, we have to create a function that will generate a deterministic turn function using an arbitrarily defined order of pieces of cheese to pick and therefore allow us to test all the possible games.
# 
# Again in the interest of reducing the complexity, instead of trying all the possible moves we are going to consider all the possible sequences of cheeses. Said otherwise, we consider that a player strategy is to choose which piece of cheese to chase next. Then we simulate the game until this piece of cheese is taken (either by the player or its opponent) before we make a new decision. This greatly reduces the number of simulations needed for the brute force algorithm.
# 
# You are given an auxiliary function that given an ordered list of locations, returns the first one that is present in the list of pieces of cheese. This function allow us to test different orders of searching for the pieces of cheese.
# 
# You will define the create_turn_target_function which is a function generator. It receives a targets list which is an ordered list of pieces of cheese to visit. It defines and returns a turn function that uses the targets list that was passed as a parameter of the function generator.
# 
# You will complete the internal_turn_target function which will use the target_choice function to choose the next target and then use the A_to_B function defined on the utils module to generate the full list of movements needed to go to the chosen piece of cheese. You will then return the first movement of this list. The function generator then returns this internal_turn_target which is defined with the correct targets list. 
# 
# Tip: The A_to_B function from the utils module receives three arguments the maze_graph, the player_location and the target vertex to visit.

# In[20]:


def target_choice(targets,pieces_of_cheese):
    for target in targets:
        if target in pieces_of_cheese:
            return target
    return None

def create_turn_target_function(targets):
    targets = targets.copy()

    def internal_turn_target(maze_graph, width,height, player_location, opponent_location, player_score, 
            opponent_score, pieces_of_cheese, time_allowed):
        target = target_choice(targets, pieces_of_cheese)
        movements = utils.A_to_B(maze_graph, player_location, target)
        return movements[0]
    return internal_turn_target


# In[21]:


#
# AUTOGRADER TEST - DO NOT REMOVE
#
turn_target = create_turn_target_function([(1, 0), (7, 8), (4, 4), (2, 4), (4, 3), (6, 4), (4, 5)])

newplayer1_location,newplayer2_location,newplayer1_score,newplayer2_score,newpieces_of_cheese,new_rounds = simulate_game(
    maze_graph,width,height,player1_location,player2_location,
    player1_score,player2_score,pieces_of_cheese,
    turn_target,turn_greedy,time_allowed)
print("At the end of the game:")
print("Player 1 (target_choice) location and score: {}, {}".format(newplayer1_location,newplayer1_score))
print("Player 2 (greedy) location and score: {}, {}".format(newplayer2_location,newplayer2_score))
print("Cheeses left {}".format(len(newpieces_of_cheese)))
print("Number of rounds {}".format(new_rounds))


# After correctly adding your code, and executing the cells you should see
# 
# ```
# At the end of the game:
# Player 1 (target_choice) location and score: (6, 4), 4
# Player 2 (greedy) location and score: (6, 2), 3
# Cheeses left 0
# Number of rounds 23
# ```
# 
# Note that in the first line we have defined by hand an order that is guaranteed to win the game. In the next exercise we will show you how to search for the best possible order

# # Exercise E (1pt)
# 
# With the arbitrarily ordered turn function creator defined, we can now use this to test all the possible games and therefore search for the optimal game.
# 
# In this exercise you will define the full_combinatorial_game function which takes an initial game state (maze_graph,width,height,pieces_of_cheese,player1_location,player2_location) and the deterministic turn function of the adversary and use those informations to test all the possible permutations of the order of pieces of cheese to pick. It returns the best target order, the difference of scores following that order and the amount of turns needed to win the game using that order.
# 
# Testing all the possibilities (brute force) allows us to guarantee that we can find the best solution (greatest difference between scores with the least amount of rounds needed). However a lot of improvement could be made in this function to avoid performing computation for all of the possibilities. This version probably works with at most 7 pieces of cheese (Almost two minutes per execution).

# In[64]:


import itertools
import tqdm
def full_combinatorial_game(maze_graph,width,height,pieces_of_cheese,player1_location,player2_location,turn_opponent,time_allowed):
    all_possible_permutations = list(itertools.permutations(pieces_of_cheese.copy()))
    best_order = None
    best_difference = -float("inf")
    best_rounds = float("inf")
    for order in tqdm.tqdm(all_possible_permutations):
        targets = list(order)
        # Create the turn function using the targets order
        # Simulate a game using the simulate_game function
        # Calculate the difference of scores from player1_score to player2_score
        # If this difference is greater than the best difference, or equal with a smaller number of rounds player
            #Save the current difference as the best_difference
            #Save the current targets list as the best_order
            #Save the current number of rounds as best_rounds
        turn = create_turn_target_function(targets)
        new_player1_location,new_player2_location,new_player1_score,new_player2_score,new_pieces_of_cheese,rounds = simulate_game(
            maze_graph,width,height,player1_location,player2_location,
            0,0,pieces_of_cheese,
            turn,turn_opponent,time_allowed)
        current_difference = new_player1_score - new_player2_score
        if (current_difference > best_difference) or (current_difference == best_difference and rounds < best_rounds):
            best_difference = current_difference
            best_order = targets
            best_rounds = rounds
        
    return best_order,best_difference,best_rounds


# In[65]:


#
# AUTOGRADER TEST - DO NOT REMOVE
#

order,best_difference,best_rounds = full_combinatorial_game(maze_graph,width,height,pieces_of_cheese,
                                                            player1_location,player2_location,turn_greedy,time_allowed)
print("Order: {}".format(order))
print("Best difference: {}".format(best_difference))
print("Quickest route: {}".format(best_rounds))


# After correctly adding your code, and executing the cells you should see
# 
# ```
# Order: [(1, 0), (7, 8), (4, 4), (2, 4), (4, 3), (6, 4), (4, 5)]
# Best difference: 1
# Quickest route: 23
# ```

# # Extra
# 
# Now that we can simulate games and search for the best game, we can use this function to ensure playing the best possible pyrat game against a greedy algorithm. 
# 
# In the next cell we define the create_preprocessing function which takes an opponent deterministic turn function and creates a preprocessing function that will generate perfect turn functions against that opponent. 

# In[62]:


pyrat.start_display()

def create_preprocessing(turn_opponent):
    def preprocessing(maze_graph, width, height, player1_location, player2_location, pieces_of_cheese, time_allowed):
        targets, best_difference,rounds = full_combinatorial_game(maze_graph,width,height,pieces_of_cheese,
                                                                  player1_location,player2_location,turn_opponent,time_allowed)
        print("Should have a {} point difference with {} movements".format(best_difference,rounds))
        return create_turn_target_function(targets)
    return preprocessing
preprocessing = create_preprocessing(turn_greedy)


# In[63]:


pyrat.pieces = pieces
maze_start = 9, 9, [(1, 0), (7, 8), (4, 4), (2, 4), (6, 4), (4, 3), (4, 5)], {(0, 0): {(1, 0): 1, (0, 1): 1}, (0, 1): {(0, 0): 1}, (0, 2): {(1, 2): 1, (0, 3): 1}, (0, 3): {(1, 3): 1, (0, 2): 1}, (0, 4): {(1, 4): 1}, (0, 5): {(0, 6): 1, (1, 5): 1}, (0, 6): {(0, 5): 1, (0, 7): 1}, (0, 7): {(0, 6): 1, (1, 7): 1}, (0, 8): {(1, 8): 1}, (1, 0): {(0, 0): 1, (2, 0): 1, (1, 1): 1}, (1, 1): {(1, 0): 1}, (1, 2): {(0, 2): 1}, (1, 3): {(0, 3): 1, (2, 3): 1, (1, 4): 1}, (1, 4): {(0, 4): 1, (1, 3): 1}, (1, 5): {(0, 5): 1}, (1, 6): {(1, 7): 1, (2, 6): 1}, (1, 7): {(1, 8): 1, (1, 6): 1, (0, 7): 1}, (1, 8): {(0, 8): 1, (1, 7): 1, (2, 8): 1}, (2, 0): {(3, 0): 1, (1, 0): 1}, (2, 1): {(3, 1): 1}, (2, 2): {(3, 2): 1}, (2, 3): {(3, 3): 1, (1, 3): 1}, (2, 4): {(2, 5): 1}, (2, 5): {(2, 6): 1, (2, 4): 1}, (2, 6): {(1, 6): 1, (3, 6): 1, (2, 5): 1}, (2, 7): {(2, 8): 1}, (2, 8): {(3, 8): 1, (1, 8): 1, (2, 7): 1}, (3, 0): {(2, 0): 1, (4, 0): 1}, (3, 1): {(4, 1): 1, (2, 1): 1}, (3, 2): {(4, 2): 1, (2, 2): 1}, (3, 3): {(4, 3): 1, (3, 4): 1, (2, 3): 1}, (3, 4): {(3, 3): 1, (3, 5): 1, (4, 4): 1}, (3, 5): {(3, 6): 1, (4, 5): 1, (3, 4): 1}, (3, 6): {(3, 5): 1, (2, 6): 1}, (3, 7): {(3, 8): 1}, (3, 8): {(2, 8): 1, (4, 8): 1, (3, 7): 1}, (4, 0): {(5, 0): 1, (4, 1): 1, (3, 0): 1}, (4, 1): {(4, 0): 1, (3, 1): 1}, (4, 2): {(3, 2): 1, (4, 3): 1}, (4, 3): {(5, 3): 1, (4, 2): 1, (3, 3): 1}, (4, 4): {(5, 4): 1, (3, 4): 1}, (4, 5): {(3, 5): 1, (4, 6): 1, (5, 5): 1}, (4, 6): {(5, 6): 1, (4, 5): 1}, (4, 7): {(4, 8): 1, (5, 7): 1}, (4, 8): {(3, 8): 1, (4, 7): 1, (5, 8): 1}, (5, 0): {(6, 0): 1, (4, 0): 1, (5, 1): 1}, (5, 1): {(5, 0): 1}, (5, 2): {(5, 3): 1, (6, 2): 1}, (5, 3): {(5, 2): 1, (4, 3): 1, (5, 4): 1}, (5, 4): {(5, 5): 1, (5, 3): 1, (4, 4): 1}, (5, 5): {(4, 5): 1, (5, 4): 1, (6, 5): 1}, (5, 6): {(4, 6): 1, (6, 6): 1}, (5, 7): {(4, 7): 1, (6, 7): 1}, (5, 8): {(6, 8): 1, (4, 8): 1}, (6, 0): {(5, 0): 1, (7, 0): 1, (6, 1): 1}, (6, 1): {(6, 0): 1}, (6, 2): {(7, 2): 1, (5, 2): 1, (6, 3): 1}, (6, 3): {(6, 2): 1, (6, 4): 1}, (6, 4): {(6, 3): 1}, (6, 5): {(5, 5): 1, (7, 5): 1}, (6, 6): {(5, 6): 1}, (6, 7): {(5, 7): 1}, (6, 8): {(5, 8): 1, (7, 8): 1}, (7, 0): {(8, 0): 1, (7, 1): 1, (6, 0): 1}, (7, 1): {(7, 0): 1, (7, 2): 1, (8, 1): 1}, (7, 2): {(7, 1): 1, (6, 2): 1}, (7, 3): {(8, 3): 1}, (7, 4): {(8, 4): 1, (7, 5): 1}, (7, 5): {(8, 5): 1, (6, 5): 1, (7, 4): 1}, (7, 6): {(8, 6): 1}, (7, 7): {(7, 8): 1}, (7, 8): {(8, 8): 1, (6, 8): 1, (7, 7): 1}, (8, 0): {(7, 0): 1}, (8, 1): {(8, 2): 1, (7, 1): 1}, (8, 2): {(8, 3): 1, (8, 1): 1}, (8, 3): {(8, 2): 1, (7, 3): 1}, (8, 4): {(7, 4): 1}, (8, 5): {(7, 5): 1, (8, 6): 1}, (8, 6): {(7, 6): 1, (8, 5): 1}, (8, 7): {(8, 8): 1}, (8, 8): {(7, 8): 1, (8, 7): 1}}


game = pyrat.Game(preprocess_1=preprocessing,preprocess_1_turn=True,turn_2=turn_greedy,maze_start=maze_start,player1_start=(0,0),player2_start=(8,8))
game.play_match()
pyrat.display_game(game)
print("Result: {} point difference with {} movements".format(game.score1 - game.score2,game.turn_count))


# If you finished all the exercises correctly you should now see a pyrat game where the rat wins against the python and also 
# ```
# Should have a 1 point difference with 23 movements
# Result: 1 point difference with 23 movements
# ```

# **Please note that it is expected that the grader takes more time to generate the grading report for this lab. You might have to wait a couple of minutes before being able to access the report.**
