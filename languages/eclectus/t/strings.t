; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "strings"      
  ("asdf"          => "asdf\n")                    
  ("1"             => "1\n")                    
  ; ("\n"            => "\n\n")                    
  (""              => "\n")                    
)

(load "compiler.scm")
(test-all)
