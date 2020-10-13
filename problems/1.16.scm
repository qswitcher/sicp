(define (even? n)
  (= (mod n 2) 0))

(define (square n) (* n n))

(define (fast-expt B N)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* b a)))))
  (fast-expt-iter B N 1)
)

(fast-expt 2 5)
