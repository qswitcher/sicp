#lang racket
(define (product-test)
    (define (product term a next b)
        (define (iter a result)
            (if (> a b)
                result
                (iter (next a) (* (term a) result))))
        (iter a 1))

    (define (factorial n) 
        (product identity 1 add1 n))
  
    ; factorial
    (display (factorial 0))
    (newline)
    (display (factorial 1))
    (newline)
    (display (factorial 4)) ; 4!
    (newline)
 

    ; pi/4 approximation
    (define (pi-div-4 n)
        (define (num-term iter) 
            (+ (if (even? iter) 2 1) iter))
        (define (den-term iter)
            (+ (if (even? iter) 1 2) iter))
        (define a (real->double-flonum (product num-term 1 add1 n)))
        (define b (real->double-flonum (product den-term 1 add1 n)))
        (/ a b)
    )

    ; 0.7853981633974483
    (display (pi-div-4 150))
)
(product-test)

; 2 4 4 6 6 8 8 10 10
; 1 2 3 4 5 6 7  8  9
; 1 2 1 2 1 2 1  2  1

; 3 3 5 5 7 7 9 9
; 1 2 3 4 5 6 7 8
; 2 1 2 1 2 1 2 1
