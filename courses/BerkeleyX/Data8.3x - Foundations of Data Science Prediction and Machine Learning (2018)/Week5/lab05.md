
# Lab 5: Song Classification, Part 2

Welcome to Lab 5! We'll pick off where we left off and continue to build a song classifer using k-nearest neighbors. 

Please complete lab 4 before starting lab 5.

Lab 4 is part 1 of the investigation. Lab 5 is part 2 of the investigation.

You will build a classifier that guesses whether a song is hip-hop or country, using only the number of times that each word appears in a song's lyrics.  By the end of the project, you should know how to:

1. Clean and organize a dataset used to test a machine learning model
2. Build a k-nearest neighbors classifier
3. Test a classifier on data

**Advice.** Develop your answers incrementally. To perform a complicated table manipulation, break it up into steps, perform each step on a different line, give a new name to each result, and check that each intermediate result is what you expect. You can add any additional names or functions you want to the provided cells. 

To get started, load `datascience`, `numpy`, `plots`, and `okgrade`.


```python
# Run this cell to set up the notebook, but please don't change it.
import numpy as np
import math
from datascience import *

# These lines set up the plotting functionality and formatting.
import matplotlib
matplotlib.use('Agg', warn=False)
%matplotlib inline
import matplotlib.pyplot as plots
plots.style.use('fivethirtyeight')
import warnings
warnings.simplefilter(action="ignore", category=FutureWarning)
warnings.simplefilter('ignore', UserWarning)

# These lines load the tests.
from okgrade import grade
```

## Overview: Recap

In lab 4, we completed the following tasks:
1. In section 1, we explored the dataset and split the dataset into training data and test data.
2. In section 2, we ran through a guided example of the k-Nearest Neightbors (k-NN) classification algorithm.

**If you do not remember lab 4, we highly recommend you go back and review it now. It will help you for this lab. **

In lab 5, we are going to complete the following tasks:
1. Identify some features.
2. Define a classifier function using your features and the training set.
3. Evaluate its performance (the proportion of correct classifications) on the test set.

Run the cell below to set up the lab.


```python
lyrics = Table.read_table('lyrics.csv')

training_proportion = 11/16

num_songs = lyrics.num_rows
num_train = int(num_songs * training_proportion)
num_valid = num_songs - num_train

train_lyrics = lyrics.take(np.arange(num_train))
test_lyrics = lyrics.take(np.arange(num_train, num_songs))

def most_common(label, table):
    return table.group(label).sort('count', descending=True).column(label).item(0)
```

## 1. Features

Now, we're going to extend our classifier from lab 4 to consider more than two features at a time.

Euclidean distance still makes sense with more than two features. For `n` different features, we compute the difference between corresponding feature values for two songs, square each of the `n`  differences, sum up the resulting numbers, and take the square root of the sum.

** Question 1.1 ** <br/>
Write a function to compute the Euclidean distance between two **arrays** of features of *arbitrary* (but equal) length.  Use it to compute the distance between the first song in the training set and the first song in the test set, *using all of the features*.  (Remember that the title, artist, and genre of the songs are not features.)

**Note:** To convert row objects to arrays, use `np.array`. For example, if `t` was a table, `np.array(t.row(0))` converts row 0 of `t` into an array.


```python
def distance(features1, features2):
    """The Euclidean distance between two arrays of feature values."""
    return np.sqrt(np.sum((features1 - features2)**2))

distance_first_to_first = distance(np.array(train_lyrics.drop(0,1,2).row(0)), np.array(test_lyrics.drop(0,1,2).row(0)))
distance_first_to_first
```




    0.1482277008140451




```python
grade("tests/q1_1.py")
```




<pre>tests/q1_1.py: All tests passed!</pre>



### 1.1. Creating your own feature set

Unfortunately, using all of the features has some downsides.  One clear downside is *computational* -- computing Euclidean distances just takes a long time when we have lots of features.  You might have noticed that in the last question!

So we're going to select just 20.  We'd like to choose features that are very *discriminative*. That is, features which lead us to correctly classify as much of the test set as possible.  This process of choosing features that will make a classifier work well is sometimes called *feature selection*, or more broadly *feature engineering*.

** Question 1.1.1 ** <br/>
Look through the list of features (the labels of the `lyrics` table after the first three).  Choose 20 common words that you think might let you distinguish between country and hip-hop songs. Make sure to choose words that are frequent enough that every song contains at least one of them. Don't just choose the 20 most frequent, though... you can do much better.

You might want to come back to this question later to improve your list, once you've seen how to evaluate your classifier.  The first time you answer this question, spend some time looking through the features, but not more than 15 minutes.


```python
# Set my_20_features to an array of 20 features (strings that are column labels)

my_20_features = ['like', 'love', 'world', 'home', 'heart', 'dream', 'time', 'season', 'mad', 'life', 'summer', 'man', 'religion', 'i', 'you', 'me', 'your', 'babi', 'away', 'mind']
#print(len(my_20_features))
train_20 = train_lyrics.select(my_20_features)
test_20 = test_lyrics.select(my_20_features)

#train_lyrics.drop(0,1,2).sum()
```

