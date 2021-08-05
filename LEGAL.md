# Original license compliance
Fixing possible license issues

The source code for [Khhota](https://github.com/djinn/khhota) is significantly
similar to the code from [Beautiful Racket](https://beautifulracket.com/) which
is **not** [public domain](https://en.wikipedia.org/wiki/Public_domain). This is
seen in the reading of the [Beautiful Racket site's legal page](https://beautifulracket.com/legal.html).

The license as per the above link is [MIT License](https://en.wikipedia.org/wiki/MIT_License)

Further reading of the aforementioned page brings forth the following contention,
which clarifies the licensing intent of the original copyright holder
```
All the sample code in the book, including the code in the tutorial projects, is made available under the MIT License
```

The said MIT License places the following conditions on the use and distribution of
the work including derivative work
```
MIT License
Copyright (c) 2016-21 Matthew Butterick

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

On further discovery it has also been noticed that the same or similar source
code of the aforementioned programs is made available on the archival site
[GitHub](https://github.com) under the aegis of a repository named 
[beautiful-racket](https://github.com/mbutterick/beautiful-racket) by the 
user [@mbutterick](https://github.com/mbutterick). This repository also 
states the files to be available under [MIT License](https://github.com/mbutterick/beautiful-racket/blob/master/LICENSE.md)

The said MIT License places the following conditions on the use and distribution of
the work including derivative work
```
MIT License for beautiful-racket

© 2016-2019 Matthew Butterick

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

```

For the purpose of compliance we shall be using the more recent notice of copyright and
license as observed in the first instance above.

To measure the degree of similarity we use the following set of commands executed on 
a Linux system running Ubuntu 20.04 distribution.
```bash
dt=$(date +%s)
mkdir ${dt}
pushd ${dt}
  git clone https://github.com/djinn/khhota
  pushd khhota
  git checkout ec62380ee9188fb21dc4a4068d1fffb6e24cd602
  popd
  git clone https://github.com/mbutterick/beautiful-racket
  pushd beautiful-racket
  git checkout b0d133f4ba4149ea506d8b0dbd3845c915efdd06
  popd
  for n in $(find khhota/ | grep rkt$)
  do
    fn=$(basename ${n})
    for s in $(find beautiful-racket/ | grep ${fn})
    do
      printf "%d differences found while comparing ${n} ${s}\n" $(diff ${n} ${s} | wc -l)
    done | grep $n | sort -n | head -1
  done | sort -n
popd
```

The above results in output similar to the one below.
```
0 differences found while comparing khhota/khhota/expander.rkt beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt
4 differences found while comparing khhota/khhota/tokenizer.rkt beautiful-racket/beautiful-racket-demo/basic-demo-2a/tokenizer.rkt
9 differences found while comparing khhota/khhota/main.rkt beautiful-racket/beautiful-racket-demo/basic-demo/main.rkt
17 differences found while comparing khhota/khhota/parser.rkt beautiful-racket/beautiful-racket-demo/jsonic-demo-2/parser.rkt
22 differences found while comparing khhota/khhota/sample.rkt beautiful-racket/beautiful-racket-demo/basic-demo-2a/sample.rkt
37 differences found while comparing khhota/khhota/lexer.rkt beautiful-racket/beautiful-racket-demo/basic-demo-2a/lexer.rkt
40 differences found while comparing khhota/khhota/parser-test.rkt beautiful-racket/beautiful-racket-demo/jsonic-demo-2/parser-test.rkt
55 differences found while comparing khhota/khhota/lexer-test.rkt beautiful-racket/beautiful-racket-demo/basic-demo/lexer-test.rkt
```

Apparently the files khhota/khhota/expander.rkt and beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt are
identical. We further test these by comparing the digital fingerprint
```
sha256sum khhota/khhota/expander.rkt
sha256sum beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt
#For reference the files are escrowed on [web archive](http://web.archive.org/web/20210805065918/https://github.com/djinn/khhota/blame/main/khhota/expander.rkt
)
```

The digital signature thus obtained are as below
```
0ad7ea2f85afd517ae26ce73820b176a42717ddd701e9338366869768a36a974  khhota/khhota/expander.rkt
0ad7ea2f85afd517ae26ce73820b176a42717ddd701e9338366869768a36a974  beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt
```
The two files are apprently **exactly** the same and identical in every aspect.

We include the SHA calculation for files with 0 (zero) differences in the earlier script
```
dt=$(date +%s)
mkdir ${dt}
pushd ${dt}
  git clone https://github.com/djinn/khhota
  pushd khhota
  git checkout ec62380ee9188fb21dc4a4068d1fffb6e24cd602
  popd
  git clone https://github.com/mbutterick/beautiful-racket
  pushd beautiful-racket
  git checkout b0d133f4ba4149ea506d8b0dbd3845c915efdd06
  popd
  for n in $(find khhota/ | grep rkt$)
  do
    fn=$(basename ${n})
    for s in $(find beautiful-racket/ | grep ${fn})
    do
      printf "%d differences found while comparing ${n} ${s}\n" $(diff ${n} ${s} | wc -l)
    done | grep $n | sort -n | head -1
  done | sort -rn | tee >/dev/stderr \
  >(printf "Total %d files possible analysis candidates\n" $(wc -l))\
  >(awk '{ if ($1=="0"){
             print "Files " $6 " and " $7 " are possibly identical with the following SHA256 sums"
             system("sha256sum " $6 " && sha256sum " $7)
           }
         }')
popd
```

This gives an output similar to the one below
```
5 differences found while comparing khhota/khhota/lexer-test.rkt beautiful-racket/beautiful-racket-demo/basic-demo/lexer-test.rkt
40 differences found while comparing khhota/khhota/parser-test.rkt beautiful-racket/beautiful-racket-demo/jsonic-demo-2/parser-test.rkt
37 differences found while comparing khhota/khhota/lexer.rkt beautiful-racket/beautiful-racket-demo/basic-demo-2a/lexer.rkt
22 differences found while comparing khhota/khhota/sample.rkt beautiful-racket/beautiful-racket-demo/basic-demo-2a/sample.rkt
17 differences found while comparing khhota/khhota/parser.rkt beautiful-racket/beautiful-racket-demo/jsonic-demo-2/parser.rkt
9 differences found while comparing khhota/khhota/main.rkt beautiful-racket/beautiful-racket-demo/basic-demo/main.rkt
4 differences found while comparing khhota/khhota/tokenizer.rkt beautiful-racket/beautiful-racket-demo/basic-demo-2a/tokenizer.rkt
0 differences found while comparing khhota/khhota/expander.rkt beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt
Files khhota/khhota/expander.rkt and beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt are possibly identical with the following SHA256 sums
0ad7ea2f85afd517ae26ce73820b176a42717ddd701e9338366869768a36a974  khhota/khhota/expander.rkt
ac@ayeai-gold:~/work_local/preet/1628153719$ popd0ad7ea2f85afd517ae26ce73820b176a42717ddd701e9338366869768a36a974  beautiful-racket/beautiful-racket-demo/basic-demo/expander.rkt
Total 8 files possible analysis candidates
```

Going by the above, we replace the matching files **from** beautiful-racket **into** khhota
using a modification of the above script
```
dt=$(date +%s)
mkdir ${dt}
pushd ${dt}
  git clone https://github.com/djinn/khhota
  pushd khhota
  git checkout ec62380ee9188fb21dc4a4068d1fffb6e24cd602
  popd
  git clone https://github.com/mbutterick/beautiful-racket
  pushd beautiful-racket
  git checkout b0d133f4ba4149ea506d8b0dbd3845c915efdd06
  popd
  for n in $(find khhota/ | grep rkt$)
  do
    fn=$(basename ${n})
    for s in $(find beautiful-racket/ | grep ${fn})
    do
      printf "%d differences found while comparing ${n} ${s}\n" $(diff ${n} ${s} | wc -l)
    done | grep $n | sort -n | head -1
  done | sort -rn | tee >/dev/stderr \
  >(printf "Total %d files possible analysis candidates\n" $(wc -l))\
  >(awk '{ if ($1=="0"){
             print "Files " $6 " and " $7 " are possibly identical with the following SHA256 sums"
             system("sha256sum " $6 " && sha256sum " $7)
           }
         }')\
  >(awk '{ system("cp -f " $6 " " $7 " && cd beautiful-racket && git diff -w")
         }')
popd
```

This gives the following diff
```
diff --git a/beautiful-racket-demo/basic-demo/lexer-test.rkt b/beautiful-racket-demo/basic-demo/lexer-test.rkt
index ddc9bf0..8bd45f9 100644
--- a/beautiful-racket-demo/basic-demo/lexer-test.rkt
+++ b/beautiful-racket-demo/basic-demo/lexer-test.rkt
@@ -1,31 +1,35 @@
 #lang br 
 (require "lexer.rkt" brag/support rackunit)
-
 (define (lex str)
-  (apply-port-proc basic-lexer str))
+       (apply-port-proc khhota-lexer str))
 
 (check-equal? (lex "")  empty)
+
 (check-equal? 
        (lex " ")
- (list (srcloc-token (token " " #:skip? #t)
-                     (srcloc 'string 1 0 1 1))))
+       (list (srcloc-token (token " " #:skip #t)
+               (srcloc 'string 1 0 1 1)))
+)
+
 (check-equal? 
- (lex "rem ignored\n")
- (list (srcloc-token (token 'REM "rem ignored")
+       (lex "ਟਿੱਪਣੀ ignored\n")
+       (list (srcloc-token (token 'REM "ਟਿੱਪਣੀ ignored")
                      (srcloc 'string 1 0 1 11))
        (srcloc-token (token 'NEWLINE "\n")
-                     (srcloc 'string 1 11 12 1))))
+                     (srcloc 'string 1 11 12 1)))      
diff --git a/beautiful-racket-demo/basic-demo/lexer-test.rkt b/beautiful-racket-demo/basic-demo/lexer-test.rkt
index ddc9bf0..8bd45f9 100644
--- a/beautiful-racket-demo/basic-demo/lexer-test.rkt
+++ b/beautiful-racket-demo/basic-demo/lexer-test.rkt
@@ -1,31 +1,35 @@
 #lang br 
 (require "lexer.rkt" brag/support rackunit)
-
 (define (lex str)
-  (apply-port-proc basic-lexer str))
+       (apply-port-proc khhota-lexer str))
 
 (check-equal? (lex "")  empty)
+
 (check-equal? 
        (lex " ")
- (list (srcloc-token (token " " #:skip? #t)
-                     (srcloc 'string 1 0 1 1))))
+       (list (srcloc-token (token " " #:skip #t)
+               (srcloc 'string 1 0 1 1)))
+)
+
 (check-equal? 
- (lex "rem ignored\n")
- (list (srcloc-token (token 'REM "rem ignored")
+       (lex "ਟਿੱਪਣੀ ignored\n")
+       (list (srcloc-token (token 'REM "ਟਿੱਪਣੀ ignored")
                      (srcloc 'string 1 0 1 11))
        (srcloc-token (token 'NEWLINE "\n")
-                     (srcloc 'string 1 11 12 1))))
+                     (srcloc 'string 1 11 12 1)))      
diff --git a/beautiful-racket-demo/basic-demo-2a/lexer.rkt b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
index 95b0bef..57d28f9 100644
--- a/beautiful-racket-demo/basic-demo-2a/lexer.rkt
+++ b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
@@ -3,13 +3,12 @@
 
 (define-lex-abbrev digits (:+ (char-set "0123456789")))
 
-(define basic-lexer
+(define khhota-lexer
        (lexer-srcloc
                ["\n" (token 'NEWLINE lexeme)]
                [whitespace (token lexeme #:skip? #t)]
-   [(from/stop-before "rem" "\n") (token 'REM lexeme)]
-   [(:or "print" "goto" "end"
-         "+" ":" ";") (token lexeme lexeme)]
+               [(from/stop-before "ਟਿੱਪਣੀ" "\n") (token 'REM lexeme)]
+               [(:or "ਛਾਪੋ" "ਜਾ" "ਅੰਤ" "+" ":" ";") (token lexeme)]
                [digits (token 'INTEGER (string->number lexeme))]
                [(:or (:seq (:? digits) "." digits)
          (:seq digits "."))
@@ -17,6 +16,7 @@
        [(:or (from/to "\"" "\"") (from/to "'" "'"))
                (token 'STRING
                        (substring lexeme
-                      1 (sub1 (string-length lexeme))))]))
+                      1 (sub1 (string-length lexeme))))]
+       ))
 
-(provide basic-lexer)
+(provide khhota-lexer)
diff --git a/beautiful-racket-demo/basic-demo-2a/lexer.rkt b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
index 95b0bef..57d28f9 100644
--- a/beautiful-racket-demo/basic-demo-2a/lexer.rkt
+++ b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
@@ -3,13 +3,12 @@
 
 (define-lex-abbrev digits (:+ (char-set "0123456789")))
 
-(define basic-lexer
+(define khhota-lexer
        (lexer-srcloc
                ["\n" (token 'NEWLINE lexeme)]
                [whitespace (token lexeme #:skip? #t)]
-   [(from/stop-before "rem" "\n") (token 'REM lexeme)]
-   [(:or "print" "goto" "end"
-         "+" ":" ";") (token lexeme lexeme)]
+               [(from/stop-before "ਟਿੱਪਣੀ" "\n") (token 'REM lexeme)]
+               [(:or "ਛਾਪੋ" "ਜਾ" "ਅੰਤ" "+" ":" ";") (token lexeme)]
                [digits (token 'INTEGER (string->number lexeme))]
                [(:or (:seq (:? digits) "." digits)
          (:seq digits "."))
@@ -17,6 +16,7 @@
        [(:or (from/to "\"" "\"") (from/to "'" "'"))
                (token 'STRING
                        (substring lexeme
-                      1 (sub1 (string-length lexeme))))]))
+                      1 (sub1 (string-length lexeme))))]
+       ))
 
-(provide basic-lexer)
+(provide khhota-lexer)
diff --git a/beautiful-racket-demo/basic-demo-2a/lexer.rkt b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
index 95b0bef..57d28f9 100644
--- a/beautiful-racket-demo/basic-demo-2a/lexer.rkt
+++ b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
@@ -3,13 +3,12 @@
 
 (define-lex-abbrev digits (:+ (char-set "0123456789")))
 
-(define basic-lexer
+(define khhota-lexer
        (lexer-srcloc
                ["\n" (token 'NEWLINE lexeme)]
                [whitespace (token lexeme #:skip? #t)]
-   [(from/stop-before "rem" "\n") (token 'REM lexeme)]
-   [(:or "print" "goto" "end"
-         "+" ":" ";") (token lexeme lexeme)]
+               [(from/stop-before "ਟਿੱਪਣੀ" "\n") (token 'REM lexeme)]
+               [(:or "ਛਾਪੋ" "ਜਾ" "ਅੰਤ" "+" ":" ";") (token lexeme)]
                [digits (token 'INTEGER (string->number lexeme))]
                [(:or (:seq (:? digits) "." digits)
          (:seq digits "."))
@@ -17,6 +16,7 @@
        [(:or (from/to "\"" "\"") (from/to "'" "'"))
                (token 'STRING
                        (substring lexeme
-                      1 (sub1 (string-length lexeme))))]))
+                      1 (sub1 (string-length lexeme))))]
+       ))
 
-(provide basic-lexer)
+(provide khhota-lexer)
diff --git a/beautiful-racket-demo/basic-demo-2a/lexer.rkt b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
index 95b0bef..57d28f9 100644
--- a/beautiful-racket-demo/basic-demo-2a/lexer.rkt
+++ b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
@@ -3,13 +3,12 @@
 
 (define-lex-abbrev digits (:+ (char-set "0123456789")))
 
-(define basic-lexer
+(define khhota-lexer
        (lexer-srcloc
                ["\n" (token 'NEWLINE lexeme)]
                [whitespace (token lexeme #:skip? #t)]
-   [(from/stop-before "rem" "\n") (token 'REM lexeme)]
-   [(:or "print" "goto" "end"
-         "+" ":" ";") (token lexeme lexeme)]
+               [(from/stop-before "ਟਿੱਪਣੀ" "\n") (token 'REM lexeme)]
+               [(:or "ਛਾਪੋ" "ਜਾ" "ਅੰਤ" "+" ":" ";") (token lexeme)]
                [digits (token 'INTEGER (string->number lexeme))]
                [(:or (:seq (:? digits) "." digits)
          (:seq digits "."))
@@ -17,6 +16,7 @@
        [(:or (from/to "\"" "\"") (from/to "'" "'"))
                (token 'STRING
                        (substring lexeme
-                      1 (sub1 (string-length lexeme))))]))
+                      1 (sub1 (string-length lexeme))))]
+       ))
 
-(provide basic-lexer)
+(provide khhota-lexer)
diff --git a/beautiful-racket-demo/basic-demo-2a/lexer.rkt b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
index 95b0bef..57d28f9 100644
--- a/beautiful-racket-demo/basic-demo-2a/lexer.rkt
+++ b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
@@ -3,13 +3,12 @@
 
 (define-lex-abbrev digits (:+ (char-set "0123456789")))
 
-(define basic-lexer
+(define khhota-lexer
        (lexer-srcloc
                ["\n" (token 'NEWLINE lexeme)]
                [whitespace (token lexeme #:skip? #t)]
-   [(from/stop-before "rem" "\n") (token 'REM lexeme)]
-   [(:or "print" "goto" "end"
-         "+" ":" ";") (token lexeme lexeme)]
+               [(from/stop-before "ਟਿੱਪਣੀ" "\n") (token 'REM lexeme)]
+               [(:or "ਛਾਪੋ" "ਜਾ" "ਅੰਤ" "+" ":" ";") (token lexeme)]
                [digits (token 'INTEGER (string->number lexeme))]
                [(:or (:seq (:? digits) "." digits)
          (:seq digits "."))
@@ -17,6 +16,7 @@
        [(:or (from/to "\"" "\"") (from/to "'" "'"))
                (token 'STRING
                        (substring lexeme
-                      1 (sub1 (string-length lexeme))))]))
+                      1 (sub1 (string-length lexeme))))]
+       ))
 
-(provide basic-lexer)
+(provide khhota-lexer)
diff --git a/beautiful-racket-demo/basic-demo-2a/lexer.rkt b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
index 95b0bef..57d28f9 100644
--- a/beautiful-racket-demo/basic-demo-2a/lexer.rkt
+++ b/beautiful-racket-demo/basic-demo-2a/lexer.rkt
@@ -3,13 +3,12 @@
 
 (define-lex-abbrev digits (:+ (char-set "0123456789")))
 
-(define basic-lexer
+(define khhota-lexer
        (lexer-srcloc
                ["\n" (token 'NEWLINE lexeme)]
                [whitespace (token lexeme #:skip? #t)]
-   [(from/stop-before "rem" "\n") (token 'REM lexeme)]
-   [(:or "print" "goto" "end"
-         "+" ":" ";") (token lexeme lexeme)]
+               [(from/stop-before "ਟਿੱਪਣੀ" "\n") (token 'REM lexeme)]
+               [(:or "ਛਾਪੋ" "ਜਾ" "ਅੰਤ" "+" ":" ";") (token lexeme)]
                [digits (token 'INTEGER (string->number lexeme))]
                [(:or (:seq (:? digits) "." digits)
          (:seq digits "."))
@@ -17,6 +16,7 @@
        [(:or (from/to "\"" "\"") (from/to "'" "'"))
                (token 'STRING
                        (substring lexeme
-                      1 (sub1 (string-length lexeme))))]))
+                      1 (sub1 (string-length lexeme))))]
+       ))
 
-(provide basic-lexer)
+(provide khhota-lexer)
```

Given the above diff, it is fair to maintain the license from the original repo.

Since we do not have write access to **khhota** (Donkey BASIC) we shall work on
a fork and apply the patches.

```
dt=$(date +%s)
mkdir ${dt}
pushd ${dt}
  git clone https://github.com/hindawiai/khhota
  git clone https://github.com/mbutterick/beautiful-racket
  pushd beautiful-racket
  git checkout b0d133f4ba4149ea506d8b0dbd3845c915efdd06
  popd
  for n in $(find khhota/ | grep rkt$)
  do
    fn=$(basename ${n})
    for s in $(find beautiful-racket/ | grep ${fn})
    do
      printf "%d differences found while comparing ${n} ${s}\n" $(diff ${n} ${s} | wc -l)
    done | grep $n | sort -n | head -1
  done | sort -rn | tee >/dev/stderr \
  >(printf "Total %d files possible analysis candidates\n" $(wc -l))\
  >(awk '{ if ($1=="0"){
             print "Files " $6 " and " $7 " are possibly identical with the following SHA256 sums"
             system("sha256sum " $6 " && sha256sum " $7)
           }
         }')\
  >(awk '{ system("cp -f " $7 " " $6 " && cd beautiful-racket && git diff -w")
         }')
  cp beautiful-racket/LICENSE.md khhota/LICENSE.md
  cp beautiful-racket/LICENSE.md khhota/LICENSE
  for n in $(find khhota/ | grep rkt$)
  do
    cat ${n} |\
    awk 'BEGIN { print ";; MIT License";
                 print ";; Copyright (c) 2016-21 Matthew Butterick";
                 print ";; Based on https://github.com/mbutterick/beautiful-racket"
               }
         /.*/  {print}
         END  { print ";; Processed for legal compliance https://github.com/hindawiai/khhota/LEGAL.md"; }' > ${n}.tmp
     cp -f ${n}.tmp ${n} && rm ${n}.tmp
  done
  cd khhota
  find . -type f | grep -v '\.git' | xargs git add
  git commit -m "SHARM-Honor: Shell Automated Resource Management towards FOSS Honor"
popd
```

The above changes shall be pushed through a pull request to ensure compliance upstream, however,
we cannot guarantee changes in other repositories.

References as accessed on 2021-08-05:
```
http://web.archive.org/web/20210805061124/https://github.com/djinn/khhota/issues/1
http://web.archive.org/web/20210805054537/https://github.com/djinn/khhota/blame/main/README.md
http://web.archive.org/web/20210805065633/https://github.com/djinn/khhota/blame/main/LICENSE
http://web.archive.org/web/20210805065918/https://github.com/djinn/khhota/blame/main/khhota/expander.rkt
http://web.archive.org/web/20210805070133/https://github.com/djinn/khhota/blame/main/khhota/lexer-test.rkt
http://web.archive.org/web/20210805070246/https://github.com/djinn/khhota/blame/main/khhota/lexer.rkt
http://web.archive.org/web/20210805070337/https://github.com/djinn/khhota/blame/main/khhota/main.rkt
http://web.archive.org/web/20210805070516/https://github.com/djinn/khhota/blame/main/khhota/parser.rkt
http://web.archive.org/web/20210805070623/https://github.com/djinn/khhota/blame/main/khhota/parser-test.rkt
http://web.archive.org/web/20210805070721/https://github.com/djinn/khhota/blame/main/khhota/sample.rkt
http://web.archive.org/web/20210805070943/https://github.com/djinn/khhota/blame/main/khhota/tokenizer.rkt
```
