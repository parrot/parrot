#! perl -w

use Scheme::Test tests => 12;

output_is (<<'CODE', 'a', 'a symbol');
(write 'a) ; for emacs ')
CODE

output_is (<<'CODE', '5', 'define');
(define a 5)
(write a)
CODE

output_is (<<'CODE', '5', 'define II');
(define a 4)
(define b (+ a 1))
(write b)
CODE

output_is (<<'CODE', '8', 'set!');
(define a 5)
(set! a 8)
(write a)
CODE

output_is (<<'CODE', '13', 'set! II');
(define a 5)
(set! a (+ a 8))
(write a)
CODE

output_is (<<'CODE', '(18 17)', 'define function');
(define (f a b) (list b a))
(write (f 17 18))
CODE

output_is (<<'CODE', '3', 'define via lambda');
(define sum (lambda (a b) (+ a b)))
(write (sum 1 2))
CODE

output_is (<<'CODE', '101', 'let');
(let ((a 1))
 (write a)
 (let ((a 0)
       (b 0))
  (write a))
 (write a))
CODE

output_is (<<'CODE', '321', 'counter');
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

output_is (<<'CODE', '9837', '2 counter');
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

output_is (<<'CODE', '012023', 'yet another counter');
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

output_is (<<'CODE','120','fakultaet');
(define (fak n)
  (if (= n 0)
      1
      (* n (fak (- n 1)))))
(write (fak 5))
CODE
