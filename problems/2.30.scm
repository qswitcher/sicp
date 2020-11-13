#lang racket
(define (run-test)
  (define (square-tree tree)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
               (square-tree sub-tree)
               (* sub-tree sub-tree)))
         tree))


  (square-tree (list 2 3 (list 2 4)))
  )
(run-test)
