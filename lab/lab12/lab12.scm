
(define-macro (def func args body)
    (list 'define (cons func args) body))


(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define all-three-multiples
  (map-stream (lambda (x) (+ x 3)) (cons-stream 0 all-three-multiples))
)


(define (compose-all funcs)
  (lambda (x)
  (if (null? funcs) x
  ((compose-all (cdr funcs)) ((car funcs) x))))
)


(define (partial-sums stream)
  (define (helper curr stream)
  (if (null? stream) '()
  (cons-stream (+ curr (car stream)) (helper (+ curr (car stream)) (cdr-stream stream)))))
  (helper 0 stream)
)

