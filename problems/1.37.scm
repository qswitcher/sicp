#lang racket
(define (test-proc)	
  (define (cont-frac n d k)
    (define (cont-frac-iter n d i result)
        (let ((next (cond
            [(= i k) (/ (n i) (d i))]
            [(<= i 0) result]
            [else (/ (n i) (+ (d i) result))]
        )))
        (if (< i 0) next (cont-frac-iter n d (- i 1) next))))s
    (cont-frac-iter n d k 0))

  (cont-frac (lambda (_) 1.0) (lambda (_) 1.0) 11) ; 1.6180339887498948482
)
(test-proc)
