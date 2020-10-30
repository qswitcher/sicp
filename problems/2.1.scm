#lang racket
(define (test-proc)
  (define (make-rat n d)
    (let (
          (g (gcd n d))
          (sign (if (or (and (< n 0) (< d 0)) (and (> n 0) (> d 0))) 1 -1))
          )
      (cons (* sign (/ (abs n) g)) (/ (abs d) g))))
 

  (display (make-rat -2 -4))
  (newline)
  (display (make-rat -2 4))
  (newline)
  (display (make-rat 2 -4))
  (newline)
  (display (make-rat 2 4))
  )
(test-proc)
