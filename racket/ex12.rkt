#lang racket

; Even function accumulate can be generalized: Please define a function filter-accumulate
; with an additional argument pred.
; pred is a one-argument predicate and filter-accumulate ties (term a) 
; to the result only if a fulfills pred.
; Using filter-accumulate please compute the sum of squares of the prime numbers in the interval [a,b] 
; and the product of the natural numbers i smaller than n for which nwd(i,n) = 1.

(define (filter-accumulate combiner null-value term a next b pred)
  (if (> a b)
      null-value
      (combiner
         (if (pred a b)
             (term a)
             null-value)
         (filter-accumulate combiner null-value term (next a) next b pred))))


(define (nwd a b)
    (if (= b 0)
        a
        (nwd b (remainder a b))))

(define (coprime? a b)
    (if (= (nwd a b) 1)
        #t
        #f))


(define (product-of-coprimes n)
    (filter-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n coprime?))

> (product-of-coprimes 3)
> (product-of-coprimes 6)
