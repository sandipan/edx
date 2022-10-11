
# coding: utf-8

# # Lab 3: Tables
# 
# Welcome to lab 3!  
# 
# This week, we will focus on manipulating tables.  Tables are described in [Chapter 6](http://www.inferentialthinking.com/chapters/06/tables.html) of the text.
# 
# First, set up the tests and imports by running the cell below.

# In[1]:


import numpy as np
from datascience import *

# These lines load the tests.

from client.api.notebook import Notebook
ok = Notebook('lab03.ok')


# ## 1. Introduction
# 
# For a collection of things in the world, an array is useful for describing a single attribute of each thing. For example, among the collection of US States, an array could describe the land area of each. Tables extend this idea by describing multiple attributes for each element of a collection.
# 
# In most data science applications, we have data about many entities, but we also have several kinds of data about each entity.
# 
# For example, in the cell below we have two arrays. The first one contains the world population in each year (as [estimated](http://www.census.gov/population/international/data/worldpop/table_population.php) by the US Census Bureau), and the second contains the years themselves (in order, so the first elements in the population and the years arrays correspond).

# In[2]:


population_amounts = Table.read_table("world_population.csv").column("Population")
years = np.arange(1950, 2015+1)
print("Population column:", population_amounts)
print("Years column:", years)


# Suppose we want to answer this question:
# 
# > When did world population cross 6 billion?
# 
# You could technically answer this question just from staring at the arrays, but it's a bit convoluted, since you would have to count the position where the population first crossed 6 billion, then find the corresponding element in the years array. In cases like these, it might be easier to put the data into a *`Table`*, a 2-dimensional type of dataset. 
# 
# The expression below:
# 
# - creates an empty table using the expression `Table()`,
# - adds two columns by calling `with_columns` with four arguments,
# - assignes the result to the name `population`, and finally
# - evaluates `population` so that we can see the table.
# 
# The strings `"Year"` and `"Population"` are column labels that we have chosen. Ther names `population_amounts` and `years` were assigned above to two arrays of the same length. The function `with_columns` (you can find the documentation [here](http://data8.org/datascience/tables.html)) takes in alternating strings (to represent column labels) and arrays (representing the data in those columns), which are all separated by commas.

# In[3]:


population = Table().with_columns(
    "Population", population_amounts,
    "Year", years
)
population


# Now the data are all together in a single table! It's much easier to parse this data--if you need to know what the population was in 1959, for example, you can tell from a single glance. We'll revisit this table later.

# ## 2. Creating Tables
# 
# **Question 2.1.** <br/> In the cell below, we've created 2 arrays. Using the steps above, assign `top_10_movies` to a table that has two columns called "Rating" and "Name", which hold `top_10_movie_ratings` and `top_10_movie_names` respectively.

# In[5]:


top_10_movie_ratings = make_array(9.2, 9.2, 9., 8.9, 8.9, 8.9, 8.9, 8.9, 8.9, 8.8)
top_10_movie_names = make_array(
        'The Shawshank Redemption (1994)',
        'The Godfather (1972)',
        'The Godfather: Part II (1974)',
        'Pulp Fiction (1994)',
        "Schindler's List (1993)",
        'The Lord of the Rings: The Return of the King (2003)',
        '12 Angry Men (1957)',
        'The Dark Knight (2008)',
        'Il buono, il brutto, il cattivo (1966)',
        'The Lord of the Rings: The Fellowship of the Ring (2001)')

top_10_movies = Table().with_columns(
    "Rating", top_10_movie_ratings,
    "Name", top_10_movie_names
)
# We've put this next line here so your table will get printed out when you
# run this cell.
top_10_movies


# In[6]:


_ = ok.grade('q2_1')


# #### Loading a table from a file
# In most cases, we aren't going to go through the trouble of typing in all the data manually. Instead, we can use our `Table` functions.
# 
# `Table.read_table` takes one argument, a path to a data file (a string) and returns a table.  There are many formats for data files, but CSV ("comma-separated values") is the most common.
# 
# **Question 2.2.** <br/>The file `imdb.csv` contains a table of information about the 250 highest-rated movies on IMDb.  Load it as a table called `imdb`.

# In[7]:


imdb = Table.read_table("imdb.csv")
imdb


# In[8]:


_ = ok.grade('q2_2')


