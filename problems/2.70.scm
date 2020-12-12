#lang racket
(define (run-test)
  (define (make-leaf symbol weight)
    (list 'leaf symbol weight))
  (define (leaf? object)
    (eq? (car object) 'leaf))
  (define (symbol-leaf x) (cadr x))
  (define (weight-leaf x) (caddr x))
  (define (make-code-tree left right)
    (list left
          right
          (append (symbols left) (symbols right))
          (+ (weight left) (weight right))))
  (define (left-branch tree) (car tree))

  (define (right-branch tree) (cadr tree))
  (define (symbols tree)
    (if (leaf? tree)
        (list (symbol-leaf tree))
        (caddr tree)))
  (define (weight tree)
    (if (leaf? tree)
        (weight-leaf tree)
        (cadddr tree)))
  
  (define (decode bits tree)
    (define (decode-1 bits current-branch)
      (if (null? bits)
          '()
          (let ((next-branch
                 (choose-branch (car bits) current-branch)))
            (if (leaf? next-branch)
                (cons (symbol-leaf next-branch)
                      (decode-1 (cdr bits) tree))
                (decode-1 (cdr bits) next-branch)))))
    (decode-1 bits tree))
  (define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
          ((= bit 1) (right-branch branch))
          (else (error "bad bit -- CHOOSE-BRANCH" bit))))

  (define (sanitize x) (string->symbol (string-upcase (symbol->string x)))) 
  (define (contains list x)
    (cond ((null? list) #f)
          ((equal? (sanitize (car list)) (sanitize x)) #t)
          (else (contains (cdr list) x))))

  (define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))))
  
  (define (encode-symbol c tree)
    (define (encode-1 bits branch)
      (if (leaf? branch) (reverse bits)
          (if (contains (symbols (left-branch branch)) c)
              (encode-1 (cons 0 bits) (left-branch branch))
              (encode-1 (cons 1 bits) (right-branch branch))
              )))
    (encode-1 '() tree))

  ;(define sample-tree
  ; (make-code-tree (make-leaf 'A 4)
  ;                (make-code-tree
  ;                (make-leaf 'B 2)
  ;               (make-code-tree (make-leaf 'D 1)
  ;                              (make-leaf 'C 1)))))

  (define (adjoin-set x set)
    (cond ((null? set) (list x))
          ((< (weight x) (weight (car set))) (cons x set))
          (else (cons (car set)
                      (adjoin-set x (cdr set))))))


  
  (define (make-leaf-set pairs)
    (if (null? pairs)
        '()
        (let ((pair (car pairs)))
          (adjoin-set (make-leaf (car pair)    ; symbol
                                 (cadr pair))  ; frequency
                      (make-leaf-set (cdr pairs))))))

  (define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))
  (define (successive-merge leaves)
    (define (iter leaves)
      (if (null? (cdr leaves)) (car leaves)
          (iter (adjoin-set (make-code-tree (car leaves) (cadr leaves)) (cddr leaves)))))
    (iter leaves))

  (define rocktree (generate-huffman-tree '((WAH 1) (BOOM  1) (A 2) (GET 2) (JOB 2) (SHA 3) (YIP 9) (NA 16)))) 
  (display rocktree)
  (newline)
  (define rock-song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))
  
  ; 84 bits we would need 108 bits if we used a fix length code
  (display (length (encode rock-song rocktree)))

  )(run-test)
