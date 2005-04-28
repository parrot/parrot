(cl:setq cl:*package* (sys:%find-package "SYSTEM"))

;; Set up some of the accessors for the LispSymbol class attributes.
(%set-object-attribute 'set-symbol-function
		       "LispSymbol"
		       "function"
		       #'(lambda (s f)
			  (%set-object-attribute s "LispSymbol" "function" f)))

(set-symbol-function 'get-symbol-function
		     #'(lambda (s)
			 (%get-object-attribute s "LispSymbol" "function")))

(set-symbol-function 'set-symbol-documentation
		     #'(lambda (s d)
			 (%set-object-attribute s "LispSymbol" "documentation" d)))

(set-symbol-function 'get-symbol-documentation
		     #'(lambda (s)
			 (%get-object-attribute s "LispSymbol" "documentation")))

(set-symbol-function 'set-symbol-name
		     #'(lambda (s n)
			 (%set-object-attribute s "LispSymbol" "name" n)))

(set-symbol-function 'get-symbol-name
		     #'(lambda (s)
			 (%get-object-attribute s "LispSymbol" "name")))

(set-symbol-function 'set-symbol-package
		     #'(lambda (s p)
			 (%set-object-attribute s "LispSymbol" "package" p)))

(set-symbol-function 'get-symbol-package
		     #'(lambda (s)
			 (%get-object-attribute s "LispSymbol" "package")))

(set-symbol-function 'set-symbol-value
		     #'(lambda (s v)
			 (%set-object-attribute s "LispSymbol" "value" v)))

(set-symbol-function 'get-symbol-value
		     #'(lambda (s)
			 (%get-object-attribute s "LispSymbol" "value")))

;; Set up some of the accessors for the LispPackage class attributes.
(set-symbol-function 'set-package-name
		     #'(lambda (p n)
			 (%set-object-attribute p "LispPackage" "name" n)))

(set-symbol-function 'get-package-name
		     #'(lambda (p)
			 (%get-object-attribute p "LispPackage" "name")))

;; Set up some of the accessors for the LispFunction class attributes.
(set-symbol-function 'set-function-documentation
		     #'(lambda (f d)
			 (%set-object-attribute f "LispFunction" "documentation" d)))

(set-symbol-function 'get-function-documentation
		     #'(lambda (f)
			 (%get-object-attribute f "LispFunction" "documentation")))

(set-symbol-function 'get-function-name
		     #'(lambda (f)
			 (%get-object-attribute f "LispFunction" "name")))

(set-symbol-function 'set-function-name
		     #'(lambda (f n)
			 (%set-object-attribute f "LispFunction" "name" n)))


;; The following functions should be created in the COMMON-LISP package.
(setq *package* (%find-package "COMMON-LISP"))

(sys:set-symbol-function 'symbol-function
			 #'(lambda (s)
			     (sys:get-symbol-function s)))

(sys:set-symbol-function 'symbol-name
			 #'(lambda (s)
			     (sys:get-symbol-name s)))

(sys:set-symbol-function 'symbol-package
			 #'(lambda (s)
			     (sys:get-symbol-package s)))

(sys:set-symbol-function 'package-name
			 #'(lambda (p)
			     (sys:get-package-name p)))
