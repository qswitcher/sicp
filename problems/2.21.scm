#lang racket
(define (run-test)
  (define (square x) (* x x))
  (define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))
  
  (define (square-list-1 items)
    (if (null? items)
        null
        (cons (square (car items)) (square-list-1 (cdr items)))))
  
  (define (square-list-2 items)
    (map square items))

  (display (square-list-1 (list 1 2 3 4 5)))
  (newline)
  (display (square-list-2 (list 1 2 3 4 5)))
  )
(run-test)
