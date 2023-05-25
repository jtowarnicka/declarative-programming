#lang racket

;  Operator begin w języku Racket służy do sekwencyjnego wykonania kilku wyrażeń. 
;  Po prostu wykonuje każde wyrażenie po kolei i zwraca wartość ostatniego z nich.

; Operator (set! <variable> <expression>) w języku Racket służy do zmiany wartości 
; zmiennej na inną wartość określoną przez <expression>.

; a) Please define a function (make-konto balance) generating an account with balance dollars.
;  The following operations should be possible: withdraw money, deposit money and checking balance.

; (define (make-konto balance)
;   (define (withdraw amount)
;     (if (>= balance amount)
;         (begin (set! balance (- balance amount))
;                balance)
;         "Insufficient funds"))
  
;   (define (deposit amount)
;     (begin (set! balance (+ balance amount))
;            balance))
  
;   (define (check-balance)
;     balance)
  
;   (lambda (operation)
;     (case operation
;       ((withdraw) (lambda (amount) (withdraw amount)))
;       ((deposit) (lambda (amount) (deposit amount)))
;       ((balance) check-balance)
;       (else (error "Invalid operation")))))

; (define k1 (make-konto 100))

; ; b) Suppose now the following definition.
;    (define k1 (make-konto 100)) 
; ; Using the environment model please show, how the following expressions are evaluated.

; ((k1 'withdraw) 40)  ; Withdraw 40 dollars from k1
; (k1 'balance)        ; Check the balance of k1
; ((k1 'deposit) 10)   ; Deposit 10 dollars into k1
; (k1 'balance)        ; Check the balance of k1

; ((k1 'withdraw) 40)
; (k1 'withdraw) -> (lambda (amount) (withdraw amount))
; (lambda (amount) (withdraw amount)) 40
; (withdraw 40)
; (if (>= 100 40)
;     (begin (set! 100 (- 100 40))
;            100) -> balance: 60

; (k1 'balance)
; (k1 'balance) -> (lambda () (check-balance))
; (lambda () (check-balance))
; (check-balance)
; balance: 60

; ((k1 'deposit) 10)
; (k1 'deposit) -> (lambda (amount) (deposit amount))
; (lambda (amount) (deposit amount)) 10
; (deposit 10)
; (begin (set! 60 (+ 60 10))
;        60) -> balance: 70

; c) Please modify function make-konto, so that an account with a password is generated
;  - that is operations are only carried out, if the correct password is given.
;     Example:
;  (define k2 (make-konto 100 'password))
;  k2
;  > ((k2 'passowrd 'withdraw) 40)
;  60
;  > ((k2 'wrong-password 'withdraw) 20)
;  incorrect password

(define (make-konto balance password)
  (define (withdraw amount pass)
    (if (equal? pass password)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds")
        "Incorrect password"))
  
  (define (deposit amount pass)
    (if (equal? pass password)
        (begin (set! balance (+ balance amount))
               balance)
        "Incorrect password"))
  
  (define (check-balance pass)
    (if (equal? pass password)
        balance
        "Incorrect password"))
  
  (lambda (pass operation . args)
    (case operation
      ((withdraw) (lambda (amount) (withdraw amount pass)))
      ((deposit) (lambda (amount) (deposit amount pass)))
      ((balance) (lambda () (check-balance pass)))
      (else (error "Invalid operation")))))

(define k2 (make-konto 100 'password))

((k2 'password 'withdraw) 40)         ; Withdraw 40 dollars from k2 with the correct password
((k2 'password 'withdraw) 20)         ; Attempt to withdraw 20 dollars from k2 with the correct password
((k2 'wrong-password 'withdraw) 20)   ; Attempt to withdraw 20 dollars from k2 with the wrong password
