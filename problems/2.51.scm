#lang racket
(define (run-test)  
  (define (below painter1 painter2)
    (let ((split-point (make-vect 0.0 5.0)))
      (let ((paint-bot
             (transform-painter painter1
                                (make-vect 0.0 0.0)
                                (make-vect 0.0 1.0)
                                split-point))
            (paint-top
             (transform-painter painter2
                                split-point
                                (make-vect 1.0 0.5)
                                (make-vect 0.0 1.0))))
        (lambda (frame)
          (paint-bot frame)
          (paint-top frame)))))

 (define (below-2 painter1 painter2) 
   (rotate90 (beside (rotate270 painter1) (rotate270 painter2)))) 
  
  )
(run-test)
