;  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; recursive
(define (f n)
    (if (< n 4)
        n
        (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
    )
)

; iterative
;f(n + 1) = f(n) + 2*f(n - 1) + 3*f(n- 2)
; iterative step
; a <- a + 2*b + 3*c
; b <- a
; c <- b

(define (f2 n)
    (if (< n 4)
        n
        (f-iter 3 2 1 (- n 1))
    )
)
(define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
