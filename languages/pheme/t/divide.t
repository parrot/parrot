(include_file lib/PhemeTest.pir)

(plan 2)

(is (/ 999 3) 333 "slash operator should divide two integers")

(is (/ 105 10) 10.5 "... and two floats")

;(is_exception (/ 1 2 3 4 5) "some exception" "... but shouldn't allow a list of more than two atoms")

;(is_exception (/ 5) "some exception" "... nor of fewer than two atoms")
