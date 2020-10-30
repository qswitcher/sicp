#lang racket
(define (test-proc)
  (define (make-point x y)
    (cons x y))
  (define (x-point p)
    (car p))
  (define (y-point p)
    (cdr p))
  (define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

  ; bottom left-point plus height and width
  (define (make-rectangle p h w)
    (cons p (cons h w)))
  (define (origin rect)
    (car rect))
  (define (width rect)
    (cdr (cdr rect)))
  (define (height rect)
    (car (cdr rect)))
  (define (area rect)
    (* (width rect) (height rect)))
  (define (perimeter rect)
    (+ (* (width rect) 2) (* (height rect) 2)))

  (define r (make-rectangle (make-point 1 1) 2 4))
  (display (area r))
  (newline)
  (display (perimeter r))
  )
(test-proc)
