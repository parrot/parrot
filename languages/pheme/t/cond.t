(include_file lib/PhemeTest.pir)

(plan 2)

(ok (cond (6) 6) "cond should return first value if first s-exp is true")

(is (cond (atom? '()) foo (1) bar) bar "... or second if second s-exp is true")
