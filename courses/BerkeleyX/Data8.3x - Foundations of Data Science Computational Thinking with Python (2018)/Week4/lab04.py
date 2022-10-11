
# coding: utf-8

# # Functions and Visualizations

# Welcome to lab 4! This week, we'll learn about functions and the table method `apply` from [Section 8.1](https://www.inferentialthinking.com/chapters/08/1/applying-a-function-to-a-column.html).  We'll also learn about visualization from [Chapter 7](https://www.inferentialthinking.com/chapters/07/visualization.html).
# 
# First, set up the tests and imports by running the cell below.

# In[1]:


import numpy as np
from datascience import *

# These lines set up graphing capabilities.
import matplotlib
get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib.pyplot as plt
plt.style.use('fivethirtyeight')
import warnings
warnings.simplefilter('ignore', FutureWarning)

from ipywidgets import interact, interactive, fixed, interact_manual
import ipywidgets as widgets

from client.api.notebook import Notebook
ok = Notebook('lab04.ok')


# ## 1. Functions and CEO Incomes
# 
# Let's start with a real data analysis task.  We'll look at the 2015 compensation of CEOs at the 100 largest companies in California.  The data were compiled for a Los Angeles Times analysis [here](http://spreadsheets.latimes.com/california-ceo-compensation/), and ultimately came from [filings](https://www.sec.gov/answers/proxyhtf.htm) mandated by the SEC from all publicly-traded companies.  Two companies have two CEOs, so there are 102 CEOs in the dataset.
# 
# We've copied the data in raw form from the LA Times page into a file called `raw_compensation.csv`.  (The page notes that all dollar amounts are in millions of dollars.)

# In[2]:


raw_compensation = Table.read_table('raw_compensation.csv')
raw_compensation


# **Question 1.1.** <br/> We want to compute the average of the CEOs' pay. Try running the cell below.

# In[3]:


np.average(raw_compensation.column("Total Pay"))


# You should see an error. Let's examine why this error occured by looking at the values in the "Total Pay" column. Use the `type` function and set `total_pay_type` to the type of the first value in the "Total Pay" column.

# In[7]:


total_pay_type = type(raw_compensation.column("Total Pay")[0])
total_pay_type


# In[8]:


_ = ok.grade('q1_1')


# **Question 1.2.** <br/>You should have found that the values in "Total Pay" column are strings (text). It doesn't make sense to take the average of the text values, so we need to convert them to numbers if we want to do this. Extract the first value in the "Total Pay" column.  It's Mark Hurd's pay in 2015, in *millions* of dollars.  Call it `mark_hurd_pay_string`.

# In[9]:


mark_hurd_pay_string = raw_compensation.column("Total Pay")[0]
mark_hurd_pay_string


# In[10]:


_ = ok.grade('q1_2')


# **Question 1.3.** <br/>Convert `mark_hurd_pay_string` to a number of *dollars*.  The string method `strip` will be useful for removing the dollar sign; it removes a specified character from the start or end of a string.  For example, the value of `"100%".strip("%")` is the string `"100"`.  You'll also need the function `float`, which converts a string that looks like a number to an actual number.  Last, remember that the answer should be in dollars, not millions of dollars.

# In[15]:


mark_hurd_pay = float(mark_hurd_pay_string.strip("$"))*10**6
mark_hurd_pay


# In[16]:


_ = ok.grade('q1_3')


# To compute the average pay, we need to do this for every CEO.  But that looks like it would involve copying this code 102 times.
# 
# This is where functions come in.  First, we'll define a new function, giving a name to the expression that converts "total pay" strings to numeric values.  Later in this lab we'll see the payoff: we can call that function on every pay string in the dataset at once.
# 
# **Question 1.4.** <br/>Copy the expression you used to compute `mark_hurd_pay` as the `return` expression of the function below, but replace the specific `mark_hurd_pay_string` with the generic `pay_string` name specified in the first line of the `def` statement.
# 
# *Hint*: When dealing with functions, you should generally not be referencing any variable outside of the function. Usually, you want to be working with the arguments that are passed into it, such as `pay_string` for this function. 

# In[17]:


