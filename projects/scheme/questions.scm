(define (caar x) (car (car x)))

(define (cadr x) (car (cdr x)))

(define (cdar x) (cdr (car x)))

(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.
(define (cons-all first rests)
  (if (null? rests)
      '()
      (cons (cons first (car rests))
            (cons-all first (cdr rests)))))

(define (zip pairs)
  (define (zip-helper pairs curr)
    (if (null? pairs)
        curr
        (zip-helper (cdr pairs)
                    (list (append (car curr) (cons (caar pairs) nil))
                          (append (cadr curr) (cons (cadr (car pairs)) nil))))))
  (zip-helper pairs '(() ())))

; ; Problem 16
; ; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 16
  (define (enum-helper s n)
    (if (null? s)
        '()
        (cons (list n (car s))
              (enum-helper (cdr s) (+ n 1)))))
  (enum-helper s 0))

; END PROBLEM 16
; ; Problem 17
; ; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 17
  (if (= total 0)
      '(())
      (if (not (null? denoms))
          (if (> (car denoms) total)
              (list-change total (cdr denoms))
              (append (cons-all (car denoms)
                                (list-change (- total (car denoms)) denoms))
                      (list-change total (cdr denoms))))
          '())))

; END PROBLEM 17
; ; Problem 18
; ; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))

(define define? (check-special 'define))

(define quoted? (check-special 'quote))

(define let? (check-special 'let))

; ; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond 
    ((atom? expr)
     ; BEGIN PROBLEM 18
     expr
     ; END PROBLEM 18
    )
    ((quoted? expr)
     ; BEGIN PROBLEM 18
     expr
     ; END PROBLEM 18
    )
    ((or (lambda? expr) (define? expr))
     (let ((form (car expr))
           (params (cadr expr))
           (body (cddr expr)))
       ; BEGIN PROBLEM 18
       (cons 'lambda
             (cons params (map let-to-lambda body))))
     ; END PROBLEM 18
    )
    ((let? expr)
     (let ((values (cadr expr))
           (body (cddr expr)))
       ; BEGIN PROBLEM 18
       (define helperLST (zip values))
       (define param (car helperLST))
       (define value
               (map let-to-lambda (cadr helperLST)))
       (append (cons (cons 'lambda
                           (cons param (map let-to-lambda body)))
                     nil)
               value)
       ; END PROBLEM 18
     ))
    (else
     ; BEGIN PROBLEM 18
     (cons (car expr) (map let-to-lambda (cdr expr)))
     ; END PROBLEM 18
    )))
