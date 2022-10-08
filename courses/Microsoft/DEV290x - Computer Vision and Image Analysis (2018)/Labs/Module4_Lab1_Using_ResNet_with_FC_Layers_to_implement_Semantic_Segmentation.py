
# coding: utf-8

# # Module 4, Lab 1: Using ResNet with Fully Convolutional Layers to Implement Semantic Segmentation
# 
# In this tutorial, we will add fully-convolutional layers to the ResNet model, allowing us to use it to perform semantic segmentation. In other words, by adding additional layers to our existing object classifier network, we are extending its capability to be able to predict the class of each pixel in the input image.
# 
# For this task, we have again chosen ResNet20 as our base model.  ResNet is configurable in terms of the number of layers, with 
# ResNet20 being relatively shallow.  This allows us to perform training in a reasonable amount of time, whilst still 
# demonstrating the important concepts and abilities of this architecture. It is relatively easy to increase the depth of the
# network to one of the larger configurations, and this is included as an optional exercise for the student.
# 
# In this tutorial, although we have added layer to ResNet to create a new model, we will train this model from scratch. In the next tutorial, we will introduce and use the concept of *Transfer Learning*, where pre-existing learned knowledge is used to inform our approach and improve our results.
# 
# Anywhere you see `*** YOUR CODE HERE ***`, you will be expected to write some simple Python (following the instructions in the text) to complete a function.  Hint: if you get stuck, keep reading through the lab.
# 
# Let's get started!
# 
# 
# # Setup Code
# 
# First, as usual, we need some boilerplate setup code to load the Microsoft Cognitive Toolkit (previously known as the CNTK) libraries etc.

# All our code examples require the Cognitive Toolkit version 2.4. We will attempt to check if we have the Cognitive Toolkit version 2.4 locally. If not, we'll have to use the Python package manager `pip` to install it. If that is needed, that could take a few minutes.

# In[1]:


# Copyright (c) Microsoft. All rights reserved.
#
# Licensed under the MIT license. See LICENSE.md file in the project root
# for full license information.
# ==============================================================================

# For Azure Notebooks, we will update Microsoft Cognitive Toolkit version to 2.4 
# you can comment out the following line if you are running in your own local Jupyter Notebook setup and already have
# CNTK 2.4 installed
get_ipython().system(u'pip install --upgrade --no-deps https://cntk.ai/PythonWheel/CPU-Only/cntk-2.4-cp35-cp35m-linux_x86_64.whl')

import cntk as C
print ("Using Microsoft Cognitive Toolkit version {}".format(C.__version__))

import numpy as np
print ("Using numpy version {}".format(np.__version__))


# In[2]:


import matplotlib.pyplot as plt
get_ipython().magic(u'matplotlib inline')
import time
import sys
import os
import cv2
from IPython.display import Image, display #, SVG
from cntk.learners import learning_rate_schedule, UnitType
from cntk.initializer import he_normal
from cntk.layers import AveragePooling, BatchNormalization, Convolution, Dense
from cntk.ops import element_times, relu, sigmoid
from cntk import load_model, placeholder, Constant
from tqdm import *          # tqdm allows us to pretty-print our loops later on...
import helper # some functions to plot images
import coco   # local class to read the COCO images and labels
import gc # Python garbage collector

# Paths relative to current python file.
abs_path  = os.path.dirname(os.path.abspath('.'))
data_path = os.path.join(abs_path, "../../data/M4")
zip_path = os.path.join(abs_path, "../data-zip")
output_path = os.path.join(abs_path, "lab1/output")



# Now, let's setup and call our function to setup the large dataset that is  needed for this lab. 
# 
# Why are we doing this? We need this step because Azure Notebooks has two storage areas: a persistent but slow area, and a transient but fast area. To ensure that this lab is able to execute as fast as possible on Azure Notebooks, we unzip our data set into this transient area once per session.  If it has already been unzipped then we'll automatically detect this and skip the step, so it is safe to run this next code block at any time.
# 
# Depending on how you are executing the lab, this step can take a minute or two.  The output you should expect to see from the following code block will look something like:
# 
#     Start unzipping data files in /home/nbuser/library/Module4/../data-zip to /home/nbuser/library/Module4/../../data/M4
#     zip file count:1
#     Destination folder /home/nbuser/library/Module4/../../data/M4 doesn't exist, creating it
#     Start unzipping files to /home/nbuser/library/Module4/../../data/M4
#        unzipping CocoMS.zip ...
#     Complete: Files have been unzipped to /home/nbuser/library/Module4/../../data/M4

