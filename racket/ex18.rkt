#lang racket

; a) Please define a function (square-list l), whose value is the list of squares of all elements of l.

; b) Please define a function (mapf f l), whose value is the list of values f(e) for all elements e of l.

; c) Please define a function (filter pred l), whose value is the list of all elements of l fulfilling pedicate pred.

> (define (square-list l)
    (if (null? l)
        '()
        (cons (* (car l) (car l)) (square-list (cdr l)))))

(square-list '(1 2 3 4 5))

> (define (mapf f l)
    (if (null? l) '()
        (cons (f (car l)) (mapf f (cdr l)))))

(mapf (lambda (x) (* x x)) '(1 2 3 4 5))

> (define (filter pred l)
    (if (null? l) '()
        (if (pred (car l))
            (cons (car l) (filter pred (cdr l)))
            (filter pred (cdr l)))
        )
    )

(filter (lambda (x) (even? x)) '(1 2 3 4 5))