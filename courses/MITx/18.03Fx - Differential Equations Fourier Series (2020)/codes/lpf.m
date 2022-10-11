%first fft to see the pattern then we can edit to see signal and inverse %back to a better sound 
[y,Fs] = audioread('secret_message.wav'); %The audio file is already loaded for you 
y = y(:,1); %Take first channel of signal
n = length(y); %length of signal 
t = (0:n-1)*(1/Fs); %time series vector
figure(2) 
plot(t, y); %plot the sound signal
%NOTE we do not take the one sided signal here because we need both sides to %recreate the sound signal using ifft command
Y = fftshift(fft(y)); %Take the Fourier series and take a symmetric shift 
fshift = (-n/2:n/2-1)*(Fs/n); %Determine the frequency vector (shifted) 
L = length(fshift); %Find the length of frequency values 
Yfilt = Y.*150; %Take the absolute value
%YOU MODIFY Yfilt here to remove the frequencies between -300hz and 300hz 
% You may find plotting fshift vs abs(Yfilt) helpful here 
plot(fshift, abs(Yfilt));
indexes = find(abs(fshift)>0.4796.*10.^4); 
%MODIFY THIS 
% index2 = max(find(fshift<800)); %MODIFY THIS
% Sets frequencies between index1 and index2 to 0 
Yfilt(indexes) = 0 ;
plot(fshift, abs(Yfilt));
%Take the inverse FFT to create a filtered sound signal 
soundFilt = ifft(ifftshift(Yfilt),'symmetric');
%Uncomment the command below to listen to your filtered sound signal in MATLAB online 
sound(y,Fs) % uncomment this command in MATLAB online to hear the sound 
sound(soundFilt,Fs); %after filter