; a + abs(b), works by substituting between + or - operation
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
