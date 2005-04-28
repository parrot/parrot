(in-package "COMMON-LISP")

;; Define some predicate functions.
(sys:set-symbol-function 'characterp
			 #'(lambda (x)
			     (eq (type-of x) 'base-char)))

(sys:set-symbol-function 'consp
			 #'(lambda (x)
			     (eq (type-of x) 'cons)))
;; XXX - This should also compare characters (which we don't have yet).
(sys:set-symbol-function 'eql
			 #'(lambda (x y)
			     (if (eq x y)
				 t
			       (if (numberp x)
				   (if (numberp y)
				       (if (eq (type-of x) (type-of y))
					   (= x y)))))))

(sys:set-symbol-function 'floatp
			 #'(lambda (x)
			     (eq (type-of x) 'float)))

(sys:set-symbol-function 'functionp
			 #'(lambda (x)
			     (eq (type-of x) 'function)))

(sys:set-symbol-function 'hash-table-p
			 #'(lambda (x)
			     (eq (type-of x) 'hash-table)))

(sys:set-symbol-function 'integerp
			 #'(lambda (x)
			     (eq (type-of x) 'integer)))

(sys:set-symbol-function 'keywordp
			 #'(lambda (x)
			     (if (symbolp x)
				 (eq (symbol-package x) (sys:%find-package "KEYWORD"))
			       nil)))			 

(sys:set-symbol-function 'listp
			 #'(lambda (x)
			     (if (eq x 'nil)
				 t
			       (eq (type-of x) 'cons))))

(sys:set-symbol-function 'numberp
			 #'(lambda (x)
			     (if (eq (type-of x) 'integer)
				 t
			       (eq (type-of x) 'float))))

(sys:set-symbol-function 'packagep
			 #'(lambda (x)
			     (eq (type-of x) 'package)))

(sys:set-symbol-function 'streamp
			 #'(lambda (x)
			     (eq (type-of x) 'stream)))

(sys:set-symbol-function 'stringp
			 #'(lambda (x)
			     (eq (type-of x) 'string)))

(sys:set-symbol-function 'symbolp
			 #'(lambda (x)
			     (eq (type-of x) 'symbol)))

