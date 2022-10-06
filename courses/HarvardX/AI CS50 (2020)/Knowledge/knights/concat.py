from skimage.io import imread
import matplotlib.pylab as plt
import matplotlib.gridspec as gridspec

'''
im1 = imread('out/knowledge_01.jpg')
for i in range(6):
	im2 = imread('out/table_{:05d}.png'.format(i))
	fig = plt.figure(figsize=(20,20)) #, constrained_layout=True)
	plt.subplots_adjust(0,0,1,0.95,0.05,0.05)
	gs = fig.add_gridspec(3, 1)
	f_ax1 = fig.add_subplot(gs[:2, 0])
	f_ax1.imshow(im1), f_ax1.axis('off'), f_ax1.set_title('AST for knowledgebase', size=20)
	f_ax2 = fig.add_subplot(gs[2, 0])
	f_ax2.imshow(im2), f_ax2.axis('off'), f_ax2.set_title('Model Checking', size=20)
	plt.savefig('out/out_{:03d}.png'.format(i)) #, bbox_in='tight', pad_in=0)
	plt.close()
'''

'''	
im1 = imread('out/knowledge_02.jpg')
for i in range(6, 50):
	im2 = imread('out/table_{:05d}.png'.format(i))
	fig = plt.figure(figsize=(20,20)) #, constrained_layout=True)
	plt.subplots_adjust(0,0,1,0.95,0.05,0.05)
	gs = fig.add_gridspec(3, 1)
	f_ax1 = fig.add_subplot(gs[:2, 0])
	f_ax1.imshow(im1), f_ax1.axis('off'), f_ax1.set_title('AST for knowledgebase', size=20)
	f_ax2 = fig.add_subplot(gs[2, 0])
	f_ax2.imshow(im2), f_ax2.axis('off'), f_ax2.set_title('Model Checking', size=20)
	plt.savefig('out/out_{:03d}.png'.format(i)) #, bbox_in='tight', pad_in=0)
	plt.close()
'''

'''
im1 = imread('out/knowledge_03.jpg')
for i in range(50, 94):
	im2 = imread('out/table_{:05d}.png'.format(i))
	fig = plt.figure(figsize=(30,20)) #, constrained_layout=True)
	plt.subplots_adjust(0,0,1,0.95,0.05,0.05)
	gs = fig.add_gridspec(4, 1)
	f_ax1 = fig.add_subplot(gs[:3, 0])
	f_ax1.imshow(im1), f_ax1.axis('off'), f_ax1.set_title('AST for knowledgebase', size=20)
	f_ax2 = fig.add_subplot(gs[3, 0])
	f_ax2.imshow(im2), f_ax2.axis('off'), f_ax2.set_title('Model Checking', size=20)
	plt.savefig('out/out_{:03d}.png'.format(i)) #, bbox_in='tight', pad_in=0)
	plt.close()
'''

im1 = imread('out/knowledge_04.jpg')
for i in range(94, 421):
	im2 = imread('out/table_{:05d}.png'.format(i))
	fig = plt.figure(figsize=(30,20)) #, constrained_layout=True)
	plt.subplots_adjust(0,0,1,0.95,0.05,0.05)
	gs = fig.add_gridspec(4, 1)
	f_ax1 = fig.add_subplot(gs[:3, 0])
	f_ax1.imshow(im1), f_ax1.axis('off'), f_ax1.set_title('AST for knowledgebase', size=20)
	f_ax2 = fig.add_subplot(gs[3, 0])
	f_ax2.imshow(im2), f_ax2.axis('off'), f_ax2.set_title('Model Checking', size=20)
	plt.savefig('out/out_{:03d}.png'.format(i)) #, bbox_in='tight', pad_in=0)
	plt.close()