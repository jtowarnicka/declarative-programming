#lang racket

; Please define the following functions for lists.

; a) (append l m), whose value is the concatenation of the lists l i m.

; b) (last l), whose value is the last element of the list l.

; c) (reverse l), whose value is the list l in reversed order.

; d) (delete x l), whose value is the list l without the element x.

; e) (pairing l1 l2), that builds a list of pairs out of the lists l1 and l2. Example:
;  > (pairing '(1 2 3) '(a b c))
;   '((1.a) (2.b) (3.c)) 

; f) (split x l), that splits l into two lists l1 and l2. l1 contains the element of l smaller
;  than x and l2 the elements greater than x.

> (define (append l m)
    (if (null? l)
        m
        (cons (car l) (append (cdr l) m))))

> (append '(1 2 3) '(4 5 6))

; (append '(1 2 3) '(4 5 6))
; (cons 1 (append '(2 3) '(4 5 6)))
; (cons 1 (cons 2 (append '(3) '(4 5 6))))
; (cons 1 (cons 2 (cons 3 (append '() '(4 5 6)))))
; (cons 1 (cons 2 (cons 3 '(4 5 6))))
; (cons 1 (cons 2 '(3 4 5 6)))
; (cons 1 '(2 3 4 5 6)) 
; '(1 2 3 4 5 6)

> (define (last l)
    (if (null? (cdr l))
        (car l)
        (last (cdr l))))

> (last '(1 2 3 4 5))


; (define (reverse-helper l reversed)
;     (if (null? l) reversed
;     (reverse-helper (cdr l) (cons (car l) reversed))
; ))
; (define (reverse l)
;     (reverse-helper l '()))

> (define (reverse l)
    (if (null? l) 
        '()
        (append (reverse (cdr l)) (list (car l)))
    ))   

> (reverse '(1 2 3 4 5))

; (reverse '(1 2 3 4 5))
; (append (reverse '(2 3 4 5)) list (1))
; (append (append (reverse '(3 4 5)) list (2)) list (1))
; (append (append (append (reverse '(4 5)) list (3)) list (2)) list (1))
; (append (append (append (append (reverse '(5)) list (4)) list (3)) list (2)) list (1))
; (append (append (append (append (append (reverse '()) list (5)) list (4)) list (3)) list (2)) list (1))
; (append (append (append (append (append '() list (5)) list (4)) list (3)) list (2)) list (1))
; (append (append (append (append '(5) list (4)) list (3)) list (2)) list (1))
; (append (append (append '(5 4) list (3)) list (2)) list (1))
; (append (append '(5 4 3) list (2)) list (1))
; (append '(5 4 3 2) list (1))
; '(5 4 3 2 1)


> (define (delete x l)
    (cond [(null? l) '()]
    [(equal? (car l) x) (delete x (cdr l))]
    [else (cons (car l) (delete x (cdr l)))]
    ))

> (delete 'a '(a b c a d a))

> (define (pairing l m)
    (cond [(and (null? l) (null? m)) '()]
    [(or (null? l) (null? m)) (error "Lists must be of equal length")]
    [else (cons (list (car l) (car m)) (pairing (cdr l) (cdr m)))]
    ))

> (pairing '(1 2 3) '(a b c))

> (define (split-helper x l smaller bigger)
    (cond [(null? l) (cons smaller bigger)]
    [(< (car l) x) (split-helper x (cdr l) (cons (car l) smaller) bigger)]
    [else (split-helper x (cdr l) smaller (cons (car l) bigger))]
    ))

> (define (split x l)
    (split-helper x l '() '()))

> (split 3 '(1 3 4 2 5))


; (define (split-helper x l m n)
;     (cond [(null? l) (list m n)]
;         [(>= x (car l)) (split-helper x (cdr l) (cons (car l) m) n)]
;         [else (split-helper x (cdr l) m (cons (car l) n))]
;     )
; )

; (define (split x l) (split-helper x l '() '()))
; (split 5 '(5 6 7 4 3 2 10))
