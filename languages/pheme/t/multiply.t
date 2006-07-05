(include_file lib/PhemeTest.pir)

(plan 3)

(is (* 999 3) 2997 "asterisk operator should multiply two integers")

(is (* 105 10.5) 1102.5 "... and two floats")

(is (* 1 2 3 4 5) 120 "... and a list of of more than two atoms")

;(is_exception (* 5) "some exception message" "... but not fewer than two atoms")