# Notice the part about "... (240 rows omitted)."  This table is big enough that only a few of its rows are displayed, but the others are still there.  10 are shown, so there are 250 movies total.
# 
# Where did `imdb.csv` come from? Take a look at [this lab's folder](./). You should see a file called `imdb.csv`.
# 
# Open up the `imdb.csv` file in that folder and look at the format. What do you notice? The `.csv` filename ending says that this file is in the [CSV (comma-separated value) format](http://edoceo.com/utilitas/csv-file-format).

# ## 3. Using lists
# 
# A *list* is another Python sequence type, similar to an array. It's different than an array because the values it contains can all have different types. A single list can contain `int` values, `float` values, and strings. Elements in a list can even be other lists! A list is created by giving a name to the list of values enclosed in square brackets and separated by commas. For example, `values_with_different_types = ['data', 8, 8.1]`
# 
# Lists can be useful when working with tables because they can describe the contents of one row in a table, which often  corresponds to a sequence of values with different types. A list of lists can be used to describe multiple rows.
# 
# Each column in a table is a collection of values with the same type (an array). If you create a table column from a list, it will automatically be converted to an array. A row, on the ther hand, mixes types.
# 
# Here's a table from Chapter 5. (Run the cell below.)

# In[9]:


# Run this cell to recreate the table
flowers = Table().with_columns(
    'Number of petals', make_array(8, 34, 5),
    'Name', make_array('lotus', 'sunflower', 'rose')
)
flowers


# **Question 3.1.** <br/>Create a list that describes a new fourth row of this table. The details can be whatever you want, but the list must contain two values: the number of petals (an `int` value) and the name of the flower (a string). For example, your flower could be "pondweed"! (A flower with zero petals)

# In[10]:


my_flower = [0, 'pondweed']
my_flower


# In[11]:


_ = ok.grade('q3_1')


# **Question 3.2.** <br/>`my_flower` fits right in to the table from chapter 5. Complete the cell below to create a table of seven flowers that includes your flower as the fourth row followed by `other_flowers`. You can use `with_row` to create a new table with one extra row by passing a list of values and `with_rows` to create a table with multiple extra rows by passing a list of lists of values.

# In[12]:


# Use the method .with_row(...) to create a new table that includes my_flower 

four_flowers = flowers.with_row(my_flower)

# Use the method .with_rows(...) to create a table that 
# includes four_flowers followed by other_flowers

other_flowers = [[10, 'lavender'], [3, 'birds of paradise'], [6, 'tulip']]

seven_flowers = four_flowers.with_rows(other_flowers)
seven_flowers


# In[13]:


_ = ok.grade('q3_2')


# ## 4. Analyzing datasets
# With just a few table methods, we can answer some interesting questions about the IMDb dataset.
# 
# If we want just the ratings of the movies, we can get an array that contains the data in that column:

# In[14]:


imdb.column("Rating")


# The value of that expression is an array, exactly the same kind of thing you'd get if you typed in `make_array(8.4, 8.3, 8.3, [etc])`.
# 
# **Question 4.1.** <br/>Find the rating of the highest-rated movie in the dataset.
# 
# *Hint:* Think back to the functions you've learned about for working with arrays of numbers.  Ask for help if you can't remember one that's useful for this.

# In[15]:


highest_rating = imdb.column("Rating").max()
highest_rating


# In[16]:


_ = ok.grade('q4_1')


# That's not very useful, though.  You'd probably want to know the *name* of the movie whose rating you found!  To do that, we can sort the entire table by rating, which ensures that the ratings and titles will stay together. Note that calling sort creates a copy of the table and leaves the original table unsorted.

# In[17]:


imdb.sort("Rating")


# Well, that actually doesn't help much, either -- we sorted the movies from lowest -> highest ratings.  To look at the highest-rated movies, sort in reverse order:

# In[18]:


imdb.sort("Rating", descending=True)


# (The `descending=True` bit is called an *optional argument*. It has a default value of `False`, so when you explicitly tell the function `descending=True`, then the function will sort in descending order.)
# 
# So there are actually 2 highest-rated movies in the dataset: *The Shawshank Redemption* and *The Godfather*.
# 
# Some details about sort:
# 
# 1. The first argument to `sort` is the name of a column to sort by.
# 2. If the column has strings in it, `sort` will sort alphabetically; if the column has numbers, it will sort numerically.
# 3. The value of `imdb.sort("Rating")` is a *copy of `imdb`*; the `imdb` table doesn't get modified. For example, if we called `imdb.sort("Rating")`, then running `imdb` by itself would still return the unsorted table.
# 4. Rows always stick together when a table is sorted.  It wouldn't make sense to sort just one column and leave the other columns alone.  For example, in this case, if we sorted just the "Rating" column, the movies would all end up with the wrong ratings.
# 
# **Question 4.2.** <br/>Create a version of `imdb` that's sorted chronologically, with the earliest movies first.  Call it `imdb_by_year`.

