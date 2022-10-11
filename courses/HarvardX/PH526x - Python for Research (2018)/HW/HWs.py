# https://www.datacamp.com/courses/using-python-for-research

import string
alphabet = string.ascii_letters
sentence = 'Jim quickly realized that the beautiful gowns are expensive'

count_letters = {}
#write your code here!
for c in sentence:
    if c in alphabet:
        count_letters[c] = count_letters.get(c, 0) + 1

count_letters
sentence = 'Jim quickly realized that the beautiful gowns are expensive'

# Create your function here!
def counter(input_string):
    count_letters = {}
    for c in input_string:
        if c in alphabet:
            count_letters[c] = count_letters.get(c, 0) + 1
    
    return count_letters

counter(sentence)

address_count = counter(address)
print(address_count)

most_frequent_letter = max([(address_count[c], c) for c in address_count])[1] 
print(most_frequent_letter)

import math
print(math.pi/4)
import random

random.seed(1) # This line fixes the value called by your function,
               # and is used for answer-checking.

def rand():
    # define `rand` here!
    random.uniform(-1,1)     
rand()

import math

def distance(x, y):
   # define your function here!
   return math.sqrt((x[0]-y[0])**2+(x[1]-y[1])**2)
   
print(distance((0,0), (1,1)))

import random, math

random.seed(1)

def in_circle(x, origin = [0]*2):
   # Define your function here!
   return distance(x, origin) < 1 

print(in_circle((1,1)))   

R = 10000
x = []
inside = []
for i in range(R):
    point = [rand(), rand()]
    x.append(point)
    # append inside here!
    inside.append(in_circle(point))
    
print(sum(inside) / R)

print(abs(sum(inside) / R - math.pi / 4))

import random

random.seed(1)

def moving_window_average(x, n_neighbors=1):
    n = len(x)
    width = n_neighbors*2 + 1
    x = [x[0]]*n_neighbors + x + [x[-1]]*n_neighbors
    # To complete the function,
    # return a list of the mean of values from i to i+width for all values i from 0 to n-1.   
    y = [0]*n
    for i in range(n_neighbors, n + n_neighbors):
        #print(i, x[i-n_neighbors:i+n_neighbors+1])
        y[i-n_neighbors] = sum(x[i-n_neighbors:i+n_neighbors+1]) / (2.*n_neighbors+1.)
    
    return y    

x=[0,10,5,3,1,5]
print(moving_window_average(x, 1))

import random

random.seed(1) # This line fixes the value called by your function,
               # and is used for answer-checking.
    
# write your code here!
R = 1000
x = [random.uniform(0,1) for _ in range(R)]
Y = [x] #[] + x # x
for n_neighbors in range(1,10):
    Y.append(moving_window_average(x, n_neighbors)) #Y += 
    #print(len(Y))

#Y

ranges = [max(y) - min(y) for y in Y]
print(ranges)


# TTT
def create_board():
    return np.zeros((3,3))
    
board = create_board()

def place(board, player, position):
    if board[position] == 0:
        board[position] = player


board = create_board()
place(board, 1, (0,0))

def possibilities(board):
    indices = np.where(board == 0)
    return list(zip(indices[0].tolist(), indices[1].tolist()))

    
possibilities(board)

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

def row_win(board, player):
    for row in range(3):
        if sum(board[row,:] == player) == 3:
            return True
    return False        


row_win(board, 1)

def col_win(board, player):
    for col in range(3):
        if sum(board[:, col] == player) == 3:
            return True
    return False        


col_win(board, 1)

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
    
def play_game():
    board = create_board()
    winner = 0
    player = 1
    while not winner:
        board = random_place(board, player)
        winner = evaluate(board)
        player = 1 + player % 2
    #print(winner)
    #print(board)
    return winner

play_game()


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


# cipher
import string
alphabet = ' ' + string.ascii_lowercase  # Add your code here! #
positions = {alphabet[i]:i for i in range(27)}
message = "hi my name is caesar"
encoded_message = ''.join([alphabet[(positions[c]+1)%27] for c in message])
def encoding(message, key):
    encoding_list = []
    for char in message:
        position = positions[char]
        encoded_position = (position + key) % 27
        encoding_list.append(alphabet[encoded_position])
    encoded_string = "".join(encoding_list)
    return encoded_string
    
