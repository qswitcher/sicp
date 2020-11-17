#lang racket
(define (run-test) 
  (define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
  (define (flatmap proc seq)
    (accumulate append null (map proc seq)))


  (define (enumerate-interval low high)
    (if (> low high)
        null
        (cons low (enumerate-interval (+ low 1) high))))
  


  (define (unique-triplets n)
    (flatmap
     (lambda (i)
       (flatmap
        (lambda (j)
          (map (lambda (k) (list i j k))
               (enumerate-interval 1 (- j 1))))
        (enumerate-interval 1 (- i 1)))
       )
     (enumerate-interval 1 n)))

  (define (make-triplet-sum trip)
    (list (car trip) (cadr trip) (car (cdr (cdr trip))) (+ (car trip) (cadr trip) (car (cdr (cdr trip))))))
  
  (define (sum-triplets s)
    (define (sum-eq? trip)
      (= (+ (car trip) (cadr trip) (car (cdr (cdr trip)))) s)
      )
    (map make-triplet-sum
         (filter sum-eq? (unique-triplets s))))
  
  (sum-triplets 20)
  )
(run-test)
