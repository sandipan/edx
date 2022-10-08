import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

import scipy.io.wavfile as wavfile

# cd 'C:/courses/Edx/Current/Microsoft DAT210x Programming with Python for Data Science/Week5/Assignments/Datasets/'

# Good Luck!

#
# INFO:
# Samples = Observations. Each audio file will is a single sample
#           in our dataset.
#
# Audio Samples = https://en.wikipedia.org/wiki/Sampling_(signal_processing)
# Each .wav file is actually just a bunch of numeric samples, "sampled"
# from the analog signal. Sampling is a type of discretization. When we
# mention 'samples', we mean observations. When we mention 'audio samples',
# we mean the actually "features" of the audio file.
#
#
# The goal of this lab is to use multi-target, linear regression to generate
# by extrapolation, the missing portion of the test audio file.
#
# Each one audio_sample features will be the output of an equation,
# which is a function of the provided portion of the audio_samples:
#
#    missing_samples = f(provided_samples)
#
# You can experiment with how much of the audio you want to chop off
# and have the computer generate using the Provided_Portion parameter.

#
# TODO: Play with this. This is how much of the audio file will
# be provided, in percent. The remaining percent of the file will
# be generated via linear extrapolation.
Provided_Portion = 0.9999 #0.25 # 0.75

#
# TODO: Create a regular ol' Python List called 'zero'
# Loop through the dataset and load up all 50 of the 0_jackson*.wav files
# For each audio file, simply append the audio data (not the sample_rate,
# just the data!) to your Python list 'zero':
#
# .. your code here ..
zero = []
import os, re
path = 'free-spoken-digit-dataset/recordings/'
files = [f for f in os.listdir(path) if re.match(r'0_.*\.wav', f)]
#convert_16_bit = float(2**15)
for f in files:
    sample_rate, samples = wavfile.read(path + f)
    x = np.linspace(0, 1, samples.shape[0])
    #samples = samples / (convert_16_bit + 1.0)
    y = samples
    #print samples
    #plt.plot(x, y)
    #plt.show()
    zero.append(samples.tolist())

#import wave
#spf = wave.open(path + files[0],'r')
#Extract Raw Audio from Wav File
#signal = spf.readframes(-1)
#signal = np.fromstring(signal, 'Int16')
#fs = spf.getframerate()
#If Stereo
#if spf.getnchannels() == 2:
#    print 'Just mono files'
#else:
#    Time=np.linspace(0, len(signal)/fs, num=len(signal))
#    plt.figure(1)
#    plt.title('Signal Wave...')
#    plt.plot(Time,signal)
#    plt.show()

# 
# TODO: Just for a second, convert zero into a DataFrame. When you do
# so, set the dtype to np.int16, since the input audio files are 16
# bits per sample. If you don't know how to do this, read up on the docs
# here:
# http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html
#
# Since these audio clips are unfortunately not length-normalized,
# we're going to have to just hard chop them to all be the same length.
# Since Pandas would have inserted NANs at any spot to make zero a 
# perfectly rectangular [n_observed_samples, n_audio_samples] array,
# do a dropna on the Y axis here. Then, convert one back into an
# NDArray using .values
#
# .. your code here ..
df = pd.DataFrame(zero, dtype=np.int16)
df = df.dropna(axis=1)
zero = df.values

#
# TODO: It's important to know how (many audio_samples samples) long the
# data is now. 'zero' is currently shaped [n_samples, n_audio_samples],
# so get the n_audio_samples count and store it in a variable called
# n_audio_samples
#
# .. your code here ..
n_audio_samples = zero.shape[1]
n_audio_samples

#
# TODO: Create your linear regression model here and store it in a
# variable called 'model'. Don't actually train or do anything else
# with it yet:
#
# .. your code here ..
from sklearn import linear_model
model = linear_model.LinearRegression()



#
# INFO: There are 50 takes of each clip. You want to pull out just one
# of them, randomly, and that one will NOT be used in the training of
# your model. In other words, the one file we'll be testing / scoring
# on will be an unseen sample, independent to the rest of your
# training set:
from sklearn.utils.validation import check_random_state
rng   = check_random_state(7)  # Leave this alone until you've submitted your lab
random_idx = rng.randint(zero.shape[0])
test  = zero[random_idx]
train = np.delete(zero, [random_idx], axis=0)



# 
# TODO: Print out the shape of train, and the shape of test
# train will be shaped: [n_samples, n_audio_samples], where
# n_audio_samples are the 'features' of the audio file
# train will be shaped [n_audio_features], since it is a single
# sample (audio file, e.g. observation).
#
# .. your code here ..
train.shape
test.shape


