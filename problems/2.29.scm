#lang racket
(define (run-test)
  (define (make-mobile left right)
    (list left right))
  (define (make-branch length structure)
    (list length structure))
  (define (left-branch mobile)
    (car mobile))
  (define (right-branch mobile)
    (car (cdr mobile)))
  (define (branch-length branch)
    (car branch))
  (define (branch-structure branch)
    (car (cdr branch)))

  (define (weight? structure) (not (pair? structure)))
  
  (define (total-weight mobile)
    (if (weight? mobile) mobile
        (let ((l (branch-structure (left-branch mobile)))
              (r (branch-structure (right-branch mobile))))
          (+
           (if (weight? l) l (total-weight l))
           (if (weight? r) r (total-weight r))
           ))))
   
  (define (balanced mobile)
    (or (weight? mobile)
        (let ((l (left-branch mobile))
              (r (right-branch mobile)))
          (and
           (= (* (branch-length l) (total-weight (branch-structure l)))
              (* (branch-length r) (total-weight (branch-structure r))))
           (balanced (branch-structure l))
           (balanced (branch-structure r))
           )))
    )

  (define x (make-mobile
             (make-branch 1 (make-mobile (make-branch 1 1) (make-branch 1 2)))
             (make-branch 2 3)))
  (define yb (make-mobile
              (make-branch 1 (make-mobile (make-branch 2 1) (make-branch 1 2)))
              (make-branch 3 1)))
  (display (total-weight x))
  (newline)
  (display (balanced x))
  (newline)
  (display (balanced yb))
  ; part (d)
  ; only need to remove the 'car's from right-branch and branch-structure
  )
(run-test)
