; $Id$

(load "tests-driver.scm") ; this should come first

; there have to be nine tests, as the number of tests is hardcoded in test-driver.scm
(add-tests-with-string-output "booleans"      
  [#\a  => "#\\a\n"]                    
  [#\A  => "#\\A\n"]                    
  [#\z  => "#\\z\n"]                    
  [#\Z  => "#\\Z\n"]                    
  [#\0  => "#\\0\n"]                    
  [#\1  => "#\\1\n"]                    
  [#\9  => "#\\9\n"]                    
  [#\$  => "#\\$\n"]                    
  [#\   => "#\\ \n"]                    
)

(load "compiler.scm")
(test-all)
