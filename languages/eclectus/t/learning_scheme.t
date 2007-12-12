; $Id$
; $Id$

; This test script has nothing to do with implementing Scheme.
; It is just a playgroud for trying out Scheme syntax

(define (plan num-tests)
  ( printf "~s..~s\n" 1 num-tests))
(define (pass test-num test-description)
  ( printf "ok ~s - ~s\n" test-num test-description))
(define (fail test-num test-description)
  ( printf "not ok ~s - ~s\n" test-num test-description))

(plan 3)
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
