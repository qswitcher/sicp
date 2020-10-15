(define (double n) (* 2 n))
(define (halve n) (/ n 2))

(define (even? n)
  (= (mod n 2) 0))

(define (fast-mult A B)
  (define (fast-mult-iter a b c)
    (cond ((= b 0) c)
        ((even? b) (fast-mult-iter (double a) (halve b) c))
        (else (fast-mult-iter a (- b 1) (+ a c)))))
  (fast-mult-iter A B 0)

(fast-mult 3 5)
