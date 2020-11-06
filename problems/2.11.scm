#lang racket
(define (run-test) 
  (define (make-interval a b) (cons a b))
  (define (upper-bound z) (max (car z) (cdr z)))
  (define (lower-bound z) (min (car z) (cdr z)))
  
  ; patt |  min  |  max 
  ; ++++ | al bl | ah bh 
  ; ++-+ | ah bl | ah bh 
  ; ++-- | ah bl | al bh 
  ; -+++ | al bh | ah bh 
  ; -+-+ | trouble case 
  ; -+-- | ah bl | al bl 
  ; --++ | al bh | ah bl 
  ; ---+ | al bh | al bl 
  ; ---- | ah bh | al bl 
  
  (define (pos? n) (>= 0)) 
  (define (neg? n) (not (pos? y))) 
  
  (define (mul-interval a b) 
    (let ((al (lower-bound a)) 
          (ah (upper-bound a)) 
          (bl (lower-bound b)) 
          (bh (upper-bound b))) 
      (cond ((and (pos? al) (pos? ah) (pos? bl) (pos? bh)) 
             (make-interval (* al bl) (* ah bh))) 
            ((and (pos? al) (pos? ah) (neg? bl) (pos? bh)) 
             (make-interval (* ah bl) (* ah bh))) 
            ((and (pos? al) (pos? ah) (neg? bl) (neg? bh)) 
             (make-interval (* ah bl) (* al bh))) 
            ((and (neg? al) (pos? ah) (pos? bl) (pos? bh)) 
             (make-interval (* al bh) (* ah bh))) 
            ((and (neg? al) (pos? ah) (neg? bl) (neg? bh)) 
             (make-interval (* ah bl) (* al bl))) 
            ((and (neg? al) (neg? ah) (pos? bl) (pos? bh)) 
             (make-interval (* al bh) (* ah bl))) 
            ((and (neg? al) (neg? ah) (neg? bl) (pos? bh)) 
             (make-interval (* al bh) (* al bl))) 
            ((and (neg? al) (neg? ah) (neg? bl) (neg? bh)) 
             (make-interval (* ah bh) (* al bl))) 
            ((and (neg? al) (pos? ah) (neg? bl) (pos? bh)) 
             ; our trouble case 
             (let ((p1 (* al bl)) 
                   (p2 (* al bh)) 
                   (p3 (* ah bl)) 
                   (p4 (* ah bh))) 
               (make-interval (min p1 p2 p3 p4) 
                              (max p1 p2 p3 p4))))))) 

  )
(run-test)
