#lang racket
(define (run-test)
  (define (tree-map proc tree)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
               (tree-map proc sub-tree)
               (proc sub-tree)))
         tree))

  (define (square x) (* x x))
  (define (square-tree tree) (tree-map square tree)) 



  (square-tree (list 2 3 (list 2 4)))
  )
(run-test)
