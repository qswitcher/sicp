#lang racket
(define (run-test)
  (define (element-of-set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else (element-of-set? x (cdr set)))))
  
  (define (union-set set1 set2)
    (define (iter acc dupes)
      (if (null? dupes) acc
          (iter (if
                 (element-of-set? (car dupes) acc)
                 acc
                 (cons (car dupes) acc)
                 )
                (cdr dupes))))
    (iter '() (append set1 set2)))

  (union-set '(1 2) '(3 2 4))

  )
(run-test)
