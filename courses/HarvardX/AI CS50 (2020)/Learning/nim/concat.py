from skimage.io import imread
import matplotlib.pylab as plt
from glob import glob

'''
for i in range(50):
#for i in range(20,10001,20):
	im1 = imread('sol/board_{:05d}.jpg'.format(i))
	im2 = imread('sol/qval_{:05d}.png'.format(i))
	plt.figure(figsize=(20,10))
	plt.subplots_adjust(0,0,1,1,0.01,0.01)
	plt.subplot(121), plt.imshow(im1), plt.axis('off')
	plt.subplot(122), plt.imshow(im2), plt.axis('off')
	plt.savefig('out_{:05d}.png'.format(i))
	plt.close()
'''

#for i in range(2,10,2):
for i in range(1,12):
	im1 = imread('sol/board_{:05d}.jpg'.format(i))
	im2 = imread('sol/bar_{:05d}.png'.format(min(2*(i//2)+1, 9)))
	im3 = imread('sol/input_{:05d}.png'.format(min(2*(i//2)+1, 9)))
	plt.figure(figsize=(20,30))
	plt.subplots_adjust(0,0,1,1,0.01,0.01)
	plt.subplot(311), plt.imshow(im1), plt.axis('off')
	plt.subplot(312), plt.imshow(im2), plt.axis('off')
	plt.subplot(313), plt.imshow(im3), plt.axis('off')
	plt.savefig('out_{:05d}.png'.format(i))
	plt.close()