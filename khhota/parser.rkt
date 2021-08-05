;; MIT License
;; Copyright (c) 2016-21 Matthew Butterick
;; Based on https://github.com/mbutterick/beautiful-racket
#lang brag
jsonic-program : (jsonic-char | jsonic-sexp)*
jsonic-char    : CHAR-TOK
jsonic-sexp    : SEXP-TOK
;; Processed for legal compliance https://github.com/hindawiai/khhota/LEGAL.md
