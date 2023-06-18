#lang racket

; Please define a function (iter f n), whose value is the function fn.

; > (define (iter f n)
;     (if (= n 1)
;         f
;         (lambda (x) (f ((iter f (- n 1)) x)))))

; > (define (square x) (* x x))

; > ((iter (lambda (x) (* x x)) 2) 2)

; Please define a function (iter f n), whose value is the function f^n.

> (define (compose f g)
   (lambda (x) (f (g x))))

> (define (iter-help fcomp f n)
   (if (<= n 1) fcomp
       (iter-help (compose fcomp f) f (- n 1))))

> (define (iter f n)
   (iter-help f f n))

> (define (fun x) ((iter (lambda (x) (+ x 1)) 3) x))

> (fun 5)

; (define (iter f n)
;     (lambda (x) 
;         (if (= n 0) x
;             ((iter f (- n 1)) (f x)))))

; (define (double a)
;     (* a 2))

; ((iter double 3) 5)
