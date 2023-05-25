#lang racket

; Suppose the following function definitions are given.
(define (comb f g)
   (lambda (x) (f (g x))))

(define (square n) (* n n))

(define (double n) (+ n n))
; Please show how the following expression ((comb square double) 5) is evaluated.

((comb square double) 5) 

; ((comb square double) 5)
; ((lambda (x) (square (double x))) 5)
; (square (double 5))
; (square 10)
; (* 10 10)
; 100
