# Trading_game consits of two scripts, that were written for the Trading game. In the directory "data" you can find the example files, that we input in the program.
1) "optimization_ratio.R" is based on the Excel file provided by prof. Zwinkels and rewrites the same steps, that are done in the Excel:
- computing log returns of the stocks;
- building up the covariance matrix;
- function that returns the formula that we use for optimization;
- "optim" function for finding the maximum ratio.   
2) "garch.R" is written to calculate the expected volatility model in the last week using GARCH
script is written based on the course "Fundamentals to Advanced R Programming LiveLessons" on the platform https://www.safaribooksonline.com using "Rugarch" package
and consits of the following steps:
- calculating the log prices;
- builting up the specification for this model; 
- fitting the model;
- using "ugarchboot" function to forecast time series for 7 periods ahead.

