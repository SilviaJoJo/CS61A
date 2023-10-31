(define (reverse lst)
    (define (reverse-helper lst curr)
        (if (null? lst) curr
            (reverse-helper (cdr lst) (append (cons (car lst) nil) curr))))
    (reverse-helper lst '()))

