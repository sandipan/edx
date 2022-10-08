import matplotlib.pyplot as plt
import numpy as np
from tqdm import tqdm,trange
import gc

def plot_img_array(img_array, ncol=3):
    nrow = len(img_array) // ncol

    f, plots = plt.subplots(nrow, ncol, sharex='all', sharey='all', figsize=(ncol * 4, nrow * 4))

    for i in trange(len(img_array), ascii=True):
        plots[i // ncol, i % ncol].imshow(img_array[i])

from functools import reduce
def plot_side_by_side(img_arrays):
    flatten_list = np.array(reduce(lambda x,y: x+y, zip(*img_arrays)))
    plot_img_array(flatten_list, ncol=len(img_arrays))
    del(flatten_list)
    gc.collect()

import itertools
def plot_errors(results_dict, title):
    markers = itertools.cycle(('+', 'x', 'o'))

    plt.title('{}'.format(title))

    for label, result in sorted(results_dict.items()):
        plt.plot(result, marker=next(markers), label=label)
        plt.ylabel('dice_coef')
        plt.xlabel('epoch')
        plt.legend(loc=3, bbox_to_anchor=(1, 0))

    plt.show()
    plt.close()
    gc.collect()

def masks_to_colorimg(masks):
    colorimg = np.zeros((masks.shape[1], masks.shape[2], 3), dtype=np.float32) * 255

    #
    # This is what we are trying to achieve (unrolled, for ease of reading)
    # colors = np.asarray([(0,0,0),(255, 0, 255)])
    #
    # channels, height, width = masks.shape
    #
    # for y in range(height):
    #     for x in range(width):
    #         selected_colors = colors[masks[:,y,x] > 0.5]
    # 
    #         if len(selected_colors) > 0:
    #             colorimg[y,x,:] = np.mean(selected_colors, axis=0)
    #
    # and here is an equivalent vectorized implemention that is harder to
    # read but executes ~60 times faster
    #

    colorimg[:,:,0] = np.where(masks[0,:,:] > 0.5, 255, 0)
    colorimg[:,:,0] = colorimg[:,:,0] + np.where(masks[1,:,:] > 0.5, 255, -255)
    colorimg[:,:,0] = np.where(colorimg[:,:,0] == 510, 127, colorimg[:,:,0])

    # colorimg[:,:,1] = 0

    colorimg[:,:,2] = np.where(masks[0,:,:] > 0.5, 255, 0)
    colorimg[:,:,2] = colorimg[:,:,2] + np.where(masks[1,:,:] > 0.5, 255, -255)
    colorimg[:,:,2] = np.where(colorimg[:,:,2] == 510, 127, colorimg[:,:,2])

    return colorimg.astype(np.uint8)
