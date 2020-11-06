#lang racket
(define (run-test) 
  (define (make-interval a b) (cons a b))
  (define (upper-bound z) (max (car z) (cdr z)))
  (define (lower-bound z) (min (car z) (cdr z)))
  
  (define (make-center-percent c p)
    (make-interval (- c (* c p)) (+ c (* c p))))
  (define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))
  (define (percent i)
    (/ (/ (- (upper-bound i) (lower-bound i)) 2)) (center i))



  )
(run-test)
