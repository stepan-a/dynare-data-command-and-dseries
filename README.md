Provides an example showing how to estimate a model by passing directly a dseries object to the estimation command. After the declaration of the model, between lines 28 and 31, I create a sample by simulating data from a first order autoregressive stochastic process. The `dseries` object `z` contains a variable called `y` which will be declared latter as the observed variable (line 50). The `data` command, one line 34, instructs Dynare that the subsample between 1970Q1 and 2050Q1 will be used for the estimation of the moving average model of order 9. 
