#lang racket

; Please define functions (nwd a b) and (nww a b) whose values are the greatest common divisor
; and the least common multiple of (natural numbers) a and b.

; (define (nwd a b)
;     (if (= b 0)
;         a
;         (nwd b (modulo a b))))

(define (nwd a b)
    (cond [(> a b) (nwd (- a b) b)]
          [(< a b) (nwd a (- b a))]
          [else a])
)

> (nwd 12 8)

; (nwd 12 8)
; (nwd 8 4)
; (nwd 4 0)
; 4

; (define nwd (lambda (a b)
;     (if (= b 0)
;         a
;         (nwd b (remainder a b)))))

(define (nww a b)
    (/ (* a b) (nwd a b)))

> (nww 12 8)

; (nww 12 8)
; (/ (* 12 8) (nwd 12 8))
; (/ (* 12 8) 4)
; 24

