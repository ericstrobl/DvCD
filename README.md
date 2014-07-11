DESCRIPTION
-----------

This is MATLAB code for three algorithms related to kernel-based Markov blanket discovery from *large, high dimensional datasets*. The algorithms were designed to compare the utility of dependence and conditional dependence measures in local causal discovery from gene expression data. 

Practically, these algorithms can help scientistis plan their experiments from observational data, since the top ranked variables from each algorithm are most likely to be causally related to the target.

As a general rule for high dimensional data, we recommend using ExcCD when samples are above several hundred and ExcD or IncD when samples are below several hundred.

CODE
----

Please download the entire package (including the utility functions)

*Main Methods*

- ExcCD.m - Rank variables using a conditional dependence measure with predictor-exclusion kernels

- ExcD.m - Rank variables using a dependence measure with predictor-exclusion kernels

- IncD.m - Rank variables using a dependence measure with predictor-inclusion kernels

*Others*

- demo.m - Examples

