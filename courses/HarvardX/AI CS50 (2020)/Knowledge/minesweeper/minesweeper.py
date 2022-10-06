import itertools
import random
from copy import deepcopy

class Minesweeper():
    """
    Minesweeper game representation
    """

    def __init__(self, height=8, width=8, mines=8):

        # Set initial width, height, and number of mines
        self.height = height
        self.width = width
        self.mines = set()

        # Initialize an empty field with no mines
        self.board = []
        for i in range(self.height):
            row = []
            for j in range(self.width):
                row.append(False)
            self.board.append(row)

        # Add mines randomly
        while len(self.mines) != mines:
            i = random.randrange(height)
            j = random.randrange(width)
            if not self.board[i][j]:
                self.mines.add((i, j))
                self.board[i][j] = True

        # At first, player has found no mines
        self.mines_found = set()

    def print(self):
        """
        Prints a text-based representation
        of where mines are located.
        """
        for i in range(self.height):
            print("--" * self.width + "-")
            for j in range(self.width):
                if self.board[i][j]:
                    print("|X", end="")
                else:
                    print("| ", end="")
            print("|")
        print("--" * self.width + "-")

    def is_mine(self, cell):
        i, j = cell
        return self.board[i][j]

    def nearby_mines(self, cell):
        """
        Returns the number of mines that are
        within one row and column of a given cell,
        not including the cell itself.
        """

        # Keep count of nearby mines
        count = 0

        # Loop over all cells within one row and column
        for i in range(cell[0] - 1, cell[0] + 2):
            for j in range(cell[1] - 1, cell[1] + 2):

                # Ignore the cell itself
                if (i, j) == cell:
                    continue

                # Update count if cell in bounds and is mine
                if 0 <= i < self.height and 0 <= j < self.width:
                    if self.board[i][j]:
                        count += 1

        return count

    def won(self):
        """
        Checks if all mines have been flagged.
        """
        return self.mines_found == self.mines


class Sentence():
    """
    Logical statement about a Minesweeper game
    A sentence consists of a set of board cells,
    and a count of the number of those cells which are mines.
    """

    def __init__(self, cells, count):
        self.cells = set(cells)
        self.count = count

    def __eq__(self, other):
        return self.cells == other.cells and self.count == other.count

    def __str__(self):
        return f"{self.cells} = {self.count}"

    def known_mines(self):
        """
        Returns the set of all cells in self.cells known to be mines.
        """
        return self.cells if len(self.cells) == self.count else set([])
        #raise NotImplementedError

    def known_safes(self):
        """
        Returns the set of all cells in self.cells known to be safe.
        """
        return self.cells if self.count == 0  else set([])
        #raise NotImplementedError

    def mark_mine(self, cell):
        """
        Updates internal knowledge representation given the fact that
        a cell is known to be a mine.
        """
        if cell in self.cells:
           self.cells.remove(cell)
           self.count -= 1
        #raise NotImplementedError

    def mark_safe(self, cell):
        """
        Updates internal knowledge representation given the fact that
        a cell is known to be safe.
        """
        if cell in self.cells:
           self.cells.remove(cell)
        #raise NotImplementedError