# In[3]:


import sys
import os
import zipfile
import fnmatch

def hydrate(zip_path, dest_path):
    print("Start unzipping data files in {0} to {1}".format(zip_path,dest_path))
    if (os.path.exists(zip_path) == False):
        print("The source folder {0} doesn't exist, so quitting".format(zip_path))
        quit()

    zipfile_count = len(fnmatch.filter(os.listdir(zip_path), '*.zip'))
    if (zipfile_count == 0):
        print("No zip (.zip) files in {0}, so quitting ".format(zip_path))

    print("zip file count:%s" % zipfile_count)

    if (os.path.exists(dest_path) == False):
        print("Destination folder {0} doesn't exist, creating it".format(dest_path))
        os.makedirs(dest_path)

        # Extract all zip files from zip_path to dest_path
        print("Start unzipping files to {0}".format(dest_path))
        for item in os.listdir(zip_path): # loop through items in dir
            if item.endswith(".zip"): # check for ".zip" extension
                print("   unzipping {0} ...".format(item))
                file_name = os.path.join(zip_path,item) # get full path of files
                zip_ref = zipfile.ZipFile(file_name) # create zipfile object
                zip_ref.extractall(dest_path) # extract file to dir
                zip_ref.close() # close file
    else:
        print("data folder already populated")

    print("Complete: Files have been unzipped to {0}".format(dest_path))
    
hydrate(zip_path, data_path)


# In the next code block, we check to see whether the Microsoft Cognitive Toolkit can use a GPU for its work. We are going to use the best available device (GPU, if available, else CPU).

# In[4]:


try:
    isUsingGPU # if this is our first time running, this will cause an exception as undefined
except NameError:
    try:
        isUsingGPU = C.device.try_set_default_device(C.device.gpu(0))
    except ValueError:
        isUsingGPU = False
        C.device.try_set_default_device(C.device.cpu())

print ("The Cognitive Toolkit is using the {} for processing.".format("GPU" if isUsingGPU else "CPU"))


# Next, we're going to implement functions to split our data into minibatches. We discussed in Module 3, Lab 2 how minibatches offer a number of advantages over single batch for training.
# 
# To split our data into minibatches, we will use Python's array slice notation. 
# 
# By way of a quick explanation of this, the notation works as follows:
# 
#     array[start:end] # items start through end-1
#     array[start:]    # items start through the rest of the array
#     array[:end]      # items from the beginning through end-1
#     array[:]         # a copy of the whole array
# 
# So, we'll slice our training data (images in `data_x`, pixel-labels in `data_y`) into `minibatch_size` chunks, where `i` is the chunk number.
# 
# **Add your code here to replace the commented section in the cell below** -- your code needs to take `data_x` and slice it into `sx` and `data_y` and slice it into `sy`.  As a hint, for each slice, you'll want to take elements from `i * minibatch_size` (inclusive) to `(i + 1) * minibatch_size` (exclusive), using the Python array slice notation explained above.

# In[7]:


def slice_minibatch(data_x, data_y, i, minibatch_size):
    sx = []
    sy = []
    # Use the Python array slice notation the divide up the dataset into minibatches
    #
    # *** YOUR CODE HERE ***
    # Set sx to the slice of data_x from element (i * minibatch_size) to (((i + 1) * minibatch_size)-1)
    # Set sy to the slice of data_y from element (i * minibatch_size) to (((i + 1) * minibatch_size)-1)
    # Hint: You'll find answers at the bottom of this lab. 
    # *** YOUR CODE HERE ***
    sx = data_x[(i * minibatch_size):((i + 1) * minibatch_size)]
    sy = data_y[(i * minibatch_size):((i + 1) * minibatch_size)]
    return sx, sy


# Our next function will measure and record the test error per mini-batch, appending it to an errors array. We will use this to calculate the mean error across all mini-batches. 
# 
# **Again, you will need to fill in some code in the cell below**. Use the Python numpy `mean()` method on the `errors` array to calculate the average error across the minibatch and store the value in the variable named `result`.

