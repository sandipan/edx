from skimage.io import imread
import matplotlib.pylab as plt
import matplotlib.gridspec as gridspec

queries = ['What are the types of supervised learning?', 'When was Python 3.0 released?', 'How do neurons connect in a neural network?', 'what is generalization in machine learning?', 'How are statistics and machine learning different?', \
           'how is deep learning used in computer vision and NLP?', 'is ML a subfield of AI?', 'is python a compiled or an interpreted language?', 'what is the difference between stochastic and batch gradient descent?']

for i in range(len(queries)):
	im1 = imread('out/wordcloud_{:03d}.png'.format(i))
	im2 = imread('out/tfidf_file_{:03d}.png'.format(i))
	fig = plt.figure(figsize=(30,15), constrained_layout=True)
	plt.subplots_adjust(0,0,1,0.95,0.01,0.01)
	gs = fig.add_gridspec(2, 5)
	f_ax1 = fig.add_subplot(gs[:, :3])
	f_ax1.imshow(im1), f_ax1.axis('off')
	f_ax2 = fig.add_subplot(gs[:, 3:])
	f_ax2.imshow(im2), f_ax2.axis('off')
	plt.suptitle('query: {}'.format(queries[i]), size=25)
	#plt.tight_layout()
	plt.savefig('out/final_out_{:03d}_1.png'.format(i)) #, bbox_in='tight', pad_in=0)
	plt.close()
	im1 = imread('out/sentences_{:03d}.png'.format(i))
	im2 = imread('out/barplot_{:03d}.png'.format(i))
	im3 = imread('out/tfidf_sent_{:03d}.png'.format(i))
	plt.figure(figsize=(25,10))
	plt.subplots_adjust(0,0,1,0.95,0.01,0.01)
	plt.subplot(131), plt.imshow(im1), plt.axis('off')
	plt.subplot(132), plt.imshow(im2), plt.axis('off')
	plt.subplot(133), plt.imshow(im3), plt.axis('off')
	plt.suptitle('query: {}'.format(queries[i]), size=25)
	plt.savefig('out/final_out_{:03d}_2.png'.format(i)) #, bbox_in='tight', pad_in=0)
	plt.close()
