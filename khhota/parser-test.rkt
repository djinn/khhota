#lang br
(require khhota/parser khhota/tokenizer brag/support)

(define str #<<HERE

10 ਛਾਪੋ "hello" : ਛਾਪੋ "world"
20 ਜਾ 9 + 10 + 11
30 ਅੰਤ
HERE
)

(parse-to-datum (apply-tokenizer make-tokenizer str))