#lang racket

; Suppose the following definition of function f.
; (define f g) (g 2))
; Please show how the following expressions are evaluated.

; a) (f square)

; b) (f (lambda (z) (+ z (* 3 z)))

; c) (f f)

> (define (f g)
  (g 2))

> (define (square x)
  (* x x))

> (f square)

; (f square) = (square 2) = (* 2 2) = 4

> (f (lambda (z) (+ z (* 3 z))))

; (f (lambda (z) (+ z (* 3 z)))) = ((lambda (z) (+ z (* 3 z)))) 2) = (+ 2 (* 3 2)) = 8

> (f f)

; (f f) = (f 2) = (2 2) = error