#
# INFO: The test data will have two parts, X_test and y_test. X_test is
# going to be the first portion of the test audio file, which we will
# be providing the computer as input. y_test, the "label" if you will,
# is going to be the remaining portion of the audio file. Like such, 
# the computer will use linear regression to derive the missing
# portion of the sound file based off of the training data its received!



#
# Save the original 'test' clip, the one you're about to delete
# half of, so that you can compare it to the 'patched' clip once 
# you've generated it. HINT: you should have got the sample_rate
# when you were loading up the .wav files:
wavfile.write(path + 'Original Test Clip.wav', sample_rate, test)



#
# TODO: Prepare the TEST date by creating a slice called X_test. It
# should have Provided_Portion * n_audio_samples audio sample features,
# taken from your test audio file, currently stored in the variable
# 'test'. In other words, grab the FIRST Provided_Portion *
# n_audio_samples audio features from test and store it in X_test.
#
# .. your code here ..
n_train_features = int(Provided_Portion*n_audio_samples)
X_test = test[:n_train_features]

#
# TODO: If the first Provided_Portion * n_audio_samples features were
# stored in X_test, then we need to also grab the *remaining* audio
# features and store it in y_test. With the remaining features stored
# in there, we will be able to R^2 "score" how well our algorithm did
# in completing the sound file.
#
# .. your code here ..
y_test = test[n_train_features:]



# 
# TODO: Duplicate the same process for X_train, y_train. The only
# differences being: 1) Your will be getting your audio data from
# 'train' instead of from 'test', 2) Remember the shape of train that
# you printed out earlier? You want to do this slicing but for ALL
# samples (observations). For each observation, you want to slice
# the first Provided_Portion * n_audio_samples audio features into
# X_train, and the remaining go into y_test. All of this should be
# accomplishable using regular indexing in two lines of code.
#
# .. your code here ..
X_train = train[:, :n_train_features]
y_train = train[:, n_train_features:]



# 
# TODO: SciKit-Learn gets mad if you don't supply your training
# data in the form of a 2D arrays: [n_samples, n_features].
#
# So if you only have one SAMPLE, such as is our case with X_test, 
# and y_test, then by calling .reshape(1, -1), you can turn
# [n_features] into [1, n_features].
#
# On the other hand, if you only have one FEATURE, which currently
# doesn't apply, you can call .reshape(-1, 1) on your data to turn
# [n_samples] into [n_samples, 1]:
#
# .. your code here ..
X_test=X_test.reshape(1,-1)
y_test=y_test.reshape(1,-1)


#
# TODO: Fit your model using your training data and label:
#
# .. your code here ..
model.fit(X_train, y_train)


# 
# TODO: Use your model to predict the 'label' of X_test. Store the
# resulting prediction in a variable called y_test_prediction
#
# .. your code here ..
y_test_prediction = model.predict(X_test)


# INFO: SciKit-Learn will use float64 to generate your predictions
# so let's take those values back to int16:
y_test_prediction = y_test_prediction.astype(dtype=np.int16)
#y_test = y_test.astype(dtype=np.float64)

# 
# TODO: Score how well your prediction would do for some good laughs,
# by passing in your test data and test label (y_test).
#
# .. your code here ..
score = model.score(X_test, y_test)
#The coefficient R^2 is defined as (1 - u/v), where u is the regression
#sum of squares ((y_true - y_pred) ** 2).sum() and v is the residual
#sum of squares ((y_true - y_true.mean()) ** 2).sum().
#RSS = ((y_test_prediction[0] - y_train.mean(axis=0)[0]) ** 2).sum() 
#ESS = ((y_test[0] - y_test_prediction[0]) ** 2).sum() 
#TSS = ((y_test[0] - y_train.mean(axis=0)[0]) ** 2).sum()         
#score = RSS/TSS   
#score = 1 - ESS/TSS   
#np.linalg.norm(y_test_prediction - y_test)
print "Extrapolation R^2 Score: ", score
plt.plot(range(y_test.shape[1]), y_test_prediction[0].tolist(), range(y_test.shape[1]), y_test[0].tolist())
plt.show()
#plt.plot(range(y_train.shape[1]), y_train[0].tolist())
#
# First, take the first Provided_Portion portion of the test clip, the
# part you fed into your linear regression model. Then, stitch that
# together with the abomination the predictor model generated for you,
# and then save the completed audio clip:
completed_clip = np.hstack((X_test, y_test_prediction))
wavfile.write(path + 'Extrapolated Clip.wav', sample_rate, completed_clip[0])

for c in range(0,X_train.shape[1]):
  plt.scatter(X_train[:,c].ravel(), y_train.ravel())
plt.show()

#
# INFO: Congrats on making it to the end of this crazy lab =) !
#
