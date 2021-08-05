;; MIT License
;; Copyright (c) 2016-21 Matthew Butterick
;; Based on https://github.com/mbutterick/beautiful-racket
#lang br/quicklang
(require "parser.rkt" "tokenizer.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-bindings
   #`(module basic-mod basic-demo/expander
       #,parse-tree)))

(module+ reader
  (provide read-syntax))
;; Processed for legal compliance https://github.com/hindawiai/khhota/LEGAL.md
