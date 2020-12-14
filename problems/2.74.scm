#lang racket
(define (run-test)
 
  (define (install-div-1-packages)
    (define records '())
    (define (tag x) (cons 'div-1 x))
    (put 'get-record 'div-1
         (lambda (id) (tag (records id))))
    (put 'get-name 'div-1
         (lambda (name) (tag (records name))))
    'done
    )

  (install-div-1-packages)

  
  (define (get-record file id)
    ((get 'get-record (division file)) id))
  (define (get-name file name)
    ((get 'get-name (division file)) name))

  (define (division file) (car file))
   
  )(run-test)
