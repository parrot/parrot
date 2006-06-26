(include_file lib/PhemeTest.pir)

(plan 4)

(is 'cons "cons" "quoting a symbol name should prevent execution")

(is 'cons "cons" "quoting a symbol name should prevent execution")

(is_deeply (quote ()) '() "quote on the empty list should give the empty list")

(is_deeply (quote (car cdr)) (cons 'car ('cdr)) "quote should handle a list")
