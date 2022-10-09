import comp_prob_inference

prob_space = {'sunny': 1/2., 'rainy': 1/6., 'snowy': 1/3.}
random_outcome = comp_prob_inference.sample_from_finite_probability_space(prob_space)
W = random_outcome
if random_outcome == 'sunny':
    I = 1
else:
    I = 0

W_mapping = {'sunny': 'sunny', 'rainy': 'rainy', 'snowy': 'snowy'}
I_mapping = {'sunny': 1, 'rainy': 0, 'snowy': 0}

random_outcome = comp_prob_inference.sample_from_finite_probability_space(prob_space)
W = W_mapping[random_outcome]
I = I_mapping[random_outcome]
print I

W_table = {'sunny': 1./2, 'rainy': 1./6, 'snowy': 1./3}
I_table = {0: 1./2, 1: 1./2}

W = comp_prob_inference.sample_from_finite_probability_space(W_table)
I = comp_prob_inference.sample_from_finite_probability_space(I_table)
print I

prob_space = {'cat': 0.2, 'dog':0.7, 'shark':0.1}

W_mapping = {'cat': 5, 'dog': 5, 'shark': 7}
I_mapping = {5: 0.9, 7: 0.1}

print W_mapping.values()

prob = {}
for i in range(1, 7):
	for j in range(1, 7):
		prob[i+j] = prob.get(i+j ,0) + 1
print {x:prob[x]/36.0 for x in prob}