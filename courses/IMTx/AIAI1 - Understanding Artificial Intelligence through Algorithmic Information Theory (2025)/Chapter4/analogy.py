################################################################################
# Understanding Artificial Intelligence through Algorithmic Information Theory #
# MOOC "AIAI" on EdX            -        see:   https://aiai.telecom-paris.fr/ #
# Institut Mines Telecom  2021  - J.-L. Dessalles with Pierre-Alexandre Murena #
################################################################################


import itertools	# for permutations
import re			# regular expressions

OPERATORS = ['let', 'mem']

####### COMPLEXITY

COMPLEXITIES = {'let': 2,
				'mem': 2,
				'?': 2,
				'letter': 2+5}
				
####### UTILS

def is_string(instruction_word):	
	return not is_argument(instruction_word) and instruction_word not in OPERATORS

def is_argument(instruction_word):
	return re.match(r'\?\d+', instruction_word)

def someSubstrings(string, list_substrings):
	" returns chunks of 'string' "
	for size in [1, len(string)-1, len(string)]:	# only 3 sizes
		for index in range(0, len(string) + 1 - size):
			list_substrings.append(string[index:index+size])

####### EXECUTION

def generate_string(instruction, exceptions_allowed=False):
	instruction = instruction.replace(" ", "")	# getting rid of spaces
	instruction_seq = instruction.split(',')
	try: return execute_next(instruction_seq, "", [])
	except Exception as e: 
		if exceptions_allowed: raise Exception(e)
		else: print('Error:', e)


def execute_next_string(instruction_seq, current_result, memory):
	# Instruction starts with a string: Simply append it (if valid)!
	first = instruction_seq[0]
	# split_string = first.split("'")
	# if len(split_string) == 3:
	return execute_next(instruction_seq[1:], current_result + first, memory)
	# raise Exception('Invalid syntax for group of characters')
	
def execute_next_let(instruction_seq, current_result, memory):
	# Instruction starts with a let
	# First find the end of the let
	let_instruction = []
	for idx, el in enumerate(instruction_seq[1:]):
		if el == 'mem':
			raise Exception('mem instructions are not allowed in let.')
		if el == 'let':
			let_instruction = instruction_seq[1:idx+1]
			break
	
	if len(let_instruction) == 0:
		raise Exception('let instruction never closed')
		
	
	arguments = set([int(x[1:]) for x in let_instruction if x.startswith('?')])
	n_args = len(arguments)
	if n_args > 0 and n_args != max(arguments) + 1:
		raise Exception('Missing arguments in let')
	
	def turn_args_into_strings(x):
		#if x.startswith('?'): return "'" + x + "'"
		# # # if is_argument(x): return "'" + x + "'"
		# # # else: return x
		return x
	
	pattern = execute_next([turn_args_into_strings(x) for x in let_instruction], '', [])
	memory.append({'n_args': n_args, 'pattern': pattern})
	return execute_next(instruction_seq[idx+2:], current_result, memory)
	
	
def execute_next_mem(instruction_seq, current_result, memory):
	#print('================================== MEM')
	try: n = len(memory) - 1 - int(instruction_seq[1])
	except: raise Exception('Invalid memory index')
	if n < 0: raise Exception('Index out of memory')
	n_args = memory[n]['n_args']
	pattern = memory[n]['pattern']
	
	idx = 2
	args = []
	for i in range(n_args):
		# Searching for argument i
		# Brute force execution until a string is obtained
		#print('- argument', i)
		len_sequence = len(instruction_seq) - idx + 1
		output = -1
		for i_final in range(1, len_sequence):
			try: 
				#print('testing instruction', instruction_seq[idx:idx+i_final])
				output = execute_next(instruction_seq[idx:idx+i_final], "", memory)
				#print('Found output:', output)
				break
			except: output = -1
		if output == -1: raise Exception('Invalid argument for mem')
		args.append(output)
		idx = idx + i_final
	#print('Arguments:', args)
	
	result = pattern
	for i in range(n_args):
		result = result.replace('?'+str(i), args[i])
	#print('================================== END MEM')
	return execute_next(instruction_seq[idx:], current_result + result, memory)


def execute_next(instruction_seq, current_result, memory):
	#print("Entering execute_next:")
	#print(' - instruction:', instruction_seq)
	#print(' - result:', current_result)
	#print(' - memory:', memory)
	
	if len(instruction_seq) == 0:
		return current_result
	
	first = instruction_seq[0]

	
	if is_string(first):
		return execute_next_string(instruction_seq, current_result, memory)
	elif is_argument(first):
		return execute_next_string(instruction_seq, current_result, memory)
	elif first == 'let':
		return execute_next_let(instruction_seq, current_result, memory)
	elif first == 'mem':
		return execute_next_mem(instruction_seq, current_result, memory)
	else:
		raise Exception('Invalid instruction: ' + first)
		




