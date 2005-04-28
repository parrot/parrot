(in-package "COMMON-LISP")

;; Define some logical functions
(sys:set-symbol-function 'not #'(lambda (x) (null x)))

