#! perl -w
# $Id$

use FindBin;
use lib "$FindBin::Bin/../..";

use Scheme::Test tests => 26;

output_is(<<'CODE', '(2 . 5)', 'cons');
(write (cons 2 5))
CODE

output_is(<<'CODE', '((2 . 3) . 4)', 'cons car');
(write (cons (cons 2 3) 4))
CODE

output_is(<<'CODE', '(2 3 . 4)', 'cons cdr');
(write (cons 2 (cons 3 4)))
CODE

output_is(<<'CODE', '((1 . 2) 3 . 4)', 'complex cons');
(write 
  (cons 
    (cons 1 2) 
    (cons 3 4)))
CODE

output_is(<<'CODE', '1', 'pair?');
(write
  (pair? (cons 1 3)))
CODE

output_is(<<'CODE', '0', 'false pair?');
(write
  (pair? 12))
CODE

output_is(<<'CODE', '(3 2 1 0)', 'list');
(write
  (list 3 2 1 0))
CODE

output_is(<<'CODE', '1', 'pair? list');
(write
  (pair? (list 3 2 1)))
CODE

output_is(<<'CODE', '(1 2 3)', 'lists the hard way');
(write
  (cons 1
    (cons 2
      (cons 3
        (list)))))
CODE

output_is(<<'CODE', '4', 'length');
(write
  (length (list 3 2 1 0)))
CODE

output_is(<<'CODE', '2', 'car');
(write
  (car (list 2 1 0)))
CODE

output_is(<<'CODE', '(1 0)', 'cdr');
(write
  (cdr (list 2 1 0)))
CODE

output_is(<<'CODE', '(4 2 3)', 'set-car!');
(write
  (set-car! (list 1 2 3) 4))
CODE

output_is(<<'CODE', '((4 . 2) 2 3)', 'set-car! II');
(write
  (set-car! (list 1 2 3) (cons 4 2)))
CODE

output_is(<<'CODE', '(1 4 2)', 'set-cdr!');
(write
  (set-cdr! (list 1 2 3) (list 4 2)))
CODE

output_is(<<'CODE', '(1 2 3 4)', 'quoted list');
(write '(1 2 3 4)) ; for emacs ')
CODE

output_is(<<'CODE', '1', 'null?');
(write
  (null? (list)))
CODE

output_is (<<'CODE', '()', "'()");
(write '()) ; for emacs ')
CODE

output_is (<<'CODE', '0', 'failed null?');
(write
  (null? (list 1)))
CODE

output_is (<<'CODE', '(1 2 (3 4))', 'complex list');
(write
  '(1 2 (3 4))) ; for emacs ')
CODE

output_is (<<'CODE', '(1 2 (3 4))', 'complex list II');
(write
  (list 1 2 (list 3 4)))
CODE

output_is (<<'CODE', '(list 3 4)', 'quasiquote');
(write
  `(list ,(+ 1 2) 4))
CODE

output_is (<<'CODE', '(quasiquote (list (unquote (+ 1 2)) 4))', 'quoted quasiquote');
(write
  '`(list ,(+ 1 2) 4))
CODE

output_is(<<'CODE', '(list 1 2 3)', 'unquote-splicing');
(write
  `(list ,@(list 1 2 3)))
CODE

output_is(<<'CODE', '(list)', 'splicing empty list');
(write
  `(list ,@(list)))
CODE

output_is(<<'CODE', '(list 1 2 3 (4 5))', 'complex quasiquote');
(write
  `(list ,@(list 1 2) ,(+ 1 2) ,(list 4 5)))
CODE