# In[19]:


imdb_by_year = imdb.sort("Year", descending=False)
imdb_by_year


# In[20]:


_ = ok.grade('q4_2')


# **Question 4.3.** <br/>What's the title of the earliest movie in the dataset?  You could just look this up from the output of the previous cell.  Instead, write Python code to find out.
# 
# *Hint:* Starting with `imdb_by_year`, extract the Title column to get an array, then use `item` to get its first item.

# In[21]:


earliest_movie_title = imdb_by_year.column("Title")[0]
earliest_movie_title


# In[22]:


_ = ok.grade('q4_3')


# ## 5. Finding pieces of a dataset
# Suppose you're interested in movies from the 1940s.  Sorting the table by year doesn't help you, because the 1940s are in the middle of the dataset.
# 
# Instead, we use the table method `where`.

# In[23]:


forties = imdb.where('Decade', are.equal_to(1940))
forties


# Ignore the syntax for the moment.  Instead, try to read that line like this:
# 
# > Assign the name **`forties`** to a table whose rows are the rows in the **`imdb`** table **`where`** the **`'Decade'`**s **`are` `equal` `to` `1940`**.
# 
# **Question 5.1.** <br/>Compute the average rating of movies from the 1940s.
# 
# *Hint:* The function `np.average` computes the average of an array of numbers.

# In[24]:


average_rating_in_forties = np.average(forties.column("Rating"))
average_rating_in_forties


# In[25]:


_ = ok.grade('q5_1')


# Now let's dive into the details a bit more.  `where` takes 2 arguments:
# 
# 1. The name of a column.  `where` finds rows where that column's values meet some criterion.
# 2. Something that describes the criterion that the column needs to meet, called a predicate.
# 
# To create our predicate, we called the function `are.equal_to` with the value we wanted, 1940.  We'll see other predicates soon.
# 
# `where` returns a table that's a copy of the original table, but with only the rows that meet the given predicate.
# 
# **Question 5.2.**<br/> Create a table called `ninety_nine` containing the movies that came out in the year 1999.  Use `where`.

# In[26]:


ninety_nine = imdb.where('Year', are.equal_to(1999))
ninety_nine


# In[27]:


_ = ok.grade('q5_2')


# So far we've only been finding where a column is *exactly* equal to a certain value. However, there are many other predicates.  Here are a few:
# 
# |Predicate|Example|Result|
# |-|-|-|
# |`are.equal_to`|`are.equal_to(50)`|Find rows with values equal to 50|
# |`are.not_equal_to`|`are.not_equal_to(50)`|Find rows with values not equal to 50|
# |`are.above`|`are.above(50)`|Find rows with values above (and not equal to) 50|
# |`are.above_or_equal_to`|`are.above_or_equal_to(50)`|Find rows with values above 50 or equal to 50|
# |`are.below`|`are.below(50)`|Find rows with values below 50|
# |`are.between`|`are.between(2, 10)`|Find rows with values above or equal to 2 and below 10|
# 
# The textbook section on selecting rows has more examples.
# 

# **Question 5.3.** <br/>Using `where` and one of the predicates from the table above, find all the movies with a rating higher than 8.5.  Put their data in a table called `really_highly_rated`.

# In[28]:


really_highly_rated = imdb.where('Rating', are.above(8.5))
really_highly_rated


# In[29]:


_ = ok.grade('q5_3')


# **Question 5.4.** <br/>Find the average rating for movies released in the 20th century and the average rating for movies released in the 21st century for the movies in `imdb`.
# 
# *Hint*: Think of the steps you need to do (take the average, find the ratings, find movies released in 20th/21st centuries), and try to put them in an order that makes sense.

# In[34]:


average_20th_century_rating = np.average(imdb.where('Year', are.between(1900, 2000)).column("Rating"))
average_21st_century_rating = np.average(imdb.where('Year', are.between(2000, 2019)).column("Rating"))
print("Average 20th century rating:", average_20th_century_rating)
print("Average 21st century rating:", average_21st_century_rating)


