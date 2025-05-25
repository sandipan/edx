################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################


"""	This program generates biased binary sequences
"""

import sys
import os
import random
import zlib

TRIALS = 5000	# number of trials to get average

#*******************************************#
# Biased sequence generation                #
#*******************************************#

def BitGen(Probability1):
	" biased coin flipping "
	return 1 * (random.random() < Probability1)
	
def SeqGen(Length, Probability1):
	" generates a biased random binary string "
	return ''.join([str(BitGen(Probability1)) for n in range(Length)])

def SeqCompress(Sequence):
	if type(Sequence) == str:
		Sequence = Sequence.encode('latin-1')	# 'latin-1' =   8 bits ASCII
	CompressedSize = len(zlib.compress(Sequence))
	CompressingFactor = 100-(100*CompressedSize)/len(Sequence)
	return CompressingFactor

	
if __name__ == "__main__":	
	if len(sys.argv) == 3 and sys.argv[1].isdigit() and sys.argv[2].isdigit():
		SequenceLength = int(sys.argv[1])
		Probability = int(sys.argv[2])
		# Since sequence is coded as an ascii sting, even a random sequence get compressed
		# One must subtract the compression factor of a random sequence
		S1 = SeqGen(int(sys.argv[1]), 1)	# constant sequence of same length
		# Compression factors:
		CF1 = SeqCompress(S1)
		CF = 0
		for n in range(TRIALS):	# averaging over several trials
			S0 = SeqGen(int(sys.argv[1]), 0.5)	# unbiased random sequence of same length
			CF0 = SeqCompress(S0)
			S = SeqGen(SequenceLength, Probability/100.0)
			if n < 10:	print('%s %s' % (S[:40], '...' * (SequenceLength > 40)))
			if n == 10:	print('...')
			CF += SeqCompress(S)
		CF /= TRIALS	# average
		print('Compression = %.01f%%' % (100 * (CF - CF0)/(CF1 - CF0)))
	else:
		print("\tUsage: %s <sequence length> <probability of 1s in %%>" % os.path.basename(sys.argv[0]))
		print(__doc__)
		
		