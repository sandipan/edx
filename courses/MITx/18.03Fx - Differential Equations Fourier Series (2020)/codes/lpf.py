from scipy.io import wavfile
import scipy.fftpack as fp
import numpy as np
import matplotlib.pylab as plt
from scipy.signal import gaussian

#first fft to see the pattern then we can edit to see signal and inverse %back to a better sound 
#Fs, y = wavfile.read('secret_message.wav')
#Fs, y = wavfile.read('pather_panchali.wav')
Fs, y = wavfile.read('pather_panchali_noisy.wav')
#[y,Fs] = audioread('secret_message.wav'); #The audio file is already loaded for you 
print(y.shape, y.dtype)
#y = y[:,0] #y = y(:,1); #Take first channel of signal
#y_scaled =  y / 2**16 #	y*2 / (y.max()-y.min()) #/ 2**16
y_scaled =  y
n = len(y) #n = length(y); #length of signal 
print(n)
t = list(range(0, n))#(0:n-1)*(1/Fs); #time series vector
plt.plot(t, y) #y*2 / (y.max()-y.min())) #plot the sound signal
plt.show()
#NOTE we do not take the one sided signal here because we need both sides to %recreate the sound signal using ifft command
Y = fp.fftshift(fp.fft(y_scaled))  #Take the Fourier series and take a symmetric shift 
print(np.argsort(Y.real)[::-1][:5])
print(np.sort(Y.real)[::-1][:5])
#fshift = (-n/2:n/2-1)*(Fs/n); %Determine the frequency vector (shifted) 
fshift = np.arange(-n//2, n//2)*(Fs/n)
plt.plot(fshift, Y.real) #plot(t, y); %plot the sound signal
plt.show()
L = len(fshift) #length(fshift); #Find the length of frequency values 
#Yfilt = Y*150 #Y.*150; #Take the absolute value
Yfilt = Y
#YOU MODIFY Yfilt here to remove the frequencies between -300hz and 300hz 
# You may find plotting fshift vs abs(Yfilt) helpful here 
k = 72000
#Yfilt[n//2-k] = Yfilt[n//2+k] = 100000 #*gaussian(2*k, 10)
Yfilt[495296] =  Yfilt[639296] = 0 
plt.plot(fshift, Yfilt.real)
plt.show()
soundNoisy = fp.ifft(fp.ifftshift(Yfilt)).real #ifft(ifftshift(Yfilt),'symmetric');
#wavfile.write('pather_panchali_noisy.wav', Fs, soundNoisy)
wavfile.write('pather_panchali_denoised.wav', Fs, soundNoisy)
plt.subplot(121), plt.plot(t, y_scaled)
plt.subplot(122), plt.plot(t, soundNoisy) #plot(t, y); %plot the sound signal
plt.show()

"""
plt.plot(fshift, abs(Yfilt.real))
plt.show()

Yfilt = Y*150 #Y.*150; #Take the absolute value
indexes = np.where(np.abs(fshift) > 5*10**4) 
#MODIFY THIS 
# index2 = max(find(fshift<800)); %MODIFY THIS
# Sets frequencies between index1 and index2 to 0 
Yfilt[indexes] = 0 #Yfilt(indexes) = 0
plt.plot(fshift, abs(Yfilt.real))
plt.show()
#Take the inverse FFT to create a filtered sound signal 
soundFilt = fp.ifft(fp.ifftshift(Yfilt)).real #ifft(ifftshift(Yfilt),'symmetric');
print('filtered!')
plt.subplot(121), plt.plot(t, y_scaled)
plt.subplot(122), plt.plot(t, soundFilt) #plot(t, y); %plot the sound signal
plt.show()
#wavfile.write('secret_message_denoised.wav', Fs, soundFilt)
wavfile.write('pather_panchali_denoised.wav', Fs, soundFilt)
#Uncomment the command below to listen to your filtered sound signal in MATLAB online 
#sound(y,Fs) # uncomment this command in MATLAB online to hear the sound 
#sound(soundFilt,Fs); #after filter
"""