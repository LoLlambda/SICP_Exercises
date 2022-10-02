#| 

Alyssa P. Hacker doesn't see why if needs to be provided as a special form. 
``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. 
Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0

Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

What happens when Alyssa attempts to use this to compute square roots? Explain.

Solution: The procedure will never finish. Because new-if is a procedure, 
and lisp uses applicative-order evaluation, both the operands will first be evaluated 
no matter whether the predicate is true or false.
Since "sqrt-iter" is the else-clause,
it will then call 'new-if' as part of it's evaluation. Which then calls "sqrt-iter" etc...
We get an infinite loop.

Here's how the special form "if" is evaluated:

"To evaluate an if expression, the interpreter starts by evaluating the <predicate> part of the expression. 
If the <predicate> evaluates to a true value, the interpreter then evaluates the <consequent> and returns its value. 
Otherwise it evaluates the <alternative> and returns its value".

So, if the predicate comes out as true, we never evaluate the alternative, and the infinite loop is avoided.


|#