encoded_message = encoding(message, 3)
print(encoded_message)

decoded_message = encoding(encoded_message, -3)

# print your decoded message here!
print(decoded_message)





# Case study 2
hamlets = pd.DataFrame(columns=['language', 'text']) ## Enter code here! ##
book_dir = "Books"
title_num = 1
for language in book_titles:
    for author in book_titles[language]:
        for title in book_titles[language][author]:
            if title == 'Hamlet': ## Enter code here! ##
                inputfile = data_filepath+"Books/"+language+"/"+author+"/"+title+".txt"
                text = read_book(inputfile) ## Enter code here! ##
                hamlets.loc[title_num] = language, text
                title_num += 1
hamlets
                
language, text = hamlets.iloc[0]

# Enter your code here.
counted_text = count_words_fast(text)
#print(counted_text.items())

#del counted_text['']
data = pd.DataFrame({
    "word": list(counted_text.keys()),
    "count": list(counted_text.values())
})

#data = pd.DataFrame(columns=['word', 'count'])
#data['word'] = counted_text.keys()
#data['count'] = counted_text.values()

#data = pd.DataFrame(data=list(counted_text.items()), columns=['word', 'count']) 
# data = pd.DataFrame.from_dict(counted_text,orient='index')

data.head()

language, text = hamlets.iloc[0]

counted_text = count_words_fast(text)

data = pd.DataFrame({
    "word": list(counted_text.keys()),
    "count": list(counted_text.values())
})

# Enter your code here.

data["length"] = data["word"].apply(len)

data['frequency'] = 'infrequent' 
data['frequency'][data['count'] > 10] = 'frequent'
data['frequency'][data['count'] == 1] = 'unique'

data.head()

language, text = hamlets.iloc[0]

counted_text = count_words_fast(text)

data = pd.DataFrame({
    "word": list(counted_text.keys()),
    "count": list(counted_text.values())
})

data["length"] = data["word"].apply(len)

data.loc[data["count"] > 10,  "frequency"] = "frequent"
data.loc[data["count"] <= 10, "frequency"] = "infrequent"
data.loc[data["count"] == 1,  "frequency"] = "unique"

# Enter your code here.
sub_data = pd.DataFrame({
        "language": language,
        "frequency": ["frequent","infrequent","unique"],
        "mean_word_length": data.groupby(by = "frequency")["length"].mean(),
        "num_words": data.groupby(by = "frequency").size()
    })
    
#sub_data = pd.DataFrame(data)
#sub_data['language'] = language
#sub_data = sub_data.groupby(['language','frequency']).mean().reset_index()
#sub_data = sub_data.rename(columns={'count':'num_words', 'length':'mean_word_length'})

sub_data.head()

def summarize_text(language, text):
    counted_text = count_words_fast(text)

    data = pd.DataFrame({
        "word": list(counted_text.keys()),
        "count": list(counted_text.values())
    })
    
    data.loc[data["count"] > 10,  "frequency"] = "frequent"
    data.loc[data["count"] <= 10, "frequency"] = "infrequent"
    data.loc[data["count"] == 1,  "frequency"] = "unique"
    
    data["length"] = data["word"].apply(len)
    
    sub_data = pd.DataFrame({
        "language": language,
        "frequency": ["frequent","infrequent","unique"],
        "mean_word_length": data.groupby(by = "frequency")["length"].mean(),
        "num_words": data.groupby(by = "frequency").size()
    })
    
    return(sub_data)
    
# Enter your code here.
grouped_data = pd.DataFrame() #([])
for i in range(hamlets.shape[0]):
    language, text = hamlets.iloc[i]
    sub_data = summarize_text(language, text)
    grouped_data = grouped_data.append(sub_data) #, ignore_index=True)
#grouped_data = grouped_data[['language', 'frequency', 'mean_word_length', 'num_words']]
grouped_data.index.name=None 
grouped_data["num_words"] = grouped_data.num_words.astype(float)
grouped_data.head()    

colors = {"Portuguese": "green", "English": "blue", "German": "red"}
markers = {"frequent": "o","infrequent": "s", "unique": "^"}
import matplotlib.pyplot as plt
for i in range(grouped_data.shape[0]):
    row = grouped_data.iloc[i]
    plt.plot(row.mean_word_length, row.num_words,
        marker=markers[row.frequency],
        color = colors[row.language],
        markersize = 10
    )

