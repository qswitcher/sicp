#lang racket
(define (run-test)  
  (define (make-vect x y)
    (cons x y))

  (define (xcor-vect v) (car v))
  (define (ycor-vect v) (cdr v))

  (define (add-vect a b)
    (make-vect (+ (xcor-vect a) (xcor-vect b)) (+ (ycor-vect a) (ycor-vect b)))
    )

  (define (sub-vect a b)
    (make-vect (- (xcor-vect a) (xcor-vect b)) (- (ycor-vect a) (ycor-vect b)))
    )

  (define (scale-vect s v) (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

  (define (make-segment v1 v2)
    (cons v1 v2))
  (define (start-segment line) (car line))
  (define (end-segment line) (cdr line))
  )
(run-test)
