from skimage.io import imread
import matplotlib.pylab as plt
import matplotlib.gridspec as gridspec

TERMINALS = """
Adj -> "country" | "dreadful" | "enigmatical" | "little" | "moist" | "red"
Adv -> "down" | "here" | "never"
Conj -> "and"
Det -> "a" | "an" | "his" | "my" | "the"
N -> "armchair" | "companion" | "day" | "door" | "hand" | "he" | "himself"
N -> "holmes" | "home" | "i" | "mess" | "paint" | "palm" | "pipe" | "she"
N -> "smile" | "thursday" | "walk" | "we" | "word"
P -> "at" | "before" | "in" | "of" | "on" | "to" | "until"
V -> "arrived" | "came" | "chuckled" | "had" | "lit" | "said" | "sat"
V -> "smiled" | "tell" | "were"
"""

for i in range(24):
	im1 = imread('out/output_{:03d}.png'.format(i))
	im2 = imread('out/output_np_{:03d}.png'.format(i))
	fig = plt.figure(figsize=(20,10), constrained_layout=True)
	gs = fig.add_gridspec(2, 2)
	f_ax1 = fig.add_subplot(gs[:, 0])
	f_ax1.imshow(im1), f_ax1.axis('off'), f_ax1.set_title('Parse tree for sentence', size=20)
	f_ax2 = fig.add_subplot(gs[0, 1])
	f_ax2.imshow(im2), f_ax2.axis('off'), f_ax2.set_title('NP chunks', size=20)
	f_ax3 = fig.add_subplot(gs[1, 1])
	f_ax3.text(0, 0, TERMINALS, size=20, rotation=0.,
         ha="left", va="bottom"#,
         #bbox=dict(boxstyle="round",
         #          ec=(1., 0.5, 0.5),
         #          fc=(1., 0.8, 0.8),
         #          )
         ), f_ax3.axis('off')
	f_ax3.set_title('Terminal rules in CFG', size=20)
	#plt.tight_layout()
	plt.savefig('out/final_out_{:03d}.png'.format(i), bbox_in='tight', pad_in=0)
	plt.close()