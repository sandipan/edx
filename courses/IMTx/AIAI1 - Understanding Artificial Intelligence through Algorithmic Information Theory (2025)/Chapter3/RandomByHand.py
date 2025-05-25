################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################


"   Elementary randomness tests for short sequences"

import random
import os

InputFileName = 'RandomByHand.csv'

Test1 = '00101001011101101011010001011010110110100010110010111010'
Test2 = '0001101110011010111111100101000001101111100101001100011010101010101111000'

def RandomBinString(Length):
	" returns a random binary string of given length "
	return bin(random.getrandbits(Length))[2:]	 # ignoring first two characters '0b'

def SimplePatterns(MaxLength, mode='short'):
	""" returns a list of 'simple' patterns
		'Simple' correspond to the following modes (examples):
		short:		['0000', '0001', '0010', ... '1110', '1111']
		repetitive:	['00', '0000', '01', '0101', '10', '1010', '11', '1111']
		uniform:	['0', '00', '000', '0000', '1', '11', '111', '1111']
		"""
	if mode == 'short':
		Patterns = range(1 << MaxLength, 2 << MaxLength)  # all patterns with '1' followed by up to MaxLength bits
		Patterns = map(bin, Patterns)
		Patterns = map(lambda x: x[3:], Patterns)   # getting rid of leading '0b1'
	else:
		Patterns = []
		if mode == 'repetitive':
			models = SimplePatterns(2, mode='short')	# oops, recursive call, just for fun
		elif mode == 'uniform':
			models = ['0', '1']
		for P in models:
			for Length in range(1, 1 + MaxLength // len(P)):
				Patterns.append(P * Length)	
	return sorted(Patterns)

def OverlapFind(Sequence, Pattern):
	" search for overlapping pattern in a sequence "
	if not Pattern: return 0
	NbPatterns = 0
	for Pos in range(len(Sequence)):
		if Sequence[Pos:].startswith(Pattern):
			NbPatterns += 1
	return NbPatterns

def Scan(Sequence, MaxLength=5, mode='repetitive'):
	" Scans for simple patterns "
	Histogram = dict()  # empty dictionary
	Patterns = SimplePatterns(MaxLength, mode=mode)
	for P in Patterns:
		Histogram[P] = OverlapFind(Sequence, P)
	return Histogram

def HistogramDisplay(Histogram, Reduction=1):
	" displays histogram with text "
	DisplayString = '\n'
	DisplayLength = max(map(len,Histogram.keys()))
	for P in sorted(Histogram.keys(), key=len):
		DisplayString += '%s\t%s\n' % (P.rjust(DisplayLength), '#' * int(Histogram[P]/max(1,Reduction)))
	return DisplayString + '\n'
	
	
def Sequences(S):
	""" Converts binary string into decimal string that counts identical bits 
		'0000011101111' --> [5, 3, 1, 4]
	"""
	DecimalList = []
	Length = len(S)
	while S:
		Tested = int(S, 2)   # Takes advantage of the fact that int() deletes leading zeros
		NewLength = len(bin(Tested)) - 2
		DecimalList.append(Length - NewLength)
		Length = NewLength
		Inverting = int('1' * Length, 2)   # used to complemet (as ~ does not seem to work)
		S = bin(Tested ^ Inverting)[2:]
		if S == '0':
			DecimalList.append(Length)
			break
	return DecimalList

if __name__ == '__main__':
	print(__doc__)

	if os.path.exists(InputFileName):
		print("Reading %s" % InputFileName)
		TestStringL = open(InputFileName).readlines()
		TestString = ''.join([L.strip() for L in TestStringL if set(L.strip()) == set(['0','1'])])	# keeping binary strings only
	else:
		print("%s not found" % InputFileName)
		print("Reading Test2 instead")
		TestString = Test2
	RandomString = RandomBinString(len(TestString))
	
##    Length = 2*(len(TestString)//2) # closest even length
##    TestString = TestString[:Length]   # truncating the string to even length
##    TestNumber = int(TestString, 2) # reading the string as a binary number
##    AlternatingString = '01' * (Length//2) # Alternating list of same length
##    AlternatingNumber = int(AlternatingString, 2)
##    Tested = TestNumber ^ AlternatingNumber
##    TestedString = bin(Tested)[2:].rjust(Length,'0')     # ignoring first two characters '0b'
##    #print bin(TestNumber)[2:].rjust(Length,'0')
##    #print bin(AlternatingNumber)[2:].rjust(Length,'0')
##    #print TestedString
##    #print bin(Tested ^ AlternatingNumber)[2:].rjust(Length,'0')
##    print ' '.join(map(str, Sequences(TestString)))
##    print ' '.join(map(str, Sequences(TestedString)))

	for T in enumerate((TestString, RandomString)): 
		print(T, len(T))
		print("Now comparing with random sequence" if T[0] else "")
		print(HistogramDisplay(Scan(T[1], MaxLength=6, mode='uniform'), Reduction=len(T[1])/160.0))
	
	
