# monte_carlo_1
some odd perl implementation of monte-carlo method for solving y = a*x+b*x^3 with unknown x.

program accept three arguments for 'y', 'a' and 'b' respectively
print out the number of iterations performed, the 'x' value and the calculated 'y' 
has no inf.loop checks and gave inf as a result if function rand() get negative argument
value of error can be changed in the code, now it's set to 0.00000000001
