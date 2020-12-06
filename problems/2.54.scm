#lang racket
(define (run-test)  
  (define (equal? a b)
    (cond [(and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b)))]
          [(and (not (pair? a)) (not (pair? b))) (eq? a b)]
          [else #f]))

  (display (equal? '(a b c) '(a b c)))
  (newline)
  (display (equal? '(b a c) '(a b c)))
  (newline)
  (display (equal? '(a (b) c) '(a b c)))
  (newline)
  (display (equal? '(a (b (c))) '(a (b (c)))))
  (newline)
  (display (equal? '(a b c) '(a b)))
  (newline)
  (display (equal? '(this is a list) '(this is a list)))
  (newline)
  (display (equal? '(this is a list) '(this (is a) list)))
  )
(run-test)
