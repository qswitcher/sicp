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

  (define (N i) 1.0)
  (define (D i) (cond
                  [(= i 1) 1.0]
                  [(= (remainder (- i 2) 3) 0) (/ (* 2.0 (+ i 1.0)) 3.0)]
                  [else 1.0]))
 
  (display (cont-frac N D 11)) ; 2.7182818284590452353602874713527
  )
(test-proc)
