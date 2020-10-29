#lang racket
(define (test-proc)
  (define (square x) (* x x))
  (define (compose f g) (lambda (x) (f (g x))))

  (define (repeated f n) 
    (if (= n 1) f (compose (repeated f (- n 1)) f))
  )
  
  (define dx 0.00001)
  
  (define (smooth f n)
    (repeated (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)) n)
  )

  ((smooth square 2) 1)
  )
(test-proc)