color_legend = []
marker_legend = []
for color in colors:
    color_legend.append(
        plt.plot([], [],
        color=colors[color],
        marker="o",
        label = color, markersize = 10, linestyle="None")
    )
for marker in markers:
    marker_legend.append(
        plt.plot([], [],
        color="k",
        marker=markers[marker],
        label = marker, markersize = 10, linestyle="None")
    )
plt.legend(numpoints=1, loc = "upper left")

plt.xlabel("Mean Word Length")
plt.ylabel("Number of Words")
# show your plot using `plt.show`!
plt.show()


# Case Study 3
import pandas as pd
data = pd.read_csv('https://s3.amazonaws.com/demo-datasets/wine.csv')
numeric_data = data.drop('color', axis=1) # Enter your code here!
data.head(5)

from sklearn import preprocessing
scaled_data = preprocessing.scale(numeric_data)
numeric_data = pd.DataFrame(scaled_data, columns=numeric_data.columns)

import sklearn.decomposition
pca = sklearn.decomposition.PCA(n_components=2)
principal_components = pca.fit_transform(numeric_data) 
principal_components = pca.fit(numeric_data).transform(numeric_data)

# First, we import a tool to allow text to pop up on a plot when the cursor
# hovers over it.  Also, we import a data structure used to store arguments
# of what to plot in Bokeh.  Finally, we will use numpy for this section as well!

from bokeh.models import HoverTool, ColumnDataSource
import numpy as np

# Let's plot a simple 5x5 grid of squares, alternating in color as red and blue.

plot_values = [1,2,3,4,5]
plot_colors = ["red", "blue"]

# How do we tell Bokeh to plot each point in a grid?  Let's use a function that
# finds each combination of values from 1-5.
from itertools import product

grid = list(product(plot_values, plot_values))
print(grid)

# The first value is the x coordinate, and the second value is the y coordinate.
# Let's store these in separate lists.

xs, ys = zip(*grid)
print(xs)
print(ys)

# Now we will make a list of colors, alternating between red and blue.

colors = [plot_colors[i%2] for i in range(len(grid))]
print(colors)

# Finally, let's determine the strength of transparency (alpha) for each point,
# where 0 is completely transparent.

alphas = np.linspace(0, 1, len(grid))

# Bokeh likes each of these to be stored in a special dataframe, called
# ColumnDataSource.  Let's store our coordinates, colors, and alpha values.

source = ColumnDataSource(
    data={
        "x": xs,
        "y": ys,
        "colors": colors,
        "alphas": alphas,
    }
)
# We are ready to make our interactive Bokeh plot!

output_file("Basic_Example.html", title="Basic Example")
fig = figure(tools="resize, hover, save")
fig.rect("x", "y", 0.9, 0.9, source=source, color="colors",alpha="alphas")
hover = fig.select(dict(type=HoverTool))
hover.tooltips = {
    "Value": "@x, @y",
    }
show(fig)

cluster_colors = ["red", "orange", "green", "blue", "purple", "gray"]
regions = ["Speyside", "Highlands", "Lowlands", "Islands", "Campbelltown", "Islay"]

region_colors = {regions[i]:cluster_colors[i] for i in range(len(regions))} ## ENTER CODE HERE! ##
print(region_colors)

distilleries = list(whisky.Distillery)
correlation_colors = []
for i in range(len(distilleries)):
    for j in range(len(distilleries)):
        if correlations[i,j] < 0.7: # if low correlation,
            correlation_colors.append('white')         # just use white.
        else:                                          # otherwise,
            if whisky.Group[i] == whisky.Group[j]:     # if the groups match,
                correlation_colors.append(cluster_colors[whisky.Group[i]]) # color them by their mutual group.
            else:                                      # otherwise
                correlation_colors.append('lightgray') # color them lightgray.
				
source = ColumnDataSource(
    data = {
        "x": np.repeat(distilleries,len(distilleries)),
        "y": list(distilleries)*len(distilleries),
        "colors": correlation_colors,  ## ENTER CODE HERE! ##,
        "correlations": correlations.flatten() ## ENTER CODE HERE! ##,
    }
)

