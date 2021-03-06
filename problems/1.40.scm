#lang racket
(define (test-proc)
  (define tolerance 0.00001)
  (define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))
  
  (define (newtons-method g guess)
    (define dx 0.00001)
    (define (deriv g)
      (lambda (x)
        (/ (- (g (+ x dx)) (g x))
           dx)))
    (define (newton-transform g)
      (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))
    (fixed-point (newton-transform g) guess))


  (define (cubic a c b)
    (lambda (x)
      (+ (* x x x) (* a x x) (* b x) c)))
  
  (newtons-method (cubic 1.0 1.0 1.0) 1)


  )
(test-proc)
