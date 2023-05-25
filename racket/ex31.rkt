#lang racket

; Please define a destructive version append! of append.
; What are the values of the following expressions?

; ????

(define x '(a b))
(define y '(c d))

(append x y)
(cdr x)
(append! x y)
(cdr x)

