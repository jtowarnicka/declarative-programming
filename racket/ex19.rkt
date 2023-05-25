#lang racket

; Using lists to represent binary trees (see lecture notes) please define functions 
; (memberTree? element tree), (sumTree tree), (inorder tree) and (mapTree f tree).

; cdr - returns the rest of the list
; car - returns the first element of the list
; cadr - car of the cdr
; caddr - car of the cadr of the cdr

> (define tree '(2 (3 () (4 () ())) (1 () ())))
;        2
;       / \
;      3   1
;       \
;        4

> (define (left-subtree tree) (cadr tree))
> (define (right-subtree tree) (caddr tree))
> (define (root tree) (car tree))

> (define (memberTree? element tree)
    (cond [(null? tree) #f]
          [(= element (root tree)) #t]
          [else (or (memberTree? element (left-subtree tree))
                    (memberTree? element (right-subtree tree)))]))

> (memberTree? 3 tree)

; (memberTree? 3 tree)
; (or (memberTree? 3 '(3 () (4 () ()))) (memberTree? 3 '(1 () ())))
; (or #t (memberTree? 3 '(1 () ())))
; #t

> (define (sumTree tree)
    (cond [(null? tree) 0]
          [else (+ (root tree)
                   (sumTree (left-subtree tree))
                   (sumTree (right-subtree tree)))]))

> (sumTree tree)

> (define (inorder tree)
    (cond [(null? tree) '()]
          [else (append (inorder (left-subtree tree))
                        (list (root tree))
                        (inorder (right-subtree tree)))]))

> (inorder tree)

> (define (mapTree f tree)
    (if (null? tree) '()
      (list (f (root tree))
       (mapTree f (left-subtree tree))
       (mapTree f (right-subtree tree)))
    ))

> (mapTree (lambda (x) (+ x 10)) tree)
