#lang racket
(define (apply-generic op . args)
  (define (convert to-type all-args)
    (define (iter args acc)
      (if (null? rest)
          acc
          (let (
                (arg (car args))
                (t1->t2 (or (and (eq? (tag arg) to-type) identity) (get-coercion (tag arg) to-type)))
                (if t1->t2
                    (iter (cdr args) (cons (t1->t2 arg) acc))
                    '())
                ))
          )
      )
    (reverse (iter types '())))

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (> (length args) 1)
              (let
                  ((args-conv (foldl (lambda (to-type init)
                                       (if (null? init) (convert to-type args) init))
                                     type-tags)))
                (if args-conv
                    (apply apply-generic (cons op args-conv))
                    (error "No method for these types"
                           (list op type-tags))))
              (error "No method for these types"
                     (list op type-tags)))))))