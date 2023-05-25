#lang racket

; a) The exponentiation b^e (for natural numbers b and e) can be quickly executed using b^e = (b^(e/2))^2.
;     Using this property please define functions (exp b e) whose value is b^e, one recursive function and one using accumulation.

; b) For both versions please show how the expression (exp 2 6) is evaluated.

> (define (even? n)
  (= (remainder n 2) 0))

> (define (square x)
  (* x x))

; > (define (exp b e)
;     (cond ((= e 0) 1)
;           ((even? e) (square (exp b (/ e 2))))
;           (else (* b (exp b (- e 1))))
;     ))

; > (exp 2 3)
; (* 2 (exp 2 (- 3 1)))
; (* 2 (exp 2 2))
; (* 2 (square (exp 2 (/ 2 2))))
; (* 2 (square (exp 2 1)))
; (* 2 (square (* 2 (exp 2 (- 1 1)))))
; (* 2 (square (* 2 (exp 2 0)))))
; (* 2 (square (* 2 1))))
; (* 2 (square 2))
; (* 2 4)
; 8


> (define (exp-accum b e acc)
    (cond ((= e 0) acc)
          ((even? e) (exp-accum (square b) (/ e 2) acc))
          (else (exp-accum b (- e 1) (* acc b)))))

> (define (exp b e)
  (exp-accum b e 1))


> (exp 2 3)
; (exp-accum 2 3 1)
; (exp-accum 2 2 2)
; (exp-accum 4 1 2)
; (exp-accum 4 0 8)
; 8
