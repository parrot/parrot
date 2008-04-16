;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; MIT Scheme Compile Script

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

((lambda (specifiers)
   (for-each (lambda (specifier)
               (compile-file (car specifier) (cdr specifier)))
             specifiers))
 '(
   ("history")
   ("closure")
   ("denotation")
   ("environment" "name" "closure" "denotation")
   ("transform" "name" "closure" "denotation" "environment")
   ("taxonomy")
   ("classify"
    "history" "name" "closure" "denotation" "environment"
    "transform" "taxonomy")
   ("standard"
    "history" "name" "closure" "denotation" "environment"
    "transform" "taxonomy" "classify")
   ("synrules"
    "history" "name" "closure" "denotation" "environment"
    "transform" "taxonomy" "classify" "standard")
   ("sexp"
    "history" "name" "closure" "denotation" "environment"
    "transform" "taxonomy" "classify" "standard" "synrules")
   ("mit-load"
    "history" "name" "closure" "denotation" "environment"
    "transform" "taxonomy" "classify" "standard" "synrules" "sexp")
   ))
