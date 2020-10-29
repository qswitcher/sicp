#lang racket
(define (test-proc)
  (define tolerance 0.00001)

  (define (compose f g) (lambda (x) (f (g x))))

  (define (repeated f n) 
    (if (= n 1) f (compose (repeated f (- n 1)) f))
    )

  (define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

  (define (average a b) (/ (+ a b) 2))
  (define (damp f) (lambda (y) (average y (f y))))
  (define (log2 x) (/ (log x) (log 2))) 

  (define (root x n)
    (define (f y) (/ x (expt y (- n 1))))
    (fixed-point ((repeated damp (floor (log2 n))) f) 1.0))

  ; 1 damp -> up to 3
  ; 2 damp -> up to 7
  ; 3 damp -> up to 15
  ; 4 damp -> up to 31
  ; need floor(log(n)) damps for an nth root
  (define n 31)
  (define r (root 8 n))
  (display r)
  (newline)
  (display (expt r n))
  )
(test-proc)
