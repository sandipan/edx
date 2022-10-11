# write your code here!
def place(board, player, position):
    if board[position] == 0:
        board[position] = player


board = create_board()
place(board, 1, (0,0))

# write your code here!
def possibilities(board):
    indices = np.where(board == 0)
    return list(zip(indices[0].tolist(), indices[1].tolist()))
    
possibilities(board)


# write your code here!
def random_place(board, player):
    pos = random.choice(possibilities(board))
    place(board, player, pos)
    return board
    
board = random_place(board, 2)


board = create_board()

for i in range(3):
    board = random_place(board, 1)
    board = random_place(board, 2)

print(board)



# write your code here!

def row_win(board, player):
    for row in range(3):
        if sum(board[row,:] == player) == 3:
            return True
    return False        


row_win(board, 1)


# write your code here!

def col_win(board, player):
    for col in range(3):
        if sum(board[:, col] == player) == 3:
            return True
    return False        


col_win(board, 1)

# write your code here!

def diag_win(board, player):
    sum_diag = 0
    for i in range(3):
        sum_diag += (board[i,i] == player) 
    if sum_diag == 3:
        return True
    sum_diag = 0
    for i in range(3):
        sum_diag += (board[i,3-i-1] == player) 
    if sum_diag == 3:
        return True
    return False        


diag_win(board, 1)




def evaluate(board):
    winner = 0
    for player in [1, 2]:
        res = row_win(board, player) or col_win(board, player) or diag_win(board, player)
        if res:
            winner = player
    if np.all(board != 0) and winner == 0:
        winner = -1
    return winner
    
# add your code here.
evaluate(board)
    

# write your code here!
def play_game():
    board = create_board()
    winner = 0
    player = 1
    while not winner:
        board = random_place(board, player)
        winner = evaluate(board)
        player = 1 + player % 2
    print(winner)
    print(board)
    

play_game()


# write your code here!
import time

res = []
start = time.time()
for _ in range(1000):
    res.append(play_game())
stop = time.time()
print(stop-start)

plt.hist(res)
plt.show()



def play_strategic_game():
    board, winner = create_board(), 0
    board[1,1] = 1
    while winner == 0:
        for player in [2,1]:
            # use `random_place` to play a game, and store as `board`.
            # use `evaluate(board)`, and store as `winner`.
            board = random_place(board, player)
            winner = evaluate(board)
            if winner != 0:
                break
    return winner

play_strategic_game()  


# write your code here!
import time

res = []
start = time.time()
for _ in range(1000):
    res.append(play_strategic_game())
stop = time.time()
print(stop-start)

plt.hist(res)
plt.show()











