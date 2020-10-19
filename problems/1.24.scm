#lang racket
(define (search-for-primes N)
  (define (runtime) (current-inexact-milliseconds))
  (define (square n) (* n n))
 
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
          (remainder (* base (expmod base (- exp 1) m))
                      m))))        
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  (define (prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))
    
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
