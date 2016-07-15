## Suggested reading:

Segel 3.1 and 3.2 (PDFs in this directory) -- we will continue from this source next time

#Additional works cited:

[Shen-Orr et al. (2002)](http://www.nature.com/ng/journal/v31/n1/full/ng881.html): Motif enrichment in the E. coli gene regulatory network

[Milo et al. (2002)](http://www.ncbi.nlm.nih.gov/pubmed/12399590): Description of the method employed in Shen-Orr et al.; also applied the method to other systems like the world wide web, food chains, etc.

[Rolland et al. (2014)](http://www.cell.com/abstract/S0092-8674(14)01422-6): A recent advance in curating the human protein-protein interaction network

[Barabasi and Albert (1999)](http://barabasi.com/f/67.pdf) and [Newman 2001](https://arxiv.org/abs/cond-mat/0007235): scale-free vs. Poisson networks and the consequences of this difference

## Notes on the in-class demo:

Sample data (Small network example with FFL enrichment, *E. coli* gene regulatory network, complete *E. coli* gene regulatory network, gene names corresponding to node numbers, and the program `mfinder` (compiled from source to run on a mac) were obtained from the [Alon lab website](http://wws.weizmann.ac.il/mcb/UriAlon/download/network-motif-software). The graph visualization script uses python/`graphviz`.

Demos were run with the following commands.

To show the sample network:

`python visualize_graph.py -i network_exmp.txt -o blah.png`

To show the E. coli GRN with node names and autoregulatory connections:

`python visualize_graph.py -i coliInterFullVec.txt  -o blah.png -l coliInterFullNames.txt`

To run the motif enrichment analysis on the *E. coli* GRN:

`./mfinder coliInterNoAutoRegVec.txt`