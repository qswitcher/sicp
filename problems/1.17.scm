(define (double n) (* 2 n))
(define (halve n) (/ n 2))

(define (even? n)
  (= (mod n 2) 0))

(define (rec-mult a b)
    (cond ((= b 1) a)
        ((even? b) (rec-mult (double a) (halve b)))
        (else (+ a (rec-mult a (- b 1))))))

(rec-mult 3 5)
