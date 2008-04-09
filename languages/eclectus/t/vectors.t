; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "vectors"
  ('#()                   => "#0()\n")                    
)

(load "compiler.scm")
(test-all)
