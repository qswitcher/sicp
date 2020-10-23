#lang racket
(define (test-proc)
     (define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
)
(test-proc)

; x -> 1 + 1/x
; (1 + sqrt(5))/2 -> 1 + 2/(1 + sqrt(5))
; = (1 + sqrt(5) + 2)/(1 + sqrt(5)) = (3 + sqrt(5))/(1 + sqrt(5))
; = (3 + sqrt(5))(1 - sqrt(5))/(-4) = (3 - 2sqrt(5) - 5)/(-4)
; = (2sqrt(5) + 2)/4 = (1 + sqrt(5)/2 
; QED
