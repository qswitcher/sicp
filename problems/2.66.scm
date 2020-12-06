#lang racket
(define (run-test)
  (define (key tree) (car tree))
  (define (entry tree) (cadr tree))
  (define (left-branch tree) (caddr tree))
  (define (right-branch tree) (cadddr tree))
  (define (make-tree key entry left right)
    (list key entry left right))


  
  (define (element-of-set? k records)
    (cond ((null? records) #f)
          ((= k (key records)) (entry records))
          ((< k (key records))
           (element-of-set? k (left-branch records)))
          ((> k (key records))
           (element-of-set? k (right-branch records)))))

  (define tree (make-tree 3 "bob"
                          (make-tree 1 "mike" null null)
                          (make-tree 5 "joe" (make-tree 4 "bill" null null) null)))

  (display (element-of-set? 4 tree))
  (newline)
  (display (element-of-set? 10 tree))
                                                                                              
  )
(run-test)
