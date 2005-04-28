(setq cl:*package* (sys:%find-package "COMMON-LISP"))

;; Define some basic functions we'll need in subsequent files.
(sys:set-symbol-function 'in-package
			 #'(lambda (pkg)
			     (setq *package* (sys:%find-package pkg))))


