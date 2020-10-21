#lang racket
(define (sum-test)
    (define (sum term a next b)
        (define (iter a result)
            (if (> a b)
                result
                (iter (next a) (+ (term a) result))))
        (iter a 0))
    
    (define (square x) ( * x x))
    (define (id x) x)
    (define (plus x) (+ x 1))
  
    (display (sum square 0 plus 10))
    (newline)
    (display (sum id 0 plus 10))
)
(sum-test)
