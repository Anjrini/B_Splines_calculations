# B-Spline calculations of basis functions:
Calculating the Cubic Spline (basis function) for step functions of order 1....n where n-> infinity and located between the boundaries.

The script has been implemented in R language to calculate the basis functions of the cubic Splines, polynomials when used in step functions for regressions.
It is indeed a self implementation of the function bs in the library Splines in R.

The values needed to be supplied to the function are:
- x: a vector on which the function is going to be applied
- knots: where are the knots and thos should be located between min(x) till max(x)
- degree: choose the degree of the polynomial where 3 is presenting a cubic spline

The results is a matrix containing the basis functions which can be used in regressions to get more flexible regressions as long as the degree is going up.

Best regards,
Mustafa Anjrini
