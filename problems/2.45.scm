#lang racket
(define (run-test)  
  (define (split proc1 proc2)
    (define (proc painter n)
      (if (= n 0)
          painter
          (let ((smaller (proc painter (- n 1))))
            (proc1 painter (proc2 smaller smaller))))))

  (define right-split (split beside below))
  (define up-split (split below beside))
  )
(run-test)
