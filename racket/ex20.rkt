#lang racket

; a) Please complete the definition of function deriv as presented in the lecture.

; b) Please modify functions make-sum and make-product so that function deriv returns normalized terms
; - this means for example y instead of (* y 1).

; c) Please complete the definition of function deriv tak, so that it can handle terms u^n
; for natural number n - using the rule d(u^n) / dx = n * u^(n-1) * du / dx .

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product 
            (make-exponentiation 
              (base exp)
              (- (exponent exp) 1))
          (deriv (base exp) var))
         ))
        (else (error "unknown expression type: DERIV" exp))
    ))

(define (variable? exp)
  (symbol? exp))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (constant? exp)
  (number? exp))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))


(define (=number? x n)
  (and (number? x) (= x n)))

(define (sum? exp)
  (and (pair? exp) (eq? (car exp) '+)))

(define (exponentiation? x)
    (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (addend s)
  (cadr s))

(define (augend s)
  (caddr s))

(define (product? exp)
  (and (pair? exp) (eq? (car exp) '*)))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(deriv '(+ x 3) 'x)
(deriv '(* x x) 'x)