This test makes sure that you have chosen words such that at least one appears in each song. If you can't find words that satisfy this test just through intuition, try writing code to print out the titles of songs that do not contain any words from your list, then look at the words they do contain.


```python
grade("tests/q1_1_1.py")
```




<pre>tests/q1_1_1.py: All tests passed!</pre>



Next, let's classify the first song from our test set using these features.  You can examine the song by running the cells below. Do you think it will be classified correctly?


```python
print("Song:")
test_lyrics.take(0).select('Title', 'Artist', 'Genre').show()
print("Features:")
test_20.take(0).show()
```

    Song:



<table border="1" class="dataframe">
    <thead>
        <tr>
            <th>Title</th> <th>Artist</th> <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>That Kind of Love</td> <td>Alison Krauss</td> <td>Country</td>
        </tr>
    </tbody>
</table>


    Features:



<table border="1" class="dataframe">
    <thead>
        <tr>
            <th>like</th> <th>love</th> <th>world</th> <th>home</th> <th>heart</th> <th>dream</th> <th>time</th> <th>season</th> <th>mad</th> <th>life</th> <th>summer</th> <th>man</th> <th>religion</th> <th>i</th> <th>you</th> <th>me</th> <th>your</th> <th>babi</th> <th>away</th> <th>mind</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0.010582</td> <td>0.026455</td> <td>0    </td> <td>0   </td> <td>0.015873</td> <td>0    </td> <td>0   </td> <td>0     </td> <td>0   </td> <td>0.005291</td> <td>0     </td> <td>0   </td> <td>0       </td> <td>0.010582</td> <td>0.005291</td> <td>0.005291</td> <td>0   </td> <td>0   </td> <td>0   </td> <td>0.005291</td>
        </tr>
    </tbody>
</table>


As before, we want to look for the songs in the training set that are most alike our test song.  We will calculate the Euclidean distances from the test song (using the 20 selected features) to all songs in the training set.  You could do this with a `for` loop, but to make it computationally faster, we have provided a function, `fast_distances`, to do this for you.  Read its documentation to make sure you understand what it does.  (You don't need to read the code in its body unless you want to.)


```python
# Just run this cell to define fast_distances.

def fast_distances(test_row, train_rows):
    """An array of the distances between test_row and each row in train_rows.

    Takes 2 arguments:
      test_row: A row of a table containing features of one
        test song (e.g., test_20.row(0)).
      train_rows: A table of features (for example, the whole
        table train_20)."""
    assert train_rows.num_columns < 50, "Make sure you're not using all the features of the lyrics table."
    counts_matrix = np.asmatrix(train_rows.columns).transpose()
    diff = np.tile(np.array(test_row), [counts_matrix.shape[0], 1]) - counts_matrix
    distances = np.squeeze(np.asarray(np.sqrt(np.square(diff).sum(1))))
    return distances
```

** Question 1.1.2 ** <br/>
Use the `fast_distances` function provided above to compute the distance from the first song in the test set to all the songs in the training set, **using your set of 20 features**.  Make a new table called `genre_and_distances` with one row for each song in the training set and two columns:
* The `"Genre"` of the training song
* The `"Distance"` from the first song in the test set 

Ensure that `genre_and_distances` is **sorted in increasing order by distance to the first test song**.


```python
# The staff solution took 4 lines of code.
distances = fast_distances(test_20.row(0), train_20)
genre_and_distances = Table().with_columns(['Genre', train_lyrics.column('Genre'),
                                         'Distance', distances]).sort('Distance')
genre_and_distances #.show(10)
```




<table border="1" class="dataframe">
    <thead>
        <tr>
            <th>Genre</th> <th>Distance</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Country</td> <td>0.0222533</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0230494</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0231138</td>
        </tr>
    </tbody>
        <tr>
            <td>Hip-hop</td> <td>0.0255408</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0262024</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0265234</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0266827</td>
        </tr>
    </tbody>
        <tr>
            <td>Hip-hop</td> <td>0.0271837</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0278543</td>
        </tr>
    </tbody>
        <tr>
            <td>Country</td> <td>0.0281441</td>
        </tr>
    </tbody>
</table>
<p>... (1173 rows omitted)</p>




```python
grade("tests/q1_1_2.py")
```




<pre>tests/q1_1_2.py: All tests passed!</pre>



** Question 1.1.3 ** <br/>
Now compute the 5-nearest neighbors classification of the first song in the test set.  That is, decide on its genre by finding the most common genre among its 5 nearest neighbors, according to the distances you've calculated.  Then check whether your classifier chose the right genre.  (Depending on the features you chose, your classifier might not get this song right, and that's okay.)


