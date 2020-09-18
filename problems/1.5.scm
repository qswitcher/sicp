(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
  
;(test 0 (p))

; normal formal
;(if (= 0 0) 0 (p))
;(if (= 0 0) 0 (p))
; evluates to 0

; applicative-order
; never terminates because (p) is infinitely expanded to itself
(test 0 (p))
(test 0 (p))
(test 0 (p))