# In[8]:


def measure_error(data_x_files, data_y_files, x, y, trainer, minibatch_size):
    errors = []
    for i in range(0, int(len(data_x_files) / minibatch_size)):
        data_sx_files, data_sy_files = slice_minibatch(data_x_files, data_y_files, i, minibatch_size)
        data_sx, data_sy = source.files_to_data(data_sx_files, data_sy_files)
        errors.append(trainer.test_minibatch({x: data_sx, y: data_sy}))

    result = 0
    #
    # *** YOUR CODE HERE ***
    # Use np.mean to set result to the average of the errors across each minibatch.
    # Hint: You'll find answers at the bottom of this lab. 
    # *** YOUR CODE HERE ***
    result = np.mean(errors)
    return result


# ## Augmenting our ResNet model from Classification to Semantic Segmentation
# 
# Now, we need to add additional Fully-Convolutional layers to our ResNet classification model to allow it to perform Semantic Segmentation.
# 
# First, let's create the functions for our usual ResNet building blocks, as per Module 3 Lab 2:

# In[9]:


# Built on top of the ResNet model in CNTK repository
# https://github.com/Microsoft/CNTK/blob/master/Examples/Image/Classification/ResNet/Python/resnet_models.py

#
# ResNet building blocks
#
def conv_bn(input, filter_size, num_filters, strides=(1,1), init=C.he_normal()):
    c = Convolution(filter_size, num_filters, activation=None, init=init, pad=True, strides=strides, bias=False)(input)
    r = BatchNormalization(map_rank=1, normalization_time_constant=4096, use_cntk_engine=False)(c)
    return r

def conv_bn_relu(input, filter_size, num_filters, strides=(1,1), init=C.he_normal()):
    r = conv_bn(input, filter_size, num_filters, strides, init)
    return relu(r)

def resnet_basic(input, num_filters):
    c1 = conv_bn_relu(input, (3,3), num_filters)
    c2 = conv_bn(c1, (3,3), num_filters)
    p  = c2 + input
    return relu(p)

def resnet_basic_inc(input, num_filters, strides=(2,2)):
    c1 = conv_bn_relu(input, (3,3), num_filters, strides)
    c2 = conv_bn(c1, (3,3), num_filters)
    s  = conv_bn(input, (1,1), num_filters, strides)
    p  = c2 + s
    return relu(p)

def resnet_basic_stack(input, num_stack_layers, num_filters):
    assert (num_stack_layers >= 0)
    l = input
    for _ in range(num_stack_layers):
        l = resnet_basic(l, num_filters)
    return l


# Now, we need to add some functions to help us augment our ResNet model with fully-convolutional layers.  
# 
# This is where the magic happens, where we convert ResNet for object classification to ResNet for semantic segmentation. 
# 
# In 2015 (https://arxiv.org/pdf/1411.4038.pdf) and 2016 (https://arxiv.org/pdf/1605.06211.pdf), Long, Shelhamer, and Darrell presented a new method for object boundaries detection using Fully Convolutional Networks (FCN). They discovered that fully convolutional networks, trained end-to-end, pixels-to-pixels, exceeded the state-of-the-art in semantic segmentation.
# 
# The main difference from a regular convolutional network is that the final fully-connected classifier is removed and replaced by a combination of all the convolutional features maps extracted from ResNet skipped connections. This allows:
# 
#  * combining of features from different stages which vary in accuracy of semantic information;
#  * upsampling of learned low resolution semantic features maps through learnable one-by-one (1x1) convolutions and 2D upsampling.
#  
#  
# The following diagram shows the evolution of our model, from the basic ResNet20 classifier in Module 3, Lab 2, (on the left-hand side) to our fully convolutional network architecture for semantic segmentation in this lab (on the right-hand side):
# ![ResNet20 Fully Convolutional Semantic Segmentation Network Architecture](images/resnet20_fcn_semantic_segmentation_network_architecture.svg "ResNet20 Fully Convolutional Semantic Segmentation Network Architecture")
# 
# In the right-hand side of the diagram above, the extra convolutional layers coming from the FCN model are actually deconvolutional layers - that is, they are deconvolving back to prediction masks, which are then reshaped and fused by the upsampling layers.
#  
# The function `create_model()` in the following code block shows how this is implemented using the Microsoft Cognitive Toolkit. We take connections from `r1`, `r2_2` and `r3_2` with the feature maps we are interested in to finally combine them in the 'merged' layer after upsampling. A convolution with a sigmoid function classifies the output depending on the number of object classes - in our case, just for airplanes.
# 
# The function `OneByOneConvAndUpSample()`  performs a 1x1 convolution over the input and and upsamples the output using basic Cognitive Toolkit primitives for operating with tensors.
#  
# We also need a dice coefficient function, which is a statistic function commonly used to compare the similarity between two samples. This is what we will use to compare our predicted semantic segmentation labelling against the ground truth for our training and test images.

