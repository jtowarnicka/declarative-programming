#lang racket

; Please define a function (product term next a b) analogous to function sum.
; Please show, how the function product can be used to define both function silnia
;  and for the approximation of p using the formula   p/4 = 2 · 4 · 4 · 6 · 6 · 8 ··· / 3 · 3 · 5 · 5 · 7 · 7 ··· .

> (define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

> (define (sum-of-naturals n) (sum (lambda (x) x) 1 (lambda (x) (+ x 1)) n))
> (sum-of-naturals 5)

> (define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))))

> (define (term n) 
    (if (even? n)
        (/ n (+ n 1.0))
        (/ (+ n 1.0) n)))

> (define (next n) (+ n 1))

> (define (approx-p n)
    (* 4 (product term 2.0 next n)))

> (approx-p 10000)