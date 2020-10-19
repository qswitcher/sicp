#lang racket
(define (carmichael-test-all)
    (define (square n) (* n n))
    (define (congruent a b n)
      (= (remainder a n) (remainder b n)))
    (define (expmod base exp m)
        (cond ((= exp 0) 1)
            ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                        m))
            (else
            (remainder (* base (expmod base (- exp 1) m))
                        m))))
    (define (carmichael-test n)
        (define (carmichael-test-iter n a)
            (cond ((= a 1) #t)
                ((congruent (expmod a n n) a n) (carmichael-test-iter n (- a 1)))
                (else #f))
        )
        (if (carmichael-test-iter n (- n 1)) (display "yes") (display "no"))
        (newline)
    )
    (carmichael-test 561)
    (carmichael-test 1105)
    (carmichael-test 1729)
    (carmichael-test 2465)
    (carmichael-test 2821)
    (carmichael-test 6601)
    (carmichael-test 499)
    (carmichael-test 498)
)
(carmichael-test-all)
