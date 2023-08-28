(define (cddr s) (cdr (cdr s)))

(define (cadr s) 'YOUR-CODE-HERE (car (cdr s)))

(define (caddr s) 'YOUR-CODE-HERE (car (cddr s)))

(define (sign num)
  'YOUR-CODE-HERE
  (cond 
    [(< num 0) -1]
    [(= num 0) 0]
    [else      1]))

(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (cond 
    [(= y 0)   1]
    [(= y 1)   x]
    [(even? y) (square (pow x (/ y 2)))]
    [else      (* x (square (pow x (/ (- y 1) 2))))]))

(define (unique s)
  'YOUR-CODE-HERE
  (define (not-value? value)
    (lambda (x) (not (equal? x value))))
  (if (null? s)
      '()
      (cons (car s)
            (unique (filter (not-value? (car s)) (cdr s))))))

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (replicate-helper lst n)
    (if (= n 0)
        lst
        (replicate-helper (append lst (list x)) (- n 1))))
  (replicate-helper '() n))

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= n 0)
      start
      (combiner (term n)
                (accumulate combiner start (- n 1) term))))

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (accumulate-helper result curr)
    (if (= curr 0)
        result
        (accumulate-helper (combiner result (term curr))
                           (- curr 1))))
  (accumulate-helper start n))

(define-macro
 (list-of map-expr for var in lst if filter-expr)
 'YOUR-CODE-HERE)
