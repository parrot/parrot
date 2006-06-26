(include_file lib/PhemeTest.pir)

(plan 6)

(ok (null? '()) "null? should be true given an empty list")

(ok (null? (quote ())) "... marked with quote")

(ok (null? '()) "... or a single quote")

(nok (null? (a list)) "null? should be false given a list with atoms")

(nok (null? ((a list))) "... or a nested list")

(nok (null? ( '() )) "... or even a list containing an empty list")
