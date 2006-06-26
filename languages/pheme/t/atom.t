(include_file lib/PhemeTest.pir)

(plan 4)

(ok (atom? foo) "atom? should be true given one atom")

(nok (atom? (foo)) "... but not a list")

(ok (atom? (car (baz))) "car of one element list should make atom? true")

(nok (atom? (cdr (quux qix))) "cdr of list should make atom? false")
