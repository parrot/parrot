(in-package "COMMON-LISP")

;; Define some list accessing functions.
(sys:set-symbol-function 'caar #'(lambda (x) (car (car x))))
(sys:set-symbol-function 'cadr #'(lambda (x) (car (cdr x))))
(sys:set-symbol-function 'cdar #'(lambda (x) (cdr (car x))))
(sys:set-symbol-function 'cddr #'(lambda (x) (cdr (cdr x))))

(sys:set-symbol-function 'caaar #'(lambda (x) (car (car (car x)))))
(sys:set-symbol-function 'caadr #'(lambda (x) (car (car (cdr x)))))
(sys:set-symbol-function 'cadar #'(lambda (x) (car (cdr (car x)))))
(sys:set-symbol-function 'caddr #'(lambda (x) (car (cdr (cdr x)))))
(sys:set-symbol-function 'cdaar #'(lambda (x) (cdr (car (car x)))))
(sys:set-symbol-function 'cdadr #'(lambda (x) (cdr (car (cdr x)))))
(sys:set-symbol-function 'cddar #'(lambda (x) (cdr (cdr (car x)))))
(sys:set-symbol-function 'cdddr #'(lambda (x) (cdr (cdr (cdr x)))))

(sys:set-symbol-function 'caaaar #'(lambda (x) (car (car (car (car x))))))
(sys:set-symbol-function 'caaadr #'(lambda (x) (car (car (car (cdr x))))))
(sys:set-symbol-function 'caadar #'(lambda (x) (car (car (cdr (car x))))))
(sys:set-symbol-function 'caaddr #'(lambda (x) (car (car (cdr (cdr x))))))
(sys:set-symbol-function 'cadaar #'(lambda (x) (car (cdr (car (car x))))))
(sys:set-symbol-function 'cadadr #'(lambda (x) (car (cdr (car (cdr x))))))
(sys:set-symbol-function 'caddar #'(lambda (x) (car (cdr (cdr (car x))))))
(sys:set-symbol-function 'cadddr #'(lambda (x) (car (cdr (cdr (cdr x))))))
(sys:set-symbol-function 'cdaaar #'(lambda (x) (cdr (car (car (car x))))))
(sys:set-symbol-function 'cdaadr #'(lambda (x) (cdr (car (car (cdr x))))))
(sys:set-symbol-function 'cdadar #'(lambda (x) (cdr (car (cdr (car x))))))
(sys:set-symbol-function 'cdaddr #'(lambda (x) (cdr (car (cdr (cdr x))))))
(sys:set-symbol-function 'cddaar #'(lambda (x) (cdr (cdr (car (car x))))))
(sys:set-symbol-function 'cddadr #'(lambda (x) (cdr (cdr (car (cdr x))))))
(sys:set-symbol-function 'cdddar #'(lambda (x) (cdr (cdr (cdr (car x))))))
(sys:set-symbol-function 'cddddr #'(lambda (x) (cdr (cdr (cdr (cdr x))))))

(sys:set-symbol-function 'endp #'(lambda (x) (eq x nil)))

(sys:set-symbol-function 'first #'(lambda (x) (car x)))
(sys:set-symbol-function 'second #'(lambda (x) (cadr x)))
(sys:set-symbol-function 'third #'(lambda (x) (caddr x)))
(sys:set-symbol-function 'fourth #'(lambda (x) (cadddr x)))
(sys:set-symbol-function 'fifth #'(lambda (x) (car (cddddr x))))
(sys:set-symbol-function 'sixth #'(lambda (x) (cadr (cddddr x))))
(sys:set-symbol-function 'seventh #'(lambda (x) (caddr (cddddr x))))
(sys:set-symbol-function 'eighth #'(lambda (x) (cadddr (cddddr x))))
(sys:set-symbol-function 'ninth #'(lambda (x) (car (cddddr (cddddr x)))))
(sys:set-symbol-function 'tenth #'(lambda (x) (cadr (cddddr (cddddr x)))))

;; Copies and returns the passed tree.
(sys:set-symbol-function 'copy-tree
			 #'(lambda (tree)
			     (if (consp tree)
				 (cons (copy-tree (car tree))
				       (copy-tree (cdr tree)))
			       tree)))

;; Identity returns whatever was passed to the function
(sys:set-symbol-function 'identity #'(lambda (object) object))

;; For working with association lists.
(sys:set-symbol-function 'acons
			 #'(lambda (key val list)
			     (cons (cons key val) list)))