# In[35]:


_ = ok.grade('q5_4')


# The property `num_rows` tells you how many rows are in a table.  (A "property" is just a method that doesn't need to be called by adding parentheses.)

# In[36]:


num_movies_in_dataset = imdb.num_rows
num_movies_in_dataset


# **Question 5.5.** <br/>Use `num_rows` (and arithmetic) to find the *proportion* of movies in the dataset that were released in the 20th century, and the proportion from the 21st century.
# 
# *Hint:* The *proportion* of movies released in the 20th century is the *number* of movies released in the 20th century, divided by the *total number* of movies.

# In[39]:


proportion_in_20th_century = imdb.where('Year', are.between(1900, 2000)).num_rows / num_movies_in_dataset
proportion_in_21st_century = imdb.where('Year', are.between(2000, 2100)).num_rows / num_movies_in_dataset
print("Proportion in 20th century:", proportion_in_20th_century)
print("Proportion in 21st century:", proportion_in_21st_century)


# In[40]:


_ = ok.grade('q5_5')


# **Question 5.6.** <br/>Here's a challenge: Find the number of movies that came out in *even* years.
# 
# *Hint:* The operator `%` computes the remainder when dividing by a number.  So `5 % 2` is 1 and `6 % 2` is 0.  A number is even if the remainder is 0 when you divide by 2.
# 
# *Hint 2:* `%` can be used on arrays, operating elementwise like `+` or `*`.  So `make_array(5, 6, 7) % 2` is `array([1, 0, 1])`.
# 
# *Hint 3:* Create a column called "Year Remainder" that's the remainder when each movie's release year is divided by 2.  Make a copy of `imdb` that includes that column.  Then use `where` to find rows where that new column is equal to 0.  Then use `num_rows` to count the number of such rows.

# In[41]:


num_even_year_movies = len(imdb.column('Year')[imdb.column('Year') % 2 == 0])
num_even_year_movies


# In[42]:


_ = ok.grade('q5_6')


# **Question 5.7.** <br/>Check out the `population` table from the introduction to this lab.  Compute the year when the world population first went above 6 billion.

# In[44]:


year_population_crossed_6_billion = years[population_amounts > 6*10**9][0]
year_population_crossed_6_billion


# In[45]:


_ = ok.grade('q5_7')


# ## 6. Miscellanea
# There are a few more table methods you'll need to fill out your toolbox.  The first 3 have to do with manipulating the columns in a table.
# 
# The table `farmers_markets.csv` contains data on farmers' markets in the United States  (data collected [by the USDA]([dataset](https://apps.ams.usda.gov/FarmersMarketsExport/ExcelExport.aspx)).  Each row represents one such market.
# 
# **Question 6.1.** <br/>Load the dataset into a table.  Call it `farmers_markets`.

# In[46]:


farmers_markets = Table.read_table("farmers_markets.csv")
farmers_markets


# In[47]:


_ = ok.grade('q6_1')


# You'll notice that it has a large number of columns in it!
# 
# ### `num_columns`
# 
# **Question 6.2.**<br/> The table property `num_columns` (example call: `tbl.num_columns`) produces the number of columns in a table.  Use it to find the number of columns in our farmers' markets dataset.

# In[48]:


num_farmers_markets_columns = farmers_markets.num_columns
print("The table has", num_farmers_markets_columns, "columns in it!")


# In[49]:


_ = ok.grade('q6_2')


# Most of the columns are about particular products -- whether the market sells tofu, pet food, etc.  If we're not interested in that stuff, it just makes the table difficult to read.  This comes up more than you might think.
# 
# ### `select`
# 
# In such situations, we can use the table method `select` to pare down the columns of a table.  It takes any number of arguments.  Each should be the name or index of a column in the table.  It returns a new table with only those columns in it.
# 
# For example, the value of `imdb.select("Year", "Decade")` is a table with only the years and decades of each movie in `imdb`.
# 
# **Question 6.3.**<br/> Use `select` to create a table with only the name, city, state, latitude ('y'), and longitude ('x') of each market.  Call that new table `farmers_markets_locations`.

# In[51]:


farmers_markets_locations = farmers_markets.select('MarketName', 'city', 'State', 'y', 'x')
farmers_markets_locations


# In[52]:


_ = ok.grade('q6_3')


