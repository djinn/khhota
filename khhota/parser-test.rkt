;; MIT License
;; Copyright (c) 2016-21 Matthew Butterick
;; Based on https://github.com/mbutterick/beautiful-racket
#lang br
(require "parser.rkt" "tokenizer.rkt" brag/support rackunit)

(check-equal?
 (parse-to-datum
  (apply-tokenizer-maker make-tokenizer "// line commment\n"))
 '(jsonic-program))
(check-equal?
 (parse-to-datum
  (apply-tokenizer-maker make-tokenizer "@$ 42 $@"))
 '(jsonic-program (jsonic-sexp " 42 ")))
(check-equal?
 (parse-to-datum
  (apply-tokenizer-maker make-tokenizer "hi"))
 '(jsonic-program
   (jsonic-char "h")
   (jsonic-char "i")))
(check-equal?
 (parse-to-datum
  (apply-tokenizer-maker make-tokenizer
                         "hi\n// comment\n@$ 42 $@"))
 '(jsonic-program
   (jsonic-char "h")
   (jsonic-char "i")
   (jsonic-char "\n")
   (jsonic-sexp " 42 ")))
;; Processed for legal compliance https://github.com/hindawiai/khhota/LEGAL.md