def convert_pay_string_to_number(pay_string):
    """Converts a pay string like '$100' (in millions) to a number of dollars."""
    return float(pay_string.strip("$"))*10**6


# In[18]:


_ = ok.grade('q1_4')


# Running that cell doesn't convert any particular pay string. Instead, it creates a function called `convert_pay_string_to_number` that can convert any string with the right format to a number representing millions of dollars.
# 
# We can call our function just like we call the built-in functions we've seen. It takes one argument, a string, and it returns a number.

# In[19]:


convert_pay_string_to_number('$42')


# In[20]:


convert_pay_string_to_number(mark_hurd_pay_string)


# In[21]:


# We can also compute Safra Catz's pay in the same way:
convert_pay_string_to_number(raw_compensation.where("Name", are.containing("Safra")).column("Total Pay").item(0))


# So, what have we gained by defining the `convert_pay_string_to_number` function? 
# Well, without it, we'd have to copy that `10**6 * float(pay_string.strip("$"))` stuff each time we wanted to convert a pay string.  Now we just call a function whose name says exactly what it's doing.
# 
# Soon, we'll see how to apply this function to every pay string in a single expression. First, let's take a brief detour and introduce `interact`.

# ### Using `interact`
# 
# We've included a nifty function called `interact` that allows you to
# call a function with different arguments.
# 
# To use it, call `interact` with the function you want to interact with as the
# first argument, then specify a default value for each argument of the original
# function like so:

# In[22]:


_ = interact(convert_pay_string_to_number, pay_string='$42')


# You can now change the value in the textbox to automatically call
# `convert_pay_string_to_number` with the argument you enter in the `pay_string`
# textbox. For example, entering in `'$49'` in the textbox will display the result of
# running `convert_pay_string_to_number('$49')`. Neat!
# 
# Note that we'll never ask you to write the `interact` function calls yourself as
# part of a question. However, we'll include it here and there where it's helpful
# and you'll probably find it useful to use yourself.
# 
# Now, let's continue on and write more functions.

# ## 2. Defining functions
# 
# Let's write a very simple function that converts a proportion to a percentage by multiplying it by 100.  For example, the value of `to_percentage(.5)` should be the number 50.  (No percent sign.)
# 
# A function definition has a few parts.
# 
# ##### `def`
# It always starts with `def` (short for **def**ine):
# 
#     def
# 
# ##### Name
# Next comes the name of the function.  Let's call our function `to_percentage`.
#     
#     def to_percentage
# 
# ##### Signature
# Next comes something called the *signature* of the function.  This tells Python how many arguments your function should have, and what names you'll use to refer to those arguments in the function's code.  `to_percentage` should take one argument, and we'll call that argument `proportion` since it should be a proportion.
# 
#     def to_percentage(proportion)
# 
# We put a colon after the signature to tell Python it's over.
# 
#     def to_percentage(proportion):
# 
# ##### Documentation
# Functions can do complicated things, so you should write an explanation of what your function does.  For small functions, this is less important, but it's a good habit to learn from the start.  Conventionally, Python functions are documented by writing a triple-quoted string:
# 
#     def to_percentage(proportion):
#         """Converts a proportion to a percentage."""
#     
#     
# ##### Body
# Now we start writing code that runs when the function is called.  This is called the *body* of the function.  We can write anything we could write anywhere else.  First let's give a name to the number we multiply a proportion by to get a percentage.
# 
#     def to_percentage(proportion):
#         """Converts a proportion to a percentage."""
#         factor = 100
# 
# ##### `return`
# The special instruction `return` in a function's body tells Python to make the value of the function call equal to whatever comes right after `return`.  We want the value of `to_percentage(.5)` to be the proportion .5 times the factor 100, so we write:
# 
#     def to_percentage(proportion):
#         """Converts a proportion to a percentage."""
#         factor = 100
#         return proportion * factor
# Note that `return` inside a function gives the function a value, while `print`, which we have used before, is a function which has no `return` value and just prints a certain value out to the console. The two are very different. 

# **Question 2.1.** <br/>Define `to_percentage` in the cell below.  Call your function to convert the proportion .2 to a percentage.  Name that percentage `twenty_percent`.

