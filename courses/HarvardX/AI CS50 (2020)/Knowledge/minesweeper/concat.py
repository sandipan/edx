from skimage.io import imread
import matplotlib.pylab as plt
import matplotlib.gridspec as gridspec

for i in range(54):
	im1 = imread('out/game_{:03d}.png'.format(i+1))
	im2 = imread('out/board_{:03d}.png'.format(i))
	fig = plt.figure(figsize=(20,10), constrained_layout=True)
	gs = fig.add_gridspec(1, 3)
	f_ax1 = fig.add_subplot(gs[0, 0])
	f_ax1.imshow(im1), f_ax1.axis('off'), f_ax1.set_title('MinsweeperAI moves', size=20)
	f_ax2 = fig.add_subplot(gs[0, 1:])
	f_ax2.imshow(im2), f_ax2.axis('off'), f_ax2.set_title('MinsweeperAI inference', size=20)
	plt.savefig('out/out_{:03d}.png'.format(i), bbox_in='tight', pad_in=0)
	plt.close()