;; Exercise 1.3.  Define a procedure that takes three numbers as arguments 
;; and returns the sum of the squares of the two larger numbers.

(define (square x) (* x x))

(define (sum_of_squares x y) (+ (square x) (square y)))

(define (sum_of_squares_of_largest_two_of_three x y z)
    (cond ((and (> x y)(> x z)(> y z))(sum_of_squares x y))
          ((and (> x y)(> x z)(< y z))(sum_of_squares x z))
          ((and (< x y)(< x z)(< y z))(sum_of_squares y z))
          ((and (< x y)(< x z)(> y z))(sum_of_squares y z))
          ((and (> x y)(< x z)(< y z))(sum_of_squares x z))
          ((and (< x y)(> x z)(> y z))(sum_of_squares x y))
    ))


;; Testing

(sum_of_squares_of_largest_two_of_three 1 2 3)
(sum_of_squares_of_largest_two_of_three 5 2 6)
(sum_of_squares_of_largest_two_of_three 6 1 2)
