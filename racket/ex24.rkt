#lang racket

; In Scheme one can define functions with an arbitrary number of arguments:
;  (define (f x y z . l) (...))
; means, that function f has at least three arguments (x,y and z). 
; If f is called with more than three arguments the remaining ones are collecte in list l .

; a) Please define a function plus, which sums up any number of numbers.

; b) Please define a function par for an arbitrary number of (one-argumented) functions fi.
;     Function par returns a (one-argumented) function, which for an argument x returns a list of all fi(x).
;     Example:
;    > ((par id square cube) 3)
;    (3 9 27) 
;    > ((par double double) 5)
;    (10 10)

; (define (plus . l)
;     (apply + l))

; (plus 1 2 3 4 5)
; (define (plus x y z . l)
;   (if (null? l)
;       (+ x y z)
;       (apply + x y z l)))


; (plus 1 2 3 4 5)

; apply takes two arguments
; The first argument is the function to apply, 
; and the second argument is the list containing the arguments.

(define (plus x y z . l)
  (if (null? l)
      (+ x y z)
      (apply plus (+ x y z) (car l) (cdr l))))

(plus 1 2 3 4 5 6 7)

; (plus 1 2 3 4 5 6 7)
; (apply plus 5 4 '(5 6 7))
; (apply plus 9 5 '(6 7))
; (apply plus 14 6 '(7))
; (apply plus 21 7 '())
; 28

(define (par . l)
  (lambda (x)
    (map (lambda (f) (f x)) l)))

(define id (lambda (x) x))
(define square (lambda (x) (* x x)))
(define cube (lambda (x) (* x x x)))

((par id square cube) 3)
;    (3 9 27) 

(define double (lambda (x) (* 2 x)))

((par double double) 5)
;    (10 10)

; (define (iden x) x)
; (define (square x) (* x x))
; (define (cube x) (* x x x))

; (define (fold-sum l)
;   (if (null? l)
;       0
;       (+ (car l) (fold-sum (cdr l)) )
;       )
;   )
; (define (plus x y z . l)
;   (+ (+ x y z) (fold-sum l) )
;   )

; (define (func-map l x)
;   (if (null? l)
;       `()
;       (append
;        (list ((car l) x))
;        (func-map (cdr l) x)
;        )
;       )
;   )
; (define (par . l)
;   (lambda (x)
;     (func-map l x)
;     )
;   )
; ; (plus 1 2 3 4 5 6)
; ; ((par iden square cube) 3)