# In[10]:


def UpSampling2D(x):
    xr = C.reshape(x, (x.shape[0], x.shape[1], 1, x.shape[2], 1))
    xx = C.splice(xr, xr, axis=-1) # axis=-1 refers to the last axis
    xy = C.splice(xx, xx, axis=-3) # axis=-3 refers to the middle axis
    r = C.reshape(xy, (x.shape[0], x.shape[1] * 2, x.shape[2] * 2))

    return r

def UpSampling2DPower(x, k_power):
    for i in range(k_power):
        x = UpSampling2D(x)

    return x

def OneByOneConvAndUpSample(x, k_power, num_channels):
    x = Convolution((1, 1), num_channels, init=he_normal(), activation=relu, pad=True)(x)
    x = UpSampling2DPower(x, k_power)

    return x

def dice_coefficient(x, y):
    # average of per-channel dice coefficient
    # global dice coefificnet doesn't work as class with larger region dominates the metrics
    # https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient
    intersection = C.reduce_sum(x * y, axis=(1,2))

    return C.reduce_mean(2.0 * intersection / (C.reduce_sum(x, axis=(1,2)) + C.reduce_sum(y, axis=(1,2)) + 1.0))


# With these functions, we can create a new model that is a combination of ResNet plus our additional layers of convolution and upsampling.

# In[11]:


#
# Defines the fully convolutional models for image segmentation
#
def create_model(input, num_classes):
    c_map = [16, 32, 64]
    num_stack_layers = 3

    conv = conv_bn_relu(input, (3,3), c_map[0])
    r1 = resnet_basic_stack(conv, num_stack_layers, c_map[0])

    r2_1 = resnet_basic_inc(r1, c_map[1])
    r2_2 = resnet_basic_stack(r2_1, num_stack_layers-1, c_map[1])

    r3_1 = resnet_basic_inc(r2_2, c_map[2])
    r3_2 = resnet_basic_stack(r3_1, num_stack_layers-1, c_map[2])
    
    # now we'll add our "deconvolutional" layers (1x1 convolution with upsampling)

    up_r1 = OneByOneConvAndUpSample(r1, 0, num_classes)
    up_r2_2 = OneByOneConvAndUpSample(r2_2, 1, num_classes)
    up_r3_2 = OneByOneConvAndUpSample(r3_2, 2, num_classes)

    merged = C.splice(up_r1, up_r3_2, up_r2_2, axis=0)

    resnet_fcn_out = Convolution((1, 1), num_classes, init=he_normal(), activation=sigmoid, pad=True)(merged)

    return resnet_fcn_out


# As before in Module 3 Lab2, we can look at the Cognitive Toolkit generated view of this model, as rendered by GraphViz:
# 
# ![ResNet20_Semantic_Segmentation_Model](images/ResNet20_Semantic_Segmentation_Model.svg "ResNet20 Fully Convolutional Semantic Segmentation Network Model")
# 

# As this model is generated directly from the Microsoft Cognitive Toolkit, it represents the network that we have actually 
# programmed the toolkit to construct.  If you are interested, you can download this model from the images/ subdirectory of this lab, and view it separately, comparing it against our reference diagram above.