def instruction_complexity(instruction_string, complexities=COMPLEXITIES):
	instruction_string = instruction_string.replace(" ", "")
	instruction_seq = instruction_string.split(',')
	complexity = 0
	
	for word in instruction_seq:
		if word == 'let':
			complexity += complexities['let']
		elif word == 'mem':
			complexity += complexities['mem']
		elif is_argument(word):
			complexity += complexities['?']
		elif is_string(word):
			complexity += len(word) * complexities['letter']
		# elif word.isdigit():
			# complexity += int(word)
		else:
			print('unknown instruction word')
	return complexity

###### SEARCH

def restricted_search(solution, min_complexity=1000):
	current_best_instruction = []
	
	# Analogy:	A:B::C:D	(A is to B as C is to D)
	analogy = solution.split('::')
	A, B = analogy[0].split(':')
	C, D = analogy[1].split(':')
	source_alphabet = set(A) | set(B)
	target_alphabet = set(C) | set(D)
	common_alphabet = source_alphabet & target_alphabet
		
	list_alphabet = []
	for letter in common_alphabet:
		# duplicating common letters to match their max number of occurrences
		n = max(A.count(letter), B.count(letter), C.count(letter))
		list_alphabet += [letter] * n
	# print(source_alphabet, target_alphabet, common_alphabet, list_alphabet)
	list_var = ['?0', '?1']
	vocab_0 = list_var * 2 + list_alphabet	# allowing twice two variables
	# print(vocab_0)
	
	# candidates for words in let operation
	list_tmp_words = []
	for i in range(1, 4):
		# generating all permutations of i elements taken from vocab_0
		list_tmp_words.extend(list(itertools.permutations(vocab_0, i)))	
	list_tmp_words = set(list_tmp_words)
	# print(sorted(list(list_tmp_words), key=len))
	
	list_words = []
	for w in list_tmp_words:
		if all(is_string(x) for x in w):
			if (''.join(w) not in solution):
				continue
		elif (len(w) > 2):
			if (is_string(w[0]) and is_string(w[1])):
				if (''.join(w[:-1]) not in solution):
					continue		
			elif (is_string(w[1]) and is_string(w[2])):
				if (''.join(w[1:]) not in solution):
					continue
		list_words.append(w)
	# print(list_words)

	# candidates for mem arguments
	list_strings_0 = []
	someSubstrings(A, list_strings_0)
	someSubstrings(B, list_strings_0)
	
	list_strings_1 = list_strings_0
	someSubstrings(C, list_strings_1)
	
	list_strings_0 = set(list_strings_0)
	list_strings_1 = set(list_strings_1)

	# Explore 
	for w1 in list_words:
		for w2 in list_words:
			instruction = ["let"] + list(w1) + [":"] + list(w2) + ["let"]
			
			# is already implemented?
			if ("?1" in instruction):
				if ("?0" not in instruction):
					continue
				elif (instruction.index("?1") < instruction.index("?0")):
						continue	 
			# is already implemented?

			instruction.extend(["mem", "0"])
			# print(','.join(instruction))

			nbVar = 0
			if ("?1" in instruction): nbVar = 2
			elif ("?0" in instruction): nbVar = 1

			i = 0
			list_arg_0 = list(itertools.permutations(list_strings_0, nbVar))
			list_arg_1 = list(itertools.permutations(list_strings_1, nbVar))

			for a1 in list_arg_0:
				instruction1 = instruction + list(a1)
				solution_temp = generate_string(','.join(instruction1))				

				if ( (solution_temp != analogy[0]) or (instruction_complexity(','.join(instruction)) > min_complexity)):
					continue

#				print(','.join(instruction1))
				#print("bingo")
				instruction1.extend(["::", "mem", "0"])
				
				for a2 in list_arg_1:
					instruction2 = instruction1 + list(a2)
					#print(instruction2)
					solution_final = generate_string(','.join(instruction2))
					#print(solution_final)

					if (solution_final.startswith(analogy[0]+"::"+analogy[1].split(":")[0]+":") is not True):
						continue
					
					if (instruction_complexity(','.join(instruction1)) < min_complexity):
#						print('===========================================')
						min_complexity = instruction_complexity(','.join(instruction1))
#						print(min_complexity)
						current_best_instruction = instruction2

	instruction_string = ','.join(current_best_instruction)
	print("Best instruction:", instruction_string)
	expected_result = analogy[-1].split(':')[-1]
	execution = generate_string(instruction_string)
	obtained_result = execution.split(':')[-1]
	print('Expected result:', expected_result)
	print('Obtained result:', obtained_result)
	return ','.join(current_best_instruction)


if __name__ == "__main__":	
	TestAnalogy = "rosa:rosam::vita:vitam"
	# TestAnalogy = "orang:orang-orang::burung:burung-burung"
	# TestAnalogy = "puhua:puhun::katsoa:katson"	
	# TestAnalogy = "abc:abd::ijk:ijl"	
	print(TestAnalogy)
	current_best_instruction = restricted_search(TestAnalogy)


__author__ = 'Murena'
