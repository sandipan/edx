################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################


"""	This program generates a prefix code for integers
"""

import sys
import os

___Correction = 1

def Binary(N):
	" returns the binary code of N as a string "
	return bin(N)[2:]	# bin(17) == '0b10001', so bin(17)[2:] == '10001'
	
def CrudeDoublingCode(N):
	""" returns a code in wich all bits in the binary representation of N are doubled, 
		and then the last bit is reversed
	"""
	Double = ''.join([b * 2 for b in Binary(N)])	
	return Double[:-1] + str((1 - int(Double[-1])))

def DoublingLengthCode(N):
	" Returns a code in which the length of N is double-coded, followed by N in binary form "
	
	BN = Binary(N)
	#print(BN, type(BN))
	if True:
		# ........  To be changed ........
		# Replace the return line below.
		# To do so, use the function CrudeDoublingCode to compute the string corresponding 
		# to the "doubling length code". 
		return CrudeDoublingCode(len(BN))+BN
		# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

def DoublingLengthDecode(BinN):
	" Interprets BinN as the double-length code of N "
	BinLength = ''	# binary reprentation of N's length
	BinN1 = iter(BinN)	# allows to loop over BinN's digits
	for B in BinN1:
		BinLength += B
		if next(BinN1) != B:	break	# consumes the next bit in BinN1
	Length = int(BinLength, 2)
	if True:
		# ........  To be changed ........
		# fill in the '...' in the line below before uncommenting it
		#print(BinN, Length, BinLength)
		StrN = BinN[2*len(BinLength): 2*len(BinLength)+Length]
		N = int(StrN, 2)
		return {'Number': N, 'Length': Length, 'Remainder': BinN[2*len(BinLength) : 2*len(BinLength)+Length]}
		# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	

if __name__ == "__main__":	
	if len(sys.argv) == 2 and sys.argv[1].isdigit():
		N = int(sys.argv[1])
		PrefixCoded_N = DoublingLengthCode(N)
		print('Double-length coding for %d: %s' % (N, PrefixCoded_N))
		print('Decoding %s: %s' % (PrefixCoded_N, DoublingLengthDecode(PrefixCoded_N)))
	else:
		print("\tUsage: %s <int>" % os.path.basename(sys.argv[0]))
		print(__doc__)
	
__author__ = 'Dessalles'
