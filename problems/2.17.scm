#lang racket
(define (run-test) 
  (define (last-pair items) 
    (let ((rest (cdr items))) 
      (if (null? rest) 
          items 
          (last-pair rest)))) 
  (display (last-pair (list 23 72 149 34)))
  (newline)
  (display (last-pair null))
  )
(run-test)
