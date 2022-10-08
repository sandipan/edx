import pandas as pd
import numpy as np
import scipy.io
import random, math

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

# cd 'C:/courses/Edx/Past/Microsoft/Microsoft DAT210x Programming with Python for Data Science/Week4/Assignments/Datasets/'

def Plot2D(T, title, x, y, num_to_plot=40):
  # This method picks a bunch of random samples (images in your case)
  # to plot onto the chart:
  fig = plt.figure()
  ax = fig.add_subplot(111)
  ax.set_title(title)
  ax.set_xlabel('Component: {0}'.format(x))
  ax.set_ylabel('Component: {0}'.format(y))
  x_size = (max(T[:,x]) - min(T[:,x])) * 0.08
  y_size = (max(T[:,y]) - min(T[:,y])) * 0.08
  for i in range(num_to_plot):
    img_num = int(random.random() * num_images)
    x0, y0 = T[img_num,x]-x_size/2., T[img_num,y]-y_size/2.
    x1, y1 = T[img_num,x]+x_size/2., T[img_num,y]+y_size/2.
    img = df.iloc[img_num,:].reshape(num_pixels, num_pixels)
    ax.imshow(img, aspect='auto', cmap=plt.cm.gray, interpolation='nearest', zorder=100000, extent=(x0, x1, y0, y1))

  # It also plots the full scatter:
  ax.scatter(T[:,x],T[:,y], marker='.',alpha=0.7)

def Plot3D(T, title, x, y, z, num_to_plot=40):

  #from mpl_toolkits.mplot3d.axes3d import Axes3D
  import matplotlib.pyplot as plt
  # imports specific to the plots in this example
  #from matplotlib import cm
  #from mpl_toolkits.mplot3d.axes3d import get_test_data
  fig = plt.figure(figsize=(20,20))
  #---- First subplot
  ax = fig.add_subplot(111, projection='3d')
  ax.set_title(title)
  ax.set_xlabel('Component: {0}'.format(x))
  ax.set_ylabel('Component: {0}'.format(y))
  ax.set_zlabel('Component: {0}'.format(z))
  # This method picks a bunch of random samples (images in your case)
  # to plot onto the chart:
  size = 0.1 # 0.08
  x_size = (max(T[:,x]) - min(T[:,x])) * size
  y_size = (max(T[:,y]) - min(T[:,y])) * size
  z_size = (max(T[:,z]) - min(T[:,z])) * size
  for i in range(num_to_plot):
    img_num = int(random.random() * num_images)
    x0, y0, z0 = T[img_num,x]-x_size/2., T[img_num,y]-y_size/2., T[img_num,z]-z_size/2.
    x1, y1, z1 = T[img_num,x]+x_size/2., T[img_num,y]+y_size/2., T[img_num,z]+z_size/2.
    img = df.iloc[img_num,:].reshape(num_pixels, num_pixels)
    #ax.imshow(img, aspect='auto', cmap=plt.cm.gray, interpolation='nearest', zorder=z1, extent=(x0, x1, y0, y1))
    xx, yy = np.meshgrid(np.linspace(x0, x1, 64), np.linspace(y0, y1, 64))#np.linspace(0,1,64), np.linspace(0,1,64))
    ax.contourf(xx, yy, img, zdir='z', offset=(z0+z1)/2, cmap=plt.cm.gray)
    #ax.plot_surface(T[img_num,x], T[img_num,y], T[img_num,z], rstride=1, cstride=1, cmap=cm.coolwarm, linewidth=0, antialiased=False)
  #fig.colorbar(surf, shrink=0.5, aspect=10)

  # It also plots the full scatter:
  ax.scatter(T[:,x],T[:,y], T[:,z], marker='.',alpha=0.2)

  #ax.set_xlim(-30, 20)
  #ax.set_ylim(-25, 20)
  #ax.set_zlim(-5, 6)


# A .MAT file is a .MATLAB file. The faces dataset could have came
# in through .png images, but we'll show you how to do that in
# anither lab. For now, you'll see how to import .mats:
mat = scipy.io.loadmat('face_data.mat')
df = pd.DataFrame(mat['images']).T
num_images, num_pixels = df.shape
num_pixels = int(math.sqrt(num_pixels))

# Rotate the pictures, so we don't have to crane our necks:
for i in range(num_images):
  df.loc[i,:] = df.loc[i,:].reshape(num_pixels, num_pixels).T.reshape(-1)

# show few images
import matplotlib.gridspec as gridspec
gs = gridspec.GridSpec(20, 20, top=1., bottom=0., right=1., left=0., hspace=0.,
        wspace=0.)

i = 0
for g in gs:
    ax = plt.subplot(g)
    ax.imshow(np.reshape(df.loc[i], (64, 64)), cmap='gray')
    ax.set_xticks([])
    ax.set_yticks([])
    ax.set_aspect('auto')
    i += 1
plt.show()

#
# TODO: Implement PCA here. Reduce the dataframe df down
# to THREE components. Once you've done that, call Plot2D.
#
# The format is: Plot2D(T, title, x, y, num_to_plot=40):
# T is your transformed data, NDArray.
# title is your chart title
# x is the principal component you want displayed on the x-axis, Can be 0 or 1
# y is the principal component you want displayed on the y-axis, Can be 1 or 2
#
# .. your code here ..

from sklearn.decomposition import PCA
pca = PCA(n_components=3)
pca.fit(df)
PCA(copy=True, n_components=3, whiten=False)
T = pca.transform(df)
#X.shape
#T.shape
#Plot2D(T, '0-1', 0, 1, num_to_plot=40)
#Plot2D(T, '0-2', 0, 2, num_to_plot=40)
#Plot2D(T, '1-2', 1, 2, num_to_plot=40)
Plot3D(T, 'Heads Dataset with PCA', 0, 1, 2, num_to_plot=50)


from sklearn.decomposition import KernelPCA
scikit_kpca = KernelPCA(n_components=3, kernel='rbf', gamma=0.01)
T = scikit_kpca.fit_transform(df)
Plot3D(T, 'Heads Dataset with KernelPCA', 0, 1, 2, num_to_plot=50)

#
# TODO: Implement Isomap here. Reduce the dataframe df down
# to THREE components. Once you've done that, call Plot2D using
# the first two components.
#
# .. your code here ..

from sklearn.manifold import Isomap
K = 8 #3
iso = Isomap(n_neighbors=K, n_components=3)
iso.fit(df)
Isomap(eigen_solver='auto', max_iter=None, n_components=3, n_neighbors=K,
    neighbors_algorithm='auto', path_method='auto', tol=0)
manifold = iso.transform(df)
#df.shape
#manifold.shape
#Plot2D(manifold, '0-1', 0, 1, num_to_plot=40)
#Plot2D(manifold, '0-2', 0, 2, num_to_plot=40)
#Plot2D(manifold, '1-2', 1, 2, num_to_plot=40)
Plot3D(manifold, 'Heads Dataset with Isomap with 8 nearest neigbors', 0, 1, 2, num_to_plot=50)


#
# TODO: If you're up for a challenge, draw your dataframes in 3D
# Even if you're not, just do it anyway.
#
# .. your code here ..
#Plot3D(manifold, '0-2', 0, 1, 2, num_to_plot=40)


plt.show()
