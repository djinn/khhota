;; MIT License
;; Copyright (c) 2016-21 Matthew Butterick
;; Based on https://github.com/mbutterick/beautiful-racket
#lang br
(require "lexer.rkt" brag/support rackunit)

(define (lex str)
  (apply-port-proc basic-lexer str))

(check-equal? (lex "") empty)
(check-equal?
 (lex " ")
 (list (srcloc-token (token " " #:skip? #t)
                     (srcloc 'string 1 0 1 1))))
(check-equal?
 (lex "rem ignored\n")
 (list (srcloc-token (token 'REM "rem ignored")
                     (srcloc 'string 1 0 1 11))
       (srcloc-token (token 'NEWLINE "\n")
                     (srcloc 'string 1 11 12 1))))
(check-equal?
 (lex "print")
 (list (srcloc-token (token "print" "print")
                     (srcloc 'string 1 0 1 5))))
(check-equal?
 (lex "goto")
 (list (srcloc-token (token "goto" "goto")
                     (srcloc 'string 1 0 1 4))))
(check-equal?
 (lex "end")
 (list (srcloc-token (token "end" "end")
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
;; Processed for legal compliance https://github.com/hindawiai/khhota/LEGAL.md
