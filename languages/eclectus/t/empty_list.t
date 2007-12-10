; $Id$

(load "tests-driver.scm") ; this should come first

; there have to be nine tests, as the number of tests is hardcoded in test-driver.scm
(add-tests-with-string-output "booleans"      
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
  [()  => "()\n"]                    
)

(load "compiler.scm")
(test-all)
