#lang racket
(define (run-test)
  (define (reverse lst)
    (define (reverse-iter lst result)
      (if (null? lst) result (reverse-iter (cdr lst) (cons (car lst) result))))
    (reverse-iter lst null))
  
  (define (same-parity? x y) (= (modulo x 2) (modulo y 2)))
  
  (define (same-parity x y . z)
    (define (iter lst result)
      (if (null? lst)
          result
          (iter (cdr lst) (if (same-parity? (car lst) x) (cons (car lst) result) result))))
    (reverse (iter z (if (same-parity? x y) (list x y) (list x)))))
    
  (display (same-parity 1 2 3 4 5 6 7))
  (newline)
  (display (same-parity 2 3 4 5 6 7))
  )
(run-test)
