#lang racket

; Please complete the arithmetics of complex numbers as presented in the lecture
; a) using manifest types.
; b) using message passing.
; c) Suppose the following definitions are given.
;    (define z1 (make-rectangular -1 3)) 
;    (define z2 (make-polar 2 -2)) 
; Please explain how the expression (angle (+c z1 z2)) is evaluated.

(define (square x) (* x x))

; magnitude - odległość od początku układu współrzędnych (pierwiastek z sumy kwadratów)
; |z| = sqrt(x^2 + y^2)
; angle - kąt między osią rzeczywistą a wektorem
; z = x + iy = r(cos(a) + i sin(a)) = r cis(a) = r e^(ia) = r exp(ia) = r exp(i tan^-1(y/x))

; manifest types
; (rectangular.(1.5))
; (polar.(7.3))

; complex numbers - arithmetic operators
(define (+c z1 z2)
    (make-rectangular (+ (real-part z1) (real-part z2))
                      (+ (imag-part z1) (imag-part z2))))


(define (-c z1 z2)
    (make-rectangular (- (real-part z1) (real-part z2))
                      (- (imag-part z1) (imag-part z2))))

(define (*c z1 z2)
    (make-polar (* (magnitude z1) (magnitude z2))
                (+ (angle z1) (angle z2))))

(define (/c z1 z2)
    (make-polar (/ (magnitude z1) (magnitude z2))
                (- (angle z1) (angle z2))))

; adding type info to the complex numbers


(define (attach-type type contents)
  (cons type contents))

(define (type datum) (car datum))

(define (contents datum) (cdr datum))

(define (rectangular? z)
  (eq? (type z) 'rectangular))

(define (polar? z) (eq? (type z) 'polar))

; (define (make-rectangular x y)
;   (attach-type 'rectangular (cons x y)))

(define (make-polar r a)
    (attach-type 'polar (cons r a)))

; (define (real-part z) 
;     (cond ((rectangular? z) (real-part-rectangular (contents z)))
;           ((polar? z) (real-part-polar (contents z)))))

; (define (imag-part z) 
;     (cond ((rectangular? z) (imag-part-rectangular (contents z)))
;           ((polar? z) (imag-part-polar (contents z)))))

; (define (magnitude z) 
;     (cond ((rectangular? z) (magnitude-rectangular (contents z)))
;           ((polar? z) (magnitude-polar (contents z)))))

; (define (angle z) 
;     (cond ((rectangular? z) (angle-rectangular (contents z)))
;           ((polar? z) (angle-polar (contents z)))))

(define (real-part-rectangular z) (car z))

(define (imag-part-rectangular z) (cdr z))

(define (magnitude-rectangular z)
  (sqrt (+ (square (car z))
           (square (cdr z)))))

(define (angle-rectangular z) (atan (cdr z) (car z)))

(define (real-part-polar z) (* (car z) (cos (cdr z))))

(define (imag-part-polar z) (* (car z) (sin (cdr z))))

(define (magnitude-polar z) (car z))

(define (angle-polar z) (cdr z))

; (define z1 (make-rectangular -1 3)) 
; (define z2 (make-polar 2 -2)) 

; (angle (+c z1 z2))
; (angle (+ (real-part z1) (real-part z2)) (+ (imag-part z1) (imag-part z2)))
; (angle (+ -1 (real-part z2)) (+ 3 (imag-part z2)))
; (angle (+ -1 (* (magnitude z2) (cos (angle z2)))) (+ 3 (* (magnitude z2) (sin (angle z2)))))
; (angle (+ -1 (* 2 (cos -2))) (+ 3 (* 2 (sin -2)))))
; 2.568903946291903

; message passing
; liczba zespolona, to funkcja, która "odpowiada" na pewne wiadomości

(define (make-rectangular x y)
  (define (dispatch m)
    (cond ((eq? m 'real-part) x)
          ((eq? m 'imag-part) y)
          ((eq? m 'magnitude) (sqrt (+ (square x) (square y))))
          ((eq? m 'angle) (atan y x))
          (else (error "Unknown message in make-rectangular: " m)))) dispatch)

(define (real-part z) (z 'real-part))
(define (imag-part z) (z 'imag-part))
(define (magnitude z) (z 'magnitude))
(define (angle z) (z 'angle))

(define z1 (make-rectangular -1 3)) 
(define z2 (make-polar 2 -2)) 

(angle (+c z1 z2))
