#lang racket

; Please define a function (eval expression values) which evaluates boolean expressions.
; expression is a list whose first element gives the "typ" of the boolean expression,
; the remaining elements are the subexpressions - for example '(and x (not y)) represents the expression x∧¬y.
; values is a list of variables together with their corresponding boolean value.
; Examples: > (define values '((x . #f) (y . #t) (z . #f)))
;           values
;           > (eval '(and y (not x)) values)
;           #t
;           > (eval '(and y (and (not x) z))) values)
;           #f
;           > (eval '(and y #t) values)
;           #t

> (define values `((x . #f) (y . #t) (z . #f)))

> (define (method-of l) (car l))

> (define (second l) (cadr l))

> (define (third l ) (caddr l))

> (define (get-value element values)
  (if (or (equal? #t element) (equal? #f element))
      element
      (if (equal? element `x)
          (cdr (first values))
          (if (equal? element `y)
              (cdr (second values))
              (cdr (third values))
              )
          )
      )
  )

> (define (eval expression values)
  (if (equal? (method-of expression) `and)
      (and
       (if (list? (second expression))
           (eval (second expression) values)
           (get-value (second expression) values)
           )
       (if (list? (third expression))
           (eval (third expression) values)
           (get-value (third expression) values)
           )
       )
      (if (equal? (method-of expression) `not)
          (not
           (if (list? (second expression))
               (eval (second expression) values)
               (get-value (second expression) values)
               )
           )
          (get-value (first expression) values)
          )
      )
  )

(eval '(and y (not x)) values)
(caddr '(and y (not x)))
(eval '(and y (and (not x) z)) values)
(eval '(and y #t) values)
