#lang racket
(define (run-test) 
  (define (make-interval a b) (cons a b))
  (define (upper-bound z) (max (car z) (cdr z)))
  (define (lower-bound z) (min (car z) (cdr z)))

  (define (sub-interval x y) 
    (make-interval (- (lower-bound x) (upper-bound y)) 
                   (- (upper-bound x) (lower-bound y)))) 

  )
(run-test)
