#lang racket

; a) Please define a function (factorial n) whose value is n! using recursion.

; b) The factorial function can also be defined the following way:
;   (define (factorial_help n i acc)
;       (if (< n i)
;           acc
;           (factorial_help n (+ i 1) (* i acc))))

;    (define (factorial n)
;       (factorial_help n 1 1))
; Please show how the expression (factorial 4) is evaluated, once for the recursive version
; a) and again for version b).
; Note: The argument acc is called accumulator and one says that this version defines 
; the faculty function using accumulation.

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

; (factorial 4)
; (* 4 (factorial 3))
; (* 4 (* 3 (factorial 2)))
; (* 4 (* 3 (* 2 (factorial 1))))
; (* 4 (* 3 (* 2 (* 1 (factorial 0)))))
; (* 4 (* 3 (* 2 (* 1 1)))))
; (* 4 (* 3 (* 2 1))))
; (* 4 (* 3 2)))
; (* 4 6))
; 24


(define (factorial_help n i acc)
  (if (< n i)
      acc
      (factorial_help n (+ i 1) (* i acc))))

(factorial_help 4 1 1)

; (factorial_help 4 1 1)
; (factorial_help 4 2 1)
; (factorial_help 4 3 2)
; (factorial_help 4 4 6)
; (factorial_help 4 5 24)
; 24

