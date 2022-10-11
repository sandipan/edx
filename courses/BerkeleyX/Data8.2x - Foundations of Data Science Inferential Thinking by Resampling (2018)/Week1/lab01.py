
# coding: utf-8

# # Lab 1: Randomization, Iteration, and Probability
# 
# Welcome to Lab 1 of Data 8.2x! This week, we will go over conditionals and iteration, and introduce the concepts of randomness and probability. All of this material is covered in [Chapter 9](https://www.inferentialthinking.com/chapters/09/randomness.html) of the textbook. 
# 
# First, set up the tests and imports by running the cell below.

# In[1]:


import numpy as np
from datascience import *

from okgrade import grade


# ## 1. Nachos and Conditionals

# In Python, Boolean values can either be `True` or `False`. We get Boolean values when using comparison operators, among which are `<` (less than), `>` (greater than), and `==` (equal to). For a complete list, refer to [Booleans and Comparison](https://www.inferentialthinking.com/chapters/09/randomness.html#Booleans-and-Comparison) at the start of Chapter 9.
# 
# Run the cell below to see an example of a comparison operator in action.

# In[2]:


3 > 1 + 1


# We can even assign the result of a comparison operation to a variable.

# In[3]:


result = 10 / 2 == 5
result


# Arrays are compatible with comparison operators. The output is an array of boolean values.

# In[4]:


make_array(1, 5, 7, 8, 3, -1) > 3


# Waiting on the dining table just for you is a hot bowl of nachos! Let's say that whenever you take a nacho, it will have cheese, salsa, both, or neither (just a plain tortilla chip). 
# 
# Using the function call `np.random.choice(array_name)`, let's simulate taking nachos from the bowl at random. Start by running the cell below several times, and observe how the results change.

# In[5]:


nachos = make_array('cheese', 'salsa', 'both', 'neither')
np.random.choice(nachos)


# **Question 1.1** <br/> Assume we took ten nachos at random, and stored the results in an array called `ten_nachos` as done below. Find the number of nachos with only cheese using code (do not hardcode the answer).  
# 
# *Hint:* Our solution involves a comparison operator and the `np.count_nonzero` method.

# In[10]:


ten_nachos = make_array('neither', 'cheese', 'both', 'both', 'cheese', 'salsa', 'both', 'neither', 'cheese', 'both')
number_cheese = np.count_nonzero(ten_nachos[ten_nachos == 'cheese'])
number_cheese


# In[11]:


grade('tests/q1_1.py')


# **Conditional Statements**
# 
# A conditional statement is made up of many lines that allow Python to choose from different alternatives based on whether some condition is true.
# 
# Here is a basic example.
# 
# ```
# def sign(x):
#     if x > 0:
#         return 'Positive'
# ```
# 
# How the function works is if the input `x` is greater than `0`, we get the string `'Positive'` back.
# 
# If we want to test multiple conditions at once, we use the following general format.
# 
# ```
# if <if expression>:
#     <if body>
# elif <elif expression 0>:
#     <elif body 0>
# elif <elif expression 1>:
#     <elif body 1>
# ...
# else:
#     <else body>
# ```
# 
# Only one of the bodies will ever be executed. Each `if` and `elif` expression is evaluated and considered in order, starting at the top. As soon as a true value is found, the corresponding body is executed, and the rest of the expression is skipped. If none of the `if` or `elif` expressions are true, then the `else body` is executed. For more examples and explanation, refer to [Section 9.1](https://www.inferentialthinking.com/chapters/09/1/conditional-statements.html).

# **Question 1.2** <br/>Complete the following conditional statement so that the string `'More please'` is assigned to `say_please` if the number of nachos with cheese in `ten_nachos` is less than `5`.
# *Hint*: You should not have to reference the variable `ten_nachos`.

# In[12]:


say_please = '?'

if number_cheese < 5:
    say_please = 'More please'
    
say_please


# In[13]:


grade('tests/q1_2.py')


# **Question 1.3** <br/>Write a function called `nacho_reaction` that returns a string based on the type of nacho passed in as an argument. From top to bottom, the conditions should correspond to: `'cheese'`, `'salsa'`, `'both'`, `'neither'`.  

# In[14]:


def nacho_reaction(nacho):
    if nacho == 'cheese':
        return 'Cheesy!'
    # next condition should return 'Spicy!'
    elif nacho == 'salsa':
        return 'Spicy!'
    # next condition should return 'Wow!'
    elif nacho == 'both':
        return 'Wow!'
    # next condition should return 'Meh.'
    else:
        return 'Meh.'    

