; $Id$

(load "tests-driver.scm") ; this should come first
(load "compiler.scm")

; there have to be nine tests, as the number of tests is hardcoded in test-driver.scm
(add-tests-with-string-output "fxadd1"      
  [($fxadd1 -2)  => "-1\n"]
  [($fxadd1 -1)  => "0\n"]
  [($fxadd1 1)   => "2\n"])
  [($fxadd1 2)   => "3\n"])

(test-all)