```python
# Set my_assigned_genre to the most common genre among these.
my_assigned_genre = most_common('Genre', genre_and_distances.take[0:5])

# Set my_assigned_genre_was_correct to True if my_assigned_genre
# matches the actual genre of the first song in the test set.
#print(test_lyrics.take(0).column('Genre').item(0), my_assigned_genre)
my_assigned_genre_was_correct = (test_lyrics.take(0).column('Genre').item(0) == my_assigned_genre)

print("The assigned genre, {}, was{}correct.".format(my_assigned_genre, " " if my_assigned_genre_was_correct else " not "))
```

    The assigned genre, Country, was correct.



```python
grade("tests/q1_1_3.py")
```




<pre>tests/q1_1_3.py: All tests passed!</pre>



### 1.2. A classifier function

Now we can write a single function that encapsulates the whole process of classification.

** Question 1.2.1 ** <br/>
Write a function called `classify`.  It should take the following four arguments:
* A row of features for a song to classify (e.g., `test_20.row(0)`).
* A table with a column for each feature (e.g., `train_20`).
* An array of classes that has as many items as the previous table has rows, and in the same order.
* `k`, the number of neighbors to use in classification.

It should return the class a `k`-nearest neighbor classifier picks for the given row of features (the string `'Country'` or the string `'Hip-hop'`).


```python
def classify(test_row, train_rows, train_classes, k):
    """Return the most common class among k nearest neigbors to test_row."""
    distances = fast_distances(test_row, train_rows)
    genre_and_distances = Table().with_columns(['Genre', train_lyrics.column('Genre'),
                                         'Distance', distances]).sort('Distance')
    return most_common('Genre', genre_and_distances.take[0:k])
```


```python
grade("tests/q1_2_1.py")
```




<pre>tests/q1_2_1.py: All tests passed!</pre>



** Question 1.2.2 ** <br/>
Assign `grandpa_genre` to the genre predicted by your classifier for the song "Grandpa Got Runned Over By A John Deere" in the test set, using **9 neighbors** and using your 20 features.


```python
# The staff solution first defined a row object called grandpa_features.
grandpa_features = test_lyrics.where('Title', are.equal_to("Grandpa Got Runned Over By A John Deere")).select(my_20_features).row(0)
#print(type(grandpa_features))
grandpa_genre = classify(grandpa_features, train_20, train_lyrics.column('Genre'), k=9)
grandpa_genre
```




    'Hip-hop'




```python
grade("tests/q1_2_2.py")
```




<pre>tests/q1_2_2.py: All tests passed!</pre>



Finally, when we evaluate our classifier, it will be useful to have a classification function that is specialized to use a fixed training set and a fixed value of `k`.

** Question 1.2.3 ** <br/>
Create a classification function that takes as its argument a row containing your 20 features and classifies that row using the 5-nearest neighbors algorithm with `train_20` as its training set.


```python
def classify_one_argument(row):
    return classify(row, train_20, train_lyrics.column('Genre'), k=5)

# When you're done, this should produce 'Hip-hop' or 'Country'.
classify_one_argument(test_20.row(0))
```




    'Country'




```python
grade("tests/q1_2_3.py")
```




<pre>tests/q1_2_3.py: All tests passed!</pre>



### 1.3. Evaluating your classifier

Now that it's easy to use the classifier, let's see how accurate it is on the whole test set.

**Question 1.3.1.** Use `classify_one_argument` and `apply` to classify every song in the test set.  Name these guesses `test_guesses`.  **Then**, compute the proportion of correct classifications. 


```python
test_guesses = test_lyrics.select(my_20_features).apply(classify_one_argument)
proportion_correct = sum(test_guesses == test_lyrics.column('Genre').item(0)) / len(test_guesses)
proportion_correct
```




    0.4144981412639405




```python
grade("tests/q1_3_1.py")
```




<pre>tests/q1_3_1.py: All tests passed!</pre>



At this point, you've gone through one cycle of classifier design.  Let's summarize the steps:
1. From available data, select test and training sets.
2. Choose an algorithm you're going to use for classification.
3. Identify some features.
4. Define a classifier function using your features and the training set.
5. Evaluate its performance (the proportion of correct classifications) on the test set.

## Submission

Congratulations! You're finished with lab 5 and Data 8.3x! You've created your own song classifer using k-nearest neighbors. 

**If you want to continue, you can read about classification online and try to build an even more accurate classifier.**

In order to successfully submit your assignment, follow these steps...
- **IMPORTANT** Before you do anything, **Save and Checkpoint** from the `File` menu. Please do this first before running the cell below,
- **run all the tests and verify that they all pass** (the next cell has a shortcut for that), 
- **Review the notebook one last time, we will be grading the final state of your notebook** If you make any changes, please **Save and Checkpoint** again.


```python
# For your convenience, you can run this cell to run all the tests at once!
import glob
from okgrade.notebook import grade_notebook
if not globals().get('__OKGRADE__', False):
    display(grade_notebook('lab05.ipynb', sorted(glob.glob('tests/q*.py'))))
```


<pre>Grade is: 100%</pre>

