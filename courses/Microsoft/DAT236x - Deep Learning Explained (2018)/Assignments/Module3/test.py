print(8*(5*5)+8 + 16*8*(5*5)+16 + 10*(16*7*7)+10) # parameters for convnet

w = h = 28
a = b = 5
c = d = 5 #3 #5
m = 32 #8
n = 32 #16
k = 256
o = 10
print (a * b + 1) * m  + (m * c * d + 1) * n + (((w - a + 1)/2 - c + 1)/2 * ((h - b + 1)/2 - d + 1)/2  * n + 1) * k + (k + 1) * o 

from PIL import Image
im = Image.open('MysteryNumberD.bmp')

pixels = list(im.getdata())
width, height = im.size
print(len(pixels), width, height)
#pixels = [pixels[i * width:(i + 1) * width] for i in xrange(height)]

import numpy as np
import matplotlib.pylab as plt
plt.imshow(np.array(pixels).reshape(28,28), cmap="gray_r")
plt.axis('off')
#plt.show()

#predicted_label_prob = out.eval(pixels)
#pred = [np.argmax(predicted_label_prob[i]) for i in range(len(predicted_label_prob))]
#print(pred)

#pixels = np.reshape(pixels, (1, 1, 28, 28))
#predicted_label_prob = out.eval(pixels)
#pred = [np.argmax(predicted_label_prob[i]) for i in range(len(predicted_label_prob))]#print(pred)
#print(predicted_label_prob)
#print(pred)

# Modify this model
def create_model(features):
    with C.layers.default_options(init = C.glorot_uniform(), activation = C.relu):
            h = features
            
            h = C.layers.Convolution2D(filter_shape=(5,5), 
                                       num_filters=8, 
                                       strides=(1,1), 
                                       pad=True, name='first_conv')(h)
            h = C.layers.AveragePooling((5,5), strides=2)(h)
            h = C.layers.Convolution2D(filter_shape=(5,5), 
                                       num_filters=16, 
                                       strides=(1,1), 
                                       pad=True, name='second_conv')(h)
            h = C.layers.AveragePooling((5,5), strides=2)(h)
            r = C.layers.Dense(num_output_classes, activation = None, name='classify')(h)
            return r
        
#do_train_test()