#|
Exercise 1.4.  Observe that our model of evaluation allows for combinations 
whose operators are compound expressions. 
Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

Solution: If the predicate (> b 0) evaluates to true (which will happen if b is a positive number), 
the interpreter evaluates the consequent (here, +). We're left with (+ a b). 
If the predicate evaluates to false (which happens when b is negative), 
we get the alternative (giving us (- a b)). As subtracting a negative number is functionally identical to adding a positive one, 
the resulting procedure gives us "a + |b|".

|#
