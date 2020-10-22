#lang racket
(define (accumulate-test)
    (define (accumulate combiner null-value term a next b)
        (define (iter a result)
            (if (> a b)
                result
                (iter (next a) (combiner (term a) result))))
        (iter a null-value)
    )
    
    (define (sum term a next b) (accumulate + 0 term a next b))
    (define (product term a next b) (accumulate * 1 term a next b))
   
    (define (square x) ( * x x))
    (define (id x) x)
  
    (display (sum square 0 add1 10))
    (newline)
    (display (sum identity 0 add1 10))
    (newline)

    (define (factorial n) 
        (product identity 1 add1 n))
  
    ; factorial
    (display (factorial 0))
    (newline)
    (display (factorial 1))
    (newline)
    (display (factorial 4)) ; 4!
    (newline)

)
(accumulate-test)
