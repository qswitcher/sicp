#lang racket
(define (test-proc)
    (define (f g) (g 2))
    (define (square n) (* n n))
    (display (f square))
    (display (f (lambda (z) (* z (+ z 1)))))
)
(test-proc)

(f f)
(f 2)
(2 2) not a produre for "2"
