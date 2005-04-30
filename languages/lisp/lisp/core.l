(setq cl:*package* (sys:%find-package "COMMON-LISP"))

;; Define a temporary, primitive version of the defun macro.
(sys:set-symbol-function 'defun
			 (sys:%make-macro
			  #'(lambda (form env)
			      (let ((name (car form)) (body (cdr form)))
				(list 'progn
				      (list 'sys:set-symbol-function
					    (list 'quote name)
					    (list 'function (cons 'lambda body)))
				      (list 'sys:set-function-name
					    (list 'sys:get-symbol-function (list 'quote name))
					    (list 'symbol-name (list 'quote name)))
				      (list 'sys:get-symbol-function (list 'quote name)))))))

(defun in-package (pkg)
  (setq *package* (sys:%find-package pkg)))
			     