# ## Training
# 
# We will again create a training function to train our network using mini-batches. 
# 
# It is worth repeating that training without a GPU is really slow. Our code here checks whether we are going to be running on a GPU or CPU. If we're running on a CPU, we'll deliberately shrink the amount of training to just a single epoch to give you a *flavor* of what happens during training, but that model will perform pretty badly. In the case of running from a CPU and training for a single epoch, we will read in a pre-trained model for inference instead.
# 

# In[12]:


def train(train_image_files, train_mask_files, val_image_files, val_mask_files):
    # Create model
    sample_img, sample_mask = source.files_to_data([train_image_files[0]], [val_image_files[0]])
    x = C.input_variable(sample_img[0].shape)
    y = C.input_variable(sample_mask[0].shape)
    
    z = create_model(x, source.num_classes)
    dice_coef = dice_coefficient(z, y)

    # Prepare model and trainer
    if (isUsingGPU):
        lr_mb = [0.001] * 5 + [0.0001] * 5 + [0.00001]*5 + [0.000001]*5 + [0.0000001]*5
    else:
        # training without a CPU is really slow, so we'll deliberatly shrink the amount of training
        # to just an epoch if we're on a CPU - just to give a flavor of what happens during training
        # and then read in a pre-trained model for inference instead.
        lr_mb = [0.0001] * 1 # deliberately shrink if training on CPU...
    lr = learning_rate_schedule(lr_mb, UnitType.sample)
    momentum = C.learners.momentum_as_time_constant_schedule(0.9)
    trainer = C.Trainer(z, (-dice_coef, -dice_coef), C.learners.adam(z.parameters, lr=lr, momentum=momentum))
                        
    training_errors = []
    test_errors = []

    # Get minibatches of training data and perform model training
    minibatch_size = 8
    num_epochs = len(lr_mb)
     
    for e in range(0, num_epochs):
        for i in tqdm(range(0, int(len(train_image_files) / minibatch_size)), ascii=True, 
                               desc="[i] Processing epoch {}/{}".format(e, num_epochs-1)):
            data_x_files, data_y_files = slice_minibatch(train_image_files, train_mask_files, i, minibatch_size)
            data_x, data_y = source.files_to_data(data_x_files, data_y_files)
            trainer.train_minibatch({x: data_x, y: data_y})
            gc.collect()
     
        # Measure training error
        training_error = measure_error(data_x_files, data_y_files, x, y, trainer, minibatch_size)
        training_errors.append(training_error)
        
        # Measure test error
        test_error = measure_error(val_image_files, val_mask_files, x, y, trainer, minibatch_size)
        test_errors.append(test_error)

        print("    epoch #{}: training_error={}, test_error={}".format(e, training_errors[-1], test_errors[-1]))
        
    return trainer, training_errors, test_errors


# # Initialise the Model
# 
# Now, let's put it all to the test, and see our solution in action!  First, we need to configure our data source, which involves parsing to figure out how many training and validation samples we have.

# In[13]:


# Configure the data source

print('[i] Configuring data source...')
try:
    source = coco.CocoMs(os.path.join(data_path, "CocoMS"))
    training_input_image_files, training_target_mask_files = source.get_data(train_data_folder='/Training')
    validation_input_image_files, validation_target_mask_files = source.get_data(train_data_folder='/Validation')
    print('[i] # training samples:   ', len(training_input_image_files))
    print('[i] # validation samples: ', len(validation_input_image_files))
    print('[i] # classes:            ', source.num_classes)
    print('[i] Image size:           ', (224,224))
except (ImportError, AttributeError, RuntimeError) as e:
    print('[!] Unable to load data source:', str(e))    


# In the next code block, we'll train our model. We'll need to either train from scratch or load a model that we made earlier...
# 
# ## If training on a CPU
# 
# If we are training on a CPU (like we will be in Azure Notebooks), we deliberately limit the training to a single epoch for time reasons. This gives an example of what training is like, but the resulting model will be very innaccurate. 
# 
# Try completing the lab using the pre-trained model, and viewing the results. This was trained on a system with a powerful GPU, and run for a number of epochs.
# 
# Then restart the Jupyter Notebook and clear all outputs - run to this point again, but set `make_model` to `True` in the code block below below. Continue running on to the end, and you will quickly see how much worse the results are, and get an intuition for how much better the results get with increasing the number of epochs of training.
# 
# You can expect even our very limited training in Azure Notebooks to take 50 minutes or so to complete. By comparison, a GPU could be anywhere from 10x to 100x faster.

