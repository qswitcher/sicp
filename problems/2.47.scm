#lang racket
(define (run-test)  
  (define (make-frame origin edge1 edge2)
    (list origin edge1 edge2))

  (define (origin frame) (car frame))
  (define (edge1 frame) (car (cdr frame)))
  (define (edge2 frame) (car (cdr (cdr frame))))


  (define (make-frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))

  (define (origin frame) (car frame))
  (define (edge1 frame) (car (cdr frame)))
  (define (edge2 frame) (cdr (cdr frame)))
  
  )
(run-test)