spicy_nacho = nacho_reaction('salsa')
spicy_nacho


# In[15]:


grade('tests/q1_3.py')


# **Question 1.4** <br/>Add a column `'Reactions'` to the table `ten_nachos_reactions` that consists of reactions for each of the nachos in `ten_nachos`. 
# 
# *Hint:* Use the `apply` method. 

# In[17]:


ten_nachos_reactions = Table().with_column('Nachos', ten_nachos)
ten_nachos_reactions.append_column('Reactions', ten_nachos_reactions.apply(nacho_reaction, 'Nachos'))
ten_nachos_reactions


# In[18]:


grade('tests/q1_4.py')


# **Question 1.5** <br/>Using code, find the number of `'Wow!'` reactions for the nachos in `ten_nachos_reactions`.

# In[21]:


number_wow_reactions = ten_nachos_reactions.where("Reactions", are.equal_to('Wow!')).num_rows
number_wow_reactions


# In[22]:


grade('tests/q1_5.py')


# **Question 1.6** <br/>Change just the comparison operators from `==` to some other operators so that `should_be_true` is `True`.

# In[24]:


should_be_true = number_cheese != number_wow_reactions != np.count_nonzero(ten_nachos == 'neither')
should_be_true


# In[25]:


grade('tests/q1_6.py')


# **Question 1.7** <br/>Complete the function `both_or_neither`, which takes in a table of nachos with reactions (just like the one from Question 4) and returns `'Wow!'` if there are more nachos with both cheese and salsa, or `'Meh.'` if there are more nachos with neither. If there are an equal number of each, return `'Okay!'`.

# In[26]:


def both_or_neither(nacho_table):
    reactions = ...
    number_wow_reactions = nacho_table.where("Reactions", are.equal_to('Wow!')).num_rows
    number_meh_reactions = nacho_table.where("Reactions", are.equal_to('Meh.')).num_rows
    if number_wow_reactions > number_meh_reactions:
        return 'Wow!'
    # next condition should return 'Meh.'
    elif number_wow_reactions < number_meh_reactions:
        return 'Meh.'
    # next condition should return 'Okay!'
    else:
        return 'Okay!'

many_nachos = Table().with_column('Nachos', np.random.choice(nachos, 250))
many_nachos = many_nachos.with_column('Reactions', many_nachos.apply(nacho_reaction, 'Nachos'))
result = both_or_neither(many_nachos)
result


# In[27]:


grade('tests/q1_7.py')


# ## 2. Iteration and Sampling
# Using a `for` statement, we can perform a task multiple times. This is known as iteration. Here, we'll simulate drawing different suits from a deck of cards. 

# In[28]:


suits = make_array("♤", "♡", "♢", "♧")

draws = make_array()

repetitions = 6

for i in np.arange(repetitions):
    draws = np.append(draws, np.random.choice(suits))

draws


# In the example above, the `for` loop appends a random draw to the `draws` array for every number in `np.arange(repetitions)`. 
# 
# A nice way to think about what we did above, was we had a deck of 4 cards of different suits. We randomly drew one card, saw the suit, kept track of it in `draws`, and put the card back into the deck. We repeated this for a total of 6 times without having to repeat code, thanks to the for loop. We simulated thie experiment using a for loop. 
# 
# Another use of iteration is to loop through a set of values. For instance, we can print out all of the colors of the rainbow.
# 

# In[29]:


rainbow = make_array("red", "orange", "yellow", "green", "blue", "indigo", "violet")

for color in rainbow:
    print(color)


# We can see that the indented part of the `for` loop, known as the body, is executed once for each item in `rainbow`. Note that the name `color` is arbitrary; we could easily have named it something else. The important thing is we stay consistent throughout the for loop. 

# In[30]:


for another_name in rainbow:
    print(another_name)


# In general, however, we would like the variable name to be somewhat informative. 

# **Question 2.1** <br/>Clay is playing darts. His dartboard contains ten equal-sized zones with point values from 1 to 10. Write code that simulates his total score after 1000 dart tosses. Make sure to use a `for` loop.
# 
# *Hint:* There are three steps to this problem (and most simulations): 
# 1. Deciding the possible values you can take in the experiment (point values in this case)
# 2. Running through the experiment a certain amount of times (running through 1000 dart tosses, and randomly getting a value per toss in this case)
# 3. Keeping track of the total information of each time you ran through the experiment (the total score in this case)

