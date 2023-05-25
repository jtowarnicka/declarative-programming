#lang racket

; Please define functions (new.< x y), (new.> x y), (new.= x y), (new.<= x y), 
; (new.>= x y) oraz (new.<> x y). No built-in functions are allowed,
; except for < and boolean functions.

(define (new.< x y)
    (< x y))

(define (new.> x y)
    (< y x))

(define (new.= x y)
    (and (not (new.< x y)) (not (new.> x y))))

(define (new.<= x y)
    (not (new.> x y)))

(define (new.>= x y)
    (not (new.< x y)))

; (define (new.<> x y)
;     (not (new.= x y)))

(define (new.<> x y)
    (or (new.< x y) (new.> x y)))


