#lang racket

; Even function accumulate can be generalized: Please define a function filter-accumulate
; with an additional argument pred.
; pred is a one-argument predicate and filter-accumulate ties (term a) 
; to the result only if a fulfills pred.
; Using filter-accumulate please compute the sum of squares of the prime numbers in the interval [a,b] 
; and the product of the natural numbers i smaller than n for which nwd(i,n) = 1.

; (define (filter-accumulate combiner null-value term a next b pred)
;   (if (> a b)
;       null-value
;       (combiner
;          (if (pred a b)
;              (term a)
;              null-value)
;          (filter-accumulate combiner null-value term (next a) next b pred))))


; (define (nwd a b)
;     (if (= b 0)
;         a
;         (nwd b (remainder a b))))

; (define (coprime? a b)
;     (if (= (nwd a b) 1)
;         #t
;         #f))


; (define (product-of-coprimes n)
;     (filter-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n coprime?))

; > (product-of-coprimes 3)
; > (product-of-coprimes 6)


(define (filter-accumulate combiner null-value term a next b pred)
  (if (> a b)
      null-value
      (combiner
       (if (pred a)
           (term a)
           null-value)
       (filter-accumulate combiner null-value term (next a) next b pred))))

(define (is-prime n)
  (define (divisible? x)
    (if (> (* x x) n)
        #t
        (if (= (modulo n x) 0)
            #f
            (divisible? (+ x 1)))))
  (cond
   ((<= n 1) #f)
   ((= n 2) #t)
   (else (divisible? 2))))

(define (sum-of-squares n)
  (filter-accumulate + 0 (lambda (x) (* x x)) 1 (lambda (x) (+ x 1)) n is-prime))

(sum-of-squares 6)

(define (nwd a b)
    (if (= b 0) a
        (nwd b (modulo a b))))

(define (is-coprime a b)
    (= (nwd a b) 1))

(define (product-of-coprimes n)
    (filter-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n (lambda (x) (is-coprime x n))))

(product-of-coprimes 6)
