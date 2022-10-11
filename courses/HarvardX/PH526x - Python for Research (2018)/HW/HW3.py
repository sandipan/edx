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



import pandas as pd
data = pd.read_csv('https://s3.amazonaws.com/demo-datasets/wine.csv')


