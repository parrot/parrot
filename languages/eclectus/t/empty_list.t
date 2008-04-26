; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "empty list"
  ('()  => "()\n"))

(load "compiler.scm")
(test-all)
