; computes value at m and n 
(define (pascal m n)
    (cond 
        ((< m 0) 0)
        ((< n 0) 0)
        ((= m 1) 1)
        ((= n 1) 1)
        (else (+ (pascal (- m 1) (- n 1)) (pascal (- m 1) n)))))
