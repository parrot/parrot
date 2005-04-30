;; Export external symbols from the COMMON-LISP package
(sys:%export (sys:%find-package "COMMON-LISP")
	     ;; List related functions
	     "CAAR" "CADR" "CDAR" "CDDR" "CAAAR" "CAADR" "CADAR" "CADDR"
	     "CDAAR" "CDADR" "CDDAR" "CDDDR" "CAAAAR" "CAAADR" "CAADAR"
	     "CAADDR" "CADAAR" "CADADR" "CADDAR" "CDAAAR" "CDAADR" "CDADAR"
	     "CDADDR" "CDDAAR" "CDDADR" "CDDDAR" "CDDDDR"

	     "FIRST" "SECOND" "THIRD" "FOURTH" "FIFTH" "SIXTH" "SEVENTH"
	     "EIGHTH" "NINTH" "TENTH"

	     "ACONS" "CONS" "LIST"

	     "COPY-TREE" "IDENTITY"

	     ;; Math functions
	     "*" "+" "-" "/" "=" "1+" "1-" "EVENP" "MOD" "ODDP" "ZEROP"

	     ;; Predicate functions
	     "BOUNDP" "CHARACTERP" "CONSP" "ENDP" "FLOATP" "FUNCTIONP"
	     "HASH-TABLE-P" "INTEGERP" "KEYWORDP" "LISTP" "NUMBERP" "PACKAGEP"
	     "STREAMP" "STRINGP" "SYMBOLP"

	     ;; Macros
	     "DEFUN"

	     ;; Miscellaneous functions
	     "APPLY" "ATOM" "EQ" "EQL" "EVAL" "FUNCTION" "GENSYM" "LET" "NOT"
	     "NULL" "PACKAGE-NAME" "PRINT" "PROGN" "QUOTE" "READ"
	     "READ-DELIMITED-LIST" "RPLACA" "RPLACD" "SETQ" "SYMBOL-FUNCTION"
	     "SYMBOL-NAME" "SYMBOL-PACKAGE" "TYPE-OF" "VALUES"
	     "IN-PACKAGE" 
	     
	     ;; Miscellaneous symbols
	     "*GENSYM-COUNTER*" "*MACROEXPAND-HOOK*" "*PACKAGE*" "*READ-EVAL*"
	     "*READTABLE*" "*STANDARD-INPUT*" "*STANDARD-OUTPUT*" "BASE-CHAR"
	     "FLOAT" "HASH-TABLE" "INTEGER" "MACRO" "NIL" "PACKAGE" "STREAM"
	     "STRING" "SYMBOL" "T")

;; Set the current package to SYSTEM so we don't have to prefix symbols.
(cl:setq *package* (sys:%find-package "SYSTEM"))
(%use-package (%find-package "SYSTEM") (%find-package "COMMON-LISP"))

;; Create a hash table used to store all the dispatching macros.
(setq *dispatching-macros* (%make-hash-table))

;; #'xxx macro. See CLtL section 2.4.8.2 for details.
(%set-hash *dispatching-macros*
	  "'"
	  (function
	   (lambda (stream char)
	     (list 'function (read stream)))))

;; #.xxx macro. See CLtL section 2.4.8.6 for details.
(setq *read-eval* t)
(%set-hash *dispatching-macros*
	  "."
	  (function
	   (lambda (stream char)
	     (if *read-eval*
		 (eval (read stream))
	       (error "reader-error" "*READ-EVAL* is NIL")))))

;; #< macro. See CLtL section 2.4.8.20 for details.
(%set-hash *dispatching-macros*
	  "<"
	  (function
	   (lambda (stream char)
	     (error "reader-error" "#< is invalid syntax"))))

;; ##<Space> macro. See CLtL section 2.4.8.21 for details.
(%set-hash *dispatching-macros*
	  " "
	  (function
	   (lambda (stream char)
	     (error "reader-error" "#| | is invalid syntax"))))

;; #) macro. See CLtL section 2.4.8.22 for details.
(%set-hash *dispatching-macros*
	  ")"
	  (function
	   (lambda (stream char)
	     (error "reader-error" "#) is invalid syntax"))))

(setq *macroexpand-hook* #'(lambda (fn form env)
			     (apply fn (list form env))))

;; Create the KEYWORD package.
(sys:%make-package "KEYWORD")

(sys:load "lisp/objects.l")
(sys:load "lisp/core.l")
(sys:load "lisp/logic.l")
(sys:load "lisp/pred.l")
(sys:load "lisp/list.l")
(sys:load "lisp/math.l")

;; Create and alias the COMMON-LISP-USER package.
(sys:%make-package "COMMON-LISP-USER")
(sys:%alias-package (sys:%find-package "COMMON-LISP-USER") "CL-USER")

(cl:setq *package* (sys:%find-package "CL-USER"))
(sys:%use-package (sys:%find-package "CL-USER")
		  (sys:%find-package "COMMON-LISP"))

(in-package "COMMON-LISP-USER")
