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

  (define (adjoin-position new-row k rest-of-queens) (cons (cons new-row k) rest-of-queens))
  (define empty-board (list ))
  (define (same-diag? p1 p2)
    (let ((x1 (car p1))
          (y1 (cdr p1))
          (x2 (car p2))
          (y2 (cdr p2)))
      (= 1 (abs (/ (- y1 y2) (- x1 x2))))
      ))
  
  (define (safe? k positions)
    (let ((p (car positions))
          (rest (cdr positions)))
      (null? (filter (lambda (pos)
                       (or
                        (= (car pos) (car p))
                        (= (cdr pos) (cdr p))
                        (same-diag? pos p)
                        ))
                     rest))
      ))

  (define (queens board-size)
    (define (queen-cols k)  
      (if (= k 0)
          (list empty-board)
          (filter
           (lambda (positions) (safe? k positions))
           (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
    (queen-cols board-size))

  (queens 5)
  )
(run-test)
