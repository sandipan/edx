prob_R = {0:1./2,1:1./2}
prob_C = {0:1./2,1:1./2}

# C R W T
joint_probs = {(0,0,1,0):1./4, (0,1,0,1):1./4, (1,0,0,1):1./4, (1,1,1,0):1./4}

# joint T W
joint_WT = {}
for W in range(2):
	for T in range(2):
		joint_WT[W,T] = sum([joint_probs.get((C,R,W,T),0) for C in range(2) for R in range(2)])
#print joint_WT
# joint W T R

joint_WTR = {}
for W in range(2):
	for T in range(2):
		for R in range(2):
			joint_WTR[W,T,R] = sum([joint_probs.get((C,R,W,T),0) for C in range(2)])
#print joint_WTR


# joint R W
joint_WR = {}
for W in range(2):
	for R in range(2):
		joint_WR[W,R] = sum([joint_probs.get((C,R,W,T),0) for C in range(2) for T in range(2)])
#print joint_WR

# joint R T
joint_TR = {}
for T in range(2):
	for R in range(2):
		joint_TR[T,R] = sum([joint_probs.get((C,R,W,T),0) for C in range(2) for W in range(2)])

# T
prob_T = {}
for T in range(2):
	prob_T[T] = sum([joint_TR.get((R,T),0) for R in range(2)])
#print prob_T

# W
prob_W = {}
for W in range(2):
	prob_W[W] = sum([joint_WR.get((W,R),0) for R in range(2)])
#print prob_W

# joint C W
joint_CW = {}
for C in range(2):
	for W in range(2):
		joint_CW[C,W] = sum([joint_probs.get((C,R,W,T),0) for R in range(2) for T in range(2)])
#print joint_CW

# joint R C
joint_RC = {}
for R in range(2):
	for C in range(2):
		joint_RC[R,C] = sum([joint_probs.get((C,R,W,T),0) for T in range(2) for W in range(2)])

# joint C T
joint_CT = {}
for C in range(2):
	for T in range(2):
		joint_CT[C,T] = sum([joint_probs.get((C,R,W,T),0) for R in range(2) for W in range(2)])

# joint W T
joint_WT = {}
for W in range(2):
	for T in range(2):
		joint_WT[W,T] = sum([joint_probs.get((C,R,W,T),0) for C in range(2) for R in range(2)])

# R*C
prob_R_times_prob_C = {}
for R in range(2):
	for C in range(2):
		prob_R_times_prob_C[R,C] = prob_R[R]*prob_C[C]

print joint_RC == prob_R_times_prob_C

# W*R
prob_W_times_prob_R = {}
for W in range(2):
	for R in range(2):
		prob_W_times_prob_R[W,R] = prob_W[W]*prob_R[R]

print 'RW', joint_WR == prob_W_times_prob_R

# W*T
prob_W_times_prob_T = {}
for W in range(2):
	for T in range(2):
		prob_W_times_prob_T[W,T] = prob_W[W]*prob_T[T]

print joint_WT == prob_W_times_prob_T

# C*W
prob_C_times_prob_W = {}
for C in range(2):
	for W in range(2):
		prob_C_times_prob_W[C,W] = prob_C[C]*prob_W[W]

print 'CW', joint_CW == prob_C_times_prob_W

# C*T
prob_C_times_prob_T = {}
for C in range(2):
	for T in range(2):
		prob_C_times_prob_T[C,T] = prob_C[C]*prob_T[T]

print joint_CT == prob_C_times_prob_T

# T*R
prob_T_times_prob_R = {}
for T in range(2):
	for R in range(2):
		prob_T_times_prob_R[T,R] = prob_T[T]*prob_R[R]

print joint_TR == prob_T_times_prob_R

# cond WT|R
cond_WTR = {}
for W in range(2):
	for T in range(2):
		for R in range(2):
			cond_WTR[W,T,R] = joint_WTR.get((W,T,R),0)/prob_R[R]
#print joint_WTR / prob_R

# cond W|R
cond_WR = {}
for W in range(2):
	for R in range(2):
		cond_WR[W,R] = joint_WR.get((W,R),0)/prob_R[R]
#print cond_WR
#print joint_WR / prob_R

# cond T|R
cond_TR = {}
for T in range(2):
	for R in range(2):
		cond_TR[T,R] = joint_TR.get((T,R),0)/prob_R[R]
#print cond_TR
#print joint_TR / prob_R