# ### `select` is not `column`!
# 
# The method `select` is **definitely not** the same as the method `column`.
# 
# `farmers_markets.column('y')` is an *array* of the latitudes of all the markets.  `farmers_markets.select('y')` is a *table* that happens to contain only 1 column, the latitudes of all the markets.
# 
# **Question 6.4.** <br/>Below, we tried using the function `np.average` to find the average latitude ('y') and average longitude ('x') of the farmers' markets in the table, but we screwed something up.  Run the cell to see the (somewhat inscrutable) error message that results from calling `np.average` on a table.  Then, fix our code.

# In[57]:


average_latitude = np.average(farmers_markets.column('y'))
average_longitude = np.average(farmers_markets.column('x'))
print("The average of US farmers' markets' coordinates is located at (", average_latitude, ",", average_longitude, ")")


# In[58]:


_ = ok.grade('q6_4')


# ### `drop`
# 
# `drop` serves the same purpose as `select`, but it takes away the columns you list instead of the ones you don't list, leaving all the rest of the columns.
# 
# **Question 6.5.** <br/>Suppose you just didn't want the "FMID" or "updateTime" columns in `farmers_markets`.  Create a table that's a copy of `farmers_markets` but doesn't include those columns.  Call that table `farmers_markets_without_fmid`.

# In[59]:


farmers_markets_without_fmid = farmers_markets.drop("FMID", "updateTime")
farmers_markets_without_fmid


# In[60]:


_ = ok.grade('q6_5')


# #### `take`
# Let's find the 5 northernmost farmers' markets in the US.  You already know how to sort by latitude ('y'), but we haven't seen how to get the first 5 rows of a table.  That's what `take` is for.
# 
# The table method `take` takes as its argument an array of numbers.  Each number should be the index of a row in the table.  It returns a new table with only those rows.
# 
# Most often you'll want to use `take` in conjunction with `np.arange` to take the first few rows of a table.
# 
# **Question 6.6.** <br/>Make a table of the 5 northernmost farmers' markets in `farmers_markets_locations`.  Call it `northern_markets`.  (It should include the same columns as `farmers_markets_locations`.

# In[63]:


northern_markets = farmers_markets_locations.sort('y', descending=True).take(np.arange(5))
northern_markets


# In[64]:


_ = ok.grade('q6_6')


# **Question 6.7.** <br/>Make a table of the farmers' markets in Berkeley, California.  (It should include the same columns as `farmers_markets_locations`.)

# In[66]:


berkeley_markets = farmers_markets_locations.where('city', are.equal_to('Berkeley'))
berkeley_markets


# In[67]:


_ = ok.grade('q6_7')


# ## 7. Summary
# 
# For your reference, here's a table of all the functions and methods we saw in this lab.
# 
# |Name|Example|Purpose|
# |-|-|-|
# |`Table`|`Table()`|Create an empty table, usually to extend with data|
# |`Table.read_table`|`Table.read_table("my_data.csv")`|Create a table from a data file|
# |`with_columns`|`tbl = Table().with_columns("N", np.arange(5), "2*N", np.arange(0, 10, 2))`|Create a copy of a table with more columns|
# |`column`|`tbl.column("N")`|Create an array containing the elements of a column|
# |`sort`|`tbl.sort("N")`|Create a copy of a table sorted by the values in a column|
# |`where`|`tbl.where("N", are.above(2))`|Create a copy of a table with only the rows that match some *predicate*|
# |`num_rows`|`tbl.num_rows`|Compute the number of rows in a table|
# |`num_columns`|`tbl.num_columns`|Compute the number of columns in a table|
# |`select`|`tbl.select("N")`|Create a copy of a table with only some of the columns|
# |`drop`|`tbl.drop("2*N")`|Create a copy of a table without some of the columns|
# |`take`|`tbl.take(np.arange(0, 6, 2))`|Create a copy of the table with only the rows whose indices are in the given array|
# 
# <br/>
# 
# Congratulations, you're done with lab 3!  Be sure to 
# - **run all the tests and verify that they all pass** (the next cell has a shortcut for that), 
# - **Review the notebook one last time, we will be grading the final state of your notebook after the deadline**,
# - **Save and Checkpoint** from the `File` menu,

# In[68]:


# For your convenience, you can run this cell to run all the tests at once!
import os
_ = [ok.grade(q[:-3]) for q in os.listdir("tests") if q.startswith('q')]

