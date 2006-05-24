(include_file lib/PhemeTest.pir)

(plan 2)

(is 'cons "cons" "quoting a symbol name should prevent execution")

(is ('cons) ("cons") "quoting a symbol name should prevent execution")

; (is (quote ()) () "quote on the empty list should give the empty list")
