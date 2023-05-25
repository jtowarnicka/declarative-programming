#lang racket

; Please define a function (same-values? p1 p2 x y) whose value is #t, if p1(x,y) 
; and p2(x,y) have the same value and #f otherwise.
; Examples: > (same-values? = new.= 3 1)
        ;   #f
        ;   > (same-values? < > 2 3)
        ;   #f
        ;   > (same-values? + * 2 2)
        ;   #t

(define (new.= x y)
    (and (not (< x y)) (not (> y x))))

(define (same-values? p1 p2 x y)
  (if (and (p1 x y) (p2 x y))
      #t
      #f))

> (same-values? = new.= 3 1)
    ; #f
> (same-values? < > 2 3)
    ; #f
> (same-values? + * 2 2)
    ; #t