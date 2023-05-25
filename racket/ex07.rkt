#lang racket

; a) Please define functions (fibonacci n) whose value is the n-th element of the Fibonacci sequence,
;  one using recursion and again using accumulation.

; b) For both versions please show how the expression (fibonacci 4) is evaluated.

; 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610
; (define (fibonacci n)
;     (cond
;         [(= n 0) 0]
;         [(= n 1) 1]
;         [else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))]
;     )
; )

> (define (fibonacci n) 
    (if (< n 2) n 
    (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))

(fibonacci 4)

; (fibonacci 4)
; (+ (fibonacci 3) (fibonacci 2))
; (+ (+ (fibonacci 2) (fibonacci 1)) (+ (fibonacci 1) (fibonacci 0)))
; (+ (+ (+ (fibonacci 1) (fibonacci 0)) 1) (+ 1 0))
; (+ (+ (+ 1 0) 1) 1)
; (+ (+ 1 1) 1)
; (+ 2 1)
; 3

> (define (fibonacci_helper n prev curr)
    (if (= n 0) prev
    (if (= n 1) curr
    (fibonacci_helper (- n 1) curr (+ prev curr)))))

> (define (fibonacci_tailrec n) (fibonacci_helper n 0 1))

> (fibonacci_tailrec 4)

; (fibonacci_tailrec 4)
; (fibonacci_helper 4 0 1)
; (fibonacci_helper 3 1 1)
; (fibonacci_helper 2 1 2)
; (fibonacci_helper 1 2 3)
; (fibonacci_helper 0 3 5)
; 3
