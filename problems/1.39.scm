#lang racket
(define (test-proc)	
  (define (cont-frac n d k)
    (define (cont-frac-iter n d i result)
      (let ((next (cond
                    [(= i k) (/ (n i) (d i))]
                    [(<= i 0) result]
                    [else (/ (n i) (+ (d i) result))]
                    )))
        (if (< i 0) next (cont-frac-iter n d (- i 1) next))))
    (cont-frac-iter n d k 0))

  
  (define (tan-cf x k)
    (define (N i) (if (= i 1) x (* -1 (* x x))))
    (define (D i) (- (* i 2) 1))
    (cont-frac N D k))

  (tan-cf (/ pi 6) 11)
  )
(test-proc)
