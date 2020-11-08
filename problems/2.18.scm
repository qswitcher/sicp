#lang racket
(define (run-test) 
  (define (reverse lst)
    (define (reverse-iter lst result)
      (if (null? lst) result (reverse-iter (cdr lst) (cons (car lst) result))))
    (reverse-iter lst null))

  (reverse (list 25 16 9 4 1))
  )
(run-test)
