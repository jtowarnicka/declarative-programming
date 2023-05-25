#lang racket

; Please define a function (counting-version f), where f is a one-argument function. 
; Its value is a one-argument function, which - computes f and - counts how often f is called.
;  Example:

> (define (counting-version f)
    (let ([counter 0])
      (lambda (x)
        (cond
          [(eq? x 'how-often) counter]
          [(eq? x 'reset) (set! counter 0)]
          [else (begin (set! counter (+ counter 1)) (f x))]))))

> (define (square x) (* x x))

> (define sq (counting-version square))
; sq
> (sq 5)
; 25
> (sq 7)
; 49
> (sq 'how-often)
; 2
> (sq 'reset)
; 0
> (sq 'how-often)
; 0