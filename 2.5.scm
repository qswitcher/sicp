#lang racket
(define (test-run)
  (define (cons x y) 
    (* (expt 2 x) (expt 3 y)))

  (define (divides? n p) (= (modulo n p) 0))

  (define (times-divides n p)
    (define (times-divides-iter n p result)
      (if (divides? n p) (times-divides-iter (/ n p) p (+ result 1)) result))
    (times-divides-iter n p 0))

  (define (car z) (times-divides z 2))

  (define (cdr z) (times-divides z 3))

  (define arr (cons 6 7))
  (display (car arr))
  (newline)
  (display (cdr arr))
  )

(test-run)
