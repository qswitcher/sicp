#lang racket
(define (run-test)
  ; N could grow because of duplicates
  (define (element-of-set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else (element-of-set? x (cdr set)))))

  ; O(1)
  (define (adjoin-set x set) (cons x set))

  ; Same time
  (define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)        
           (cons (car set1)
                 (intersection-set (cdr set1) set2)))
          (else (intersection-set (cdr set1) set2))))

  ; Constant time union
  (define (union-set set1 set2) (append set1 set2))

  (union-set '(1 2) '(3 2 4))

  ; advantageous for applications in which you want fast union times and set creation

  )
(run-test)
