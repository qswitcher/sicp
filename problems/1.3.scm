(define (sqrLarge a b c)
  (cond 
    ((and (< a b) (< a c)) (+ (* b b) (* c c)))
    ((and (< b a) (< b c)) (+ (* a a) (* c c)))
    (else                  (+ (* a a) (* b b)))))

(sqrLarge 1 2 3)
(sqrLarge 2 1 3)
(sqrLarge 3 2 1)
