#lang racket

; Please define a function (root f a b) approximating a root of f between a and b using the half-interval-method.


; > (define (root f a b)
;   (if (< (abs (- a b)) 0.0001)
;       (/ (+ a b) 2)
;         (cond ((= (f (/ (+ a b) 2)) 0) (/ (+ a b) 2))
;               ((< (* (f a) (f (/ (+ a b) 2))) 0) (root f a (/ (+ a b) 2)))
;               ((< (* (f b) (f (/ (+ a b) 2))) 0) (root f (/ (+ a b) 2) b))
;               (else (error "root not found")))))

; > (root sin 2.0 4.0)

> (define (avg x y ) (/ (+ x y) 2))

> (define (close_enough? x y)
    (< (abs (- x y)) 0.0001))

> (define (search f neg-point pos-point)
    (let ((mid-point (avg neg-point pos-point)))
      (cond ((close_enough? neg-point pos-point) mid-point)
            ((> (f mid-point) 0) (search f neg-point mid-point))
            ((< (f mid-point) 0) (search f mid-point pos-point))
            (else mid-point))))

> (define (half-interval-method f a b)
    (cond ((and (> (f a) 0) (< (f b) 0)) (search f b a))
          ((and (< (f a) 0) (> (f b) 0)) (search f a b))
          (else error "f(a) and f(b) must have opposite signs")))

> (half-interval-method sin 2.0 4.0)