output_file("Whisky Correlations.html", title="Whisky Correlations")
fig = figure(title="Whisky Correlations",
    x_axis_location="above", tools="resize,hover,save",
    x_range=list(reversed(distilleries)), y_range=distilleries)
fig.grid.grid_line_color = None
fig.axis.axis_line_color = None
fig.axis.major_tick_line_color = None
fig.axis.major_label_text_font_size = "5pt"
fig.xaxis.major_label_orientation = np.pi / 3

fig.rect('x', 'y', .9, .9, source=source,
     color='colors', alpha='correlations')
hover = fig.select(dict(type=HoverTool))
hover.tooltips = {
    "Whiskies": "@x, @y",
    "Correlation": "@correlations",
}
show(fig)

points = [(0,0), (1,2), (3,1)]
xs, ys = zip(*points)
colors = ["red", "blue", "green"]

output_file("Spatial_Example.html", title="Regional Example")
location_source = ColumnDataSource(
    data={
        "x": xs,
        "y": ys,
        "colors": colors,
    }
)

fig = figure(title = "Title",
    x_axis_location = "above", tools="resize, hover, save")
fig.plot_width  = 300
fig.plot_height = 380
fig.circle("x", "y", 10, 10, size=10, source=location_source,
     color='colors', line_color = None)

hover = fig.select(dict(type = HoverTool))
hover.tooltips = {
    "Location": "(@x, @y)"
}
show(fig)

# edit this to make the function `location_plot`.
def location_plot(title, colors):
    output_file(title+".html")
    location_source = ColumnDataSource(
        data={
            "x": whisky[" Latitude"],
            "y": whisky[" Longitude"],
            "colors": colors,
            "regions": whisky.Region,
            "distilleries": whisky.Distillery
        }
    )
    
    fig = figure(title = title,
        x_axis_location = "above", tools="resize, hover, save")
    fig.plot_width  = 400
    fig.plot_height = 500
    fig.circle("x", "y", 10, 10, size=9, source=location_source,
         color='colors', line_color = None)
    fig.xaxis.major_label_orientation = np.pi / 3
    hover = fig.select(dict(type = HoverTool))
    hover.tooltips = {
        "Distillery": "@distilleries",
        "Location": "(@x, @y)"
    }
    show(fig)

#regions = whisky.Region.unique()
#cluster_colors = ["red", "orange", "green", "blue", "purple", "gray"]
#region_cols_map = {regions[i]:cluster_colors[i] for i in range(len(regions))}   #
#region_cols = whisky.apply(lambda x: region_cols_map[x['Region']], axis=1).tolist() ## ENTER CODE HERE! ##
region_colors = {regions[i]:cluster_colors[i] for i in range(len(regions))} 
region_cols = [region_colors[x] for x in whisky.Region.tolist()]
location_plot("Whisky Locations and Regions", region_cols)

region_cols = [region_colors[x] for x in whisky.Region.tolist()] ## ENTER CODE HERE! ##
classification_cols = [cluster_colors[c] for c in whisky.Group.tolist()] ## ENTER CODE HERE! ##

location_plot("Whisky Locations and Regions", region_cols)
location_plot("Whisky Locations and Groups", classification_cols)







# Case Study 5
# First, use `groupby()` to group the data by "bird_name".
grouped_birds = birddata.groupby(['bird_name'])

# Now calculate the mean of `speed_2d` using the `mean()` function.
mean_speeds = grouped_birds['speed_2d'].mean()

# Use the `head()` method prints the first 5 lines of each bird.
grouped_birds.head()

# Find the mean `altitude` for each bird.
mean_altitudes = grouped_birds['altitude'].mean()

				
# Convert birddata.date_time to the `pd.datetime` format.
birddata['date_time'] = pd.to_datetime(birddata.date_time)#, format='%Y%m%d', errors='ignore')

# Create a new column of day of observation
birddata["date"] = birddata['date_time'].dt.date

# Check the head of the column.
birddata["date"].head()

# Use `groupby()` to group the data by date.
grouped_bydates = birddata.groupby(['date'])

# Find the mean `altitude` for each date.
mean_altitudes_perday = grouped_bydates['altitude'].mean()
mean_altitudes_perday

# Use `groupby()` to group the data by bird and date.
grouped_birdday = birddata.groupby(['bird_name', 'date'])

# Find the mean `altitude` for each bird and date.
mean_altitudes_perday = grouped_birdday['altitude'].mean()

