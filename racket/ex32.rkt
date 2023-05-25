#lang racket


; Please implement stacks analogous to queues.
; queues

; (define (front-ptr queue) (mcar queue))

; (define (rear-ptr queue) (mcdr queue))

; (define (set-front-ptr! queue item) (set-mcar! queue item))

; (define (set-rear-ptr! queue item) (set-mcdr! queue item))

; (define (empty-queue? queue) (null? (front-ptr queue)))

; (define (make-queue) (cons '() '()))

; (define (front-queue queue) 
;   (if (empty-queue? queue) 
;     (error "FRONT called with an empty queue" queue) 
;     (car (front-ptr queue))))

; (define (insert-queue! queue item)
;   (let ((new (mcons item '())))
;     (if (empty-queue? queue)
;       (begin (set-front-ptr! queue new)
;               (set-cdr! (rear-ptr queue) new)
;               queue)
;       (begin (set-mcdr! (rear-ptr queue) new)
;               (set-rear-ptr! queue new)
;               queue))))

; (define (delete-queue! queue)
;   (if ((empty-queue? queue)
;          (error "DELETE! called with an empty queue" queue))
;          (begin (set-front-ptr! queue (mcdr (front-ptr queue)))
;                 queue)))

; (define (print-queue queue)
;   (define (mlist-to-list l)
;     (if (null? l)
;       '()
;       (cons (mcar l) (mlist-to-list (mcdr l)))))
;       (mlist-to-list (mcar queue)))

(define (make-stack)
  (define my-stack '())
  
  (define (pop)
    (if (empty?)
        (error "Stack is empty -- POP")
        (let ((result (car my-stack)))
          (set! my-stack (cdr my-stack))
          result)))
  
  (define (push x)
    (set! my-stack (cons x my-stack)))
  
  (define (empty?)
    (null? my-stack))
  
  (define (prints)
    (if (empty?)
        #t
        (car my-stack)))
  
  (define (dispatch method)
    (cond ((eq? method 'pop) pop)
          ((eq? method 'push) push)
          ((eq? method 'empty?) empty?)
          ((eq? method 'prints) prints)
          (else (error "Unknown request -- STACK" method))))
  
  dispatch)

(define stack (make-stack))
((stack 'pop))
((stack 'push 5))
((stack 'empty?))
((stack 'prints))
