#lang racket
(define (run-test)
  (define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

  
  (define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) null sequence))
  
  (define (append seq1 seq2)
    (accumulate cons seq2 seq1))
  
  (define (length sequence)
   (accumulate (lambda (x sum) (add1 sum)) 0 sequence))
  
  (define (square x) (* x x))
  (display (map square (list 1 2 3 4)))
  (newline)
  (display (append (list 1 2) (list 3 4)))
  (newline)
  (display (length (list 1 2 3 4)))
  )
(run-test)
