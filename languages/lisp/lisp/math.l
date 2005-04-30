(in-package "COMMON-LISP")

(defun 1+ (x) (+ x 1))
(defun 1- (x) (- x 1))
(defun evenp (x) (eql (mod x 2) 0))
(defun oddp (x) (eql (mod x 2) 1))
(defun zerop (x) (eql x 0))
