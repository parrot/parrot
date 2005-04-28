(in-package "COMMON-LISP")

(sys:set-symbol-function '1+ #'(lambda (x) (+ x 1)))
(sys:set-symbol-function '1- #'(lambda (x) (- x 1)))
(sys:set-symbol-function 'evenp #'(lambda (x) (eql (mod x 2) 0)))
(sys:set-symbol-function 'oddp #'(lambda (x) (eql (mod x 2) 1)))
(sys:set-symbol-function 'zerop #'(lambda (x) (eql x 0)))
