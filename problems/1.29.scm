#lang racket
(define (test-all)
    (define (integral f a b n)
        (define (sum term i)
            (if (> i n)
                0
                (+ (term i) (sum term (+ i 1)))))

        (define h (/ (- b a) n))

        (define (next x i) (+ x h))

        (define (y i) 
            (define yi (f (+ a (* i h))))
            (cond 
                [(or (= i 0) (= i n)) yi]
                [(even? i) (* 2 yi)]
                [else (* 4 yi)]))

        (/ (* (sum y 0) h) 3))
    
    (define (cube x) (* x (* x x)))
    ; did 0 - 0.5 which is 0.015625 since Racket was printing 1/4 for 0 to 1
    (display (integral cube 0 0.5 100))
    (newline)
    (display (integral cube 0 0.5 1000))
)
(test-all)
