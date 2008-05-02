; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "characters"      
  (#\a  => "#\\a\n")                    
  (#\A  => "#\\A\n")                    
  (#\z  => "#\\z\n")                    
  (#\Z  => "#\\Z\n")                    
  (#\0  => "#\\0\n")                    
  (#\1  => "#\\1\n")                    
  (#\9  => "#\\9\n")                    
  (#\$  => "#\\$\n")                    
  (#\   => "#\\ \n")                    
  (#\-  => "#\\-\n")                    
)

(load "compiler.scm")
(test-all)
