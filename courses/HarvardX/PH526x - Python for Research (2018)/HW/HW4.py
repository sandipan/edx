numeric_data = data.drop('color', axis=1) # Enter your code here!
data.head(5)






import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from matplotlib.backends.backend_pdf import PdfPages
observation_colormap = ListedColormap(['red', 'blue'])
x = principal_components[:,0] # Enter your code here!
y = principal_components[:,1] # Enter your code here!

plt.title("Principal Components of Wine")
plt.scatter(x, y, alpha = 0.2,
    c = data['high_quality'], cmap = observation_colormap, edgecolors = 'none')
plt.xlim(-8, 8); plt.ylim(-8, 8)
plt.xlabel("Principal Component 1"); plt.ylabel("Principal Component 2")
plt.show()


def accuracy(predictions, outcomes):
    # Enter your code here!
    return sum(predictions == outcomes) / len(outcomes)

x = np.array([1,2,3]) 
y = np.array([1,2,4])
print(accuracy(x, y))

print(accuracy(0, data["high_quality"]))

from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors = 5)
knn.fit(numeric_data, data['high_quality'])
# Enter your code here!
library_predictions = knn.predict(numeric_data)
print(accuracy(library_predictions, data["high_quality"]))

n_rows = data.shape[0]

# Enter your code here.
random.seed(123)
selection = random.sample(range(n_rows), 10)

predictors = np.array(numeric_data)
training_indices = [i for i in range(len(predictors)) if i not in selection]
outcomes = np.array(data["high_quality"])

my_predictions = []
for p in predictors[selection]:
    my_predictions.append(knn_predict(p, predictors[training_indices,:],  outcomes[training_indices], k=5)) # Enter your code here!
percentage = accuracy(my_predictions, data.high_quality[selection]) # Enter your code here!
print(percentage)
