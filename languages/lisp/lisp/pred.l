(in-package "COMMON-LISP")

;; XXX - This should also compare characters (which we don't have yet).
(defun eql (x y)
  (if (eq x y)
      t
    (if (numberp x)
	(if (numberp y)
	    (if (eq (type-of x) (type-of y))
		(= x y))))))

;; Define some predicate functions.
(defun characterp (x) (eq (type-of x) 'base-char))

(defun consp (x) (eq (type-of x) 'cons))

(defun floatp (x) (eq (type-of x) 'float))

(defun functionp (x) (eq (type-of x) 'function))

(defun hash-table-p (x) (eq (type-of x) 'hash-table))

(defun integerp (x) (eq (type-of x) 'integer))

(defun keywordp (x)
  (if (symbolp x)
      (eq (symbol-package x) (sys:%find-package "KEYWORD"))
    nil))

(defun listp (x)
  (if (eq x 'nil)
      t
    (eq (type-of x) 'cons)))

(defun numberp (x)
  (if (eq (type-of x) 'integer)
      t
    (eq (type-of x) 'float)))

(defun packagep (x)
  (eq (type-of x) 'package))

(defun streamp (x)
  (eq (type-of x) 'stream))

(defun stringp (x)
  (eq (type-of x) 'string))

(defun symbolp (x)
  (eq (type-of x) 'symbol))