# In[14]:


# And now do some training

make_model = False

# Load the saved model if specified
model_file = "cntk-resnet-fcn.dnn"

if (make_model):
    print("[i] Starting training...", flush=True)
    if (not isUsingGPU):
        print("    Have you tried running again with make_model set to False to compare output?", flush=True)

    tic = time.time()
    trainer, training_errors, test_errors = train(training_input_image_files, training_target_mask_files, 
                                              validation_input_image_files, validation_target_mask_files)
    print('Training time: {} s.'.format(time.time() - tic))

    print("[i] Training finished...")
    model = trainer.model  
    del training_input_image_files
    del training_target_mask_files

else: 
    # load model
    if os.path.isfile(model_file):
        print("[i] Skipping training, using pre-trained model...")
        model = C.load_model(model_file)
    else:
        print("[!] model files {} does not exist. This will force training".format(model_file))
        tic = time.time()
        trainer, training_errors, test_errors = train(training_input_image_files, training_target_mask_files, 
                                                  validation_input_image_files, validation_target_mask_files)
        print('Training time: {} s.'.format(time.time() - tic))
        print("[i] Training finished...")
        model = trainer.model  
        # clean-up no longer needed variables
        del training_input_image_files
        del training_target_mask_files


# ## At last, some Semantic Segmentation predictions!
# 
# With our model initialised (either trained or using a downloaded pre-trained model, we can now start making predictions on test images, and try to label them.  We will do this in two steps:
#     
#  * First, we will do a forward pass of the input image through our network in order to calculate the actual prediction masks, which contain a class label for each image in the input image;
#  * Second, we will create some graphics, allowing us to quickly visualize how well we did.

# In[15]:


#
# We need to convert our validation filenames to image data for the predictor...
#

print ("[i] Converting file lists to image data...", flush=True)
tic = time.time()
validation_input_images, validation_target_masks =         source.files_to_data(validation_input_image_files, validation_target_mask_files)
print('Converting validation image data time: {} s.'.format(time.time() - tic))
print("[i] Converting file lists finished...")


# In[16]:


#
# First, let's do our semantic segmentation prediction
#

print("[i] Starting prediction...", flush=True)  
tic = time.time()

pred = []
for idx in tqdm(range(0, len(validation_input_images)),ascii=True, desc='[i] Predicting...'):
    pred += list(model.eval(validation_input_images[idx]))
print('Prediction time: {} s.'.format(time.time() - tic))
print('[i] {} images predicted.'.format(len(pred)))
print("[i] Prediction finished...")


# If you have run the Python code above, you'll again see how much faster predicting with a network is compared to training the network.
# 
# And now some image processing to allow us better understand the results... We are going to blend our input images and predictions together, so we can see where we labeled the pixels correctly and where we did not.
# 

# In[17]:


#
# Second, let's do our image processing to create some graphics for ease of visualisation
#
print("[i] Started image processing...", flush=True)

tic = time.time()

input_images_rgb = []

for x in tqdm(validation_input_images, ascii=True, desc='[i] Converting input images (BGR2RGB)...'):
    img = np.moveaxis(x,0,2).astype(np.uint8)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    input_images_rgb.append(img)

target_masks_rgb=[]
for x in tqdm(validation_target_masks, ascii=True, desc='[i] Coloring ground truth images...'):
    target_masks_rgb.append(helper.masks_to_colorimg(x))

pred_rgb=[]
for x in tqdm(pred, ascii=True, desc='[i] Coloring prediction images...'):
    pred_rgb.append(helper.masks_to_colorimg(x))

output_images_rgb = []
for index in tqdm(range(len(input_images_rgb)), ascii=True, desc='[i] Combining input images + predictions...'):
    img = cv2.bitwise_or(input_images_rgb[index], pred_rgb[index])
    output_images_rgb.append(img)

print('Image Processing time: {} s.'.format(time.time() - tic))

print("Image processing finished...")


