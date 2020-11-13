#lang racket
(define (run-test)
  (define (subsets s)
    (if (null? s)
        (list null)
        (let ((rest (subsets (cdr s))))
          (append rest (map (lambda (rs) (append (list (car s)) rs)) rest)))))

  (subsets (list 1 2 3 4))

  )
(run-test)
