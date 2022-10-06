from skimage.io import imread
import matplotlib.pylab as plt
from glob import glob

#for i in range(10):
for i in range(100,10001,100):
	im1 = imread('out/test_{:05d}.jpg'.format(i))
	im2 = imread('out/bar_test_{:05d}.png'.format(i))
	plt.figure(figsize=(20,10))
	plt.subplots_adjust(0,0,1,1,0.01,0.01)
	plt.subplot(121), plt.imshow(im1), plt.axis('off')
	plt.subplot(122), plt.imshow(im2), plt.axis('off')
	plt.savefig('out/out_{:05d}.png'.format(i))