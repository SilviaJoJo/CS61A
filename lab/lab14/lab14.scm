(define (split-at lst n)
	(define (split-helper lst curr n)
		(if (null? lst) curr
			(if (= n 0)
				(cons (car curr) lst)
				(split-helper (cdr lst)
							  (cons (append (car curr) (cons (car lst) nil)) (cdr curr))
							  (- n 1)))))
	(split-helper lst (cons nil nil) n))


(define-macro (switch expr cases)
	(cons _________
		(map (_________ (_________) (cons _________ (cdr case)))
    			cases))
)

