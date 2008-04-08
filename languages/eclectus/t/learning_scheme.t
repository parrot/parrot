; $Id$

(load "tap_helpers.scm")

; This test script has nothing to do with implementing Scheme.
; It is just a playgroud for trying out Scheme syntax

; set up TAP test plan
(plan 17)

(define test-num 1)
(pass test-num "form definition")

; object properties are something like Perl hashes
(putprop 'parrot 'wing "feather")

(define desc "getprop equals")
(set! test-num (add1 test-num))
(if (string=? (getprop 'parrot 'wing) "feather")       (pass test-num desc) (fail test-num desc)) 

(define desc "getprop not equal")
(set! test-num (add1 test-num))
(if (string=? (getprop 'parrot 'wing) "not a feather") (fail test-num desc) (pass test-num desc)) 

; and
(define desc "and")

(set! test-num (add1 test-num))
( if (and #t #t) (pass test-num desc) (fail test-num desc)) 

(set! test-num (add1 test-num))
( if (and #t #f) (fail test-num desc) (pass test-num desc)) 

(set! test-num (add1 test-num))
( if (and #t #t #t) (pass test-num desc) (fail test-num desc)) 

(set! test-num (add1 test-num))
( if (and #t #f #t) (fail test-num desc) (pass test-num desc)) 

(define desc "recursive and")
(set! test-num (add1 test-num))
( if (and (and #t #t) (and #t #t) ) (pass test-num desc) (fail test-num desc)) 
(set! test-num (add1 test-num))
( if (and (and #t #t) (and #t #t) (and #f #t)) (fail test-num desc) (pass test-num desc)) 

; play with tree transformation
(define-syntax my-and
  (syntax-rules ()
    ((_)              #t)
    ((_ e)            e)
    ((_ e1 e2 e3 ...) ( if e1 (my-and e2 e3 ...) #f ))))

(define-syntax my-or
  (syntax-rules ()
    ((_)              #f)
    ((_ e)            e)
    ((_ e1 e2 e3 ...) ( if e1 e1 (my-or e2 e3 ...) ))))

; and
(define desc "my-and")

(set! test-num (add1 test-num))
( if (my-and #t #t) (pass test-num desc) (fail test-num desc)) 

(set! test-num (add1 test-num))
( if (my-and #t #f) (fail test-num desc) (pass test-num desc)) 

(set! test-num (add1 test-num))
( if (my-and #t #t #t) (pass test-num desc) (fail test-num desc)) 

(set! test-num (add1 test-num))
( if (my-and #t #f #t) (fail test-num desc) (pass test-num desc)) 

(define desc "recursive my-and")

(set! test-num (add1 test-num))
( if (my-and (my-and #t #t) (my-and #t #t) ) (pass test-num desc) (fail test-num desc)) 
(set! test-num (add1 test-num))
( if (my-and (my-and #t #t) (my-and #t #t) (my-and #f #t)) (fail test-num desc) (pass test-num desc)) 

(define desc "my-and and my-or")

(set! test-num (add1 test-num))
( if (my-and (my-and #t #t) (my-or  #f #t) ) (pass test-num desc) (fail test-num desc)) 
(set! test-num (add1 test-num))
( if (my-and (my-and #t #t) (my-or  #f #f) ) (fail test-num desc) (pass test-num desc)) 
