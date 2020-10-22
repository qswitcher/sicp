#lang racket
(define (filtered-accumulate-test)
    (define (square n) (* n n))
    (define (prime? n)
        (define (smallest-divisor n)
            (find-divisor n 2))
        (define (next n)
            (if (= n 2) 3 (+ 2 n)))
        
        (define (find-divisor n test-divisor)
            (cond ((> (square test-divisor) n) n)
                    ((divides? test-divisor n) test-divisor)
                    (else (find-divisor n (next test-divisor)))))
        (define (divides? a b)
            (= (remainder b a) 0))
        (= n (smallest-divisor n)))

    (define (filtered-accumulate filter combiner null-value term a next b)
        (define (iter a result)
            (if (> a b)
                result
                (iter (next a) 
                    (if (filter (term a)) 
                        (combiner (term a) result) 
                        result
                    )
                )
            )
        )
        (iter a null-value)
    )
    
    (define (sum-primes a b) (filtered-accumulate prime? + 0 identity a add1 b))
   
    (display (sum-primes 2 10))
    (newline)
    (display (sum-primes 2 100))
    (newline)

    (define (gcd a b)
        (if (= b 0)
            a
            (gcd b (remainder a b))))
        
    (define (rel-primes a b) 
        (define (rel-prime? a) (= (gcd a b) 1))
        (filtered-accumulate rel-prime? + 0 identity a add1 b)
    )

    (display (rel-primes 2 10))
    (newline)
    (display (rel-primes 2 100))
    (newline)
)
(filtered-accumulate-test)
