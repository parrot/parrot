; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "begin"
  ((begin)                 => "\n")
  ((begin 42)              => "42\n")
  ((begin 1 2 3)           => "3\n")
  ((begin (begin 1 2 3 4)) => "4\n")
)

(load "compiler.scm")
(test-all)
