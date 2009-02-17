#! perl
# $Id$

# Copyright (C) 2002-2007, Parrot Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 12;
use Parrot::Test;

language_output_is( 'Scheme', <<'CODE', 'a', 'a symbol' );
(write 'a) ; for emacs ')
CODE

language_output_is( 'Scheme', <<'CODE', '5', 'define' );
(define a 5)
(write a)
CODE

language_output_is( 'Scheme', <<'CODE', '5', 'define II' );
(define a 4)
(define b (+ a 1))
(write b)
CODE

language_output_is( 'Scheme', <<'CODE', '8', 'set!' );
(define a 5)
(set! a 8)
(write a)
CODE

language_output_is( 'Scheme', <<'CODE', '13', 'set! II' );
(define a 5)
(set! a (+ a 8))
(write a)
CODE

language_output_is( 'Scheme', <<'CODE', '(18 17)', 'define function' );
(define (f a b) (list b a))
(write (f 17 18))
CODE

language_output_is( 'Scheme', <<'CODE', '3', 'define via lambda' );
(define sum (lambda (a b) (+ a b)))
(write (sum 1 2))
CODE

language_output_is( 'Scheme', <<'CODE', '101', 'let' );
(let ((a 1))
 (write a)
 (let ((a 0)
       (b 0))
  (write a))
 (write a))
CODE

language_output_is( 'Scheme', <<'CODE', '321', 'counter' );
(define (make-counter val) 
   (lambda () 
     (set! val (- val 1))
     val)
)
(define counter (make-counter 4))
(write (counter))
(write (counter))
(write (counter))
CODE

language_output_is( 'Scheme', <<'CODE', '9837', '2 counter' );
(define (make-counter val) 
   (lambda () 
     (set! val (- val 1))
     val)
)
(define ci (make-counter 10))
(write (ci))
(define cii (make-counter 4))
(write (ci))
(write (cii))
(write (ci))
CODE

language_output_is( 'Scheme', <<'CODE', '012023', 'yet another counter' );
(define (make-counter incr) 
  (let ((val 0)) 
    (lambda ()
      (let ((ret val))
	(set! val (+ incr val))
	ret))))
(define ci (make-counter 1))
(write (ci))
(write (ci))
(define cii (make-counter 2))
(write (ci))
(write (cii))
(write (cii))
(write (ci))
CODE

language_output_is( 'Scheme', <<'CODE', '120', 'fakultaet' );
(define (fak n)
  (if (= n 0)
      1
      (* n (fak (- n 1)))))
(write (fak 5))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
