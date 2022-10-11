# download matlab script
# url = 'https://courses.edx.org/asset-v1:MITx+18.03Fx+3T2018+type@asset+block@waveEqn.m';
# websave('waveEqn.m',url)

from scipy import signal
import numpy as np
import soundfile as sf
import matplotlib.pylab as plt
from matplotlib import mlab

y, samplerate = sf.read('asset-v1_MITx+18.03Fx+3T2018+type@asset+block@audio_1803_musicdata_voice_2pitches.wav') 
print(y[:,0].shape, samplerate)

'''
chunks = np.array_split(y,int(samplerate/2000))
peaks = []

for chunk in chunks:
    # simulated pure signal
    t = np.linspace(0, 1, samplerate)
    wave = chunk
    # compute the magnitude of the Fourier Transform and its corresponding frequency values
    freq_magnitudes = np.abs(np.fft.fft(wave))
    freq_values = np.fft.fftfreq(samplerate, 1/samplerate)
    # find the max. magnitude
    max_positive_freq_idx = np.argmax(freq_magnitudes[:samplerate//2 + 1])
    peaks.append(freq_values[max_positive_freq_idx])

print(sorted(peaks))
'''
	
#f,t,Sxx = signal.spectrogram(y[:,0],samplerate)
# [S, F, T] = spectrogram(data, window, NOverlap, NFFT, Fs);
# spectrogram(y, 1024, 512, 2048, Fs)
[s, f, t] = mlab.specgram(x = y[:,0], NFFT = 2048, Fs = samplerate, noverlap = 512, mode='magnitude') #window = 1024, 
s = abs(s)
#print(s.shape)
freqs = []
for i in range(s.shape[1]):
	sc = s[:, i]
	indices = sc.argsort()[-5:]
	freqs.append(10**4*sc[indices])
	#plt.plot(f, sc, 'b-')
	#plt.plot(f[indices], sc[indices], 'r.')
	#plt.show()
#[pks, freq] = findpeaks(s(:, timePnt), f, 'MinPeakProminence',0.02, 'MinPeakDistance', 100);
#scipy.signal.find_peaks_cwt(vector, widths, wavelet=None, max_distances=None, gap_thresh=None, min_length=None, min_snr=1, noise_perc=10)
plt.hist(freqs)
plt.show()

'''
[pks, freq] = findpeaks(s(:, timePnt), f, 'MinPeakProminence',0.02, 'MinPeakDistance', 100);
% Find the indices of the 5 largest peaks (if it finds 3 separate peaks)
[maxPks, pkInd] = maxk(pks, 5);
% Find the frequencies and view them
maxFrequencies = freq(pkInd)
% add them to the plot
hold on
plot(maxFrequencies, maxPks, 'ro')
hold off

mxf = []
for timePnt=500:600
    [pks, freq] = findpeaks(s(:, timePnt), f, 'MinPeakProminence',0.02, 'MinPeakDistance', 100);
    % Find the indices of the 5 largest peaks (if it finds 3 separate peaks)
    [maxPks, pkInd] = maxk(pks, 5);
    % Find the frequencies and view them
    maxFrequencies = freq(pkInd)
    mxf = [mxf, maxFrequencies];
end

h = histogram(mxf); 
h1.BinWidth = 10;

plt.pcolormesh(t, f, np.log10(Sxx))
plt.ylabel('Frequency [Hz]')
plt.xlabel('Time [sec]')
plt.show()
'''

'''
from numpy.fft import rfft
from numpy import argmax, mean, diff, log, nonzero
from scipy.signal import blackmanharris, correlate
from time import time
import sys
try:
    import soundfile as sf
except ImportError:
    from scikits.audiolab import flacread

from parabolic import parabolic


def freq_from_crossings(sig, fs):
    """
    Estimate frequency by counting zero crossings
    """
    # Find all indices right before a rising-edge zero crossing
    indices = nonzero((sig[1:] >= 0) & (sig[:-1] < 0))[0]

    # Naive (Measures 1000.185 Hz for 1000 Hz, for instance)
    # crossings = indices

    # More accurate, using linear interpolation to find intersample
    # zero-crossings (Measures 1000.000129 Hz for 1000 Hz, for instance)
    crossings = [i - sig[i] / (sig[i+1] - sig[i]) for i in indices]

    # Some other interpolation based on neighboring points might be better.
    # Spline, cubic, whatever

    return fs / mean(diff(crossings))


def freq_from_fft(sig, fs):
    """
    Estimate frequency from peak of FFT
    """
    # Compute Fourier transform of windowed signal
    windowed = sig * blackmanharris(len(sig))
    f = rfft(windowed)

    # Find the peak and interpolate to get a more accurate peak
    i = argmax(abs(f))  # Just use this for less-accurate, naive version
    true_i = parabolic(log(abs(f)), i)[0]

    # Convert to equivalent frequency
    return fs * true_i / len(windowed)


def freq_from_autocorr(sig, fs):
    """
    Estimate frequency using autocorrelation
    """
    # Calculate autocorrelation and throw away the negative lags
    corr = correlate(sig, sig, mode='full')
    corr = corr[len(corr)//2:]

    # Find the first low point
    d = diff(corr)
    start = nonzero(d > 0)[0][0]

    # Find the next peak after the low point (other than 0 lag).  This bit is
    # not reliable for long signals, due to the desired peak occurring between
    # samples, and other peaks appearing higher.
    # Should use a weighting function to de-emphasize the peaks at longer lags.
    peak = argmax(corr[start:]) + start
    px, py = parabolic(corr, peak)

    return fs / px


def freq_from_HPS(sig, fs):
    """
    Estimate frequency using harmonic product spectrum (HPS)
    """
    windowed = sig * blackmanharris(len(sig))

    from pylab import subplot, plot, log, copy, show

    # harmonic product spectrum:
    c = abs(rfft(windowed))
    maxharms = 8
    subplot(maxharms, 1, 1)
    plot(log(c))
    for x in range(2, maxharms):
        a = copy(c[::x])  # Should average or maximum instead of decimating
        # max(c[::x],c[1::x],c[2::x],...)
        c = c[:len(a)]
        i = argmax(abs(c))
        true_i = parabolic(abs(c), i)[0]
        print('Pass %d: %f Hz' % (x, fs * true_i / len(windowed)))
        c *= a
        subplot(maxharms, 1, x)
        plot(log(c))
    show()


filename = sys.argv[1]

#print('Reading file "%s"\n' % filename)
#try:
#    signal, fs = sf.read(filename)
#except NameError:
#    signal, fs, enc = flacread(filename)

fs = y[:,0]

print('Calculating frequency from FFT:', end=' ')
start_time = time()
print('%f Hz' % freq_from_fft(signal, fs))
print('Time elapsed: %.3f s\n' % (time() - start_time))

print('Calculating frequency from zero crossings:', end=' ')
start_time = time()
print('%f Hz' % freq_from_crossings(signal, fs))
print('Time elapsed: %.3f s\n' % (time() - start_time))

print('Calculating frequency from autocorrelation:', end=' ')
start_time = time()
print('%f Hz' % freq_from_autocorr(signal, fs))
print('Time elapsed: %.3f s\n' % (time() - start_time))

print('Calculating frequency from harmonic product spectrum:')
start_time = time()
freq_from_HPS(signal, fs)
print('Time elapsed: %.3f s\n' % (time() - start_time))
'''