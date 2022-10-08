import pandas as pd

from scipy import misc
from mpl_toolkits.mplot3d import Axes3D
import matplotlib
import matplotlib.pyplot as plt

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week4/Assignments/Datasets/'

# Look pretty...
matplotlib.style.use('ggplot')


#
# TODO: Start by creating a regular old, plain, "vanilla"
# python list. You can call it 'samples'.
#
# .. your code here .. 
samples = []

#
# TODO: Write a for-loop that iterates over the images in the
# Module4/Datasets/ALOI/32/ folder, appending each of them to
# your list. Each .PNG image should first be loaded into a
# temporary NDArray, just as shown in the Feature
# Representation reading.
#
# Optional: Resample the image down by a factor of two if you
# have a slower computer. You can also convert the image from
# 0-255  to  0.0-1.0  if you'd like, but that will have no
# effect on the algorithm's results.
#
# .. your code here .. 

import os
lst = os.listdir("ALOI/32/")

# Uses the Image module (PIL)
from scipy import misc

for imgfile in lst:
    # Load the image up
    img = misc.imread("ALOI/32/" + imgfile)
    # Is the image too big? Shrink it by an order of magnitude
    #img = img[::2, ::2]
    # Scale colors from (0-255) to (0-1), then reshape to 1D Array
    img = (img / 255.0).reshape(-1, 3)
    samples.append(img.mean(axis=1))

#
# TODO: Once you're done answering the first three questions,
# right before you converted your list to a dataframe, add in
# additional code which also appends to your list the images
# in the Module4/Datasets/ALOI/32_i directory. Re-run your
# assignment and answer the final question below.
#
# .. your code here .. 
lst = os.listdir("ALOI/32_i/")
for imgfile in lst:
    # Load the image up
    img = misc.imread("ALOI/32_i/" + imgfile)
    # Is the image too big? Shrink it by an order of magnitude
    #img = img[::2, ::2]
    # Scale colors from (0-255) to (0-1), then reshape to 1D Array
    img = (img / 255.0).reshape(-1, 3)
    samples.append(img.mean(axis=1))


#
# TODO: Convert the list to a dataframe
#
# .. your code here .. 
df = pd.DataFrame(samples)



#
# TODO: Implement Isomap here. Reduce the dataframe df down
# to three components, using K=6 for your neighborhood size
#
# .. your code here .. 
from sklearn.manifold import Isomap
K = 6
iso = Isomap(n_neighbors=K, n_components=3)
iso.fit(df)
Isomap(eigen_solver='auto', max_iter=None, n_components=3, n_neighbors=K,
    neighbors_algorithm='auto', path_method='auto', tol=0)
manifold = iso.transform(df)
#df.shape
#manifold.shape

#
# TODO: Create a 2D Scatter plot to graph your manifold. You
# can use either 'o' or '.' as your marker. Graph the first two
# isomap components
#
# .. your code here .. 
plt.scatter(manifold[:,0], manifold[:,1], color=['blue']*72+['red']*12)



#
# TODO: Create a 3D Scatter plot to graph your manifold. You
# can use either 'o' or '.' as your marker:
#
# .. your code here ..
fig = plt.figure()
ax = Axes3D(fig)
ax.scatter(manifold[:,0], manifold[:,1], manifold[:,2], color=['blue']*72+['red']*12)



plt.show()

