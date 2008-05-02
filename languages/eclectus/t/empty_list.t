; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "empty_list"
  ('()  => "()\n"))

(load "compiler.scm")
(test-all)
