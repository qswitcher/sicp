#lang racket
(define (test-proc)
  ; fixed-point
  (define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

  ; sqrt-iter
  (define (sqrt-iter guess x)
    (define (square x) (* x x))
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))

  (display (sqrt-iter 9.0 9))
  (newline)
  (display (fixed-point cos 1.0))

  ; iter-improve
  (define (iterative-improve good-enough? improve)
    (define (iter-improve guess)
      (if (good-enough? guess)
          guess
          (iter-improve (improve guess))))
    (lambda (initial-guess) (iter-improve initial-guess))
    )

  ; fixed-point-iter-improve
  (define (fixed-point-iter-improve f initial-guess)
    (define tolerance 0.00001)
    (define (good-enough? guess)
      (< (abs (- (f guess) guess)) tolerance))
    (define (improve guess) (f guess))
    ((iterative-improve good-enough? improve) initial-guess)
    )
  
  ; sqrt-iter-improve
  (define (sqrt-iter-improve x)
    (define (square x) (* x x))
    (define (average x y)
      (/ (+ x y) 2))
    (define (good-enough? guess)
      (< (abs (- (square guess) x)) 0.001))
    (define (improve guess)
      (average guess (/ x guess)))
    ((iterative-improve good-enough? improve) x))

  (newline)
  (display (sqrt-iter-improve 9.0))
  (newline)
  (display (fixed-point-iter-improve cos 1.0))
  )
(test-proc)
