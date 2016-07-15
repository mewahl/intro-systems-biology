import numpy as np
from numpy.random import exponential, multinomial
from scipy import integrate
import matplotlib.pyplot as plt

''' Function definitions '''

def update_simulation(old_concentrations):
	reaction_rates = list(rates)
	for i in range(0,54):
		species_used = reactants[i]
		for reactant in species_used:
			reaction_rates[i] *= old_concentrations[species.index(reactant)]
	time_elapsed = exponential(1.0/sum(reaction_rates))

	event_distribution = [i/sum(reaction_rates) for i in reaction_rates]
	event = multinomial(1, event_distribution).argmax()
	new_concentrations = old_concentrations + stoichiometry[event]

	return time_elapsed, new_concentrations

def run_simulation(initial_concentrations):
	t_max = 60*60*24*7
	saved_concentrations = np.zeros((3000000,2))
	old_concentrations = list(initial_concentrations)
	t = 0.0
	timepoints = [t]
	i=0
	while t < t_max:
		timepoints.append(t)
		time_elapsed, new_concentrations = update_simulation(old_concentrations)
		if t > 60*60*24*3:
			new_concentrations[0] = 0.0
			new_concentrations[0] = 1000.0
		t += time_elapsed
		saved_concentrations[i+1, 0] = new_concentrations[26]
		saved_concentrations[i+1, 0] = new_concentrations[27]
		old_concentrations = new_concentrations
		i += 1

	saved_concentrations = saved_concentrations[:len(timepoints),:]
	return timepoints, saved_concentrations

def plot_reporters(timepoints, saved_concentrations):
	plt.clf()
	BFP = saved_concentrations[:,0].tolist()
	mCT = saved_concentrations[:,1].tolist()

	h_BFP = plt.plot(timepoints,BFP,"b-")
	h_mCT = plt.plot(timepoints,mCT,"r-")
	plt.title('Timecourse of reporter expression levels')
	plt.xlabel("Time")
	plt.ylabel("Molecule count")
	plt.savefig('timecourse.png', bbox_inches='tight')
	return

''' Variable definitions '''
r_CMV = 1.0E-4
r_CMV_l_CMV = r_CMV * 0.01 # Not sure if 0.01 is a "percentage"
r_CMV_VK_CMV = r_CMV * 2.0
r_CMV_V_CMV = r_CMV * 10.0
k_T = 1.0
q_T = 1.0E-4
k_T_alphaTK = k_T * 3.05
d_T = 1.0E-5
d_BFP = 1.0E-5
d_mCT = 1.0E-5

rates = [k_T_alphaTK,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T_alphaTK,
	q_T,
	k_T,
	q_T,
	r_CMV_VK_CMV,
	r_CMV_VK_CMV,
	r_CMV_V_CMV,
	r_CMV_V_CMV,
	r_CMV_l_CMV,
	r_CMV_l_CMV,
	r_CMV,
	r_CMV,
	r_CMV_VK_CMV,
	r_CMV_VK_CMV,
	r_CMV_V_CMV,
	r_CMV_V_CMV,
	r_CMV_l_CMV,
	r_CMV_l_CMV,
	r_CMV,
	r_CMV,
	r_CMV,
	r_CMV,
	r_CMV,
	r_CMV,
	r_CMV_l_CMV,
	r_CMV_l_CMV,
	r_CMV_l_CMV,
	r_CMV_l_CMV,
	d_T,
	d_T,
	d_T,
	d_T,
	d_BFP,
	d_mCT]

reactants = [['PCMV_A0', 'T_AK', 'T_AK'],
	['T_AK_T_AK_PCMV_A0'],
	['PCMV_A0', 'T_AK', 'T_AV'],
	['T_AK_T_AV_PCMV_A0'],
	['PCMV_A0', 'T_AV', 'T_AV'],
	['T_AV_T_AV_PCMV_A0'],
	['PCMV_A1', 'T_AK', 'T_AK'],
	['T_AK_T_AK_PCMV_A1'],
	['PCMV_A1', 'T_AK', 'T_AV'],
	['T_AK_T_AV_PCMV_A1'],
	['PCMV_A1', 'T_AV', 'T_AV'],
	['T_AV_T_AV_PCMV_A1'],
	['PCMV_B0', 'T_BK', 'T_BK'],
	['T_BK_T_BK_PCMV_B0'],
	['PCMV_B0', 'T_BK', 'T_BV'],
	['T_BK_T_BV_PCMV_B0'],
	['PCMV_B0', 'T_BV', 'T_BV'],
	['T_BV_T_BV_PCMV_B0'],
	['PCMV_B1', 'T_BK', 'T_BK'],
	['T_BK_T_BK_PCMV_B1'],
	['PCMV_B1', 'T_BK', 'T_BV'],
	['T_BK_T_BV_PCMV_B1'],
	['PCMV_B1', 'T_BV', 'T_BV'],
	['T_BV_T_BV_PCMV_B1'],
	['T_AK_T_AV_PCMV_A0'],
	['T_AK_T_AV_PCMV_A1'],
	['T_AV_T_AV_PCMV_A0'],
	['T_AV_T_AV_PCMV_A1'],
	['T_AK_T_AK_PCMV_A0'],
	['T_AK_T_AK_PCMV_A1'],
	['PCMV_A0'],
	['PCMV_A1'],
	['T_BK_T_BV_PCMV_B0'],
	['T_BK_T_BV_PCMV_B1'],
	['T_BV_T_BV_PCMV_B0'],
	['T_BV_T_BV_PCMV_B1'],
	['T_BK_T_BK_PCMV_B0'],
	['T_BK_T_BK_PCMV_B1'],
	['PCMV_B0'],
	['PCMV_B1'],
	['PCMV_PIP0','PI'],
	['PCMV_PIP1','PI'],
	['PCMV_E0','ER'],
	['PCMV_E1','ER'],
	['PCMV_PIP0'],
	['PCMV_PIP1'],
	['PCMV_E0'],
	['PCMV_E1'],
	['T_AK'],
	['T_AV'],
	['T_BK'],
	['T_BV'],
	['BFP'],
	['mCT'] ]

