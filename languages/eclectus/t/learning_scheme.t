; $Id$
; $Id$

; This test script has nothing to do with implementing Scheme.
; It is just a playgroud for trying out Scheme syntax

(define plan
  (lambda (num-tests)
    ( printf "~s..~s\n" 1 num-tests)))

(define pass
  (lambda (test-num test-description)
    ( printf "ok ~s - ~s\n" test-num test-description)))

(define fail
  (lambda (test-num test-description)
    ( printf "not ok ~s - ~s\n" test-num test-description)))

; set up TAP test plan
(plan 17)

(define test-num 1)
(pass test-num "form definition")

; object properties are something like Perl hashes
(putprop 'parrot 'wing "feather")

(define desc "getprop equals")
(define test-num (add1 test-num))
(if (string=? (getprop 'parrot 'wing) "feather")       (pass test-num desc) (fail test-num desc)) 

(define desc "getprop not equal")
(define test-num (add1 test-num))
(if (string=? (getprop 'parrot 'wing) "not a feather") (fail test-num desc) (pass test-num desc)) 

; and
(define desc "and")

(define test-num (add1 test-num))
( if (and #t #t) (pass test-num desc) (fail test-num desc)) 

(define test-num (add1 test-num))
( if (and #t #f) (fail test-num desc) (pass test-num desc)) 

(define test-num (add1 test-num))
( if (and #t #t #t) (pass test-num desc) (fail test-num desc)) 

(define test-num (add1 test-num))
( if (and #t #f #t) (fail test-num desc) (pass test-num desc)) 

(define desc "recursive and")
( if (and (and #t #t) (and #t #t) ) (pass test-num desc) (fail test-num desc)) 
( if (and (and #t #t) (and #t #t) (and #f #t)) (fail test-num desc) (pass test-num desc)) 

; play with tree transformation
(define-syntax my-and
  (syntax-rules ()
    [(_)              #t]
    [(_ e)            e]
    [(_ e1 e2 e3 ...) ( if e1 (my-and e2 e3 ...) #f )]))

(define-syntax my-or
  (syntax-rules ()
    [(_)              #f]
    [(_ e)            e]
    [(_ e1 e2 e3 ...) ( if e1 e1 (my-or e2 e3 ...) )]))

; and
(define desc "my-and")

(define test-num (add1 test-num))
( if (my-and #t #t) (pass test-num desc) (fail test-num desc)) 

(define test-num (add1 test-num))
( if (my-and #t #f) (fail test-num desc) (pass test-num desc)) 

(define test-num (add1 test-num))
( if (my-and #t #t #t) (pass test-num desc) (fail test-num desc)) 

(define test-num (add1 test-num))
( if (my-and #t #f #t) (fail test-num desc) (pass test-num desc)) 

(define desc "recursive my-and")

(define test-num (add1 test-num))
( if (my-and (my-and #t #t) (my-and #t #t) ) (pass test-num desc) (fail test-num desc)) 
( if (my-and (my-and #t #t) (my-and #t #t) (my-and #f #t)) (fail test-num desc) (pass test-num desc)) 

(define desc "my-and and my-or")

(define test-num (add1 test-num))
( if (my-and (my-and #t #t) (my-or  #f #t) ) (pass test-num desc) (fail test-num desc)) 
( if (my-and (my-and #t #t) (my-or  #f #f) ) (fail test-num desc) (pass test-num desc)) 