cond_WR_times_TR = {}
for W in range(2):
	for T in range(2):
		for R in range(2):
			cond_WR_times_TR[W,T,R] = cond_WR[W,R]*cond_TR[T,R]

print 'WT|R', cond_WTR == cond_WR_times_TR

joint_RCW = {}
for R in range(2):
	for C in range(2):
		for W in range(2):
			joint_RCW[R,C,W] = sum([joint_probs.get((C,R,W,T),0) for T in range(2)])
#print joint_RCW

# cond RC|W
cond_RCW = {}
for R in range(2):
	for C in range(2):
		for W in range(2):
			cond_RCW[R,C,W] = joint_RCW.get((R,C,W),0)/prob_W[W]

# cond R|W
cond_RW = {}
for R in range(2):
	for W in range(2):
		cond_RW[R,W] = joint_WR.get((W,R),0)/prob_W[W]

# cond C|W
cond_CW = {}
for C in range(2):
	for W in range(2):
		cond_CW[C,W] = joint_CW.get((C,W),0)/prob_W[W]

cond_RW_times_CW = {}
for R in range(2):
	for C in range(2):
		for W in range(2):
			cond_RW_times_CW[R,C,W] = cond_RW[R,W]*cond_CW[C,W]

print 'RC|W', cond_RCW == cond_RW_times_CW

joint_RTW = {}
for R in range(2):
	for T in range(2):
		for W in range(2):
			joint_RTW[R,T,W] = sum([joint_probs.get((C,R,W,T),0) for C in range(2)])
#print joint_RTW

# cond RT|W
cond_RTW = {}
for R in range(2):
	for T in range(2):
		for W in range(2):
			cond_RTW[R,T,W] = joint_RTW.get((R,T,W),0)/prob_W[W]

# cond R|W
cond_RW = {}
for R in range(2):
	for W in range(2):
		cond_RW[R,W] = joint_WR.get((W,R),0)/prob_W[W]

# cond T|W
cond_TW = {}
for T in range(2):
	for W in range(2):
		cond_TW[T,W] = joint_WT.get((W,T),0)/prob_W[W]

cond_RW_times_TW = {}
for R in range(2):
	for T in range(2):
		for W in range(2):
			cond_RW_times_TW[R,T,W] = cond_RW[R,W]*cond_TW[T,W]

print 'RT|W', cond_RTW == cond_RW_times_TW


joint_CTW = {}
for C in range(2):
	for T in range(2):
		for W in range(2):
			joint_CTW[C,T,W] = sum([joint_probs.get((C,R,W,T),0) for R in range(2)])
#print joint_CTW

# cond CT|W
cond_CTW = {}
for C in range(2):
	for T in range(2):
		for W in range(2):
			cond_CTW[C,T,W] = joint_CTW.get((C,T,W),0)/prob_W[W]

# cond C|W
cond_CW = {}
for C in range(2):
	for W in range(2):
		cond_CW[C,W] = joint_CW.get((C,W),0)/prob_W[W]

# cond T|W
cond_TW = {}
for T in range(2):
	for W in range(2):
		cond_TW[T,W] = joint_WT.get((W,T),0)/prob_W[W]

cond_CW_times_TW = {}
for C in range(2):
	for T in range(2):
		for W in range(2):
			cond_CW_times_TW[C,T,W] = cond_CW[C,W]*cond_TW[T,W]

print 'CT|W', cond_CTW == cond_CW_times_TW

joint_CTR = {}
for C in range(2):
	for T in range(2):
		for R in range(2):
			joint_CTR[C,T,R] = sum([joint_probs.get((C,R,W,T),0) for W in range(2)])
#print joint_CTR

# cond CT|R
cond_CTR = {}
for C in range(2):
	for T in range(2):
		for R in range(2):
			cond_CTR[C,T,R] = joint_CTR.get((C,T,R),0)/prob_R[R]

# cond C|R
cond_CR = {}
for C in range(2):
	for R in range(2):
		cond_CR[C,R] = joint_RC.get((R,C),0)/prob_R[R]

# cond T|R
cond_TR = {}
for T in range(2):
	for R in range(2):
		cond_TR[T,R] = joint_TR.get((T,R),0)/prob_R[R]

cond_CR_times_TR = {}
for C in range(2):
	for T in range(2):
		for R in range(2):
			cond_CR_times_TR[C,T,R] = cond_CR[C,R]*cond_TR[T,R]

print 'CT|R', cond_CTR == cond_CR_times_TR
