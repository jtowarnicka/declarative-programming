#lang racket

; Please - again - define a function (fibonacci n) whose value is the n-th element
; of the Fibonacci sequence - this time by computing the n-th power of the matrix
; ( 1 1
;   1 0 )

; 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 ...

; (define (m11 m) (caar m))
; (define (m12 m) (cadar m))
; (define (m21 m) (caadr m))
; (define (m22 m) (cadadr m))
; (define (mult-matrices a b)
;   (list
;    (list (+ (* (m11 a) (m11 b) ) (* (m12 a) (m21 b)))
;          (+ (* (m11 a) (m12 b) ) (* (m12 a) (m22 b)))
;          )
;    (list  (+ (* (m21 a) (m11 b) ) (* (m22 a) (m21 b)))
;           (+ (* (m21 a) (m12 b) ) (* (m22 a) (m22 b)))
;           )
;    )
;   )
; (define a (list (list 1 1) (list 1 0)))
; (define id-matrix (list (list 1 0) (list 0 1)))
; (define (fibonacci n)
;   (if (equal? n 0)
;       id-matrix
;       (mult-matrices a (fibonacci (- n 1)))
;       )
;   )
; (fibonacci 2)
; (fibonacci 3)
; (fibonacci 4)
; (fibonacci 5)
; (fibonacci 6)
; (fibonacci 7)

; (define (fibonacci n)
;   (define (multiply-matrix a b)
;     (list (+ (* (car a) (car b)) (* (cadr a) (caddr b)))
;           (+ (* (car a) (cadr b)) (* (cadr a) (cadddr b)))
;           (+ (* (caddr a) (car b)) (* (cadddr a) (caddr b)))
;           (+ (* (caddr a) (cadr b)) (* (cadddr a) (cadddr b)))))

;   (define (matrix-power m k)
;     (if (= k 1)
;         m
;         (let ((half-power (matrix-power m (quotient k 2))))
;           (if (odd? k)
;               (multiply-matrix m (multiply-matrix half-power half-power))
;               (multiply-matrix half-power half-power)))))

;   (if (<= n 0)
;       0
;       (let ((fib-matrix (matrix-power '(1 1 1 0) n)))
;         (car fib-matrix))))

; (fibonacci 6)

  (define (multiply-matrix a b)
    (list (+ (* (car a) (car b)) (* (cadr a) (caddr b)))
          (+ (* (car a) (cadr b)) (* (cadr a) (cadddr b)))
          (+ (* (caddr a) (car b)) (* (cadddr a) (caddr b)))
          (+ (* (caddr a) (cadr b)) (* (cadddr a) (cadddr b)))))

  (define (matrix-power m k)
    (if (= k 1)
        m
        (if (odd? k)
            (multiply-matrix m (matrix-power (multiply-matrix m m) (quotient k 2)))
            (matrix-power (multiply-matrix m m) (quotient k 2)))))

(define (fibonacci n)
  (if (<= n 0)
      0
      (let ((fib-matrix (matrix-power '(1 1 1 0) (- n 1))))
        (car fib-matrix))))

(fibonacci 6)
