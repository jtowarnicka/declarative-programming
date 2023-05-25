#lang racket

; Using function fold please define the following functions for lists.
; a) (prod l)
; b) (length l)
; c) (delete x l)
; d) (reverse l)
; e) (map f l)
; f) (filter pred l)
; g) (forall pred l).


> (define lst '(1 2 3 4 5))

; > (define (fold f end l)
;   (if (null? l)
;       end
;       (f (car l) (fold f end (cdr l)))))

> (define (fold f e)
    (lambda (l) 
        (if (null? l) e
            (f (car l) ((fold f e) (cdr l)))
    )))

> (define (prod l)
    ((fold * 1) l)
)

> (prod lst)

> (define (length l)
    ((fold (lambda (x y) (+ 1 y)) 0) l))

> (length lst)

; (length '(1 2 3 4 5))
; (fold (lambda (x y) (+ 1 y)) 0 '(1 2 3 4 5))
; (fold (lambda (x y) (+ 1 y)) 1 '(2 3 4 5))
; (fold (lambda (x y) (+ 1 y)) 2 '(3 4 5))
; (fold (lambda (x y) (+ 1 y)) 3 '(4 5))
; (fold (lambda (x y) (+ 1 y)) 4 '(5))
; (fold (lambda (x y) (+ 1 y)) 5 '())
; 5

> (define (delete x l) 
    ((fold (lambda (y z) (if (eq? x y) z (cons y z))) '()) l))

> (delete 3 lst)

> (define (reverse l)
    ((fold (lambda (x y) (append y (list x))) '()) l))

> (reverse lst)

> (define (map f l)
    ((fold (lambda (x y) (cons (f x) y)) '()) l))

> (map (lambda (x) (* x x)) lst)

> (define (filter pred l)
    ((fold (lambda (x y) (if (pred x) (cons x y) y)) '()) l))

> (filter (lambda (x) (even? x)) lst)

> (define (forall pred l)
    ((fold (lambda (x y) (and (pred x) y)) #t) l))

> (forall (lambda (x) (even? x)) lst)
