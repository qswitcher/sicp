#lang racket
(define (test-proc)
  (define (make-segment p1 p2)
    (cons p1 p2))
  (define (start-segment line)
    (car line))
  (define (end-segment line)
    (cdr line))
  (define (make-point x y)
    (cons x y))
  (define (x-point p)
    (car p))
  (define (y-point p)
    (cdr p))
  (define (midpoint-segment line)
    (make-point
     (/ (+ (x-point (start-segment line)) (x-point (end-segment line))) 2)
     (/ (+ (y-point (start-segment line)) (y-point (end-segment line))) 2)
     ))
   
  (define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))


  (define line (make-segment (make-point 1 2) (make-point 3 6)))

  (display (print-point (midpoint-segment line)))
  )
(test-proc)