# In[31]:


possible_point_values = list(range(1,11))
tosses = 1000
total_score = np.sum([np.random.choice(possible_point_values) for _ in range(tosses)])

total_score


# In[32]:


grade('tests/q2_1.py')


# **Question 2.2** <br/>What is the average point value of a dart thrown by Clay?

# In[33]:


average_score = np.mean([np.random.choice(possible_point_values) for _ in range(tosses)])
average_score


# In[34]:


grade('tests/q2_2.py')


# **Question 2.3** <br/>In the following cell, we've loaded the text of _Pride and Prejudice_ by Jane Austen, split it into individual words, and stored these words in an array. Using a `for` loop, assign `longer_than_five` to the number of words in the novel that are more than 5 letters long.
# 
# *Hint*: You can find the number of letters in a word with the `len` function.

# In[40]:


austen_string = open('Austen_PrideAndPrejudice.txt', encoding='utf-8').read()
p_and_p_words = np.array(austen_string.split())
#p_and_p_words

longer_than_five = sum([1 if len(x) > 5 else 0 for x in p_and_p_words])
        
longer_than_five


# In[41]:


grade('tests/q2_3.py')


# **Question 2.4** <br/>Using simulation with 10,000 trials, assign `chance_of_all_different` to an estimate of the chance that if you pick three words from Pride and Prejudice uniformly at random (with replacement), they all have different lengths. 
# 
# *Hint*: Remember that `!=` only checks for non-equality between two items, not three. However, you can use `!=` more than once in the same line. 
# 
# For example, `2 != 3 != 4` first checks for non-equality between `2` and `3`, then `3` and `4`, but NOT `2` and `4`.

# In[48]:


trials = 10000
different = 0

for _ in range(trials):
    words = np.random.choice(p_and_p_words, 3, replace=True)
    different += ((len(words[0]) != len(words[1]) != len(words[2])) and (len(words[0]) != len(words[2])))

chance_of_all_different = different / trials

chance_of_all_different


# In[49]:


grade('tests/q2_4.py')


# ** Question 2.5 <br/>** Quincy is drafting Basketball Players for his NBA Fantasy League. He chooses 10 times randomly from a list of players, and drafts the player regardless of whether the player has been chosen before (You could have 10 Kevin Durant's on a team!). Count how many times John Wall is chosen in a version of Quincy's draft.

# In[51]:


players = ["John Wall", "Steph Curry", "Kevin Durant", "Jimmy Butler", "Russell Westbrook"]
draft_picks = np.random.choice(players, 10, replace=True)
num_wall = 0 #np.sum(draft_picks == "John Wall")

for p in draft_picks:
    num_wall += (p == "John Wall")

num_wall


# In[52]:


grade('tests/q2_5.py')


# ## 3. Finding Probabilities
# After a long day of class, Clay decides to go to Crossroads for dinner. Today's menu has Clay's four favorite foods: enchiladas, hamburgers, pizza, and spaghetti. However, each dish has a 30% chance of running out before Clay can get to Crossroads.

# **Question 3.1** <br/>What is the probability that Clay will be able to eat pizza at Crossroads?

# In[53]:


pizza_prob = 1 - 0.3


# In[54]:


grade('tests/q3_1.py')


# **Question 3.2** <br/>What is the probability that Clay will be able to eat all four of these foods at Crossroads?

# In[55]:


all_prob = pizza_prob**4


# In[56]:


grade('tests/q3_2.py')


# **Question 3.3** <br/>What is the probability that Crossroads will have run out of something before Clay can get there?

# In[57]:


something_is_out = 1 - pizza_prob**4


# In[58]:


grade('tests/q3_3.py')


# To make up for their unpredictable food supply, Crossroads decides to hold a contest for some free Cal Dining swag. There is a bag with two red marbles, two green marbles, and two blue marbles. Clay has to draw three marbles separately. In order to win, all three of these marbles must be of different colors.

# **Question 3.4** <br/>What is the probability of Clay winning the contest?

# In[66]:


winning_prob = 2/5


# In[67]:


grade('tests/q3_4.py')


# ## Submission

# In[68]:


# For your convenience, you can run this cell to run all the tests at once!
import glob
from okgrade.notebook import grade_notebook
if not globals().get('__OKGRADE__', False):
    display(grade_notebook('lab01.ipynb', glob.glob('tests/q*.py')))