# In[23]:


def to_percentage(proportion):
    """Converts a proportion to a percentage."""
    factor = 100
    return proportion * factor

twenty_percent = to_percentage(.2)
twenty_percent


# In[24]:


_ = ok.grade('q2_1')


# Like the built-in functions, you can use named values as arguments to your function.
# 
# **Question 2.2.** <br/>Use `to_percentage` again to convert the proportion named `a_proportion` (defined below) to a percentage called `a_percentage`.
# 
# *Note:* You don't need to define `to_percentage` again!  Just like other named things, functions stick around after you define them.

# In[25]:


a_proportion = 2**(.5) / 2
a_percentage = to_percentage(a_proportion)
a_percentage


# In[26]:


_ = ok.grade('q2_2')


# Here's something important about functions: the names assigned within a function body are only accessible within the function body. Once the function has returned, those names are gone.  So even though you defined `factor = 100` inside `to_percentage` above and then called `to_percentage`, you cannot refer to `factor` anywhere except inside the body of `to_percentage`:

# In[27]:


# You should see an error when you run this.  (If you don't, you might
# have defined factor somewhere above.)
factor


# As we've seen with the built-in functions, functions can also take strings (or arrays, or tables) as arguments, and they can return those things, too.
# 
# **Question 2.3.** <br/>Define a function called `disemvowel`.  It should take a single string as its argument.  (You can call that argument whatever you want.)  It should return a copy of that string, but with all the characters that are vowels removed.  (In English, the vowels are the characters "a", "e", "i", "o", and "u".)
# 
# *Hint:* To remove all the "a"s from a string, you can use `that_string.replace("a", "")`.  The `.replace` method for strings returns another string, so you can call `replace` multiple times, one after the other. 

# In[29]:


def disemvowel(a_string):
    for vowel in ['a','e','i','o','u']:
        a_string = a_string.replace(vowel, '')
    return a_string    

# An example call to your function.  (It's often helpful to run
# an example call from time to time while you're writing a function,
# to see how it currently works.)
disemvowel("Can you read this without vowels?")


# In[30]:


# Alternatively, you can use interact to call your function
_ = interact(disemvowel, a_string='Hello world')


# In[31]:


_ = ok.grade('q2_3')


# ##### Calls on calls on calls
# Just as you write a series of lines to build up a complex computation, it's useful to define a series of small functions that build on each other.  Since you can write any code inside a function's body, you can call other functions you've written.
# 
# If a function is a like a recipe, defining a function in terms of other functions is like having a recipe for cake telling you to follow another recipe to make the frosting, and another to make the sprinkles.  This makes the cake recipe shorter and clearer, and it avoids having a bunch of duplicated frosting recipes.  It's a foundation of productive programming.
# 
# For example, suppose you want to count the number of characters *that aren't vowels* in a piece of text.  One way to do that is this to remove all the vowels and count the size of the remaining string.
# 
# **Question 2.4.** <br/>Write a function called `num_non_vowels`.  It should take a string as its argument and return a number.  The number should be the number of characters in the argument string that aren't vowels.
# 
# *Hint:* The function `len` takes a string as its argument and returns the number of characters in it.

# In[32]:


def num_non_vowels(a_string):
    """The number of characters in a string, minus the vowels."""
    return len(disemvowel(a_string))

# Try calling your function yourself to make sure the output is what
# you expect. You can also use the interact function if you'd like.


# In[34]:


# Alternatively, you can use interact to call your function
_ = interact(num_non_vowels, a_string='Hello world')


# In[35]:


_ = ok.grade('q2_4')


# Functions can also encapsulate code that *does things* rather than just computing values.  For example, if you call `print` inside a function, and then call that function, something will get printed.
# 
# The `movies_by_year` dataset in the textbook has information about movie sales in recent years.  Suppose you'd like to display the year with the 5th-highest total gross movie sales, printed in a human-readable way.  You might do this:

# In[36]:


movies_by_year = Table.read_table("movies_by_year.csv")
rank = 5
fifth_from_top_movie_year = movies_by_year.sort("Total Gross", descending=True).column("Year").item(rank-1)
print("Year number", rank, "for total gross movie sales was:", fifth_from_top_movie_year)


