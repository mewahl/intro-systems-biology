#(Optional) Problem Set 0: Game of Life
This problem set is optional: it is meant to help you develop MATLAB skills in the context of the course material. Please feel free to ask for feedback or assistance from the teaching staff at any time.

##Getting Started

You can play the Game of Life in MATLAB using an existing simulator:

- Download `lifex.m` and `lexicon.txt` from the [Experiments with MATLAB module](http://www.mathworks.com/moler/exm/exmfilelist.html).
- Change your current MATLAB directory to the folder containing these two files.
- Issue the command `lifex` to randomly display an entity from [Stephen Silver's Life Lexicon](http://www.argentum.freeserve.co.uk/lex_home.htm).
- Press "Step" to view what the entity will look like after one round of the game. Alternatively, press "slow" or "fast" to progress through multiple rounds.
- Press "next" or "random" to check out a different entity.
- If you know the name of an entity in the lexicon that you would like to simulate, give its name as a string option when calling the function lifex. For example, to get a glider, run `lifex('glider')`.
- You can also specify your own initial entity as a matrix of ones and zeros. (Live cells correspond to ones.) Your initial matrix will automatically be padded with neighboring empty cells. Just send the variable name of your matrix as the option when calling the function `lifex`. For example:
```
> G = [1 1 1; 1 0 0; 0 1 0];
> lifex(G)
```
[Glider](glider_screenshot.png)

## Changing the rules of life

The `lifex.m` script is more complicated than most that you will encounter (or write yourself) in this class. The script can read a reference file (`lexicon.txt`), accept different kinds and numbers of arguments (for example, an initial condition can be referenced by name, provided in the form of a matrix, or chosen at random), display results visually, and accept commands through buttons on a graphic user interface. Although those features are important, for now let's focus on the portion of the script that actually implements the game of life (approx. lines 58 through 74).

Your first goal will be to fully understand how these few lines work to implement the rules of life. You may find it useful to display the values in some variables as the program runs, which you can do by removing semicolons from assignments or by typing the variable's name on a separate line.

- What are the dimensions of the matrices `X`, `p`, `q`, and `Y`? (Hint: use the built-in function `size()` if you are unsure.)
- What are the dimensions of `X(:,p)`? Describe qualitatively how this matrix is related to `X`. (Hint: try printing both `X` and `X(:,p)` to the screen.)
- The sum beginning on line 68 has eight terms, each corresponding to a different "neighbor". Which term adds the neighbor to the east (right)? The southwest (bottom left)? Explain.
- What, qualitatively, is the significance of the values in the matrix `Y`?
- Rewrite the Boolean expression on line 74 as a flow chart describing how `X(i,j)` is updated based on the values of `X(i,j)` and `Y(i,j)`. Is it clear how this implements the game of life?

In class, we will mention that self-replication in Life is feasible but challenging to implement with the classic rule set. If we can't win the game, why not change the rules?

- Rewrite the Boolean expression on line 74 so that a dead cell can come to life if it has exactly six neighbors. (Live cells with six neighbors should die, as usual.) Initiate the game of life with the following pattern and describe how this pattern changes over many rounds of the simulation.

[Replicator](replicator_screenshot.png)

## Create Life

Write your own simulator for the Game of Life. It need not have the bells and whistles in `lifex.m`: you are free to describe the format of input and output, the size of the world, and the conditions for deciding when the game "ends." We recommend, however, that you experiment with visualizing at least the initial and final state, in order to familiarize yourself with the plotting functions of MATLAB (or your chosen language).

## Further exploration

Congratulations on completing the (optional) problem set! In case you are excited to learn more, or are looking for final project inspiration, here are some related links:

### Turning back time

What can we infer about the past by looking at the present? Is it always possible to infer the previous state from the current state? Do all states have a previous state? See the wikipedia article on [Gardens of Eden](http://en.wikipedia.org/wiki/Garden_of_Eden_%28cellular_automaton%29).

### Self-replicator in Conway's Game of Life

Follow progress towards the Holy Grail of Conway's Game of Life -- a quadratic self-replicator -- on [Dave Greene's blog](http://conwaylife.com/).

### Other phenomena in Conway's Game of Life

See the community [wiki](http://www.conwaylife.com/wiki/Main_Page) and [forum](http://www.conwaylife.com/forums/).

### Other types of cellular automata

Langton's ant and, more generally, turmites ([wikipedia article](http://en.wikipedia.org/wiki/Langton%27s_ant), [Boolean circuits](http://www.dim.uchile.cl/~anmoreir/oficial/langton_dam.pdf))

Stephen Wolfram (creator of Mathematica)'s book *A New Kind of Science*.

### Evolvable digital organisms

Ofria, Adami, and Brown's *Avida*, in which digital organisms modeled on computers (with evolvable software, and hardware such as CPU and memory) can evolve under fitness constraints including environmental adaptation and ability to solve computational problems. Introductory [PDF](http://www.cse.msu.edu/~ofria/pubs/2009AvidaIntro.pdf) and [Github](https://github.com/devosoft/avida).