#lang racket


; Please define a function (accumulate combiner null-value term a next b)
; generalizing functions sum and product: The arguments term, next, a, and b are the same
; as in the definitions of sum i prod.
; combiner is a two-argument function describing, how (term a) is tied together
; with the recursive result. null-value is the initial value used in the basic step of recursion.
; Please also show, how sum and product can be defined using accumulate.

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum-of-naturals n)
  (accumulate + 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(sum-of-naturals 5)

(define (product-of-integers n)
  (accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(product-of-integers 4)

; sum-of-naturals
; (accumulate + 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
; (accumulate + 1 (accumulate + 0 (lambda (x) x) 2 (lambda (x) (+ x 1)) 5)
; (accumulate + 1 (accumulate + 2 (accumulate + 0 (lambda (x) x) 3 (lambda (x) (+ x 1)) 5)
; (accumulate + 1 (accumulate + 2 (accumulate + 3 (accumulate + 0 (lambda (x) x) 4 (lambda (x) (+ x 1)) 5)
; (accumulate + 1 (accumulate + 2 (accumulate + 3 (accumulate + 4 (accumulate + 0 (lambda (x) x) 5 (lambda (x) (+ x 1)) 5)
; (accumulate + 1 (accumulate + 2 (accumulate + 3 (accumulate + 4 (accumulate + 5 (accumulate + 0 (lambda (x) x) 6 (lambda (x) (+ x 1)) 5)
; (accumulate + 1 (accumulate + 2 (accumulate + 3 (accumulate + 4 (accumulate + 5 ( 0 ) ) )
; (accumulate + 1 (accumulate + 2 (accumulate + 3 (accumulate + 4 ( 5 ) ) )
; (accumulate + 1 (accumulate + 2 (accumulate + 3 ( 9 ) )
; (accumulate + 1 (accumulate + 2 ( 12 )
; (accumulate + 1 ( 14 )
; 15

; product-of-integers
; (accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) 4)
; (accumulate * 1 (accumulate * 1 (lambda (x) x) 2 (lambda (x) (+ x 1)) 4)
; (accumulate * 1 (accumulate * 2 (accumulate * 1 (lambda (x) x) 3 (lambda (x) (+ x 1)) 4)
; (accumulate * 1 (accumulate * 2 (accumulate * 3 (accumulate * 1 (lambda (x) x) 4 (lambda (x) (+ x 1)) 4)
; (accumulate * 1 (accumulate * 2 (accumulate * 3 (accumulate * 4 ( 1 )) )))
; (accumulate * 1 (accumulate * 2 (accumulate * 12 ( 1 ))))
; (accumulate * 1 (accumulate * 24 ( 1 )))
; (accumulate * 1 ( 24 ))
; 24
