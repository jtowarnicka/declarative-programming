#lang racket

; > (define (new-if condition consequence alternative)
;  (cond (condition consequence)
;       (else      alternative)))

> (define (if-test a)
    (if (= a 0 ) a
    (print "old if")))

> (if-test 0)

> (define (new-if condition consequence alternative)
 (cond (condition consequence)
      (else      alternative)))

(define (consequence) (begin (display "Consequence evaluated\n") 10))
(define (alternative) (begin (display "Alternative evaluated\n") 20))

(new-if (= 2 2) (consequence) (alternative))