# After writing this, you realize you also wanted to print out the 2nd and 3rd-highest years.  Instead of copying your code, you decide to put it in a function.  Since the rank varies, you make that an argument to your function.
# 
# **Question 2.5.** <br/>Write a function called `print_kth_top_movie_year`.  It should take a single argument, the rank of the year (like 2, 3, or 5 in the above examples).  It should print out a message like the one above.  It shouldn't have a `return` statement.

# In[46]:


def print_kth_top_movie_year(k):
    # Our solution used 2 lines.
    print("Year number", k, "for total gross movie sales was:", movies_by_year.sort("Total Gross", descending=True).column("Year").item(k-1))

# Example calls to your function:
print_kth_top_movie_year(2)
print_kth_top_movie_year(3)


# In[47]:


# interact also allows you to pass in an array for a function argument. It will
# then present a dropdown menu of options.
_ = interact(print_kth_top_movie_year, k=np.arange(1, 10))


# In[48]:


_ = ok.grade('q2_5')


# ## 3. `apply`ing functions
# 
# Defining a function is a lot like giving a name to a value with `=`.  In fact, a function is a value just like the number 1 or the text "the"!
# 
# For example, we can make a new name for the built-in function `max` if we want:

# In[49]:


our_name_for_max = max
our_name_for_max(2, 6)


# The old name for `max` is still around:

# In[50]:


max(2, 6)


# Try just writing `max` or `our_name_for_max` (or the name of any other function) in a cell, and run that cell.  Python will print out a (very brief) description of the function.

# In[51]:


max


# Why is this useful?  Since functions are just values, it's possible to pass them as arguments to other functions.  Here's a simple but not-so-practical example: we can make an array of functions.

# In[52]:


make_array(max, np.average, are.equal_to)


# **Question 3.1.** <br/>Make an array containing any 3 other functions you've seen.  Call it `some_functions`.

# In[55]:


some_functions = make_array(min, np.std, are.not_equal_to)
some_functions


# In[56]:


_ = ok.grade('q3_1')


# Working with functions as values can lead to some funny-looking code.  For example, see if you can figure out why this works:

# In[57]:


make_array(max, np.average, are.equal_to).item(0)(4, -2, 7)


# Here's a simpler example that's actually useful: the table method `apply`.
# 
# `apply` calls a function many times, once on *each* element in a column of a table.  It produces an array of the results.  Here we use `apply` to convert every CEO's pay to a number, using the function you defined:

# In[58]:


raw_compensation.apply(convert_pay_string_to_number, "Total Pay")


# Here's an illustration of what that did:
# 
# <img src="apply.png" alt="For each value in the column 'Total Pay', the function `convert_pay_string_to_number` was applied."/>
# 
# Note that we didn't write something like `convert_pay_string_to_number()` or `convert_pay_string_to_number("Total Pay")`.  The job of `apply` is to call the function we give it, so instead of calling `convert_pay_string_to_number` ourselves, we just write its name as an argument to `apply`.
# 
# **Question 3.2.** <br/>Using `apply`, make a table that's a copy of `raw_compensation` with one more column called "Total Pay (\$)".  It should be the result of applying `convert_pay_string_to_number` to the "Total Pay" column, as we did above, and creating a new table which is the old one, but with the "Total Pay" column redone.  Call the new table `compensation`.

# In[64]:


compensation = raw_compensation.with_column("Total Pay ($)", raw_compensation.apply(convert_pay_string_to_number, "Total Pay"))
compensation


# In[65]:


_ = ok.grade('q3_2')


# Now that we have the pay in numbers, we can compute things about them.
# 
# **Question 3.3.**<br/>Compute the average total pay of the CEOs in the dataset.

# In[67]:


average_total_pay = np.average(compensation.column('Total Pay ($)'))
average_total_pay


# In[68]:


_ = ok.grade('q3_3')


# **Question 3.4.** <br/>Companies pay executives in a variety of ways: directly in cash; by granting stock or other "equity" in the company; or with ancillary benefits (like private jets).  Compute the proportion of each CEO's pay that was cash.  (Your answer should be an array of numbers, one for each CEO in the dataset.)