class MinesweeperAI():
    """
    Minesweeper game player
    """

    def __init__(self, height=8, width=8):

        # Set initial height and width
        self.height = height
        self.width = width

        # Keep track of which cells have been clicked on
        self.moves_made = set()

        # Keep track of cells known to be safe or mines
        self.mines = set()
        self.safes = set()

        # List of sentences about the game known to be true
        self.knowledge = []

    def mark_mine(self, cell):
        """
        Marks a cell as a mine, and updates all knowledge
        to mark that cell as a mine as well.
        """
        self.mines.add(cell)
        for sentence in self.knowledge:
            sentence.mark_mine(cell)

    def mark_safe(self, cell):
        """
        Marks a cell as safe, and updates all knowledge
        to mark that cell as safe as well.
        """
        self.safes.add(cell)
        for sentence in self.knowledge:
            sentence.mark_safe(cell)

    # ensure that no duplicate sentences are added			
    def knowledge_contains(self, sentence):
        for s in self.knowledge:
            if s == sentence:
               return True
        return False

    def add_knowledge(self, cell, count):
        """
        Called when the Minesweeper board tells us, for a given
        safe cell, how many neighboring cells have mines in them.

        This function should:
            1) mark the cell as a move that has been made
            2) mark the cell as safe
            3) add a new sentence to the AI's knowledge base
               based on the value of `cell` and `count`
            4) mark any additional cells as safe or as mines
               if it can be concluded based on the AI's knowledge base
            5) add any new sentences to the AI's knowledge base
               if they can be inferred from existing knowledge
        """
        # mark the cell as a move that has been made
        self.moves_made.add(cell)  
        # mark the cell as safe
        self.mark_safe(cell)
        # add a new sentence to the AI's knowledge base, based on the value of `cell` and `count
        i, j = cell
        cells = []
        for row in range(max(i-1,0), min(i+2,self.height)):
            for col in range(max(j-1,0), min(j+2,self.width)):
                if (row, col) in self.mines:
                   count -= 1 # if some mines in the neighbors are already known, make sure to decrement the count
                if (not (row, col) in self.safes) and (not (row, col) in self.mines):
                   cells.append((row, col))
        sentence = Sentence(cells, count)
        
        if not self.knowledge_contains(sentence):
            self.knowledge.append(sentence)
            # mark any additional cells as safe or as mines if it can be concluded based on the AI's knowledge base
            sentence1 = deepcopy(sentence)
            for c in sentence1.known_safes():
                self.mark_safe(c)
            for c in sentence1.known_mines():
                self.mark_mine(c)
            # add any new sentences to the AI's knowledge base if they can be inferred from existing knowledge
            # add a new inference rule when the following happens: any time we have two sentences set1 = count1 and set2 = count2 where set1 is a subset of set2, then we can construct the new sentence set2 - set1 = count2 - count1. 
            #knowledge = deepcopy(self.knowledge)
            for s in self.knowledge:
                sentence2 = None
                m, n = len(sentence.cells), len(s.cells)
                common = sentence.cells.intersection(s.cells)
                l = len(common)
                print(m, n, l)
                if sentence == s or l != min(m, n): #sentence.cells.isdisjoint(s.cells):
                    continue               
                elif l == m: #sentence.cells.issubset(s.cells):
                    sentence2 = Sentence(s.cells - sentence.cells, s.count - sentence.count)
                elif l == n: #s.cells.issubset(sentence.cells):
                    sentence2 = Sentence(sentence.cells - s.cells, sentence.count - s.count)
                if sentence2 and not self.knowledge_contains(sentence2):
                   self.knowledge.append(sentence2)
                   sent = deepcopy(sentence2)
                   for c in sent.known_safes():
                       self.mark_safe(c)
                   for c in sent.known_mines():
                       self.mark_mine(c) 
        self.knowledge = list(filter(lambda x: len(x.cells) != 0, self.knowledge))
        #raise NotImplementedError

    def make_safe_move(self):
        """
        Returns a safe cell to choose on the Minesweeper board.
        The move must be known to be safe, and not already a move
        that has been made.

        This function may use the knowledge in self.mines, self.safes
        and self.moves_made, but should not modify any of those values.
        """
        safe_moves = self.safes - self.moves_made
        if len(safe_moves) > 0:
           return safe_moves.pop()
        else:
           return None
        #raise NotImplementedError

    def make_random_move(self):
        """
        Returns a move to make on the Minesweeper board.
        Should choose randomly among cells that:
            1) have not already been chosen, and
            2) are not known to be mines
        """
        moves_mines = self.moves_made.union(self.mines)
        if len(moves_mines) == self.width * self.height:
           return None
        cells = list(set(itertools.product(range(self.height), range(self.width))) - set(moves_mines))
        return random.choice(cells)
        #raise NotImplementedError
