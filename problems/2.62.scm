#lang racket
(define (run-test)
  (define (element-of-set? x set)
    (cond ((null? set) false)
          ((= x (car set)) true)
          ((< x (car set)) false)
          (else (element-of-set? x (cdr set)))))
  
  (define (adjoin-set x set)
    (cond ((null? set) '(x))
          ((< x (car set)) (cons x set))
          ((= x (car set)) set)
          (else (adjoin-set x (cdr set))))
    )

  (define (intersection-set set1 set2)
     (if (or (null? set1) (null? set2))
         '()    
         (let ((x1 (car set1)) (x2 (car set2)))
           (cond ((= x1 x2)
                  (cons x1
                        (intersection-set (cdr set1)
                                          (cdr set2))))
                 ((< x1 x2)
                  (intersection-set (cdr set1) set2))
                 ((< x2 x1)
                  (intersection-set set1 (cdr set2)))))))


   ; linear time union
   (define (union-set set1 set2)
     (define (iter s1 s2 acc)
       (cond ((null? s1) (append (reverse acc) s2))
             ((null? s2) (append (reverse acc) s1))
             ((= (car s1) (car s2)) (iter (cdr s1) (cdr s2) (cons (car s1) acc)))
             ((< (car s1) (car s2)) (iter (cdr s1) s2 (cons (car s1) acc)))
             (else (iter s1 (cdr s2) (cons (car s2) acc)))))
     (iter set1 set2 '()))

   (union-set '(1 2 5) '(2 3 4 7))


  

   )
  (run-test)
  