# In[71]:


cash_proportion = compensation.apply(convert_pay_string_to_number, "Cash Pay") / compensation.apply(convert_pay_string_to_number, "Total Pay") #compensation.apply(lambda x, y: x / y, 'Cash Pay', 'Total Pay ($)')
cash_proportion


# In[72]:


_ = ok.grade('q3_4')


# Check out the "% Change" column in `compensation`.  It shows the percentage increase in the CEO's pay from the previous year.  For CEOs with no previous year on record, it instead says "(No previous year)".  The values in this column are *strings*, not numbers, so like the "Total Pay" column, it's not usable without a bit of extra work.
# 
# Given your current pay and the percentage increase from the previous year, you can compute your previous year's pay.  For example, if your pay is \$100 this year, and that's an increase of 50% from the previous year, then your previous year's pay was $\frac{\$100}{1 + \frac{50}{100}}$, or around \$66.66.
# 
# **Question 3.5.** <br/>Create a new table called `with_previous_compensation`.  It should be a copy of `compensation`, but with the "(No previous year)" CEOs filtered out, and with an extra column called "2014 Total Pay ($)".  That column should have each CEO's pay in 2014.
# 
# *Hint:* This question takes several steps, but each one is still something you've seen before.  Take it one step at a time, using as many lines as you need.  You can print out your results after each step to make sure you're on the right track.
# 
# *Hint 2:* You'll need to define a function.  You can do that just above your other code.

# In[87]:


# For reference, our solution involved more than just this one line of code
def convert_change_percent_to_number(change_string):
    return float(change_string.strip("%"))
    
with_previous_compensation = compensation.where('% Change', are.not_equal_to('(No previous year)'))
with_previous_compensation = with_previous_compensation.with_column('Prop Change', with_previous_compensation.apply(convert_change_percent_to_number, "% Change"))
with_previous_compensation = with_previous_compensation.with_column("2014 Total Pay ($)", with_previous_compensation.column('Total Pay ($)')/(1+with_previous_compensation.column('Prop Change')/100))


# In[88]:


_ = ok.grade('q3_5')


# **Question 3.6.** <br/>What was the average pay of these CEOs in 2014?

# In[90]:


average_pay_2014 = np.average(with_previous_compensation.column('2014 Total Pay ($)'))
average_pay_2014


# In[91]:


_ = ok.grade('q3_6')


# ## 4. Histograms
# Earlier, we computed the average pay among the CEOs in our 102-CEO dataset.  The average doesn't tell us everything about the amounts CEOs are paid, though.  Maybe just a few CEOs make the bulk of the money, even among these 102.
# 
# We can use a *histogram* to display more information about a set of numbers.  The table method `hist` takes a single argument, the name of a column of numbers.  It produces a histogram of the numbers in that column.
# 
# **Question 4.1.** <br/>Make a histogram of the pay of the CEOs in `compensation`.

# In[83]:


compensation.hist('Total Pay ($)')


# **Question 4.2.** <br/>Looking at the histogram, how many CEOs made more than \$30 million?  (Answer the question by filling in your answer manually.  You'll have to do a bit of arithmetic; feel free to use Python as a calculator.)

# In[79]:


num_ceos_more_than_30_million = 5


# **Question 4.3.**<br/> Answer the same question with code.  *Hint:* Use the table method `where` and the property `num_rows`.

# In[80]:


num_ceos_more_than_30_million_2 = compensation.where('Total Pay ($)', are.above(30000000)).num_rows
num_ceos_more_than_30_million_2


# In[81]:


_ = ok.grade('q4_3')


# ## 5. Submission

# Great job! :D You're finished with lab 4! Be sure to...
# - **run all the tests and verify that they all pass** (the next cell has a shortcut for that), 
# - **Review the notebook one last time, we will be grading the final state of your notebook after the deadline**,
# - **Save and Checkpoint** from the `File` menu,

# In[92]:


# For your convenience, you can run this cell to run all the tests at once!
import os
_ = [ok.grade(q[:-3]) for q in os.listdir("tests") if q.startswith('q')]

