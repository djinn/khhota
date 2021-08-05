#lang br 
(require "lexer.rkt" brag/support rackunit)
(define (lex str)
	(apply-port-proc khhota-lexer str))

(check-equal? (lex "")  empty)

(check-equal? 
	(lex " ")
	(list (srcloc-token (token " " #:skip #t)
		(srcloc 'string 1 0 1 1)))
)

(check-equal? 
	(lex "ਟਿੱਪਣੀ ignored\n")
	(list (srcloc-token (token 'REM "ਟਿੱਪਣੀ ignored")
                     (srcloc 'string 1 0 1 11))
       (srcloc-token (token 'NEWLINE "\n")
                     (srcloc 'string 1 11 12 1)))	
)

(check-equal?
 (lex "ਛਾਪੋ")
 (list (srcloc-token (token "ਛਾਪੋ" "ਛਾਪੋ")
                     (srcloc 'string 1 0 1 5))))
(check-equal?
 (lex "ਜਾ")
 (list (srcloc-token (token "ਜਾ" "ਜਾ")
                     (srcloc 'string 1 0 1 4))))
(check-equal?
 (lex "ਅੰਤ")
 (list (srcloc-token (token "ਅੰਤ" "ਅੰਤ")
                     (srcloc 'string 1 0 1 3))))
(check-equal?
 (lex "+")
 (list (srcloc-token (token "+" "+")
                     (srcloc 'string 1 0 1 1))))
(check-equal?
 (lex ";")
 (list (srcloc-token (token ";" ";")
                     (srcloc 'string 1 0 1 1))))
(check-equal?
 (lex ":")
 (list (srcloc-token (token ":" ":")
                     (srcloc 'string 1 0 1 1))))
(check-equal?
 (lex "12")
 (list (srcloc-token (token 'INTEGER 12)
                     (srcloc 'string 1 0 1 2))))
(check-equal?
 (lex "1.2")
 (list (srcloc-token (token 'DECIMAL 1.2)
                     (srcloc 'string 1 0 1 3))))
(check-equal?
 (lex "12.")
 (list (srcloc-token (token 'DECIMAL 12.)
                     (srcloc 'string 1 0 1 3))))
(check-equal?
 (lex ".12")
 (list (srcloc-token (token 'DECIMAL .12)
                     (srcloc 'string 1 0 1 3))))
(check-equal?
 (lex "\"foo\"")
 (list (srcloc-token (token 'STRING "foo")
                     (srcloc 'string 1 0 1 5))))
(check-equal?
 (lex "'foo'")
 (list (srcloc-token (token 'STRING "foo")
                     (srcloc 'string 1 0 1 5))))
(check-exn exn:fail:read? (lambda () (lex "x")))