# Bayesian Modeling using Stan

Stan is an open-source, Bayesian inference tool with interfaces in R, Python, Matlab, Julia, Stata, and the command line. Users write statistical models in a high-level statistical language. The default Bayesian inference algorithm is the no-U-turn sampler (NUTS), an auto-tuned version of Hamiltonian Monte Carlo. Stan was developed to address the speed and scalability issues of existing Bayesian inference tools.

The goal of the workshop is the practical application of Stan to different models, via the RStan and PyStan interfaces. Each day will be divided into three sections:

1. Bayesian Statistics and MCMC
2. Coding models in RStan
3. Case studies in biostatistics (days 1 and 2)

The afternoon on the third day will allow users to bring their own data and prototype a model for it using Stan.

Instructors: [Bob Carpenter](https://github.com/bob-carpenter) (Columbia University), [Daniel Lee](https://github.com/syclik) (Columbia University), Chris Fonnesbeck (Vanderbilt University)

Event Timing: May 31 - June 2, 2016, 9:00 - 16:00  
Event Address: [Featheringill Hall 136](https://www.google.com/maps/place/Featheringill+Hall/@36.1447708,-86.8055131,17z/data=!3m1!4b1!4m5!3m4!1s0x886466bd355f5741:0x3ae06da3496821a0!8m2!3d36.1447708!4d-86.8033244)

The slides presented at the workshop can be [downloaded here](http://mc-stan.org/workshops/vanderbilt2016/)

## Schedule

### Day One
- Intro to Stan
	- Supporting reproducible research
	- First examples
	- I/O in the RStan interface
- Intro to Bayesian Statistics
- Components of a Stan Program
	- Basic data types and variable declarations
	- Variable constraints and transform to unconstrained scale
	- Program blocks and execution: data, parameters, model
	- Derived quantities
	- Functions, operators, statements
	- Debugging and error handling
	- User-defined functions
	- Solving ordinary differential equations (ODE)
- Working with RStan

### Day Two

- Inference with Markov Chain Monte Carlo
	- Monte Carlo methods and plug-in inference
	- Markov chain Monte Carlo (MCMC)
	- Warmup adaptation
	- Diagnosing convergence with R-hat
	- Effective sample size vs. number of iterations
- Stan Programming Techniques
	- Reproducible research practices
	- Probabilistic programming principles
	- Generated quantities for inference
	- Data simulation and model checking
	- Posterior predictive checks
	- Marginalizing discrete parameters
	- Handling missing data
	- Ragged and sparse data structures

### Day Three

- Stan Programming Techniques (continued)
- Topics in Applied Modeling with Stan
	- A few case studies
	- Bring your own statistical models

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3221.8949587563097!2d-86.80551308477725!3d36.14477078008877!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x886466bd355f5741%3A0x3ae06da3496821a0!2sFeatheringill+Hall!5e0!3m2!1sen!2sus!4v1462888357093" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

Questions? Contact chris.fonnesbeck@vanderbilt.edu