# look at the head of `mean_altitudes_perday`.
mean_altitudes_perday.head()

eric_daily_speed  = birddata[birddata.bird_name=='Eric'].groupby(['date'])['speed_2d'].mean() # Enter your code here.
sanne_daily_speed = birddata[birddata.bird_name=='Sanne'].groupby(['date'])['speed_2d'].mean() # Enter your code here.
nico_daily_speed  = birddata[birddata.bird_name=='Nico'].groupby(['date'])['speed_2d'].mean() # Enter your code here.

eric_daily_speed.plot(label="Eric")
sanne_daily_speed.plot(label="Sanne")
nico_daily_speed.plot(label="Nico")
plt.legend(loc="upper left")
plt.show()

# Case study 6
from collections import Counter
def frequency(chars):
    # Enter code here!
    v = Counter(chars.values())
    Z = sum(v.values())
    return {k:v[k]/Z for k in v}
    
def chance_homophily(chars):
    # Enter code here!
    f = frequency(chars)
    return sum([x**2 for x in f.values()])

favorite_colors = {
    "ankit":  "red",
    "xiaoyu": "blue",
    "mary":   "blue"
}

color_homophily = chance_homophily(favorite_colors)
print(color_homophily)

import pandas as pd
df  = pd.read_stata(data_filepath + "individual_characteristics.dta")
df1 = df[df.village==1] #.dropna(axis=0,how='any') # Enter code here!
df2 = df[df.village==2] #.dropna(axis=0,how='any') # Enter code here!

# Enter code here!
df1.head()

sex1      = {df1.iloc[i].pid:df1.iloc[i].resp_gend for i in range(df1.shape[0])} # Enter code here!
caste1    = {df1.iloc[i].pid:df1.iloc[i].caste for i in range(df1.shape[0])} # Enter code here!
religion1 = {df1.iloc[i].pid:df1.iloc[i].religion for i in range(df1.shape[0])} # Enter code here!

# Continue for df2 as well.
sex2      = {df2.iloc[i].pid:df2.iloc[i].resp_gend for i in range(df2.shape[0])} # Enter code here!
caste2    = {df2.iloc[i].pid:df2.iloc[i].caste for i in range(df2.shape[0])} # Enter code here!
religion2 = {df2.iloc[i].pid:df2.iloc[i].religion for i in range(df2.shape[0])} # Enter code here!

print("Village 1 chance of same sex:", chance_homophily(sex1))
# Enter your code here.
print("Village 1 chance of same caste:", chance_homophily(caste1))
print("Village 1 chance of same religion:", chance_homophily(religion1))
print("Village 2 chance of same sex:", chance_homophily(sex2))
print("Village 2 chance of same caste:", chance_homophily(caste2))
print("Village 2 chance of same religion:", chance_homophily(religion2))


def homophily(G, chars, IDs):
    """
    Given a network G, a dict of characteristics chars for node IDs,
    and dict of node IDs for each node in the network,
    find the homophily of the network.
    """
    num_same_ties = 0
    num_ties = 0
    for n1, n2 in G.edges():
        if IDs[n1] in chars and IDs[n2] in chars:
            if G.has_edge(n1, n2):
                # Should `num_ties` be incremented?  What about `num_same_ties`?
                num_ties += 1
                if chars[IDs[n1]] == chars[IDs[n2]]:
                    # Should `num_ties` be incremented?  What about `num_same_ties`?
                    num_same_ties += 1
    return (num_same_ties / num_ties)    
    
# Enter code here!
pid1  = pd.read_csv(data_filepath + "key_vilno_1.csv", header=None)
pid2  = pd.read_csv(data_filepath + "key_vilno_2.csv", header=None)


print("Village 1 observed proportion of same sex:", homophily(G1, sex1, pid1), chance_homophily(sex1))

# Enter your code here!
print("Village 1 observed proportion of same caste:", homophily(G1, caste1, pid1), chance_homophily(caste1))
print("Village 1 observed proportion of same religion:", homophily(G1, religion1, pid1), chance_homophily(religion1))

print("Village 2 observed proportion of same sex:", homophily(G2, sex2, pid2), chance_homophily(sex2))
print("Village 2 observed proportion of same caste:", homophily(G2, caste2, pid2), chance_homophily(caste2))
print("Village 2 observed proportion of same religion:", homophily(G2, religion2, pid2), chance_homophily(religion2))



