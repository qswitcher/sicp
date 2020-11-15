#lang racket
(define (run-test)
  (define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
  
  (define (accumulate-n op init seqs)
    (if (null? (car seqs))
        null
        (cons (accumulate op init (map car seqs))
              (accumulate-n op init (map cdr seqs)))))

  (define m1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
  (define m2 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
  
  (define (dot-product v w)
    (accumulate + 0 (map * v w)))
   
  (define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))
  (display (matrix-*-vector m1 (list 1 2 3 4)))
  (newline)
  
  (define (transpose mat)
    (accumulate-n cons null mat))
  (display (transpose m1))
  (newline)
  
  (define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
      (map (lambda (row) (matrix-*-vector cols row)) m)))
  (display (matrix-*-matrix m1 m2))
  (newline)
  )
(run-test)
