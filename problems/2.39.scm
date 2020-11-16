#lang racket
(define (run-test)
  (define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
  (define fold-right accumulate)
  (define (fold-left op initial sequence)
    (define (iter result rest)
      (if (null? rest)
          result
          (iter (op result (car rest))
                (cdr rest))))
    (iter initial sequence))

  (define (reverse-r sequence)
    (fold-right (lambda (x y) (append y (list x))) null sequence))
  (define (reverse-l sequence)
    (fold-left (lambda (x y) (append x (list y))) null sequence))
  
  (display (reverse-r (list 1 2 3)))
  (newline)
  (display (reverse-l (list 1 2 3)))
  (newline)
  )
(run-test)
