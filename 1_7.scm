#| 

a). The good-enough? test used in computing square roots will not be very effective for finding the 
square roots of very small numbers. Also, in real computers, arithmetic operations are almost always 
performed with limited precision. This makes our test inadequate for very large numbers. 
Explain these statements, with examples showing how the test fails for small and large numbers. 

Solution: 

"The good-enough? test used in computing square roots will not be very effective for finding the 
square roots of very small numbers."

Our good-enough? test relies upon testing whether or not (guess^2 - x) < 0.001. 
Very small numbers will always fall under this threshold so the computed square root will be 
less accurate the smaller you go. 

ex. (sqrt 9e-3) ==> 0.09529918575

This is quite close, as the true figure is 0.0948683298. (99.5% accurate)

ex. (sqrt 9e-4) ==> 0.0403006226 

The true value is 0.03; we can see that we lose accuracy 
now that we're computing numbers that are close to the 0.001 threshold. (74.4% accurate)
This holds true the farther we go, as we can see with the next example.

ex. (sqrt 9e-5) ==> 0.0322032432438

The true value is 0.00948683298. (29.5% accurate)

Precision refers to "refinement in a measurement, calculation, or specification, 
especially as represented by the number of digits given." 
Since "arithmetic operations are almost always 
performed with limited precision", trying to calculate a number with too many digits results in
arithmetic overflow; 
the result of a calculation that exceeds the memory space designated to hold it. 
We can see that this happens when we try to calculate the square root of very large numbers.

ex. (sqrt 9e99) will never give a result.




b). An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration 
to the next and to stop when the change is a very small fraction of the guess. 
Design a square-root procedure that uses this kind of end test. 
Does this work better for small and large numbers?

Solution: 

(define (good-enough? guess previousGuess)
    (< (abs (/ (- guess previousGuess) guess)) 0.000000000000001)) 

And then change the main function to:

(define (sqrt-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (sqrt-iter (improve guess x) x)))


|#