# Case study 7
import pandas as pd
import numpy as np

from sklearn.model_selection import cross_val_predict
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestRegressor
from sklearn.ensemble import RandomForestClassifier

from sklearn.metrics import accuracy_score
from sklearn.metrics import r2_score

import matplotlib.pyplot as plt

df = pd.read_csv(data_filepath + 'merged_movie_data.csv')
# Enter code here.
df.head()

# Enter code here.

df['profitable'] = df.apply(lambda x: 1 if x['revenue'] > x['budget'] else 0, axis=1)
#df['profitable'] = (df.revenue > df.budget).astype('int')
#df['profitable'] = (df['revenue'] > df['budget']).astype('int')
#df['profitable'] = 0
#df[df['revenue'] > df['budget']]['profitable'] = 1
regression_target = 'revenue'
classification_target = 'profitable'

# Enter code here.

df = df.replace([np.inf, -np.inf], np.nan)
df = df.dropna(axis=0,how='any')

# Enter your code here.
df['genres'] = df['genres'].str.strip() # .replace(' ', '', regex=True)
genres = pd.unique(df['genres'].str.split(',',expand=True).stack())
genres = list(set([g.strip() for g in genres]))
#for g in genres:
for g in ['Action', 'Adventure', 'Fantasy', 'Science Fiction', 'Crime', 'Drama', 'Thriller', 'Animation', 'Family', 'Western', 'Comedy', 'Romance', 'Horror', 'Mystery', 'War', 'History', 'Music', 'Documentary', 'TV Movie', 'Foreign']:
    df[g] = df['genres'].map(lambda x: 1 if g in x else 0)
#df[genres] = df['genres'].str.get_dummies(sep=',')
df[genres].head()

continuous_covariates = ['budget', 'popularity', 'runtime', 'vote_count', 'vote_average']
outcomes_and_continuous_covariates = continuous_covariates + [regression_target, classification_target]
plotting_variables = ['budget', 'popularity', regression_target]

axes = pd.tools.plotting.scatter_matrix(df[plotting_variables], alpha = 0.15,color=(0,0,0),hist_kwds={"color":(0,0,0)},facecolor=(1,0,0))
plt.tight_layout()
# show the plot.
plt.show()
# determine the skew.
df[outcomes_and_continuous_covariates].skew()

# Enter your code here.
for col in ['budget', 'popularity', 'runtime', 'vote_count', 'revenue']:
    df[[col]] = np.log10(1+df[[col]]) #.transform(lambda x: x))


# Case study 7 part 2
# Define all covariates and outcomes from `df`.
regression_outcome = df[regression_target]
classification_outcome = df[classification_target]
covariates = df[all_covariates]

# Instantiate all regression models and classifiers.
linear_regression = LinearRegression()
logistic_regression = LogisticRegression()
forest_regression = RandomForestRegressor(max_depth=4, random_state=0)
forest_classifier = RandomForestClassifier(max_depth=4, random_state=0)

# Enter your code here.
def correlation(estimator, X, y):
    predictions = estimator.fit(X, y)
    return r2_score(y, predictions)
    
def accuracy(estimator, X, y):
    predictions = estimator.fit(X, y)
    return accuracy_score(y, predictions)    
	
# Determine the cross-validated correlation for linear and random forest models.
linear_regression_scores = cross_val_score(linear_regression, covariates, regression_outcome, cv=10, scoring=correlation)
forest_regression_scores = cross_val_score(forest_regression, covariates, regression_outcome, cv=10, scoring=correlation)

# Plot Results
plt.axes().set_aspect('equal', 'box')
plt.scatter(linear_regression_scores, forest_regression_scores)
plt.plot((0, 1), (0, 1), 'k-')

plt.xlim(0, 1)
plt.ylim(0, 1)
plt.xlabel("Linear Regression Score")
plt.ylabel("Forest Regression Score")

# Show the plot.
plt.show()

# Determine the cross-validated accuracy for logistic and random forest models.
logistic_regression_scores = cross_val_score(logistic_regression, covariates, classification_outcome, cv=10, scoring=accuracy)
forest_classification_scores = cross_val_score(forest_classifier, covariates, classification_outcome, cv=10, scoring=accuracy)


