#lang racket
(define (search-for-primes N)
  (define (runtime) (current-inexact-milliseconds))
  (define (square n) (* n n))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (next n)
    (if (= n 2) 3 (+2 n)))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (prime? n)
    (= n (smallest-divisor n)))
    
  (define (start-prime-test n start-time)
    (cond
      [(prime? n) (report-prime n (- (runtime) start-time))]))
  (define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time))
  (define (timed-prime-test n)
    (start-prime-test n (runtime)))
  
  (define (search-for-primes-iter count nMax result)
    (cond
      [(< count nMax) (search-for-primes-iter (+ count 2) nMax (timed-prime-test count))]))
  (search-for-primes-iter 3 N (void)))

(search-for-primes 1000000)

; before 999983 *** 0.057861328125
; after 999983 *** 0.050048828125
; the ratio is ~1.22 < 2.0 because there's the extra IF test for each number in `next`