# If we have trained, we can view the learning curves for our training and our testing. All going well, these will have converged to a reasonable error rate, based on our dice coefficient. Ideally, we want the curves for test and training sets to be as close together as possible. Normally we'll see the curve for the training set is slightly more accurate (lower `dice_coef` value) than the test set.
# 
# If you have trained locally on a GPU, they should look something like:
# 
# ![sample training curve](images/sample_training_curve.png "Sample Training Curve")
# 
# If you have trained on a CPU and only for one epoch, you'll only have one reading for test and training error, so you might get a funny graph like:
# 
# ![cpu limited_training curve](images/cpu_limited_training_curve.png "CPU Limited Training Curve")
# 
# If you have trained on CPU and see that type of curve, don't worry about it - it makes perfect sense for the limited (but costly in terms of time) amount of training you performed!  Your network has not converged *yet* and it would not be expected perform well. If you had plenty of patience, you could continue to train it for longer and see the curves converging.
# 

# In[18]:


if (make_model):
    helper.plot_errors({"training": training_errors, "test": test_errors}, title="Simulation Learning Curve")
                
    # clean-up some variables we no longer need to reduce our memory footprint...
    # otherwise our Azure Notebook might run out of memory
    del validation_input_images
    del validation_input_image_files
    del validation_target_mask_files
    del validation_target_masks
    del trainer
    del training_errors
    del test_errors
    print("Garbage collection reclaimed {} objects".format(gc.collect()))
    plt.close()


# ## *A picture is worth a thousand words*
# 
# And now, some images. We'll plot an original test image, with its associated ground truth mask/label. Alongside these, we'll show our predicted mask, and finally our predicted mask super-imposed on the original image, allowing us to visually see how well our model did. **Note: this plot function takes a while!**

# In[19]:


helper.plot_side_by_side([input_images_rgb, target_masks_rgb, pred_rgb, output_images_rgb])


# If you took the pre-trained model or trained via a GPU, we did well, considering the network learned *from scratch* how to label planes of all sorts, and from all viewpoints and angles. However, we can see that in some cases the network did make mistakes. This is mostly due to our network being small and our training set being very small -- to make this lab run in a reasonable amount of time.
# 
# If you trained on a CPU, the very limited training will mean we're just barely detecting the planes and our model has a lot more *learning* to do to be useful.
# 
# A larger network would be more expressive (e.g., ResNet-150), and could capture greater detail. If running on a GPU, we could relatively easily switch in a larger/deeper ResNet model and benefit from its greater capabilities.
# 
# Additionally, a larger corpus of training examples would allow the network to better learn the objective, and to generalise much more accurately to new examples.
# 
# There is something we can do to help tremendously with the limited training set by making use of *Transfer Learning*.  We will see in in the next lab.
# 
# For now, let's take a look at some of the more interesting samples.

# In[20]:


plt.imshow(output_images_rgb[89])


# In[21]:


plt.imshow(output_images_rgb[2])


# In[22]:


plt.imshow(output_images_rgb[6])


# In[23]:


plt.imshow(output_images_rgb[7])


# In[24]:


plt.imshow(output_images_rgb[8])


# In[25]:


plt.imshow(output_images_rgb[11])


# # Conclusions 
# 
# In this lab, we used the Microsoft Cognitive Toolkit to build a ResNet20 model and modified it to perform semantic segmentation.
# 
# We used the Coco dataset, which provides labels and masks for a variety of object classes. We focused on a subset containing airplanes.  We either used a pre-trained model or used this subset to train our model using the training data in mini-batches. Then we used this trained model to perform segmentation on some test images and plotted the results.
# 
# Despite the fact that our accuracy was limited by the size of the base model (ResNet20, vs its 
# larger cousin ResNet150, for example) and the size of the training set (~3K images), we demonstrated 
# segmentation results far superior than could be expected of the traditional hand-crafted methods we saw in Module 2.
# 
# In the next lab, we'll look at transfer learning -- a way of bringing in extra smarts from another
# model already trained on a much larger but different dataset. These extra smarts can help boost the
# performance of our semantic segmentation considerably.

# **Solution to missing slice_minibatch code**
# 
#     sx = data_x[i \* minibatch_size: (i+1) \* minibatch_size] 
#     sy = data_y[i \* minibatch_size: (i+1) \* minibatch_size] 
# 

# **Solution to missing measure_error code**
# 
#     result = np.mean(errors)
# 
# 
