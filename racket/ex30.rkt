#lang racket

; mcons - it returns a mutable pair (mpair) object

; a) Assume that the following expessions have been evaluated.
> (define x (mcons 'a (mcons 'b '())))
; refrence
> (define z1 (mcons x x))
; copy
> (define z2 (mcons (mcons 'a (mcons 'b '()))
                    (mcons (mcons 'a (mcons 'b '())) '())))

> (set-mcar! (mcar z1) 'g)
> (set-mcar! (mcar z2) 'g) 

; What are the values of z1 and z2?
; z1 => ((a . (b . ())) . (a . (b . ())))
;       ((g . (b . ())) . (a . (b . ())))

; z2 => (((a . (b . ())) . ((g . (b . ())) . ())) . ((a . (b . ())) . ((g . (b . ())) . ())))
; (((g . (b . ())) . (b . ())) . ((a . (b . ())) . (a . (b . ())))))

; b) Please define a function (mlist l), which is transforming list l into a destructive list.

(define (mlist l)
  (if (list? l) 
    (if (empty? l) `() 
      (mcons (mlist (car l)) (mlist (cdr l)))) l))
