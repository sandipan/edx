################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################


"""	This program samples memory and measures its complexity by compressing the sample
"""

import sys

import random
import re
import zlib
import bz2

#******************************#
# choosing compression method  #
#******************************#
compressor = zlib.compress		# compressor that is used in compression operations
# compressor = bz2.compress		# compressor that is used in compression operations

Bits = ['0', '1']
Bytes = [chr(i) for i in range(256)]		# 256 first chars


#******************************#
# base conversions             #
#******************************#
def BaseChange(Number, BaseSymbols=Bytes):
	""" converts a number from base 10 to another base 
	"""
	Base = len(BaseSymbols)
	result = ''
	Number = int(Number)	# to avoid errors if input is text
	while Number:
		result = BaseSymbols[Number % (Base)] + result	# low-weight digits processed first
		Number //= Base
	return result	# returned as a string

def Base4To16(DNA, Nucleotides='ATGC'):
	"""	converts DNA string with A,T,G,C into base 256
	"""
	Base = list(Nucleotides)
	ByteSequence = ''
	for locus in range(0, len(DNA), 4):
		Hexa = Base.index(DNA[locus])
		Hexa += Base.index(DNA[locus+1])*4
		Hexa += Base.index(DNA[locus+2])*16
		Hexa += Base.index(DNA[locus+3])*64
		ByteSequence += Bytes[Hexa]
	return HexaSequence

	
	
#******************************#
# Compressing sequences        #
#******************************#
	
def Champernowne(N, base=10):
	" computes the Champernowne constant up to N in various bases "
	Champ = ''
	easybases = {2:'b', 8:'o', 10:'', 16:'x'}
	if base in easybases:
		for i in range(N): Champ += ('{0:%s}' % easybases[base]).format(i)
	else:	print('Unsupported base: %d' % base)
	return Champ
	
def compression(TextSample, TextName='', Encoding='latin-1', Verbose=True):
	"""	gets a string compressed and prints compression factor
	"""
	try:	
		if Verbose:	sys.stdout.write("Compressing %s ...\n" % TextSample[:40])
	except UnicodeEncodeError:	pass
	if type(TextSample) == str:
		TextSample = TextSample.encode(Encoding)	# 'latin-1' =   8 bits ASCII
	CompressedSize = len(compressor(TextSample))
	CompressingFactor = 100-(100*CompressedSize)/len(TextSample)
	if Verbose:
		print("%s: size %d reduced to --> %d (compression %.01f%%)" % (TextName, len(TextSample), 
			CompressedSize, CompressingFactor))
	return (CompressedSize, CompressingFactor)
	
  
if __name__ == "__main__":	
	
	##############################
	# Compressing pow(10,i) base 10  #
	##############################
	i = 10000
	print('\nCompressing pow(10,%d) base 10' % i)
	Num = pow(10,i)
	StrNum = str(Num)
	compression(StrNum, "power of ten")

	######################################
	# Compressing pow(256,i) (base 256)  #
	######################################
	i = 10000
	print('\nCompressing pow(256,%d) base 256 represented in bytes' % i)
	Num = pow(256,i)
	StrNum = BaseChange(Num, Bytes)	# mostly null chars
	compression(StrNum, "power of 256")


	#################################
	# Compressing a Random Number   #
	#################################
	i = 10000
	print('\nCompressing a pseudo-Random Number larger than 10^%d represented in bytes' % i)
	Num = random.randint(pow(10,i),pow(10,i+1)-1)
	# Changing base to 256 to use full string expressive power
	StrNum = BaseChange(Num, Bytes)	# converts base 10 into 256
	compression(StrNum, "random number", Encoding='latin-1')
	

	##############################
	# Compressing Pi             #
	##############################
	print('\nCompressing Pi represented in bytes')
	PIDECIMALSFILE = "Pi_decimals.txt"
	try:
		TextSample = open(PIDECIMALSFILE).read()
		TextSample = re.sub(r'[\s\.\,]', '', TextSample)	# gets rid of spaces and punctations
		##### Add relevant line here #######
		(CompSize, CompFactor) = compression(TextSample, "Pi in base 10")
		if CompFactor > 1:	print("Strange: Pi's decimals seem to be compressible !!")
	except IOError:
		print(f"To compress 'Pi', please provide a text file '{PIDECIMALSFILE}' with decimal digits of Pi")




__author__ = "Dessalles"