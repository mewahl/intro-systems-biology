import numpy as np
import scipy as sp
from scipy.stats import poisson
from scipy.stats import powerlaw
import matplotlib.pyplot as plt
import csv
from scipy.integrate import ode
import collections

all_proteins = []
all_proteins_unique = []
protein_count = {}
self_interactions = 0

with open('rolland.tsv', 'r') as tsvfile:
    table_reader = csv.reader(tsvfile, delimiter='\t')
    for row in table_reader:
        all_proteins.append(int(row[0]))
        if row[0] == row[1]: # self interactions
            self_interactions += 1
            continue
        else:
            all_proteins.append(int(row[1]))
        
all_proteins_unique = np.unique(all_proteins)
all_proteins_unique.sort()
for protein in all_proteins_unique:
    protein_count[protein] = 0
    
for protein in all_proteins:
    protein_count[protein] += 1
    
proteins_lambda = np.mean(protein_count.values())
print "Problem 1a) There are an average of " + str(proteins_lambda) + " interactions per protein."