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

  (define make-segment const)
  (define start-segment car)
  (define end-segment cdr)

  (define pa (segments->paint
              (list
               (make-segment (make-vect 0 0) (make-vect 0 1))
               (make-segment (make-vect 0 1) (make-vect 1 1))
               (make-segment (make-vect 1 1) (make-vect 1 0))
               (make-segment (make-vect 1 0) (make-vect 0 0))
               )))
  (define pb (segments->paint
              (list
               (make-segment (make-vect 0 0) (make-vect 1 1))
               (make-segment (make-vect 0 1) (make-vect 1 0))
               )))
  )
(run-test)
