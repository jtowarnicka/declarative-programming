#lang racket

; Please define functions (odd? n) and (even? n) checking whether a natural number n is odd or even,
; resp. No built-in functions are allowed, except for #t, #f, zero? and a function "-1" calculating n-1.

(define (odd? n)
  (if (zero? n)
      #f
      (even? (- n 1))))

(define (even? n)
    (if (zero? n)
        #t
        (odd? (- n 1))))

(odd? 3)

; (odd? 3)
; (even? (- 3 1)) -> (even? 2)
; (odd? (- 2 1)) -> (odd? 1)
; (even? (- 1 1)) -> (even? 0)
; (zero? 0) -> #t
; #t

(even? 3)

; (even? 3)
; (odd? (- 3 1)) -> (odd? 2)
; (even? (- 2 1)) -> (even? 1)
; (odd? (- 1 1)) -> (odd? 0)
; (zero? 0) -> #f
; #f

(even? 4)

; (even? 4)
; (odd? (- 4 1)) -> (odd? 3)
; (even? (- 3 1)) -> (even? 2)
; (odd? (- 2 1)) -> (odd? 1)
; (even? (- 1 1)) -> (even? 0)
; (zero? 0) -> #t
; #t

(odd? 4)

; (odd? 4)
; (even? (- 4 1)) -> (even? 3)
; (odd? (- 3 1)) -> (odd? 2)
; (even? (- 2 1)) -> (even? 1)
; (odd? (- 1 1)) -> (odd? 0)
; (zero? 0) -> #f
; #f