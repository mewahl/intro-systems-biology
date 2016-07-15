import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import ode

def f(phi, current_concentrations):
	# use simpler variable names
	s1 = current_concentrations[0]
	s2 = current_concentrations[1]

	v0 = 5.0
	k1 = 3.0
	k2 = 2.0
	change_in_s1 = v0 - k1 * s1
	change_in_s2 = k1 * s1 - k2*s2

	return [change_in_s1, change_in_s2]

initial_concentrations = [1.0, 0.0]
solver = ode(f).set_integrator('dopri5') # Runge-Kutta, equiv. to ode45() in MATLAB
solver.set_initial_value(initial_concentrations)

timestep = 0.01
number_of_timepoints = int(1/timestep)
timepoints = np.linspace(0, 5, number_of_timepoints)
s1 = np.zeros(number_of_timepoints)
s2 = np.zeros(number_of_timepoints)

for i in range(number_of_timepoints):
	current_concentrations = solver.integrate(timepoints[i])
	s1[i] = current_concentrations[0]
	s2[i] = current_concentrations[1]

plt.figure()
plt.plot(timepoints,s1)
plt.plot(timepoints,s2)
plt.xlabel('Time')
plt.ylabel('Concentration')
plt.legend(['s_1', 's_2'], loc='upper left')
plt.show()