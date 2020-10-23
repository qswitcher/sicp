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

  (define (cont-frac-2 n d k)
    (define (cont-frac-rec n d i)
      (if (= i k) 
          (/ (n k) (d k)) 
          (/ (n i) (+ (d i) (cont-frac-rec n d (+ i 1))))))
    (cont-frac-rec n d 1))

  (display (cont-frac (lambda (_) 1.0) (lambda (_) 1.0) 11)) ; 1.6180339887498948482
  (newline)
  (display (cont-frac-2 (lambda (_) 1.0) (lambda (_) 1.0) 11)) ; 1.6180339887498948482
  )
(test-proc)
