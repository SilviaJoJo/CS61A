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
	(cons 'cond
		(map (lambda (case) (cons (eq? (eval expr) (car case)) (cdr case)))
    			cases)))
'Note-that-the-cond-is-quoted-while-map,-lambda,-eq?-are-not
'This-is-because-cond-is-not-executed-until-macro-is-called
'But-the-other-ones-are-executed-when-macro-is-initiated