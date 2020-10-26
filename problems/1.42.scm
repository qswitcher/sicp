#lang racket
(define (test-proc)
  (define (square x) (* x x))
  (define (compose f g) (lambda (x) (f (g x))))
  ((compose square add1) 6)


  )
(test-proc)
