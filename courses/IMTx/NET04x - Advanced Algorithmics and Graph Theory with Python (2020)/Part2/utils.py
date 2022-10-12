MOVE_DOWN = 'D'
MOVE_LEFT = 'L'
MOVE_RIGHT = 'R'
MOVE_UP = 'U'

def get_position_above(original_position):
    """
    Given a position (x,y) returns the position above the original position, defined as (x,y+1)
    """
    (x,y) = original_position
    return (x,y+1)


def get_position_below(original_position):
    """
    Given a position (x,y) returns the position below the original position, defined as (x,y-1)
    """
    (x,y) = original_position
    return (x,y-1)

def get_position_right(original_position):
    """
    Given a position (x,y) returns the position to the right of the original position, defined as (x+1,y)
    """
    (x,y) = original_position
    return (x+1,y)

def get_position_left(original_position):
    """
    Given a position (x,y) returns the position to the left of the original position, defined as (x-1,y)
    """
    (x,y) = original_position
    return (x-1,y)

def reset_game(pyrat,game,starting_point,end_point):
    pyrat.pieces = 1
    game.pieces_of_cheese = [end_point]
    game.player1_location = starting_point
    game.history["pieces_of_cheese"] = [game.convert_cheeses()]
    game.history["player1_location"] = [list(starting_point)]
    game.play_match()
    return game