#lang racket
(define (run-test)
  (define (reverse lst)
    (define (reverse-iter lst result)
                 (if (null? lst) result (reverse-iter (cdr lst) (cons (reverse (car lst)) result))))
    (if (pair? lst) (reverse-iter lst null) lst))
  
  (define x (list (list 1 2) (list 3 4)))

  (reverse x)
  )
(run-test)
