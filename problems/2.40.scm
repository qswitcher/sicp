#lang racket
(define (run-test)
  (define (runtime) (current-inexact-milliseconds))
  (define (square n) (* n n))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (prime? n)
    (= n (smallest-divisor n)))

  
  (define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
  (define (flatmap proc seq)
    (accumulate append null (map proc seq)))


  (define (enumerate-interval low high)
    (if (> low high)
        null
        (cons low (enumerate-interval (+ low 1) high))))
  
  (define (unique-pairs n)
    (flatmap
     (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n))
    )

  (define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
  (define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))
  
  (define (prime-sum-pairs n)
    (map make-pair-sum
         (filter prime-sum?
                 (unique-pairs n))))

  (prime-sum-pairs 3)
  )
(run-test)
