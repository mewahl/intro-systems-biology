## Suggested reading:

Brian Douglas has made some wonderful [Khan-style videos describing the use of Nyquist plots](https://www.youtube.com/watch?v=sof3meN96MA): this ~16 minute video would likely be the most expedient way to clarify concepts introduced in class.

Segel 3-3 (PDF in this directory): Works through the two-step repressor system example that we began in class today and will continue Monday. It may help to have read the material in advance.

Ogata 11-4 and 11-5 (PDF in this directory): For further information on Nyquist plots if needed.

## In-class demos:

We will use a MATLAB simulation of a linear and time-invariant system whose impulse-response function is an exponentially-decaying sinusoid (as on question 3 of problem set 4). Some relevant scripts are given in this directory. Inputs are represented as multiples of the Dirac delta function for each time bin. The output is shown as a waveform and played as a sound. Change inputs by commenting/uncommenting lines in the `chimescontroller()` script.

To compare how the locations of zeros and poles, and the form of Nyquist plots, respond to shifting (e.g., G(s) vs. 1 + G(s)) and scaling (e.g., G(s) vs. kG(s)), try fiddling with the parameters the script `compare_nyquist_and_zeros.m`

Brian Douglas's video shows/links to a demo where you can trace contours in s-space and see their corresponding plots in w-space. Unfortunately his scripts do not work as provided in MATLAB 2014b. Here is the marginally-functioning version we used in class: `Interact.m`