products = [['T_AK_T_AK_PCMV_A0'],
	['PCMV_A0', 'T_AK', 'T_AK'],
	['T_AK_T_AV_PCMV_A0'],
	['PCMV_A0', 'T_AK', 'T_AV'],
	['T_AV_T_AV_PCMV_A0'],
	['PCMV_A0', 'T_AV', 'T_AV'],
	['T_AK_T_AK_PCMV_A1'],
	['PCMV_A1', 'T_AK', 'T_AK'],
	['T_AK_T_AV_PCMV_A1'],
	['PCMV_A1', 'T_AK', 'T_AV'],
	['T_AV_T_AV_PCMV_A1'],
	['PCMV_A1', 'T_AV', 'T_AV'],
	['T_BK_T_BK_PCMV_B0'],
	['PCMV_B0', 'T_BK', 'T_BK'],
	['T_BK_T_BV_PCMV_B0'],
	['PCMV_B0', 'T_BK', 'T_BV'],
	['T_BV_T_BV_PCMV_B0'],
	['PCMV_B0', 'T_BV', 'T_BV'],
	['T_BK_T_BK_PCMV_B1'],
	['PCMV_B1', 'T_BK', 'T_BK'],
	['T_BK_T_BV_PCMV_B1'],
	['PCMV_B1', 'T_BK', 'T_BV'],
	['T_BV_T_BV_PCMV_B1'],
	['PCMV_B1', 'T_BV', 'T_BV'],
	['T_AK_T_AV_PCMV_A0','T_BK','BFP'],
	['T_AK_T_AV_PCMV_A1','T_AV'],
	['T_AV_T_AV_PCMV_A0','T_BK','BFP'],
	['T_AV_T_AV_PCMV_A1','T_AV'],
	['T_AK_T_AK_PCMV_A0','T_BK','BFP'],
	['T_AK_T_AK_PCMV_A1','T_AV'],
	['PCMV_A0','T_BK','BFP'],
	['PCMV_A1','T_AV'],
	['T_BK_T_BV_PCMV_B0', 'T_AK', 'mCT'],
	['T_BK_T_BV_PCMV_B1', 'T_BV'],
	['T_BV_T_BV_PCMV_B0', 'T_AK', 'mCT'],
	['T_BV_T_BV_PCMV_B1', 'T_BV'],
	['T_BK_T_BK_PCMV_B0', 'T_AK', 'mCT'],
	['T_BK_T_BK_PCMV_B1', 'T_BV'],
	['PCMV_B0', 'T_AK', 'mCT'],
	['PCMV_B1', 'T_BV'],
	['PCMV_PIP0','PI', 'T_BK'],
	['PCMV_PIP1','PI', 'T_AV'],
	['PCMV_E0','ER', 'T_AK'],
	['PCMV_E1','ER', 'T_BV'],
	['PCMV_PIP0', 'T_BK'],
	['PCMV_PIP1', 'T_AV'],
	['PCMV_E0', 'T_AK'],
	['PCMV_E1', 'T_BV'],
	[],
	[],
	[],
	[],
	[],
	[] ]

species = ['PI',
	'ER',
	'PCMV_PIP0',
	'PCMV_PIP1',
	'PCMV_E0',
	'PCMV_E1',
	'PCMV_A0',
	'T_AK_T_AK_PCMV_A0',
	'T_AK_T_AV_PCMV_A0',
	'T_AV_T_AV_PCMV_A0',
	'PCMV_A1',
	'T_AK_T_AK_PCMV_A1',
	'T_AK_T_AV_PCMV_A1',
	'T_AV_T_AV_PCMV_A1',
	'PCMV_B0',
	'T_BK_T_BK_PCMV_B0',
	'T_BK_T_BV_PCMV_B0',
	'T_BV_T_BV_PCMV_B0',
	'PCMV_B1',
	'T_BK_T_BK_PCMV_B1',
	'T_BK_T_BV_PCMV_B1',
	'T_BV_T_BV_PCMV_B1',
	'T_AK',
	'T_AV',
	'T_BK',
	'T_BV',
	'BFP',
	'mCT']

''' Create a 54 by 28 array describing which species are created and destroyed in each reaction '''
stoichiometry = np.zeros((54,28))
for i in range(0,54):
	used_up = reactants[i]
	for reactant in used_up:
		j = species.index(reactant)
		stoichiometry[i][j] += -1.0
	created = products[i]
	for product in created:
		j = species.index(product)
		stoichiometry[i][j] += 1.0

if __name__ == "__main__":
	activator_conc = 100.0
	repressor_conc = 100.0
	pi_conc = 0.0
	er_conc = 1000.0
	initial_concentrations = [pi_conc, er_conc, activator_conc, repressor_conc, activator_conc,
		repressor_conc, activator_conc, 0.0, 0.0, 0.0, repressor_conc, 0.0, 0.0, 0.0,
		activator_conc, 0.0, 0.0, 0.0, repressor_conc, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
		0.0]

	timepoints, concentrations = run_simulation(initial_concentrations)
	plot_reporters(timepoints, concentrations)
