#lang racket

; Suppose the following definitions are given.
(define a 2)
(define (p a)
  (pp 2))
(define (pp b)
  (set! a (+ b 1))
  (* a b))
; What is the value of the expression (p 5)? 
; What is the value of a after evaluating (p 5)? Justify Your answers using the environment model.

(p 5)

; (p 5)
; (pp 2) ; a = 5
; (set! a (+ b 1)) ; b = 2; a = 3
; (* a b) ; 3 * 2 = 6

; Initial environment: a = 2
; Evaluation of (p 5):
; Call (p 5)
; New environment: a = 5
; Evaluate (pp 2)
; New environment: a = 5, b = 2
; Set a to the value of b + 1: a = 2 + 1 = 3
; Compute the product of a and b: 3 * 2 = 6
; Result of (pp 2): 6
; Result of (p 5): 6
; Value of a after evaluating (p 5): 3

; description of the environment model
; Initially, a is defined as 2 in the environment.
; When (p 5) is called, a new environment is created where a is rebound to 5.
; Inside the procedure p, (pp 2) is evaluated.
; In the environment of (pp 2), a is still 5, and b is bound to 2.
; The expression (set! a (+ b 1)) updates the value of a to 3 (5 + 1).
; Then, (* a b) computes the product of a (3) and b (2), resulting in 6.
; The value of (pp 2) is 6, which becomes the result of (p 5).
; After evaluating (p 5), the value of a is 3 due to the update made inside the procedure pp.
