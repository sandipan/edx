################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################

"""
	naive algorithm that compresses strings by detecting duplicates 
"""

import sys
import re
import os
import random
from math import log, ceil

log2p = lambda x: int(ceil(log(x,2)))
MAXPATTERNSIZE = 64		# max length of duplicates

def BackExplore(Str, split, Pattern):
	""" Looks for Pattern before split point, as long as coding for duplication is advantageous
		If found, Pattern is replaced by 
			<relative position in History> <pattern length>
		where position and length are coded in standard binary representation
	"""
	PatternLength = len(Pattern)
	# constraint: log(1+<relative position>) + log(1+PatternLength) < PatternLength
	MaxPast = 2 ** (PatternLength - log2p(1+PatternLength)) - 1		# MaxPast > 0 as soon as PL >= 4
	if MaxPast > 0:
		Best = ' ' * PatternLength	# will store best code for duplicate od Pattern
		for shift in range(min(split, MaxPast)):
			if Str[split-shift-PatternLength:split-shift] == Pattern:
				Code = "%s %s" % (bin(shift)[2:], bin(PatternLength)[2:])
				if len(Code) < len(Best):	Best = Code
		if Best.strip(): return Best
	return None

def Encode(Str):
	" detects duplicates and encodes the string accordingly "
	
	Best = (0, 0, ' ' * MAXPATTERNSIZE)	# will store best duplicate (for the code length difference)
	for split in range(len(Str)):	# splitting the string at all successive positions
		for PatternLength in range(MAXPATTERNSIZE, 2, -1):
			Pattern = Str[split:split+PatternLength]
			ActualPL = len(Pattern)	# may differ from PatternLength
			BE = BackExplore(Str, split, Pattern)
			if BE:
				Gain = ActualPL - len(BE)
				if Gain > 1 and Gain > Best[1] - len(Best[2]):
					Best = (split, ActualPL, BE)
	splt, pl, be = Best
	if be.strip():		# duplicate found
		# recursive calls
		Start = Encode(Str[:splt])
		End = Encode(Str[splt+pl:])
		print('pattern %s of length %d is duplicated at location %d' % (Str[splt:splt+pl], pl, splt))
		return ('%s 1 %s %s' % (Start, be, End)).strip()	# the encoded part is prefixed by 1
	# return '0 ' + Str if Str else ''
	return Str

def Decode(EStr):
	" decodes a string in which duplicates have been encoded "
	Chunks = re.split(r'( 1 \d+ \d+)', EStr)	# splitting code chunks, either <NormalStr> or <1 distanceToPattern patternLength>
	Chunks = map(lambda x: x.strip(), Chunks)	# getting rid of surrounding spaces
	Str = ''
	for Ch in list(Chunks):
		if not Ch.startswith('1 '):	Str += Ch	# normal string
		else:	# expected: <1 distanceToPattern patternLength>
			shift = int(Ch.split()[1], 2)
			patternLength = int(Ch.split()[2], 2)
			SL = len(Str)
			Str += Str[SL-shift-patternLength:SL-shift]
	return Str
	
if __name__ == "__main__":	
	print(__doc__)
	if len(sys.argv) > 1:	TestStr = ''.join(sys.argv[1:])	
	else:
		# TestStr = "001010000111110100110100001111101010010001"
		# TestStr = "001010000111110100110100001111101010010000111000011"
		# TestStr = "0101010101010101010101010101010101"
		# TestStr = "0001010110111001101000010111110011011100110110010001011100110001"
		# TestStr = "1100110100110110111110100001000101011101011101101111101111101111100001100110000111100001100110111000"
		Pi = '1001001000011111101101010100010001000010110100011000010001101001100010011000110011000101000101110000000110111'
		# TestStr = Pi
		TestStr = ''.join([str(random.randint(0,1)) for n in range(100) ])	# random sequence
		print('Usage: %s <binary string with duplicates>\n' % os.path.basename(sys.argv[0]))
	ETestStr = Encode(TestStr)
	print('Original:\t%s - length: %d' % (TestStr, len(TestStr)))
	print('Encoded:\t%s - length: %d' % (ETestStr, len(ETestStr.replace(' ',''))))
	DTestStr = Decode(ETestStr)
	print('Decoded:\t%s - %s' % (DTestStr, 'Correct' if DTestStr == TestStr else 'Incorrect'))

__author__ = 'Dessalles'