# Plot Results
plt.axes().set_aspect('equal', 'box')
plt.scatter(logistic_regression_scores, forest_classification_scores)
plt.plot((0, 1), (0, 1), 'k-')

plt.xlim(0, 1)
plt.ylim(0, 1)
plt.xlabel("Linear Classification Score")
plt.ylabel("Forest Classification Score")

# Show the plot.
plt.show()

positive_revenue_df = df[df.revenue > 0]

# Replace the dataframe in the following code, and run.

regression_outcome = positive_revenue_df[regression_target]
classification_outcome = positive_revenue_df[classification_target]
covariates = positive_revenue_df[all_covariates]

# Reinstantiate all regression models and classifiers.
linear_regression = LinearRegression()
logistic_regression = LogisticRegression()
forest_regression = RandomForestRegressor(max_depth=4, random_state=0)
forest_classifier = RandomForestClassifier(max_depth=4, random_state=0)
linear_regression_scores = cross_val_score(linear_regression, covariates, regression_outcome, cv=10, scoring=correlation)
forest_regression_scores = cross_val_score(forest_regression, covariates, regression_outcome, cv=10, scoring=correlation)
logistic_regression_scores = cross_val_score(logistic_regression, covariates, classification_outcome, cv=10, scoring=accuracy)
forest_classification_scores = cross_val_score(forest_classifier, covariates, classification_outcome, cv=10, scoring=accuracy)

positive_revenue_df = df[df.revenue > 0]

# Replace the dataframe in the following code, and run.

regression_outcome = positive_revenue_df[regression_target]
classification_outcome = positive_revenue_df[classification_target]
covariates = positive_revenue_df[all_covariates]

# Reinstantiate all regression models and classifiers.
linear_regression = LinearRegression()
logistic_regression = LogisticRegression()
forest_regression = RandomForestRegressor(max_depth=4, random_state=0)
forest_classifier = RandomForestClassifier(max_depth=4, random_state=0)
linear_regression_scores = cross_val_score(linear_regression, covariates, regression_outcome, cv=10, scoring=correlation)
forest_regression_scores = cross_val_score(forest_regression, covariates, regression_outcome, cv=10, scoring=correlation)
logistic_regression_scores = cross_val_score(logistic_regression, covariates, classification_outcome, cv=10, scoring=accuracy)
forest_classification_scores = cross_val_score(forest_classifier, covariates, classification_outcome, cv=10, scoring=accuracy)

# Determine the cross-validated correlation for linear and random forest models.
linear_regression_scores = cross_val_score(linear_regression, covariates, regression_outcome, cv=10, scoring=correlation)
forest_regression_scores = cross_val_score(forest_regression, covariates, regression_outcome, cv=10, scoring=correlation)

# Plot Results
plt.axes().set_aspect('equal', 'box')
plt.scatter(linear_regression_scores, forest_regression_scores)
plt.plot((0, 1), (0, 1), 'k-')

plt.xlim(0, 1)
plt.ylim(0, 1)
plt.xlabel("Linear Regression Score")
plt.ylabel("Forest Regression Score")

# Show the plot.
plt.show()
# Print the importance of each covariate in the random forest regression.
forest_regression.fit(covariates, regression_outcome)
importances = forest_regression.feature_importances_
for i,x in enumerate(all_covariates):
    print(x, importances[i])

# Determine the cross-validated accuracy for logistic and random forest models.
logistic_regression_scores = cross_val_score(logistic_regression, covariates, classification_outcome, cv=10, scoring=accuracy)
forest_classification_scores = cross_val_score(forest_classifier, covariates, classification_outcome, cv=10, scoring=accuracy)


# Plot Results
plt.axes().set_aspect('equal', 'box')
plt.scatter(logistic_regression_scores, forest_classification_scores)
plt.plot((0, 1), (0, 1), 'k-')

plt.xlim(0, 1)
plt.ylim(0, 1)
plt.xlabel("Linear Classification Score")
plt.ylabel("Forest Classification Score")

# Show the plot.
plt.show()
# Print the importance of each covariate in the random forest classification.
forest_classifier.fit(covariates, classification_outcome)
importances = forest_classifier.feature_importances_
for i,x in enumerate(all_covariates):
    print(x, importances[i])
