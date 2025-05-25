################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################

# 2014

"""	This program samples memory and measures its complexity by compressing the sample
"""

import sys
import os

from NumberCompression import compression

def readText(TextFile):
	" robust text reading from file "
	try:	return open(TextFile).read()
	except UnicodeDecodeError:
		try:	return open(TextFile, encoding='utf-8').read()
		except UnicodeDecodeError:
			return open(TextFile, encoding='latin-2').read()
	except (IOError, FileNotFoundError):	
		print('******** ERROR: Unable to open %s' % TextFile)
		return(" ")

def distText(Text1, Text2):
	# reading Text1
	TextSample = readText(Text1)
	# compressing Text1
	(CompressedSize1, CompressionFactor1) = compression(TextSample, Text1, Encoding='utf-8')
	# Concatenating Text1 + Text2
	TextSample += readText(Text2)
	#On calcule la taille du nouveau fichier compresse
	(CompressedSize2, CompressionFactor2) = compression(TextSample, Text1+" + "+Text2, Encoding='utf-8')
	#On compare les tailles
	print("Z(%s + %s) - Z(%s): %.02f\n" % (Text1, Text2, Text1, CompressedSize2 - CompressedSize1))
  
if __name__ == "__main__":	

	
	LArgs = len(sys.argv)	# number of arguments in the command line

	if LArgs == 3:
		try:
			distText(sys.argv[1], sys.argv[2])
		except IOError as Msg:
			print('Unable to read %s and %s' % tuple(sys.argv[1:]))
			print(Msg)
	else:
		print('Usage:\n %s <file1 to compress> <file2 to compress and compare with file1>' % os.path.basename(sys.argv[0]))
		
