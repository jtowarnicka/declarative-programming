#lang racket

; Suppose the following definitions are given.
; (define m 1)             (define n 1)
; (define (p m)            (define (q n)
;    (pp 5))                  (define (qq x)
; (define (pp x)                 (+ x n))
;    (+ x m))                 (qq 5))

; What are the values of the expressions (p 11) and (q 11)? 
; Justify Your answers using the environment model

(define m 1)
(define (pp x)
  (+ x m))
(define (p m)
  (pp 5))

(define n 1)
(define (qq x)
  (+ x n))
(define (q n)
  (qq 5))

(p 11)

; Evaluation of (p 11):
; Initial environment: m = 1, n = 1
; Call (p 11)
; New environment: m = 1, n = 1
; Evaluate (pp 5)
; New environment: m = 1, n = 1, x = 5
; Evaluate (+ x m)
; Current environment: m = 1, n = 1, x = 5
; Compute 5 + 1 = 6
; Result of (+ x m): 6
; Result of (p 11): 6


(q 11)

; Evaluation of (q 11):
; Initial environment: m = 1, n = 1
; Call (q 11)
; New environment: m = 1, n = 1
; Evaluate (qq 5)
; New environment: m = 1, n = 1, x = 5
; Evaluate (+ x n)
; Current environment: m = 1, n = 1, x = 5
; Compute 5 + 1 = 6
; Result of (+ x n): 6
; Result of (q 11): 6
