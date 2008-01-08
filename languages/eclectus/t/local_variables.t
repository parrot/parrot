; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "local variables"
  [(let() 13)                                              => "13\n"]     
  [(let (($var_a 17)) 13)                                  => "13\n"]     
  [(let (($var_a 14)) $var_a)                              => "14\n"]     
  [(let (($var_a 17) ($var_b 21)) 13)                      => "13\n"]     
  [(let (($var_a 13) ($var_b 21)) (fxadd1 $var_a))         => "14\n"]     
  [(let (($var_a 13) ($var_b 21)) (fx+ $var_a $var_b))     => "34\n"]     
  [(let (($var_a 13) ($var_b 21)) (fx> $var_a $var_b))     => "#f\n"]     
  [(let (($var_a 13) ($var_b 21)) (fx> $var_b $var_a))     => "#t\n"]     
)

(load "compiler.scm")
(test-all)
