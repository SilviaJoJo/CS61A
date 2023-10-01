(define (rle s)
    (define (rle-helper last count s)
        (if (null? s)
            (cons-stream (list last count) nil)
                (if (= last (car s))
                    (rle-helper last (+ count 1) (cdr-stream s))
                    (cons-stream (list last count) (rle-helper (car s) 0 s)))))
    (if (null? s) '()
        (rle-helper (car s) 0 s)))



(define (group-by-nondecreasing s)
    (define (helper last curr s)
        (if (null? s) (cons-stream curr nil)
            (if (>= (car s) last)
                (helper (car s) (append curr (cons (car s) nil)) (cdr-stream s))
                (cons-stream curr (helper (car s) '() s)))))
    (if (null? s) '()
        (helper (car s) '() s)))


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

