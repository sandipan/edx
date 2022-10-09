from simpsons_paradox_data import *

joint_prob_table[gender_mapping['female'], department_mapping['C'], admission_mapping['admitted']]
joint_prob_gender_admission = joint_prob_table.sum(axis=1)
joint_prob_gender_admission = joint_prob_table.sum(axis=1)

female_only = joint_prob_gender_admission[gender_mapping['female']]
prob_admission_given_female = female_only / np.sum(female_only)
prob_admission_given_female_dict = dict(zip(admission_labels, prob_admission_given_female))
print(prob_admission_given_female_dict)

admitted_only = joint_prob_gender_admission[:, admission_mapping['admitted']]
prob_gender_given_admitted = admitted_only / np.sum(admitted_only)
prob_gender_given_admitted_dict = dict(zip(gender_labels, prob_gender_given_admitted))
print(prob_gender_given_admitted_dict)
female_and_A_only = joint_prob_table[gender_mapping['female'], department_mapping['A']]
