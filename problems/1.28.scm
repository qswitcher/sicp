#lang racket
(define (test-all)
    (define (square n) (* n n))
    (define (congruent a b n)
      (= (remainder a n) (remainder b n)))
    
    (define (square-check n m) (if (and (congruent (square n) 1 m) (not (= n 1)) (not (= n (- m 1)))) 0 (remainder (square n) m)))

    (define (expmod base exp m)
        (cond ((= exp 0) 1)
            ((even? exp)
            (square-check (expmod base (/ exp 2) m) m))
            (else
            (remainder (* base (expmod base (- exp 1) m))
                        m))))   
    (define (prime? n)
      (define (try-it a)
        (= (expmod a (- n 1) n) 1))
      (try-it (+ 1 (random (- n 1)))))

    (define (run-test n)
        (newline)
        (if (prime? n) (display "yes") (display "no")))

    ; charmichael numbers
    (run-test 561)
    (run-test 1105)
    (run-test 1729)
    (run-test 2465)
    (run-test 2821)
    (run-test 6601)

    ; prime
    (run-test 491)
    (run-test 499)

    ; not-prime
    (run-test 498)
)
(test-all)
